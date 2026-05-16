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

#include "ArkUIKeyEventTest.h"
#include "common/Common.h"
namespace ArkUIKeyEventTest {
std::unordered_map<ArkUI_KeyEventType, int32_t> g_keyEventMap;

void UIInputEventCallback(ArkUI_NodeEvent* event)
{
    ArkUI_UIInputEvent* uiEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    ArkUI_KeyEventType KeyEventType = OH_ArkUI_KeyEvent_GetType(uiEvent);
    if (g_keyEventMap.count(KeyEventType) == 0) {
        g_keyEventMap.insert({KeyEventType, KeyEventType});
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "UIInputEventCallback", "OnUIInputEventCallback: %{public}d",
                 KeyEventType);
    return;
}

napi_value CreateNativeNode(napi_env env, napi_callback_info info)
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
    ArkUI_NodeContentHandle nodeContentHandle_ = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle_);
    ArkUI_NativeNodeAPI_1* nodeAPI;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto component = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    nodeAPI->registerNodeEvent(component, NODE_ON_KEY_EVENT, 0, nullptr);
    int32_t setResult = nodeAPI->addNodeEventReceiver(component, UIInputEventCallback);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNode", "CreateNativeNode: %{public}d", setResult);
    ArkUI_NumberValue FocusValue[] = {{.i32 = 1}};
    ArkUI_AttributeItem FocusItem = {FocusValue, 1};
    nodeAPI->setAttribute(component, NODE_FOCUSABLE, &FocusItem);
    nodeAPI->setAttribute(component, NODE_DEFAULT_FOCUS, &FocusItem);
    ArkUI_AttributeItem IdItem = { .string = "TEXT"};
    nodeAPI->setAttribute(component, NODE_ID, &IdItem);
    int32_t ret = OH_ArkUI_NodeContent_AddNode(nodeContentHandle_, component);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeAttach", "setUserData failed error=%{public}d", ret);
    return nullptr;
}

ArkUI_KeyEventType CheckKeyEventType(int32_t KeyEventType)
{
    if (KeyEventType == ARKUI_KEY_EVENT_UNKNOWN) {
        return ARKUI_KEY_EVENT_UNKNOWN;
    } else if (KeyEventType == ARKUI_KEY_EVENT_DOWN) {
        return ARKUI_KEY_EVENT_DOWN;
    } else if (KeyEventType == ARKUI_KEY_EVENT_UP) {
        return ARKUI_KEY_EVENT_UP;
    } else if (KeyEventType == ARKUI_KEY_EVENT_LONG_PRESS) {
        return ARKUI_KEY_EVENT_LONG_PRESS;
    } else if (KeyEventType == ARKUI_KEY_EVENT_CLICK) {
        return ARKUI_KEY_EVENT_CLICK;
    } else {
        return ArkUI_KeyEventType(PARAM_NEGATIVE_2);
    }
}

napi_value GetArkuiKeyEventType(napi_env env, napi_callback_info info)
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
    int32_t getParam;
    napi_get_value_int32(env, args[0], &getParam);
    ArkUI_KeyEventType KeyEventType = CheckKeyEventType(getParam);
    if (g_keyEventMap.count(KeyEventType) == 1) {
        napi_create_int32(env, 1, &args[0]);
    } else {
        napi_create_int32(env, 0, &args[0]);
    }
    g_keyEventMap.clear();
    return args[0];
}
}
