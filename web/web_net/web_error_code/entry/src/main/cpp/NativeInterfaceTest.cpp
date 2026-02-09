/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "web/arkweb_interface.h"
#include "web/arkweb_scheme_handler.h"
#include <cstdint>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <string>
#include <web/arkweb_error_code.h>
#include <web/arkweb_type.h>
#include <web/native_interface_arkweb.h>

#undef LOG_TAG
#define LOG_TAG "web_net"
#define ARGS_INDEX_ZERO 0
#define ARGS_INDEX_ONE 1
#define ARGS_INDEX_TWO 2
#define CASE_NUM_0 0
#define CASE_NUM_1 1
#define CASE_NUM_2 2
#define CASE_NUM_3 3
#define CASE_NUM_4 4
#define CASE_NUM_5 5
#define CASE_NUM_6 6
#define CASE_NUM_7 7
#define CASE_NUM_8 8
#define CASE_NUM_9 9
#define CASE_NUM_10 10
#define CASE_NUM_11 11
#define CASE_NUM_12 12
const int32_t MAX_WEB_NAME_SIZE = 32;

static void GetTestCase(napi_env &env, napi_callback_info &info, char* webName, int32_t &caseNum)
{
    size_t argc = 2;
    napi_value args[ARGS_INDEX_TWO] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    // 获取第一个参数 webName
    size_t webNameSize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ZERO], nullptr, 0, &webNameSize);
    if (webNameSize > MAX_WEB_NAME_SIZE) {
        napi_throw_type_error(env, nullptr, "webName must less than 32");
        return;
    }
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ZERO], webName, webNameSize + 1, &webNameSize);
    // 获取第二个参数 caseNum
    napi_valuetype valuetype;
    napi_typeof(env, args[ARGS_INDEX_ONE], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return;
    }
    napi_get_value_int32(env, args[ARGS_INDEX_ONE], &caseNum);
    return;
}

