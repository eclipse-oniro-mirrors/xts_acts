/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "hilog/log.h"
#include "napi/native_api.h"
#include <chrono>
#include <string>
#include "common/native_common.h"
#include "web/native_interface_arkweb.h"
#include "web/arkweb_interface.h"
#include "jsbridgeObject.h"
#include <thread>


constexpr unsigned int LOG_PRINT_DOMAIN = 0xFF00;
ArkWeb_ControllerAPI *controller = nullptr;
ArkWeb_JavaScriptValueAPI *javaScriptValueApi = nullptr;
std::shared_ptr<JSBridgeObject> jsbridge_object_ptr = nullptr;
std::string g_ndkJsBridge = "";
std::string g_ndkAsyncJsBridge = "";
std::string g_ndkJsBridgeEx = "";
std::string g_ndkAsyncJsBridgeEx = "";

std::chrono::time_point<std::chrono::high_resolution_clock> start;

int g_funcOnePid = -1;
int g_funcTwoPid = -1;

std::thread::id g_thisId = std::this_thread::get_id();
std::size_t g_hashValueCur = std::hash<std::thread::id>()(g_thisId);
int g_mPid = static_cast<int>(g_hashValueCur);

char *GetStringValue(napi_env env, napi_value value)
{
    size_t size = 0;
    napi_get_value_string_utf8(env, value, nullptr, 0, &size);
    char *paramValue = new (std::nothrow) char[size + 1];
    size_t paramLength = 0;
    napi_get_value_string_utf8(env, value, paramValue, size + 1, &paramLength);
    return paramValue;
}

// 发送JS脚本到H5侧执行，执行结果的回调
static void RunJavaScriptCallback(const char *result)
{
    std::chrono::duration<double, std::milli> elapsed_ms = std::chrono::high_resolution_clock::now() - start;
}

// 示例代码 ，注册了1个对象，2个方法
static char *ProxyMethod1(const char **argv, int argc)
{
    return nullptr;
}

static char *ProxyMethod2(const char **argv, int argc)
{
    char *ret = "ygz hello from native ProxyMethod2";
    return ret;
}

static char *ProxyMethod3(const char **argv, int argc)
{
    char *ret = "ygz hello from native ProxyMethod3";
    return ret;
}

void ValidCallback(const char *webName)
{
    const char *methodName[2] = {"method1", "method2"};
    NativeArkWeb_OnJavaScriptProxyCallback callback[2] = {ProxyMethod1, ProxyMethod2};
    // 如此注册的情况下，在H5页面就可以使用proxy.method1、proxy.method1调用此文件下的ProxyMethod1和ProxyMethod2方法了
    int32_t size = 2;
    OH_NativeArkWeb_RegisterJavaScriptProxy(webName, "ndkProxy", methodName, callback, size, false);
}

void DestroyCallback(const char *webName)
{
}

static napi_value NativeWebInit(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webName
    size_t webNameSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webNameSize);
    char *webNameValue = new (std::nothrow) char[webNameSize + 1];
    size_t webNameLength = 0;
    napi_get_value_string_utf8(env, args[0], webNameValue, webNameSize + 1, &webNameLength);

    // 注js proxy册回调函数
    NativeArkWeb_OnValidCallback ptr = ValidCallback;
    OH_NativeArkWeb_SetJavaScriptProxyValidCallback(webNameValue, ptr);
    OH_NativeArkWeb_GetJavaScriptProxyValidCallback(webNameValue);
    // 注册destroy回调函数
    OH_NativeArkWeb_SetDestroyCallback(webNameValue, DestroyCallback);
    OH_NativeArkWeb_GetDestroyCallback(webNameValue);
    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, "RunSuccess", NAPI_AUTO_LENGTH, &output));
    return output;
}

// 发送JS脚本到H5侧执行
static napi_value RunJavaScript(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    // 获取第一个参数 webName
    size_t webNameSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webNameSize);
    char *webNameValue = new (std::nothrow) char[webNameSize + 1];
    size_t webNameLength = 0;
    napi_get_value_string_utf8(env, args[0], webNameValue, webNameSize + 1, &webNameLength);

    // 获取第二个参数 jsCode
    size_t bufferSize = 0;
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &bufferSize);
    char *jsCode = new (std::nothrow) char[bufferSize + 1];
    size_t byteLength = 0;
    napi_get_value_string_utf8(env, args[1], jsCode, bufferSize + 1, &byteLength);
    start = std::chrono::high_resolution_clock::now();

    // 调用ndk接口
    OH_NativeArkWeb_RunJavaScript(webNameValue, jsCode, RunJavaScriptCallback);
    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, "RunSuccess", NAPI_AUTO_LENGTH, &output));
    return output;
}

