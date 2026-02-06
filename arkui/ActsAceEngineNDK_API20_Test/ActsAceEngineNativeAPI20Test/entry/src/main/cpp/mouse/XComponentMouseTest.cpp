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

#include "mouse/XComponentMouse.h"

namespace XComponentMouse {

napi_value MouseEventAction(napi_env env, napi_callback_info info)
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
    int32_t Index;
    napi_get_value_int32(env, args[0], &Index);
    int32_t result = g_mouseEventActionMap.count(SelectMouseEventAction(Index));
    g_mouseEventActionMap.clear();
    napi_create_int32(env, result, &args[0]);
    return args[0];
}

napi_value MouseEventButton(napi_env env, napi_callback_info info)
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
    int32_t Index;
    napi_get_value_int32(env, args[0], &Index);
    int32_t result = g_mouseEventButtonMap.count(SelectMouseEventButton(Index));
    g_mouseEventButtonMap.clear();
    napi_create_int32(env, result, &args[0]);
    return args[0];
}

napi_value MouseEventTimeStamp(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_mouseEvent.timestamp != -1;
    g_mouseEvent =
    {
        .x = -1,
        .y = -1,
        .screenX = -1,
        .screenY = -1,
        .timestamp = -1,
        .action = OH_NativeXComponent_MouseEventAction(),
        .button = OH_NativeXComponent_MouseEventButton(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CreateMouseNativeNode(napi_env env, napi_callback_info info)
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
    XComponentCallback.DispatchMouseEvent = MouseEventCallback;
    auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
        ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
        if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
            InitNode();
            OH_ArkUI_NodeContent_AddNode(handle, ColumnComponent.GetComponent());
        }
    };
    OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle, nodeContentEvent);
    return nullptr;
}

void InitNode()
{
    int width = 480;
    ColumnComponent.SetWidth(width);
    XComponent.SetXComponentType(ARKUI_XCOMPONENT_TYPE_SURFACE);
    XComponent.SetXComponentId("TestXComponent");
    XComponent.SetXComponentSurfaceSize(PARAM_15, PARAM_15);
    XComponent.SetFocusable(true);
    XComponent.SetFocusDefault(true);
    XComponent.SetPercentWidth(1.0);
    XComponent.SetPercentHeight(1.0);
    XComponent.SetId("ndkxcomponent");
    
    auto *nativeXComponent = XComponent.GetXComponent();
    if (!nativeXComponent) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetNativeXComponent error");
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetNativeXComponent success");
    OH_NativeXComponent_RegisterMouseEventCallback(nativeXComponent, &XComponentCallback);
    auto typeRet = XComponent.getAttribute(NODE_XCOMPONENT_TYPE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "xcomponent type: %{public}d",
                 typeRet->value[0].i32);
    auto idRet = XComponent.getAttribute(NODE_XCOMPONENT_ID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "xcomponent id: %{public}s",
                 idRet->string);
    std::shared_ptr<ArkUICapiTest::Component> child = std::make_shared<ArkUICapiTest::XComponent>(XComponent);
    ColumnComponent.AddChild(child);
}

void MouseEventCallback(OH_NativeXComponent* component, void* window)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MouseEvent", "MouseEventCallback");
    OH_NativeXComponent_GetMouseEvent(component, window, &g_mouseEvent);
    if (g_mouseEventActionMap.count(g_mouseEvent.action) == 0) {
        g_mouseEventActionMap.insert({g_mouseEvent.action, g_mouseEvent});
    }
    if (g_mouseEventButtonMap.count(g_mouseEvent.button) == 0) {
        g_mouseEventButtonMap.insert({g_mouseEvent.button, g_mouseEvent});
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "MouseEvent", "g_mouseEvent Get");
    return;
}

OH_NativeXComponent_MouseEventAction SelectMouseEventAction(int32_t index)
{
    switch (index) {
        case PARAM_0:
            return OH_NATIVEXCOMPONENT_MOUSE_NONE;
        case PARAM_1:
            return OH_NATIVEXCOMPONENT_MOUSE_PRESS;
        case PARAM_2:
            return OH_NATIVEXCOMPONENT_MOUSE_RELEASE;
        case PARAM_3:
            return OH_NATIVEXCOMPONENT_MOUSE_MOVE;
        case PARAM_4:
            return OH_NATIVEXCOMPONENT_MOUSE_CANCEL;
    }
}

OH_NativeXComponent_MouseEventButton SelectMouseEventButton(int32_t index)
{
    switch (index) {
        case PARAM_0:
            return OH_NATIVEXCOMPONENT_NONE_BUTTON;
        case PARAM_1:
            return OH_NATIVEXCOMPONENT_LEFT_BUTTON;
        case PARAM_2:
            return OH_NATIVEXCOMPONENT_RIGHT_BUTTON;
        case PARAM_4:
            return OH_NATIVEXCOMPONENT_MIDDLE_BUTTON;
        case PARAM_8:
            return OH_NATIVEXCOMPONENT_BACK_BUTTON;
        case PARAM_16:
            return OH_NATIVEXCOMPONENT_FORWARD_BUTTON;
    }
}

};
