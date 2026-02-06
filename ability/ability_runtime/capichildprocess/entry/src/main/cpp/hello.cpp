/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "IpcProxy.h"
#include <cstdlib>
#include <cstring>
#include <hilog/log.h>
#include <fcntl.h>
#include <future>
#include <unistd.h>
#include <thread>
#include <future>
#include <mutex>
#include <deque>
#include "napi/native_api.h"
#include "AbilityKit/native_child_process.h"
#include "ChildProcess.h"
#include "loghelper.h"
#include <vector>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "CHILD_TAG"

static ChildProcess g_childProcess;
static IpcProxy *g_ipcProxyPnt = nullptr;
static std::vector<IpcProxy*> g_ipcProxyPntObjects;
static std::promise<int> *g_promiseStartProcess = nullptr;

extern "C" {

OHIPCRemoteStub* NativeChildProcess_OnConnect()
{
    OH_LOG_INFO(LOG_APP, "Child process - OnConnect");
    return g_childProcess.GetIpcStub();
}

void NativeChildProcess_MainProc()
{
    OH_LOG_INFO(LOG_APP, "Child process - MainProc started");
    g_childProcess.MainProc();
    OH_LOG_INFO(LOG_APP, "Child process - MainProc end");
}

} // extern "C"

class ArkTsThread {
    std::thread thread_;
    napi_env env;
    napi_ref on_message_func;
    std::condition_variable cond;
    std::mutex lock;
    std::deque<std::function<void()>> jobs;
    bool stopFlag = false;
    public:
        ArkTsThread();
        ~ArkTsThread();
        void CallFunc();
};

ArkTsThread::ArkTsThread()
{
    auto waiter = std::promise<bool>();
    this->thread_ = std::thread([&]() {
        napi_create_ark_runtime(&this->env);
        auto env = this->env;

        napi_value worker_utils;
        napi_load_module_with_info(env, "entry/src/main/ets/pages/worker",
            "com.example.capichildprocesstest/entry", &worker_utils);
        napi_value on_message_func;
        auto ret = napi_get_named_property(env, worker_utils, "onMessage", &on_message_func);
        napi_create_reference(env, on_message_func, 1, &this->on_message_func);
        waiter.set_value(true);

        while (!stopFlag) {
            auto l = std::unique_lock<std::mutex>(this->lock);
            cond.wait(l, [this] {return stopFlag;});
            for (const auto job : this->jobs) {
                job();
            }
            this->jobs.clear();
        }
        napi_destroy_ark_runtime(&this->env);
    });
    waiter.get_future().wait();
}

ArkTsThread::~ArkTsThread()
{
    {
        auto l = std::unique_lock<std::mutex>(this->lock);
        stopFlag = true;
    }
    cond.notify_all();
    if (this->thread_.joinable()) {
        this->thread_.join();
    }
}

void ArkTsThread::CallFunc()
{
    auto l = std::unique_lock<std::mutex>(this->lock);
    this->jobs.push_back([this]() {
        napi_value on_message_func;
        napi_get_reference_value(this->env, this->on_message_func, &on_message_func);
        napi_value ret;
        napi_call_function(this->env, nullptr, on_message_func, 0, nullptr, &ret);
    });
    this->cond.notify_all();
}

namespace {
    ArkTsThread *thread;
}

static void OnNativeChildProcessStarted(int errCode, OHIPCRemoteProxy *remoteProxy)
{
    OH_LOG_INFO(LOG_APP, "Main process - OnNativeChildProcessStarted %{public}d", errCode);
    g_ipcProxyPnt = new (std::nothrow) IpcProxy(remoteProxy);
    if (g_ipcProxyPnt == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Main process - Alloc ipc proxy object failed!");
        OH_IPCRemoteProxy_Destroy(remoteProxy);
    } else {
        g_ipcProxyPntObjects.push_back(g_ipcProxyPnt);
    }
    
    if (g_promiseStartProcess != nullptr) {
        g_promiseStartProcess->set_value(errCode);
    }
}

static void OnNativeChildProcessExit(int32_t pid, int32_t signal)
{
    OH_LOG_INFO(LOG_APP, "child exit, pid:%{public}d, signal:%{public}d", pid, signal);
    thread = new ArkTsThread();
    thread->CallFunc();
    delete thread;
    thread = nullptr;
}