static napi_value RegisterJavaScriptProxy(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webName
    size_t webNameSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webNameSize);
    char *webNameValue = new (std::nothrow) char[webNameSize + 1];
    size_t webNameLength = 0;
    napi_get_value_string_utf8(env, args[0], webNameValue, webNameSize + 1, &webNameLength);
    const char *methodName[3] = {"method1", "method2", "method3"};
    NativeArkWeb_OnJavaScriptProxyCallback callback[3] = {ProxyMethod1, ProxyMethod2, ProxyMethod3};
    // 如此注册的情况下，在H5页面就可以使用proxy.method1、proxy.method1调用此文件下的ProxyMethod1和ProxyMethod2方法了
    int32_t size = 3;
    OH_NativeArkWeb_RegisterJavaScriptProxy(webNameValue, "ndkProxy", methodName, callback, size, false);
    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, "RunSuccess", NAPI_AUTO_LENGTH, &output));
    return output;
}

static napi_value UnregisterJavaScriptProxy(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webName
    size_t webNameSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webNameSize);
    char *webNameValue = new (std::nothrow) char[webNameSize + 1];
    size_t webNameLength = 0;
    napi_get_value_string_utf8(env, args[0], webNameValue, webNameSize + 1, &webNameLength);
    NativeArkWeb_OnJavaScriptProxyCallback callback[3] = {ProxyMethod1, ProxyMethod2, ProxyMethod3};
    // 如此注册的情况下，在H5页面就可以使用proxy.method1、proxy.method1调用此文件下的ProxyMethod1和ProxyMethod2方法了
    OH_NativeArkWeb_UnregisterJavaScriptProxy(webNameValue, "ndkProxy");
    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, "RunSuccess", NAPI_AUTO_LENGTH, &output));
    return output;
}

ArkWeb_JavaScriptValuePtr ArkWebProxyMethodOne(const char *webTag, const ArkWeb_JavaScriptBridgeData *dataArray,
    size_t arraySize, void *userData)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb",
        "ArkWebProxyMethodOne webTag:%{public}s userData:%{public}s",
        webTag,
        (char *)userData);
    std::size_t hashValue = std::hash<std::thread::id>()(std::this_thread::get_id());
    g_funcOnePid = static_cast<int>(hashValue);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb",
        "ArkWebProxyMethodOne PID:%{public}d, Fid:%{public}d",
        g_mPid,
        g_funcOnePid);
    jsbridge_object_ptr->ProxyMethod(dataArray, arraySize);
    std::string str = std::string((char *)userData);
    return javaScriptValueApi->createJavaScriptValue(ArkWeb_JavaScriptValueType::ARKWEB_JAVASCRIPT_STRING,
        (void *)str.c_str(),
        str.length() + 1);
}

ArkWeb_JavaScriptValuePtr ArkWebProxyMethodTwo(const char *webTag, const ArkWeb_JavaScriptBridgeData *dataArray,
    size_t arraySize, void *userData)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb",
        "ArkWebProxyMethodTwo webTag:%{public}s userData:%{public}s",
        webTag,
        (char *)userData);
    std::size_t hashValue = std::hash<std::thread::id>()(std::this_thread::get_id());
    g_funcTwoPid = static_cast<int>(hashValue);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb",
        "ArkWebProxyMethodTwo PID:%{public}d, Fid:%{public}d",
        g_mPid,
        g_funcTwoPid);
    jsbridge_object_ptr->ProxyMethod(dataArray, arraySize);
    bool boolValue = true;
    return javaScriptValueApi->createJavaScriptValue(ArkWeb_JavaScriptValueType::ARKWEB_JAVASCRIPT_BOOL,
        (void *)(&boolValue),
        1);
}

ArkWeb_JavaScriptValuePtr ArkWebProxyMethodThree(const char *webTag, const ArkWeb_JavaScriptBridgeData *dataArray,
    size_t arraySize, void *userData)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb",
        "ArkWebProxyMethodThree webTag:%{public}s userData:%{public}s",
        webTag,
        (char *)userData);
    jsbridge_object_ptr->ProxyMethod(dataArray, arraySize);
    return javaScriptValueApi->createJavaScriptValue(ArkWeb_JavaScriptValueType::ARKWEB_JAVASCRIPT_NONE,
        (void *)nullptr,
        1);
}