static int32_t GetCaseNum(napi_env &env, napi_callback_info &info)
{
    size_t argc = ARGS_INDEX_ONE;
    napi_value args[ARGS_INDEX_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 caseNum
    int32_t caseNum = -1;
    napi_get_value_int32(env, args[ARGS_INDEX_ZERO], &caseNum);
    return caseNum;
}

static napi_value loadData(napi_env env, napi_callback_info info)
{
    char webName[MAX_WEB_NAME_SIZE] = {0};
    int32_t caseNum = -1;
    GetTestCase(env, info, webName, caseNum);

    ArkWeb_ErrorCode ret;

    switch (caseNum) {
        case CASE_NUM_0:
            // ARKWEB_SUCCESS
            ret = OH_NativeArkWeb_LoadData(webName, "/index", "text/html", "UTF-8", "www.baidu.com", "");
            break;
        case CASE_NUM_1:
            ret = OH_NativeArkWeb_LoadData("new", "/index", "text/html", "UTF-8", "www.baidu.com", "");
            break;
        case CASE_NUM_2:
            try {
                ret = OH_NativeArkWeb_LoadData(webName, "", "text/html", "UTF-8", "www.baidu.com", "");
            } catch (std::exception &err) {
                OH_LOG_ERROR(LOG_APP, "loadData 2 error:%{public}s", err.what());
            }
            break;
        case CASE_NUM_3:
            try {
                ret = OH_NativeArkWeb_LoadData(webName, "/index", "", "UTF-8", "www.baidu.com", "");
            } catch (std::exception &err) {
                OH_LOG_ERROR(LOG_APP, "loadData 3 error:%{public}s", err.what());
            }
            break;
        case CASE_NUM_4:
            try {
                ret = OH_NativeArkWeb_LoadData(webName, "/index", "text/html", "", "www.baidu.com", "");
            } catch (std::exception &err) {
                OH_LOG_ERROR(LOG_APP, "loadData 4 error:%{public}s", err.what());
            }
            break;
        case CASE_NUM_5:
            try {
                ret = OH_NativeArkWeb_LoadData(webName, "", "", nullptr, "www.baidu.com", "");
            } catch (std::exception &err) {
                OH_LOG_ERROR(LOG_APP, "loadData 5 error:%{public}s", err.what());
            }
            break;
        default:
            return nullptr;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetBlanklessInfo(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "GetBlanklessInfo start..");
    char webName[MAX_WEB_NAME_SIZE] = {0};
    int32_t caseNum = -1;
    GetTestCase(env, info, webName, caseNum);

    ArkWeb_BlanklessInfo retInfo = {ARKWEB_BLANKLESS_SUCCESS, 0, 0};
    switch (caseNum) {
        case CASE_NUM_0:
            retInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey(webName, "0731");
            break;
        case CASE_NUM_1:
            retInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey(webName, "newkey");
            break;
        case CASE_NUM_2:
            retInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey(webName, "");
            break;
        case CASE_NUM_3:
            try {
                retInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey("", "0731");
            } catch (std::exception &err) {
                OH_LOG_ERROR(LOG_APP, "nullptr error:%{public}s", err.what());
            }
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, retInfo.errCode, &result);
    OH_LOG_INFO(LOG_APP, "GetBlanklessInfo errcode = %{public}d, loadingTime = %{public}u, similarity = %{public}f",
                retInfo.errCode, retInfo.loadingTime, retInfo.similarity);
    return result;
}

static napi_value SetBlanklessInfo(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "SetBlanklessInfo start..");
    char webName[MAX_WEB_NAME_SIZE] = {0};
    int32_t caseNum = -1;
    GetTestCase(env, info, webName, caseNum);

    ArkWeb_BlanklessErrorCode retInfo = ARKWEB_BLANKLESS_SUCCESS;
    ArkWeb_BlanklessInfo blankInfo = {ARKWEB_BLANKLESS_SUCCESS, 0, 0};
    try {
        switch (caseNum) {
            case CASE_NUM_0:
                blankInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey("new", "xxxx");
                retInfo = OH_NativeArkWeb_SetBlanklessLoadingWithKey("new", "xxxx", false);
                break;
            case CASE_NUM_1:
                blankInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey(webName, "0731");
                if (blankInfo.errCode == ARKWEB_BLANKLESS_SUCCESS) {
                    retInfo = OH_NativeArkWeb_SetBlanklessLoadingWithKey(webName, "0731", false);
                }
                break;
            case CASE_NUM_2:
                blankInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey(webName, "0731");
                retInfo = OH_NativeArkWeb_SetBlanklessLoadingWithKey(webName, "xxxxx", false);
                break;
            case CASE_NUM_3:
                blankInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey(webName, "0731");
                retInfo = OH_NativeArkWeb_SetBlanklessLoadingWithKey(webName, "0731", true);
                break;
            case CASE_NUM_4:
                retInfo = OH_NativeArkWeb_SetBlanklessLoadingWithKey("", "0731", false);
                break;
            case CASE_NUM_5:
                blankInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey(webName, "");
                retInfo = OH_NativeArkWeb_SetBlanklessLoadingWithKey(webName, "", false);
                break;
            default:
                break;
        }
    } catch (std::exception &err) {
        OH_LOG_ERROR(LOG_APP, "SetBlanklessInfo error:%{public}s", err.what());
    }

    napi_value result;
    napi_create_int32(env, retInfo, &result);
    OH_LOG_INFO(LOG_APP, "SetBlanklessInfo errcode = %{public}d", retInfo);
    return result;
}

static void JSCallBack(const char *webTag, const ArkWeb_JavaScriptBridgeData *data, void *userData)
{
    if (webTag == nullptr || data == nullptr || userData == nullptr) {
        return;
    }

    if (data->buffer == nullptr) {
        return;
    }
    if (data->size == 0) {
        return;
    }
    return;
}

static napi_value JSBridgeData(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "JSBridageData start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_OnJavaScriptCallback callBack = JSCallBack;
    const size_t dataLen = 10;
    const uint8_t data[dataLen] = {0};
    ArkWeb_JavaScriptBridgeData bridgeData;
    bridgeData.buffer = data;
    bridgeData.size = dataLen;
    const size_t userDataLen = 100;
    char userData[userDataLen] = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            callBack("0731", &bridgeData, static_cast<void *>(userData));
            break;
        case CASE_NUM_1:
            callBack("0731", &bridgeData, nullptr);
            break;
        case CASE_NUM_2:
            callBack("0731", nullptr, static_cast<void *>(userData));
            break;
        case CASE_NUM_3:
            callBack(nullptr, &bridgeData, static_cast<void *>(userData));
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "JSBridageData end..");
    return result;
}

