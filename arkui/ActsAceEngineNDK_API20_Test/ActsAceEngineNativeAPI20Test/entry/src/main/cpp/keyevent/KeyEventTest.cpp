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

#include "KeyEventTest.h"
#include <cstdint>
static const uint32_t MAX_NAME_LENGTH = 1024;
static bool g_numlockresult = false;
static bool g_capslockresult = false;
static bool g_scrolllockresult = false;
static int32_t g_testresult1 = 2;
static int32_t g_testresult2 = 2;
static int32_t g_testresult3 = 2;

namespace KeyEventTest {

ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

void onReceiver(ArkUI_NodeEvent *event)
{
    const ArkUI_UIInputEvent* g_ArkUI_UIInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    g_testresult1 = OH_ArkUI_KeyEvent_IsNumLockOn(g_ArkUI_UIInputEvent, &g_numlockresult) == ARKUI_ERROR_CODE_NO_ERROR;
    g_testresult2 = OH_ArkUI_KeyEvent_IsCapsLockOn(g_ArkUI_UIInputEvent, &g_capslockresult) ==
                    ARKUI_ERROR_CODE_NO_ERROR;
    g_testresult3 = OH_ArkUI_KeyEvent_IsScrollLockOn(g_ArkUI_UIInputEvent, &g_scrolllockresult) ==
                    ARKUI_ERROR_CODE_NO_ERROR;
    return;
}
napi_value CreateTextInputNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    // 1. 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto keyevent = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    nodeAPI->registerNodeEvent(keyevent, NODE_ON_KEY_EVENT, 1, nullptr);
    ArkUI_NumberValue requestFocusValue[] = {{.i32 = 1}}; // 1表示请求焦点<br>
    ArkUI_AttributeItem requestFocusItem = {.value = requestFocusValue, .size = 1};
    nodeAPI->setAttribute(keyevent, NODE_FOCUSABLE, &requestFocusItem);
    nodeAPI->setAttribute(keyevent, NODE_DEFAULT_FOCUS, &requestFocusItem);
    
    nodeAPI->addNodeEventReceiver(keyevent, onReceiver);
    
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, keyevent);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value IsNumLockOnTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_testresult1 ? 0 : 1, &retValue);
    return retValue;
}
napi_value IsNumLockOnTest_002(napi_env env, napi_callback_info info)
{
    int32_t result1 = OH_ArkUI_KeyEvent_IsNumLockOn(nullptr, &g_numlockresult);
    napi_value retValue;
    napi_create_int32(env, result1 == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}
napi_value IsCapsLockOnTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_testresult2 ? 0 : 1, &retValue);
    return retValue;
}
napi_value IsCapsLockOnTest_002(napi_env env, napi_callback_info info)
{
    int32_t result1 = OH_ArkUI_KeyEvent_IsCapsLockOn(nullptr, &g_capslockresult);
    napi_value retValue;
    napi_create_int32(env, result1 == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}
napi_value IsScrollLockOnTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_testresult3 ? 0 : 1, &retValue);
    return retValue;
}
napi_value IsScrollLockOnTest_002(napi_env env, napi_callback_info info)
{
    int32_t result1 = OH_ArkUI_KeyEvent_IsScrollLockOn(nullptr, &g_scrolllockresult);
    napi_value retValue;
    napi_create_int32(env, result1 == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}
}