ArkWeb_ProxyObjectWithResult GetProxyObjectWithResult(napi_env env, napi_value args[])
{
    ArkWeb_ProxyMethodWithResult *methodList = new ArkWeb_ProxyMethodWithResult[3];
    const char *userDataOne = "method1";
    const char *userDataTwo = "method2";
    const char *userDataThree = "method3";
    const int indexOne = 0;
    const int indexTwo = 1;
    const int indexThree = 2;
    methodList[indexOne] = {"method1", ArkWebProxyMethodOne, (void *)userDataOne};
    methodList[indexTwo] = {"method2", ArkWebProxyMethodTwo, (void *)userDataTwo};
    methodList[indexThree] = {"method3", ArkWebProxyMethodThree, (void *)userDataThree};

    int32_t size = 3;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AsyncRegister", "methodSize:%{public}d", size);
    ArkWeb_ProxyObjectWithResult proxyObject = {"ndkProxy", methodList, (size_t)size};
    return proxyObject;
}



static napi_value NativeWebInitTwo(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "NativeWebInitTwo start");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webName
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb",
        "NativeWebInitTwo webTag:%{public}s",
        webTagValue);

    jsbridge_object_ptr = std::make_shared<JSBridgeObject>(webTagValue);
    if (jsbridge_object_ptr) {
        jsbridge_object_ptr->Init();
    }

    controller = reinterpret_cast<ArkWeb_ControllerAPI *>(OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_CONTROLLER));
    javaScriptValueApi =
        reinterpret_cast<ArkWeb_JavaScriptValueAPI *>(OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_JAVASCRIPT_VALUE));
    if (javaScriptValueApi) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "ArkWeb_JavaScriptValueAPI success");
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "NativeWebInitTwo end");

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, "RunSuccess", NAPI_AUTO_LENGTH, &output));
    return output;
}

static napi_value RegisterAsyncThreadJavaScriptProxy(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *webTagValue = GetStringValue(env, args[0]);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AsyncRegister",
        "RegisterAsyncThreadJavaScriptProxy webTag:%{public}s",
        webTagValue);

    char *permission = GetStringValue(env, args[1]);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AsyncRegister",
        "RegisterAsyncThreadJavaScriptProxy permissionStr:%{public}s",
        permission);

    if (strcmp(permission, "null") == 0) {
        permission = nullptr;
    }
    if (strcmp(webTagValue, "null") == 0) {
        webTagValue = nullptr;
    }

    ArkWeb_ProxyObjectWithResult proxyObjectWithResult = GetProxyObjectWithResult(env, args);
    OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy(webTagValue, &proxyObjectWithResult, permission);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AsyncRegister",
        "RegisterAsyncThreadJavaScriptProxy success");

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, "RunSuccess", NAPI_AUTO_LENGTH, &output));
    return output;
}

static void NdkJsBridge(const char *webTag,
    const ArkWeb_JavaScriptBridgeData *dataArray, size_t arraySize, void *userData)
{
    g_ndkJsBridge += "NdkJsBridge;";
}

static void NdkAsyncJsBridge(const char *webTag,
    const ArkWeb_JavaScriptBridgeData *dataArray, size_t arraySize, void *userData)
{
    g_ndkAsyncJsBridge += "NdkAsyncJsBridge;";
}

ArkWeb_JavaScriptValuePtr NdkJsBridgeEx(const char *webTag,
    const ArkWeb_JavaScriptBridgeData *dataArray, size_t arraySize, void *userData)
{
    g_ndkJsBridgeEx += "NdkJsBridgeEx;";
    bool boolValue = false;
    return javaScriptValueApi->createJavaScriptValue(ArkWeb_JavaScriptValueType::ARKWEB_JAVASCRIPT_BOOL,
        (void *)(&boolValue), 1);
}

static void NdkAsyncJsBridgeEx(const char *webTag,
    const ArkWeb_JavaScriptBridgeData *dataArray, size_t arraySize, void *userData)
{
    g_ndkAsyncJsBridgeEx += "NdkAsyncJsBridgeEx;";
}