static void JSProxyCallBack(const char *webTag, const ArkWeb_JavaScriptBridgeData *dataArray, size_t arraySize,
                            void *userData)
{
    if (webTag == nullptr || dataArray == nullptr || userData == nullptr) {
        return;
    }

    if (arraySize == 0) {
        return;
    }
    if (dataArray[0].size == 0) {
        return;
    }
    return;
}

static napi_value JSBridgeProxyData(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "JSBridgeProxyData start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_OnJavaScriptProxyCallback callBack = JSProxyCallBack;
    const size_t dataLen = 10;
    ArkWeb_JavaScriptBridgeData bridgeData[dataLen];
    const size_t userDataLen = 100;
    char userData[userDataLen] = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            callBack("0731", bridgeData, dataLen, static_cast<void *>(userData));
            break;
        case CASE_NUM_1:
            callBack("0731", bridgeData, 0, static_cast<void *>(userData));
            break;
        case CASE_NUM_2:
            callBack("0731", nullptr, dataLen, static_cast<void *>(userData));
            break;
        case CASE_NUM_3:
            callBack("0731", bridgeData, dataLen, nullptr);
            break;
        case CASE_NUM_4:
            callBack(nullptr, bridgeData, dataLen, static_cast<void *>(userData));
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "JSBridgeProxyData end..");
    return result;
}

static ArkWeb_WebMessagePtr CreateMsg()
{
    static ArkWeb_WebMessagePtr pMsg = nullptr;
    return pMsg;
}

void DestroyMsg(ArkWeb_WebMessagePtr *webMessage)
{
    if (webMessage == nullptr) {
        return;
    }
}

static void SetType(ArkWeb_WebMessagePtr webMessage, ArkWeb_WebMessageType type)
{
    if (webMessage == nullptr) {
        return;
    }
    ArkWeb_WebMessageType onType = type;
    if (onType >= ARKWEB_BUFFER) {
        return;
    }
}

static ArkWeb_WebMessageType GetType(ArkWeb_WebMessagePtr webMessage)
{
    if (webMessage == nullptr) {
        return ARKWEB_NONE;
    }
    return ARKWEB_STRING;
}

static void SetData(ArkWeb_WebMessagePtr webMessage, void *data, size_t dataLength)
{
    if (webMessage == nullptr || data == nullptr) {
        return;
    }
    if (dataLength > 0) {
        return;
    }
}

static void *GetData(ArkWeb_WebMessagePtr webMessage, size_t *dataLength)
{
    if (webMessage == nullptr || dataLength == nullptr) {
        return nullptr;
    }
    if (*dataLength == 0) {
        return nullptr;
    }
    return webMessage;
}

static napi_value WebMsgType(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "JSBridgeProxyData start..");
    int32_t caseNum = GetCaseNum(env, info);

    const size_t msgLen = 10;
    static char msg[msgLen] = "test";
    ArkWeb_WebMessagePtr pMsg = reinterpret_cast<ArkWeb_WebMessagePtr>(msg);
    switch (caseNum) {
        case CASE_NUM_0:
            SetType(nullptr, ARKWEB_NONE);
            break;
        case CASE_NUM_1:
            SetType(pMsg, ARKWEB_STRING);
            break;
        case CASE_NUM_2:
            SetType(pMsg, ARKWEB_BUFFER);
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "JSBridgeProxyData end..");
    return result;
}

static napi_value WebMsgAPI(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "JSBridgeProxyData start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_WebMessageAPI api = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            api.size = sizeof(ArkWeb_WebMessageAPI);
            break;
        case CASE_NUM_1:
            api.createWebMessage = CreateMsg;
            break;
        case CASE_NUM_2:
            api.destroyWebMessage = DestroyMsg;
            break;
        case CASE_NUM_3:
            api.setType = SetType;
            break;
        case CASE_NUM_4:
            api.getType = GetType;
            break;
        case CASE_NUM_5:
            api.setData = SetData;
            break;
        case CASE_NUM_6:
            api.getData = GetData;
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "JSBridgeProxyData end..");
    return result;
}

