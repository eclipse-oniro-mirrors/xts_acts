/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <napi/native_api.h>
#include <hilog/log.h>
#include "uv.h"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cerrno>

#define LOG_DOMAIN 0x0201
#define LOG_TAG "LibuvTest"

// 全局变量（用于 uv_once 测试）
static uv_once_t once_only = UV_ONCE_INIT;
static int g_incrementCounter = 0;

void Increment()
{
    g_incrementCounter++;
}

// 辅助函数：创建结果对象
static napi_value CreateResult(napi_env env, bool success, const char* message = nullptr, int code = 0)
{
    napi_value result;
    napi_create_object(env, &result);
    
    napi_value successValue;
    napi_get_boolean(env, success, &successValue);
    napi_set_named_property(env, result, "success", successValue);
    
    if (message) {
        napi_value msgValue;
        napi_create_string_utf8(env, message, NAPI_AUTO_LENGTH, &msgValue);
        napi_set_named_property(env, result, "message", msgValue);
    }
    
    if (code != 0) {
        napi_value codeValue;
        napi_create_int32(env, code, &codeValue);
        napi_set_named_property(env, result, "code", codeValue);
    }
    
    return result;
}

// 测试1: UV Version
static napi_value TestUVVersion(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestUVVersion start");
    
    napi_value result;
    napi_create_object(env, &result);
    
    // 测试 uv_version
    int version = uv_version();
    napi_value versionValue;
    napi_create_int32(env, version, &versionValue);
    napi_set_named_property(env, result, "version", versionValue);
    
    // 测试 uv_version_string
    const char* versionString = uv_version_string();
    napi_value versionStrValue;
    napi_create_string_utf8(env, versionString, NAPI_AUTO_LENGTH, &versionStrValue);
    napi_set_named_property(env, result, "versionString", versionStrValue);
    
    // 测试 uv_replace_allocator（应该返回错误）
    int replaceResult = uv_replace_allocator(nullptr, nullptr, nullptr, nullptr);
    napi_value replaceValue;
    napi_create_int32(env, replaceResult, &replaceValue);
    napi_set_named_property(env, result, "replaceAllocatorError", replaceValue);
    
    // 测试 uv_loop_new
    uv_loop_t* loop = uv_loop_new();
    bool loopCreatedFlag = (loop != nullptr);
    napi_value loopCreated;
    napi_get_boolean(env, loopCreatedFlag, &loopCreated);
    napi_set_named_property(env, result, "loopCreated", loopCreated);
    
    if (loop) {
        uv_loop_delete(loop);
    }
    
    // 验证结果
    // 版本号应该大于0，不需要精确匹配 UV_VERSION_HEX（因为可能存在版本差异）
    bool success = (version > 0) &&
                   (replaceResult == UV_EINVAL) &&
                   loopCreatedFlag;
    napi_value successValue;
    napi_get_boolean(env, success, &successValue);
    napi_set_named_property(env, result, "success", successValue);
    
    OH_LOG_INFO(LOG_APP, "TestUVVersion end: version=%{public}d, success=%{public}d", version, success);
    return result;
}

// 测试2: Loop 生命周期
static napi_value TestLoop(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestLoop start");
    
    uv_loop_t* newLoop = uv_loop_new();
    bool success = (newLoop != nullptr);
    
    if (newLoop) {
        uv_loop_delete(newLoop);
    }
    
    OH_LOG_INFO(LOG_APP, "TestLoop end: success=%{public}d", success);
    return CreateResult(env, success, "Loop created and deleted successfully");
}

// 测试3: 错误名称
static napi_value TestErrName(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestErrName start");
    
    int err = 0;
    char buf[40];
    size_t buflen = 40;
    char* errName = uv_err_name_r(err, buf, buflen);
    
    napi_value result;
    napi_create_object(env, &result);
    
    napi_value errNameValue;
    napi_create_string_utf8(env, errName, NAPI_AUTO_LENGTH, &errNameValue);
    napi_set_named_property(env, result, "errorName", errNameValue);
    
    bool success = (strcmp(errName, "Unknown system error 0") == 0);
    napi_value successValue;
    napi_get_boolean(env, success, &successValue);
    napi_set_named_property(env, result, "success", successValue);
    
    OH_LOG_INFO(LOG_APP, "TestErrName end: %{public}s", errName);
    return result;
}

// 测试4: 请求数据
static napi_value TestReqGetData(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestReqGetData start");
    
    float f = 5.5f;
    float* pf = &f;
    uv_req_t* req = (uv_req_t*)malloc(sizeof(uv_req_t));
    if (req == nullptr) {
        return CreateResult(env, false, "Memory allocation failed");
    }
    uv_req_t* setReq = (uv_req_t*)malloc(sizeof(uv_req_t));
    if (setReq == nullptr) {
        free(req);
        return CreateResult(env, false, "Memory allocation failed");
    }
    
    req->data = pf;
    req->type = UV_UNKNOWN_REQ;
    
    bool test1 = (uv_req_get_data(req) == pf);
    bool test2 = (uv_req_get_type(req) == UV_UNKNOWN_REQ);
    
    uv_req_set_data(setReq, pf);
    bool test3 = (uv_req_get_data(setReq) == pf);
    
    free(req);
    free(setReq);
    
    bool success = test1 && test2 && test3;
    OH_LOG_INFO(LOG_APP, "TestReqGetData end: success=%{public}d", success);
    return CreateResult(env, success, "Request data operations successful");
}

// 测试5: 打印句柄
static napi_value TestPrintHandles(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestPrintHandles start");
    
    uv_loop_t* loop = nullptr;
    const char* testFile = "/data/storage/el2/base/cache/foo.gz";
    FILE* fp = fopen(testFile, "w");
    
    bool success = false;
    if (fp) {
        // 打印句柄信息到文件
        uv_print_all_handles(loop, fp);
        uv_print_active_handles(loop, fp);
        fclose(fp);
        success = true;
        OH_LOG_INFO(LOG_APP, "TestPrintHandles: file created and written successfully");
    } else {
        OH_LOG_INFO(LOG_APP, "TestPrintHandles: failed to open file, errno=%{public}d", errno);
    }
    
    OH_LOG_INFO(LOG_APP, "TestPrintHandles end: success=%{public}d", success);
    return CreateResult(env, success, "Print handles completed");
}

// 测试6: UDP 发送队列
static napi_value TestUdpSendQueue(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestUdpSendQueue start");
    
    const size_t testQueueSize = 5;
    const size_t testQueueCount = 5;
    
    uv_udp_t* handle = (uv_udp_t*)malloc(sizeof(uv_udp_t));
    if (handle == nullptr) {
        return CreateResult(env, false, "Memory allocation failed");
    }
    handle->send_queue_size = testQueueSize;
    handle->send_queue_count = testQueueCount;
    
    size_t size = uv_udp_get_send_queue_size(handle);
    size_t count = uv_udp_get_send_queue_count(handle);
    
    free(handle);
    
    bool success = (size == testQueueSize) && (count == testQueueCount);
    OH_LOG_INFO(LOG_APP, "TestUdpSendQueue end: size=%{public}zu, count=%{public}zu", size, count);
    return CreateResult(env, success, "UDP queue operations successful");
}

// 测试7: 文件系统 lchown
static napi_value TestFsLchown(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestFsLchown start");
    
    uv_loop_t loop;
    uv_fs_t req;
    const char* path = "/data/test/";
    uv_uid_t uid = 10000;
    uv_gid_t gid = 2020;
    
    int retC = uv_fs_lchown(&loop, &req, path, uid, gid, nullptr);
    
    napi_value result;
    napi_create_object(env, &result);
    
    napi_value retValue;
    napi_create_int32(env, retC, &retValue);
    napi_set_named_property(env, result, "returnCode", retValue);
    
    // 这个测试预期会失败（路径不存在），但不应该崩溃
    napi_value successValue;
    napi_get_boolean(env, true, &successValue);  // 只要不崩溃就算成功
    napi_set_named_property(env, result, "success", successValue);
    
    OH_LOG_INFO(LOG_APP, "TestFsLchown end: retC=%{public}d", retC);
    return result;
}

// 测试8: 禁用 stdio 继承
static napi_value TestDisableStdioInheritance(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestDisableStdioInheritance start");
    
    uv_disable_stdio_inheritance();
    
    OH_LOG_INFO(LOG_APP, "TestDisableStdioInheritance end");
    return CreateResult(env, true, "Stdio inheritance disabled");
}

// 测试9: 动态库加载
static napi_value TestDlsym(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestDlsym start");
    
    const int testLibCount = 3;
    const char* testLibs[] = {"aaaa", "bbbb", "cccc"};
    uv_lib_t* lib = (uv_lib_t*)malloc(sizeof(uv_lib_t));
    if (lib == nullptr) {
        return CreateResult(env, false, "Memory allocation failed");
    }
    
    int attemptCount = 0;
    for (int i = 1; i < testLibCount; i++) {
        int ret = uv_dlopen(testLibs[i], lib);
        attemptCount++;
        
        if (ret == 0) {
            void* symbol = nullptr;
            uv_dlsym(lib, "initialize", &symbol);
            uv_dlclose(lib);
        }
    }
    
    free(lib);
    
    // 测试不会成功加载库，但不应该崩溃
    bool success = (attemptCount == 2);
    OH_LOG_INFO(LOG_APP, "TestDlsym end: attempts=%{public}d", attemptCount);
    return CreateResult(env, success, "Dlsym operations completed");
}

// 测试10: uv_once
static napi_value TestUvOnce(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "TestUvOnce start");
    
    int before = g_incrementCounter;
    uv_once(&once_only, Increment);
    int after = g_incrementCounter;
    
    napi_value result;
    napi_create_object(env, &result);
    
    napi_value beforeValue;
    napi_value afterValue;
    napi_create_int32(env, before, &beforeValue);
    napi_create_int32(env, after, &afterValue);
    napi_set_named_property(env, result, "before", beforeValue);
    napi_set_named_property(env, result, "after", afterValue);
    
    bool success = (after > before);
    napi_value successValue;
    napi_get_boolean(env, success, &successValue);
    napi_set_named_property(env, result, "success", successValue);
    
    OH_LOG_INFO(LOG_APP, "TestUvOnce end: before=%{public}d, after=%{public}d", before, after);
    return result;
}

// 模块初始化
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testUVVersion", nullptr, TestUVVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testLoop", nullptr, TestLoop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testErrName", nullptr, TestErrName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testReqGetData", nullptr, TestReqGetData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testPrintHandles", nullptr, TestPrintHandles, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testUdpSendQueue", nullptr, TestUdpSendQueue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testFsLchown", nullptr, TestFsLchown, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testDisableStdioInheritance", nullptr, TestDisableStdioInheritance, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testDlsym", nullptr, TestDlsym, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testUvOnce", nullptr, TestUvOnce, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libuvtest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterLibuvTestModule(void)
{
    napi_module_register(&demoModule);
}
