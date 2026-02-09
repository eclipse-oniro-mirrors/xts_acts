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
std::unordered_map<ArkUI_KeyIntension, int32_t> g_keyIntensionMap;

void UIInputEventCallback2(ArkUI_NodeEvent* event)
{
    ArkUI_UIInputEvent* uiEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    ArkUI_KeyIntension KeyIntensionType = OH_ArkUI_KeyEvent_GetKeyIntensionCode(uiEvent);
    if (g_keyIntensionMap.count(KeyIntensionType) == 0) {
        g_keyIntensionMap.insert({KeyIntensionType, KeyIntensionType});
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "UIInputEventCallback2", "OnUIInputEventCallback2: %{public}d",
                 KeyIntensionType);
    return;
}

napi_value CreateNativeNode2(napi_env env, napi_callback_info info)
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
    int32_t setResult = nodeAPI->addNodeEventReceiver(component, UIInputEventCallback2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNode2", "CreateNativeNode2: %{public}d", setResult);
    ArkUI_NumberValue FocusValue[] = {{.i32 = 1}};
    ArkUI_AttributeItem FocusItem = {FocusValue, 1};
    nodeAPI->setAttribute(component, NODE_FOCUSABLE, &FocusItem);
    nodeAPI->setAttribute(component, NODE_DEFAULT_FOCUS, &FocusItem);
    int32_t ret = OH_ArkUI_NodeContent_AddNode(nodeContentHandle_, component);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeAttach", "setUserData failed error=%{public}d", ret);
    return nullptr;
}

ArkUI_KeyIntension CheckKeyIntension2(int32_t KeyIntension)
{
    if (KeyIntension == ARKUI_KEY_INTENSION_PAGE_DOWN ||
        KeyIntension == ARKUI_KEY_INTENSION_ZOOM_OUT ||
        KeyIntension == ARKUI_KEY_INTENSION_ZOOM_IN ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_PLAY_PAUSE ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_FAST_FORWARD ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_FAST_PLAYBACK ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_NEXT ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_PREVIOUS ||
        KeyIntension == ARKUI_KEY_INTENTION_MEDIA_MUTE ||
        KeyIntension == ARKUI_KEY_INTENTION_VOLUME_UP ||
        KeyIntension == ARKUI_KEY_INTENTION_VOLUME_DOWN ||
        KeyIntension == ARKUI_KEY_INTENTION_CALL ||
        KeyIntension == ARKUI_KEY_INTENTION_CAMERA) {
        return ArkUI_KeyIntension(KeyIntension);
    } else {
        return ArkUI_KeyIntension(PARAM_NEGATIVE_2);
    }
}

ArkUI_KeyIntension CheckKeyIntension1(int32_t KeyIntension)
{
    if (KeyIntension == ARKUI_KEY_INTENSION_UNKNOWN ||
        KeyIntension == ARKUI_KEY_INTENSION_UP ||
        KeyIntension == ARKUI_KEY_INTENSION_DOWN ||
        KeyIntension == ARKUI_KEY_INTENSION_LEFT ||
        KeyIntension == ARKUI_KEY_INTENSION_RIGHT ||
        KeyIntension == ARKUI_KEY_INTENSION_SELECT ||
        KeyIntension == ARKUI_KEY_INTENSION_ESCAPE ||
        KeyIntension == ARKUI_KEY_INTENSION_BACK ||
        KeyIntension == ARKUI_KEY_INTENSION_FORWARD ||
        KeyIntension == ARKUI_KEY_INTENSION_MENU ||
        KeyIntension == ARKUI_KEY_INTENSION_HOME ||
        KeyIntension == ARKUI_KEY_INTENSION_PAGE_UP) {
        return ArkUI_KeyIntension(KeyIntension);
    } else {
        return CheckKeyIntension2(KeyIntension);
    }
}

napi_value GetKeyIntensionType(napi_env env, napi_callback_info info)
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
    ArkUI_KeyIntension KeyIntensionType = CheckKeyIntension1(getParam);
    if (g_keyIntensionMap.count(KeyIntensionType) == 1) {
        napi_create_int32(env, 1, &args[0]);
    } else {
        napi_create_int32(env, 0, &args[0]);
    }
    g_keyIntensionMap.clear();
    return args[0];
}
}