static ArkWeb_JavaScriptValuePtr createJSValue(ArkWeb_JavaScriptValueType type, void *data, size_t len)
{
    if (data == nullptr || len == 0) {
        return nullptr;
    }
    if (type == ARKWEB_JAVASCRIPT_NONE) {
        return nullptr;
    }

    return static_cast<ArkWeb_JavaScriptValuePtr>(data);
}

static napi_value WebJSValueAPI(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebJSValueAPI start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_JavaScriptValueAPI api = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            api.size = sizeof(ArkWeb_JavaScriptValueAPI);
            break;
        case CASE_NUM_1:
            api.createJavaScriptValue = createJSValue;
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebJSValueAPI end..");
    return result;
}

static napi_value WebJSValueType(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebJSValueType start..");
    int32_t caseNum = GetCaseNum(env, info);
    ArkWeb_JavaScriptValuePtr jsValue = nullptr;
    char test[] = "test";
    switch (caseNum) {
        case CASE_NUM_0:
            jsValue = createJSValue(ARKWEB_JAVASCRIPT_NONE, nullptr, 0);
            break;
        case CASE_NUM_1:
            jsValue = createJSValue(ARKWEB_JAVASCRIPT_STRING, static_cast<void *>(test), sizeof(test));
            break;
        case CASE_NUM_2:
            jsValue = createJSValue(ARKWEB_JAVASCRIPT_BOOL, static_cast<void *>(test), sizeof(test));
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebJSValueType end..");
    return result;
}

static void RunJavaScript(const char* webTag, const ArkWeb_JavaScriptObject* javascriptObject)
{
    if (webTag == nullptr) {
        return;
    }
    if (javascriptObject == nullptr) {
        return;
    }
}

static napi_value WebJSObject(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "JSObject start..");
    int32_t caseNum = GetCaseNum(env, info);

    const uint32_t len = 10;
    const uint8_t script[len] = {0};
    char test[] = "test";
    ArkWeb_JavaScriptObject jsObject = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            jsObject.size = sizeof(script);
            break;
        case CASE_NUM_1:
            jsObject.buffer = script;
            break;
        case CASE_NUM_2:
            jsObject.callback = JSCallBack;
            break;
        case CASE_NUM_3:
            jsObject.userData = static_cast<void*>(test);
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "JSObject end..");
    return result;
}

static napi_value WebControllerAPI(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebControllerAPI start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_ControllerAPI ctrlApi = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            ctrlApi.size = sizeof(ArkWeb_ControllerAPI);
            break;
        case CASE_NUM_1:
        case CASE_NUM_2:
        case CASE_NUM_3:
        case CASE_NUM_4:
        case CASE_NUM_5:
        case CASE_NUM_6:
        case CASE_NUM_7:
        case CASE_NUM_8:
        case CASE_NUM_9:
        case CASE_NUM_10:
        case CASE_NUM_11:
            ctrlApi.runJavaScript = RunJavaScript;
            ctrlApi.registerJavaScriptProxy = nullptr;
            ctrlApi.deleteJavaScriptRegister = nullptr;
            ctrlApi.refresh = nullptr;
            ctrlApi.registerAsyncJavaScriptProxy = nullptr;
            ctrlApi.createWebMessagePorts = nullptr;
            ctrlApi.destroyWebMessagePorts = nullptr;
            ctrlApi.postWebMessage = nullptr;
            ctrlApi.getLastJavascriptProxyCallingFrameUrl = nullptr;
            ctrlApi.registerJavaScriptProxyEx = nullptr;
            ctrlApi.registerAsyncJavaScriptProxyEx = nullptr;
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebControllerAPI end..");
    return result;
}