static napi_value RegisterForHeadReady(napi_env env, napi_callback_info info)
{
    ArkWeb_ProxyMethod method = {"NdkJsBridge", NdkJsBridge,
        static_cast<void *>(jsbridge_object_ptr->GetWeakPtr())};
    ArkWeb_ProxyMethod methodList[1] = { method };
    ArkWeb_ProxyObject proxyObject = {"SyncObj", methodList, 1};

    controller->registerJavaScriptProxy("ArkWeb", &proxyObject);

    ArkWeb_ProxyMethod methodAsync = {"NdkAsyncJsBridge", NdkAsyncJsBridge,
        static_cast<void *>(jsbridge_object_ptr->GetWeakPtr())};
    ArkWeb_ProxyMethod methodListAsync[1] = { methodAsync };
    ArkWeb_ProxyObject proxyObjectAsync = {"ASyncObj", methodListAsync, 1};

    controller->registerAsyncJavaScriptProxy("ArkWeb", &proxyObjectAsync);

    ArkWeb_ProxyMethodWithResult methodEx = {"NdkJsBridgeEx", NdkJsBridgeEx,
        static_cast<void *>(jsbridge_object_ptr->GetWeakPtr())};
    ArkWeb_ProxyMethodWithResult methodListEx[1] = { methodEx };
    ArkWeb_ProxyObjectWithResult proxyObjectEx = {"SyncObjEx", methodListEx, 1};

    const char* str1 = "{\"javascriptProxyPermission\":{\"urlPermissionList\":[{\"scheme\":\"https\",";
    const char* str2 = "\"host\":\"www.baidu.com\",\"port\":\"\",\"path\":\"\"}]}}";
    std::string str3 = std::string(str1) + str2;
    const char *permission = str3.c_str();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "permission :%{public}s", permission);
    controller->registerJavaScriptProxyEx("ArkWeb", &proxyObjectEx, permission);

    ArkWeb_ProxyMethod methodAsyncEx = {"NdkAsyncJsBridgeEx", NdkAsyncJsBridgeEx,
        static_cast<void *>(jsbridge_object_ptr->GetWeakPtr())};
    ArkWeb_ProxyMethod methodListAsyncEx[1] = { methodAsyncEx };
    ArkWeb_ProxyObject proxyObjectAsyncEx = {"ASyncObjEx", methodListAsyncEx, 1};

    controller->registerAsyncJavaScriptProxyEx("ArkWeb", &proxyObjectAsyncEx, permission);

    napi_value output;
    NAPI_CALL(env, napi_create_string_utf8(env, "success", NAPI_AUTO_LENGTH, &output));
    return output;
}

static napi_value GetPidResult(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "GetPidResult g_mPid:%{public}d", g_mPid);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "GetPidResult funcOnePid:%{public}d", g_funcOnePid);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "GetPidResult funcTwoPid:%{public}d", g_funcTwoPid);
    int32_t testResult = 0;
    if (g_mPid != g_funcOnePid && g_mPid != g_funcTwoPid && g_funcOnePid == g_funcTwoPid) {
        testResult = 1;
    }
    napi_create_int32(env, testResult, &result);
    return result;
}

static napi_value GetResultOne(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string param = g_ndkJsBridge;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "GetResultOne:%{public}s", param.c_str());
    napi_create_string_utf8(env, param.c_str(), param.length(), &result);
    return result;
}

static napi_value GetResultTwo(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string param = g_ndkAsyncJsBridge;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "GetResultTwo:%{public}s", param.c_str());
    napi_create_string_utf8(env, param.c_str(), param.length(), &result);
    return result;
}

static napi_value GetResultThree(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string param = g_ndkJsBridgeEx;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "GetResultThree:%{public}s", param.c_str());
    napi_create_string_utf8(env, param.c_str(), param.length(), &result);
    return result;
}

static napi_value GetResultFour(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::string param = g_ndkAsyncJsBridgeEx;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkWeb", "GetResultFour:%{public}s", param.c_str());
    napi_create_string_utf8(env, param.c_str(), param.length(), &result);
    return result;
}

static napi_value ResetResult(napi_env env, napi_callback_info info)
{
    g_ndkJsBridge = "";
    g_ndkAsyncJsBridge = "";
    g_ndkJsBridgeEx = "";
    g_ndkAsyncJsBridgeEx = "";
    return nullptr;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"nativeWebInit", nullptr, NativeWebInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"runJavaScript", nullptr, RunJavaScript, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerJavaScriptProxy", nullptr, RegisterJavaScriptProxy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unregisterJavaScriptProxy", nullptr, UnregisterJavaScriptProxy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nativeWebInitTwo", nullptr, NativeWebInitTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerAsyncThreadJavaScriptProxy", nullptr, RegisterAsyncThreadJavaScriptProxy, nullptr, nullptr, nullptr,
            napi_default,
            nullptr},
        {"getPidResult", nullptr, GetPidResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerForHeadReady", nullptr, RegisterForHeadReady, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResultOne", nullptr, GetResultOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResultTwo", nullptr, GetResultTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResultThree", nullptr, GetResultThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResultFour", nullptr, GetResultFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetResult", nullptr, ResetResult, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}