static napi_value ChildProcessAdd(napi_env env, napi_callback_info info)
{
    int32_t result = INT32_MIN;
    if (g_ipcProxyPnt != nullptr) {
        size_t argc = 2;
        napi_value args[2] = { nullptr };
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        int32_t value0;
        napi_get_value_int32(env, args[0], &value0);
        int32_t value1;
        napi_get_value_int32(env, args[1], &value1);
        
        result = g_ipcProxyPnt->Add(value0, value1);
        OH_LOG_INFO(LOG_APP, "Main process - ChildProcessAdd %{public}d+%{public}d=%{public}d",
            value0, value1, result);
    } else {
        OH_LOG_ERROR(LOG_APP, "Main process - Child process not started");
    }
    
    napi_value sumNapi;
    napi_create_int32(env, result, &sumNapi);
    return sumNapi;
}

static napi_value StartNativeChildProcess(napi_env env, napi_callback_info info)
{
    std::promise<int> promise;
    g_promiseStartProcess = &promise;
    
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    char libName[64];
    size_t nameLen;
    napi_get_value_string_utf8(env, args[0], libName, sizeof(libName), &nameLen);
    
    int32_t ret = OH_Ability_CreateNativeChildProcess(libName, OnNativeChildProcessStarted);
    OH_LOG_INFO(LOG_APP, "Main process - StartNativeChildProcess Lib:%{public}s ret:%{public}d", libName, ret);

    if (ret == NCP_NO_ERROR) {
        auto future = promise.get_future();
        OH_LOG_INFO(LOG_APP, "Main process - Wait for call back");
        ret = future.get();
    }
    
    g_promiseStartProcess = nullptr;
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value RequestExitChildProcess(napi_env env, napi_callback_info info)
{
    int32_t ret = 0;
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    if (g_ipcProxyPnt != nullptr && g_ipcProxyPnt->RequestExitChildProcess(value0)) {
        ret = 1;
        delete g_ipcProxyPnt;
        g_ipcProxyPnt = nullptr;
        OH_LOG_INFO(LOG_APP, "Main process - RequestExitChildProcess successed");

        g_ipcProxyPntObjects.pop_back();
        if (!g_ipcProxyPntObjects.empty()) {
            OH_LOG_INFO(LOG_APP, "Main process - RequestExitChildProcess get g_ipcProxyPnt");
            g_ipcProxyPnt = g_ipcProxyPntObjects.back();
        }
    }
    
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value CallApiWithNullCallback(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_Ability_CreateNativeChildProcess("libentry.so", nullptr);
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value CallApiWithNullLibName(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_Ability_CreateNativeChildProcess(nullptr, OnNativeChildProcessStarted);
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value CallApiWithNull(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_Ability_CreateNativeChildProcess(nullptr, nullptr);
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value ChildProcessStartNewProcess(napi_env env, napi_callback_info info)
{
    int32_t ret = INT32_MIN;
    if (g_ipcProxyPnt != nullptr) {
        ret = g_ipcProxyPnt->StartNativeChildProcess();
        OH_LOG_INFO(LOG_APP, "Main process - StartNativeChildProcess ret:%{public}d", ret);
    }
    
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value BusyTest(napi_env env, napi_callback_info info)
{
    napi_value napiRet;
    std::promise<int> promise;
    g_promiseStartProcess = &promise;
    int32_t ret = OH_Ability_CreateNativeChildProcess("libbusytest.so", OnNativeChildProcessStarted);
    if (ret != NCP_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "Main process - StartNativeChildProcess for busy test failed! ret:%{public}d", ret);
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    
    ret = OH_Ability_CreateNativeChildProcess("libentry.so", OnNativeChildProcessStarted);
    
    auto future = promise.get_future();
    OH_LOG_INFO(LOG_APP, "Main process - Wait for busy test call back");
    future.wait();

    g_promiseStartProcess = nullptr;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static Ability_NativeChildProcess_ErrCode StartChildWithArgs(NativeChildProcess_IsolationMode mode)
{
    int32_t pid = -1;
    NativeChildProcess_Args args;
    auto testParam = "testEntryParams";
    args.entryParams = (char*)malloc(sizeof(char) * strlen(testParam) + 1);
    (void)strcpy(args.entryParams, testParam);

    auto fd1Name = "fd1";
    args.fdList.head = (NativeChildProcess_Fd*)malloc(sizeof(NativeChildProcess_Fd));
    args.fdList.head->fdName = (char*)malloc(sizeof(char) * strlen(fd1Name) + 1);
    (void)strcpy(args.fdList.head->fdName, fd1Name);
    
    auto path = "data/storage/el2/base/files/test.txt";
    int32_t fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
    auto testString = "test";
    write(fd, testString, strlen(testString));
    close(fd);
    fd = open(path, O_RDWR | O_TRUNC, 0644);
    args.fdList.head->fd = fd;
    args.fdList.head->next = NULL;
    
    NativeChildProcess_Options options = {
        .isolationMode = mode
    };
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess before");
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_StartNativeChildProcess(
        "libentry.so:Main", args, options, &pid);
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess_ErrCode: %{public}d", ret);
    close(fd);
    return ret;
}

static Ability_NativeChildProcess_ErrCode StartChildWithNoArgs()
{
    int32_t pid = -1;
    NativeChildProcess_Args args;
    args.entryParams = NULL;
    args.fdList.head = NULL;
    
    NativeChildProcess_Options options = {
        .isolationMode = NCP_ISOLATION_MODE_ISOLATED
    };
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess before");
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_StartNativeChildProcess(
        "libentry.so:Main", args, options, &pid);
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess_ErrCode: %{public}d", ret);
    return ret;
}

static napi_value StartChildIsolated(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "===================StartChildIsolated");
    int32_t ret = static_cast<int32_t>(StartChildWithArgs(NCP_ISOLATION_MODE_ISOLATED));
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value StartChildNormal(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "===================StartChildNormal");
    int32_t ret = static_cast<int32_t>(StartChildWithArgs(NCP_ISOLATION_MODE_NORMAL));
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}


static napi_value StartChildNoArgs(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "===================StartChildWithNoArgs");
    int32_t ret = static_cast<int32_t>(StartChildWithNoArgs());
    OH_LOG_INFO(LOG_APP, "===================StartChildWithNoArgs end: %{public}d", ret);
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value RegisterNativeChildExit(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "===================RegisterNativeChildExit before");
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_RegisterNativeChildProcessExitCallback(
        OnNativeChildProcessExit);
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess_ErrCode: %{public}d", ret);
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value UnregisterNativeChildExit(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "===================UnregisterNativeChildExit before");
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_UnregisterNativeChildProcessExitCallback(
        OnNativeChildProcessExit);
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess_ErrCode: %{public}d", ret);
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}



static napi_value CreateThread(napi_env env, napi_callback_info info)
{
    thread = new ArkTsThread();
    return {};
}

static napi_value DestroyThread(napi_env env, napi_callback_info info)
{
    if (thread) {
        delete thread;
        thread = nullptr;
    }

    return {};
}
static napi_value CreateNativeChildProcessWithConfigs(napi_env env, napi_callback_info info)
{
    std::promise<int> promise;
    g_promiseStartProcess = &promise;
    
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    char libName[64];
    size_t nameLen;
    napi_get_value_string_utf8(env, args[0], libName, sizeof(libName), &nameLen);
    
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode errCode = 
        OH_Ability_ChildProcessConfigs_SetProcessName(configs, "abc_123");
    if(errCode != NCP_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "SetProcessName failed, errCode=%{public}d", errCode);
    }

    int32_t ret = OH_Ability_CreateNativeChildProcessWithConfigs(libName, configs, OnNativeChildProcessStarted);
    OH_LOG_INFO(LOG_APP, "Main process - StartNativeChildProcess Lib:%{public}s ret:%{public}d", libName, ret);

    if (ret == NCP_NO_ERROR) {
        auto future = promise.get_future();
        OH_LOG_INFO(LOG_APP, "Main process - Wait for call back");
        ret = future.get();
    }
    
    g_promiseStartProcess = nullptr;
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value CreateNativeChildProcessWithConfigsLibNamenullptr(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode errCode = 
        OH_Ability_ChildProcessConfigs_SetProcessName(configs, "abc_123");
    if(errCode != NCP_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "SetProcessName failed, errCode=%{public}d", errCode);
    }

    int32_t ret = OH_Ability_CreateNativeChildProcessWithConfigs(nullptr, configs, OnNativeChildProcessStarted);
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value CreateNativeChildProcessWithConfigsNullCallback(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode errCode = 
        OH_Ability_ChildProcessConfigs_SetProcessName(configs, "abc_123");
    if(errCode != NCP_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "SetProcessName failed, errCode=%{public}d", errCode);
    }

    int32_t ret = OH_Ability_CreateNativeChildProcessWithConfigs("libentry.so", configs, nullptr);
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value StartNativeChildProcessWithConfigs(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args_str[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args_str, nullptr, nullptr);
    
    char entry[64];
    size_t nameLen;
    napi_get_value_string_utf8(env, args_str[0], entry, sizeof(entry), &nameLen);
    
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode errCode = 
        OH_Ability_ChildProcessConfigs_SetProcessName(configs, "abc_123");
    if(errCode != NCP_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "SetProcessName failed, errCode=%{public}d", errCode);
    }

    int32_t pid = -1;
    NativeChildProcess_Args args;
    auto testParam = "testEntryParams";
    args.entryParams = (char*)malloc(sizeof(char) * strlen(testParam) + 1);
    (void)strcpy(args.entryParams, testParam);

    auto fd1Name = "fd1";
    args.fdList.head = (NativeChildProcess_Fd*)malloc(sizeof(NativeChildProcess_Fd));
    args.fdList.head->fdName = (char*)malloc(sizeof(char) * strlen(fd1Name) + 1);
    (void)strcpy(args.fdList.head->fdName, fd1Name);
    
    auto path = "data/storage/el2/base/files/test.txt";
    int32_t fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
    auto testString = "test";
    write(fd, testString, strlen(testString));
    close(fd);
    fd = open(path, O_RDWR | O_TRUNC, 0644);
    args.fdList.head->fd = fd;
    args.fdList.head->next = NULL;
   
    int32_t ret = OH_Ability_StartNativeChildProcessWithConfigs(entry, args, configs, &pid);
    
    OH_LOG_INFO(LOG_APP, "Main process - StartNativeChildProcessWithConfigs entry:%{public}s ret:%{public}d", entry, ret);

    free(args.entryParams);
    free(args.fdList.head->fdName);
    free(args.fdList.head);
    close(fd);

    if (ret == NCP_NO_ERROR) {
        ret = pid;
    }

    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value StartNativeChildProcessWithConfigsEntryNull(napi_env env, napi_callback_info info)
{
    std::promise<int> promise;
    g_promiseStartProcess = &promise;
        
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode errCode = 
        OH_Ability_ChildProcessConfigs_SetProcessName(configs, "abc_123");
    if(errCode != NCP_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "SetProcessName failed, errCode=%{public}d", errCode);
    }

    int32_t pid = -1;
    NativeChildProcess_Args args;
    args.entryParams = (char*) malloc (sizeof(char) * 11);
    (void)strcpy(args.entryParams, "testParams");

    args.fdList.head = (NativeChildProcess_Fd *)malloc(sizeof(NativeChildProcess_Fd));
    args.fdList.head->fdName = (char *)malloc(sizeof(char) * 5);
    (void)strcpy(args.fdList.head->fdName, "fd1");
    int32_t fd = open("/data/storage/el2/base/haps/entry/files/test0.txt", O_RDWR | O_CREAT, 0644);
    write(fd, "test", 4);
    close(fd);

    fd = open("/data/storage/el2/base/haps/entry/files/test0.txt", O_RDWR | O_CREAT, 0644);
    args.fdList.head->fd = fd;
    args.fdList.head->next = NULL;

    int32_t ret = OH_Ability_StartNativeChildProcessWithConfigs(nullptr, args, configs, &pid);
    
    //OH_LOG_INFO(LOG_APP, "Main process - StartNativeChildProcessWithConfigs entry:%{public}s ret:%{public}d", entry, ret);

    free(args.entryParams);
    free(args.fdList.head->fdName);
    free(args.fdList.head);
    close(fd);

    if (ret == NCP_NO_ERROR) {
        ret = pid;
    }

    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value StartNativeChildProcessWithConfigsEntryParams200K(napi_env env, napi_callback_info info)
{
    std::promise<int> promise;
    g_promiseStartProcess = &promise;
        
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode errCode = 
        OH_Ability_ChildProcessConfigs_SetProcessName(configs, "abc_123");
    if(errCode != NCP_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "SetProcessName failed, errCode=%{public}d", errCode);
    }

    int32_t pid = -1;
    const size_t size = 200*1024;
    NativeChildProcess_Args args;
    auto testParam = "testEntryParams";
    args.entryParams = (char*)malloc(sizeof(char) * strlen(testParam) + 1);
    (void)strcpy(args.entryParams, testParam);

    auto fd1Name = "fd1";
    args.fdList.head = (NativeChildProcess_Fd*)malloc(sizeof(NativeChildProcess_Fd));
    args.fdList.head->fdName = (char*)malloc(sizeof(char) * strlen(fd1Name) + 1);
    (void)strcpy(args.fdList.head->fdName, fd1Name);
    
    auto path = "data/storage/el2/base/files/test.txt";
    int32_t fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
    auto testString = "test";
    write(fd, testString, strlen(testString));
    close(fd);
    fd = open(path, O_RDWR | O_TRUNC, 0644);
    args.fdList.head->fd = fd;
    args.fdList.head->next = NULL;

    int32_t ret = OH_Ability_StartNativeChildProcessWithConfigs("libentry.so:Main", args, configs, &pid);
    
    OH_LOG_INFO(LOG_APP, "Main process - StartNativeChildProcessWithConfigs entry:%{public}s ret:%{public}d", "libentry.so:Main", ret);

    free(args.entryParams);
    free(args.fdList.head->fdName);
    free(args.fdList.head);
    close(fd);

    if (ret == NCP_NO_ERROR) {
        ret = pid;
    }

    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value StartNativeChildProcessWithConfigsFdlistNum17(napi_env env, napi_callback_info info)
{
    std::promise<int> promise;
    g_promiseStartProcess = &promise;
        
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode errCode = 
        OH_Ability_ChildProcessConfigs_SetProcessName(configs, "abc_123");
    if(errCode != NCP_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "SetProcessName failed, errCode=%{public}d", errCode);
    }

    int32_t pid = -1;
    const size_t size = 200*1024;
    NativeChildProcess_Args args;
    args.entryParams = (char*) malloc (sizeof(char) * size);
    for(int i=0; i < size; i++){
        args.entryParams[i] = 'a';
    }

    args.fdList.head = (NativeChildProcess_Fd *)malloc(sizeof(NativeChildProcess_Fd));
    args.fdList.head->fdName = (char *)malloc(sizeof(char) * 5);
    (void)strcpy(args.fdList.head->fdName, "fd1");
    int32_t fd = open("/data/storage/el2/base/haps/entry/files/test0.txt", O_RDWR | O_CREAT, 0644);
    write(fd, "test", 4);
    close(fd);

    fd = open("/data/storage/el2/base/haps/entry/files/test0.txt", O_RDWR | O_CREAT, 0644);
    args.fdList.head->fd = fd;
    int32_t MAX_fd_count = 17;
    NativeChildProcess_Fd* tmp_node = args.fdList.head;
    for (int32_t i = 1; i < MAX_fd_count; i++) {
        tmp_node->next = (NativeChildProcess_Fd *)malloc(sizeof(NativeChildProcess_Fd));
        tmp_node = tmp_node->next;
        tmp_node->fdName = (char *)malloc(sizeof(char)*3);
        std::string tmp_fdName = "fd" + std::to_string(i);
        (void)strcpy(tmp_node->fdName, tmp_fdName.c_str());
        std::string tmp_filename = "/data/storage/el2/base/haps/entry/files/test" + std::to_string(i) + "txt";
        int32_t tmp_fd = open(tmp_filename.c_str(), O_RDWR | O_CREAT, 0644);
        tmp_node->fd = tmp_fd;
    }

    tmp_node->next = NULL;

    int32_t ret = OH_Ability_StartNativeChildProcessWithConfigs("libentry.so:Main", args, configs, &pid);
    
    OH_LOG_INFO(LOG_APP, "Main process - StartNativeChildProcessWithConfigs entry:%{public}s ret:%{public}d", "libentry.so:Main", ret);

    for(NativeChildProcess_Fd* node = args.fdList.head; node != NULL; ){
        NativeChildProcess_Fd* next_node = node->next;
        close(node->fd);
        free(node->fdName);
        free(node);
        node = next_node;
    }
    free(args.entryParams);

    if (ret == NCP_NO_ERROR) {
        ret = pid;
    }

    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value SetIsolationModeConfigsNullptr(napi_env env, napi_callback_info info)
{
    Ability_NativeChildProcess_ErrCode ret = 
        OH_Ability_ChildProcessConfigs_SetIsolationMode(nullptr, NCP_ISOLATION_MODE_ISOLATED);
    
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value SetProcessName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    char processName[70];
    size_t nameLen;
    napi_get_value_string_utf8(env, args[0], processName, sizeof(processName), &nameLen);

    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode ret = 
        OH_Ability_ChildProcessConfigs_SetProcessName(configs, processName);
    if(ret != NCP_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "SetProcessName failed, errCode=%{public}d", ret);
    }

    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value SetProcessNameConfigsNullptr(napi_env env, napi_callback_info info)
{
    Ability_NativeChildProcess_ErrCode ret = 
        OH_Ability_ChildProcessConfigs_SetProcessName(nullptr, "abc_123");
    if(ret != NCP_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "SetProcessName failed, errCode=%{public}d", ret);
    }

    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value DestroyChildProcessConfigs(napi_env env, napi_callback_info info)
{
    Ability_ChildProcessConfigs* configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode ret = 
        OH_Ability_DestroyChildProcessConfigs(configs);
    
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value DestroyChildProcessConfigsNullptr(napi_env env, napi_callback_info info)
{
    Ability_NativeChildProcess_ErrCode ret = 
        OH_Ability_DestroyChildProcessConfigs(nullptr);
    
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "childProcessAdd", nullptr, ChildProcessAdd, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startNativeChildProcess", nullptr, StartNativeChildProcess,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "requestExitChildProcess", nullptr, RequestExitChildProcess,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "callApiWithNullCallback", nullptr, CallApiWithNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "callApiWithNullLibName", nullptr, CallApiWithNullLibName,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "callApiWithNull", nullptr, CallApiWithNull,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "childProcessStartNewProcess", nullptr, ChildProcessStartNewProcess,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "busyTest", nullptr, BusyTest,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startChildIsolated", nullptr, StartChildIsolated,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startChildNormal", nullptr, StartChildNormal,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startChildNoArgs", nullptr, StartChildNoArgs,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "registerNativeChildExit", nullptr, RegisterNativeChildExit,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "unregisterNativeChildExit", nullptr, UnregisterNativeChildExit,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createThread", nullptr, CreateThread,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "destroyThread", nullptr, DestroyThread,
            nullptr, nullptr, nullptr, napi_default, nullptr },
		{ "CreateNativeChildProcessWithConfigs", nullptr, CreateNativeChildProcessWithConfigs,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreateNativeChildProcessWithConfigsLibNamenullptr", nullptr, CreateNativeChildProcessWithConfigsLibNamenullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "CreateNativeChildProcessWithConfigsNullCallback", nullptr, CreateNativeChildProcessWithConfigsNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "StartNativeChildProcessWithConfigs", nullptr, StartNativeChildProcessWithConfigs,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "StartNativeChildProcessWithConfigsEntryNull", nullptr, StartNativeChildProcessWithConfigsEntryNull,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "StartNativeChildProcessWithConfigsFdlistNum17", nullptr, StartNativeChildProcessWithConfigsFdlistNum17,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "StartNativeChildProcessWithConfigsEntryParams200K", nullptr, StartNativeChildProcessWithConfigsEntryParams200K,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetIsolationModeConfigsNullptr", nullptr, SetIsolationModeConfigsNullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetProcessName", nullptr, SetProcessName,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SetProcessNameConfigsNullptr", nullptr, SetProcessNameConfigsNullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DestroyChildProcessConfigs", nullptr, DestroyChildProcessConfigs,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DestroyChildProcessConfigsNullptr", nullptr, DestroyChildProcessConfigsNullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
