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
#include "napi/native_api.h"
#include "AbilityKit/native_child_process.h"
#include "ChildProcess.h"
#include "loghelper.h"

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
    if (g_ipcProxyPnt != nullptr && g_ipcProxyPnt->RequestExitChildProcess()) {
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