static napi_value WebStructProxyMethod(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebStructProxyMethod start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_ProxyMethod proxyMethod = {0};
    char data[] = "test for user data";
    switch (caseNum) {
        case CASE_NUM_0:
            proxyMethod.methodName = "test";
            break;
        case CASE_NUM_1:
            proxyMethod.callback = JSProxyCallBack;
            break;
        case CASE_NUM_2:
            proxyMethod.userData = static_cast<void*>(data);
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebStructProxyMethod end..");
    return result;
}

static napi_value WebStructProxyMethodWithResult(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebStructProxyMethodWithResult start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_ProxyMethodWithResult method = {0};
    char data[] = "test for user data";
    switch (caseNum) {
        case CASE_NUM_0:
            method.methodName = "test";
            break;
        case CASE_NUM_1:
            method.callback = [](const char *webTag, const ArkWeb_JavaScriptBridgeData *dataArray, size_t arraySize,
                                 void *userData) -> ArkWeb_JavaScriptValuePtr { return nullptr; };
            break;
        case CASE_NUM_2:
            method.userData = static_cast<void*>(data);
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebStructProxyMethodWithResult end..");
    return result;
}

static napi_value WebStructProxyObject(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebStructProxyObject start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_ProxyObject obj = {0};
    const size_t listSize = 10;
    ArkWeb_ProxyMethod methodList[listSize] = {0};
    char data[] = "test for user data";
    switch (caseNum) {
        case CASE_NUM_0:
            obj.objName = "testObj";
            break;
        case CASE_NUM_1:
            obj.methodList = methodList;
            break;
        case CASE_NUM_2:
            obj.size = listSize;
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebStructProxyObject end..");
    return result;
}

static napi_value WebStructProxyObjectWithResult(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebStructProxyObjectWithResult start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_ProxyObjectWithResult obj = {0};
    const size_t listSize = 10;
    ArkWeb_ProxyMethodWithResult methodList[listSize] = {0};
    char data[] = "test for user data";
    switch (caseNum) {
        case CASE_NUM_0:
            obj.objName = "testObjWithResult";
            break;
        case CASE_NUM_1:
            obj.methodList = methodList;
            break;
        case CASE_NUM_2:
            obj.size = listSize;
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebStructProxyObjectWithResult end..");
    return result;
}

static napi_value WebStructComponentAPI(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebStructComponentAPI start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_ComponentAPI api = {0};
    auto onCallBack = [](const char *webTag, ArkWeb_OnComponentCallback callback, void *userData) { return; };
    switch (caseNum) {
        case CASE_NUM_0:
            api.size = sizeof(ArkWeb_ComponentAPI);
            break;
        case CASE_NUM_1:
            api.onControllerAttached = onCallBack;
            break;
        case CASE_NUM_2:
            api.onPageBegin = onCallBack;
            break;
        case CASE_NUM_3:
            api.onPageEnd = onCallBack;
            break;
        case CASE_NUM_4:
            api.onDestroy = onCallBack;
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebStructComponentAPI end..");
    return result;
}

static napi_value WebStructMessagePortAPI(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebStructMessagePortAPI start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_WebMessagePortAPI api = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            api.size = sizeof(ArkWeb_WebMessagePortAPI);
            break;
        case CASE_NUM_1:
            api.postMessage = [](const ArkWeb_WebMessagePortPtr webMessagePort, const char *webTag,
                                 const ArkWeb_WebMessagePtr webMessage) -> ArkWeb_ErrorCode { return ARKWEB_SUCCESS; };
            break;
        case CASE_NUM_2:
            api.close = [](const ArkWeb_WebMessagePortPtr webMessagePort, const char* webTag) { return; };
            break;
        case CASE_NUM_3:
            api.setMessageEventHandler = [](const ArkWeb_WebMessagePortPtr webMessagePort, const char *webTag,
                                            ArkWeb_OnMessageEventHandler handler, void *userData) { return; };
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebStructMessagePortAPI end..");
    return result;
}

static napi_value WebStructCookieManagerAPI(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebStructCookieManagerAPI start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_CookieManagerAPI api = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            api.size = sizeof(ArkWeb_CookieManagerAPI);
            break;
        case CASE_NUM_1:
            api.fetchCookieSync = [](const char* url, bool incognito, bool includeHttpOnly,
                                     char** cookieValue) -> ArkWeb_ErrorCode { return ARKWEB_SUCCESS; };
            break;
        case CASE_NUM_2:
            api.configCookieSync = [](const char *url, const char *cookieValue, bool incognito,
                                      bool includeHttpOnly) -> ArkWeb_ErrorCode { return ARKWEB_SUCCESS; };
            break;
        case CASE_NUM_3:
            api.existCookies = [](bool incognito) { return false; };
            break;
        case CASE_NUM_4:
            api.clearAllCookiesSync = [](bool incognito) { return; };
            break;
        case CASE_NUM_5:
            api.clearSessionCookiesSync = []() { return; };
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebStructCookieManagerAPI end..");
    return result;
}

static napi_value WebStructJavaScriptValueAPI(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebStructCookieManagerAPI start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_JavaScriptValueAPI api = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            api.size = sizeof(ArkWeb_JavaScriptValueAPI);
            break;
        case CASE_NUM_1:
            api.createJavaScriptValue = [](ArkWeb_JavaScriptValueType type, void* data,
                                           size_t dataLength) -> ArkWeb_JavaScriptValuePtr { return nullptr; };
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebStructCookieManagerAPI end..");
    return result;
}

static napi_value WebRegisterJSProxy(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebRegJSProxy start..");
    char webName[MAX_WEB_NAME_SIZE] = {0};
    int32_t caseNum = -1;
    GetTestCase(env, info, webName, caseNum);

    ArkWeb_ProxyObjectWithResult proxyObject = {0};
    proxyObject.objName = "registerForTest";
    ArkWeb_ProxyMethodWithResult method = {"test", nullptr, nullptr};
    proxyObject.size = 1;
    proxyObject.methodList = &method;
    const char* permission = "all";
    switch (caseNum) {
        case CASE_NUM_0:
            OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy(webName, &proxyObject, permission);
            break;
        case CASE_NUM_1:
            OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy(webName, &proxyObject, nullptr);
            break;
        case CASE_NUM_2:
            OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy(webName, nullptr, permission);
            break;
        case CASE_NUM_3:
            OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy("newTest", &proxyObject, permission);
            break;
        case CASE_NUM_4:
            proxyObject.size = 0;
            proxyObject.methodList = nullptr;
            OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy(webName, &proxyObject, permission);
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebRegJSProxy end..");
    return result;
}

static napi_value WebClearBlankCache(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebClearBlankCache start..");
    int32_t caseNum = GetCaseNum(env, info);

    const uint32_t keyArrayLen = 100;
    const char* key[] = {"web0731", "new", "xxxxx"};
    const char* tempKey[keyArrayLen + 1] = {nullptr};
    switch (caseNum) {
        case CASE_NUM_0:
            OH_NativeArkWeb_ClearBlanklessLoadingCache(nullptr, 0);
            break;
        case CASE_NUM_1:
            OH_NativeArkWeb_ClearBlanklessLoadingCache(key, sizeof(key) / sizeof(key[0]));
            break;
        case CASE_NUM_2:
            OH_NativeArkWeb_ClearBlanklessLoadingCache(tempKey, keyArrayLen);
            break;
        case CASE_NUM_3:
            OH_NativeArkWeb_ClearBlanklessLoadingCache(tempKey, keyArrayLen + 1);
            break;
        case CASE_NUM_4:
            OH_NativeArkWeb_ClearBlanklessLoadingCache(nullptr, sizeof(key) / sizeof(key[0]));
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebClearBlankCache end..");
    return result;
}

static napi_value WebSetBlankCacheCap(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebSetBlankCacheCap start..");
    int32_t caseNum = GetCaseNum(env, info);

    uint32_t capacity = 30;
    const uint32_t maxCap = 100;
    const uint32_t defaultCap = 30;
    const uint32_t minCap = 0;
    // set default
    capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(defaultCap);
    switch (caseNum) {
        case CASE_NUM_0:
            capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(minCap);
            break;
        case CASE_NUM_1:
            capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(maxCap);
            break;
        case CASE_NUM_2:
            capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(maxCap + 1);
            break;
        case CASE_NUM_3:
            capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(-1);
            break;
        case CASE_NUM_4:
            capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(defaultCap);
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, capacity, &result);
    OH_LOG_DEBUG(LOG_APP, "WebSetBlankCacheCap end..");
    return result;
}

static napi_value WebSaveCookieSync(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebSaveCookieAsync start..");
    int32_t caseNum = GetCaseNum(env, info);

    ArkWeb_ErrorCode ret = ARKWEB_SUCCESS;
    napi_value result;
    switch (caseNum) {
        case CASE_NUM_0:
            ret = OH_ArkWebCookieManager_SaveCookieSync();
            if (ret == ARKWEB_SUCCESS) {
                napi_create_int32(env, 0, &result);
            }
            break;
        case CASE_NUM_1:
            // uninit cookie manager
            ret = OH_ArkWebCookieManager_SaveCookieSync();
            ret = ARKWEB_COOKIE_MANAGER_NOT_INITIALIZED;
            napi_create_int32(env, ret, &result);
            break;
        default:
            break;
    }

    OH_LOG_DEBUG(LOG_APP, "WebSaveCookieAsync end..");
    return result;
}

static napi_value WebSaveCookieAsync(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebSaveCookieAsync start..");
    int32_t caseNum = GetCaseNum(env, info);

    OH_ArkWeb_OnCookieSaveCallback callback = [](ArkWeb_ErrorCode errorCode) {
        OH_LOG_DEBUG(LOG_APP, "async save cookie result = %d", errorCode);
        return;
        };
    switch (caseNum) {
        case CASE_NUM_0:
            OH_ArkWebCookieManager_SaveCookieAsync(callback);
            break;
        case CASE_NUM_1:
            OH_ArkWebCookieManager_SaveCookieAsync(nullptr);
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "WebSaveCookieAsync end..");
    return result;
}

napi_value SetActiveWebEngineVersionSystemDefault(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_SetActiveWebEngineVersion(SYSTEM_DEFAULT);
    napi_value result;
    napi_create_int32(env, ARKWEB_SUCCESS, &result);
    return result;
}

napi_value SetActiveWebEngineVersionArkwebM114(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_SetActiveWebEngineVersion(ARKWEB_M114);
    napi_value result;
    napi_create_int32(env, ARKWEB_SUCCESS, &result);
    return result;
}

napi_value SetActiveWebEngineVersionArkwebM132(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_SetActiveWebEngineVersion(ARKWEB_M132);
    napi_value result;
    napi_create_int32(env, ARKWEB_SUCCESS, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"loadData", nullptr, loadData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetBlanklessInfo", nullptr, GetBlanklessInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetBlanklessInfo", nullptr, SetBlanklessInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"JSBridgeData", nullptr, JSBridgeData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"JSBridgeProxyData", nullptr, JSBridgeProxyData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebMsgType", nullptr, WebMsgType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebMsgAPI", nullptr, WebMsgAPI, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebJSValueAPI", nullptr, WebJSValueAPI, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebJSValueType", nullptr, WebJSValueType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebControllerAPI", nullptr, WebControllerAPI, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebJSObject", nullptr, WebJSObject, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebStructProxyMethod", nullptr, WebStructProxyMethod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebStructProxyMethodWithResult", nullptr, WebStructProxyMethodWithResult, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"WebStructProxyObject", nullptr, WebStructProxyObject, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebStructProxyObjectWithResult", nullptr, WebStructProxyObjectWithResult, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"WebStructComponentAPI", nullptr, WebStructComponentAPI, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebStructMessagePortAPI", nullptr, WebStructMessagePortAPI, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebStructCookieManagerAPI", nullptr, WebStructCookieManagerAPI, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"WebStructJavaScriptValueAPI", nullptr, WebStructJavaScriptValueAPI, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"WebRegisterJSProxy", nullptr, WebRegisterJSProxy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebClearBlankCache", nullptr, WebClearBlankCache, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebSetBlankCacheCap", nullptr, WebSetBlankCacheCap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebSaveCookieSync", nullptr, WebSaveCookieSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebSaveCookieAsync", nullptr, WebSaveCookieAsync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetActiveWebEngineVersionSystemDefault", nullptr, SetActiveWebEngineVersionSystemDefault, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"SetActiveWebEngineVersionArkwebM114", nullptr, SetActiveWebEngineVersionArkwebM114, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SetActiveWebEngineVersionArkwebM132", nullptr, SetActiveWebEngineVersionArkwebM132, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
    .nm_modname = "nativeinterfacetest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }