/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#ifndef _PLUGIN_RENDER_H_
#define _PLUGIN_RENDER_H_

#include <string>
#include <unordered_map>

#include <native_interface_xcomponent.h>
#include <napi/native_api.h>
#include <native_interface_accessibility.h>

#include "egl_core.h"

class PluginRender {
public:
    explicit PluginRender(std::string& id);
    static PluginRender* GetInstance(std::string& id);
    static OH_NativeXComponent_Callback* GetNXComponentCallback();
    static OH_NativeXComponent_MouseEvent_Callback* GetNXComponentMouseEventCallback();

    void SetNativeXComponent(OH_NativeXComponent* component);

public:
    // NAPI interface
    napi_value Export(napi_env env, napi_value exports);

    // Exposed to JS developers by NAPI
    static napi_value NapiChangeShape(napi_env env, napi_callback_info info);
    static napi_value NapiDrawTriangle(napi_env env, napi_callback_info info);
    static napi_value NapiChangeColor(napi_env env, napi_callback_info info);
    static napi_value NapiChangeColorWorker(napi_env env, napi_callback_info info);

    // xts interfaces
    static napi_value TestXComponentFindAccessibilityNodeInfosById(napi_env env, napi_callback_info info);
    static napi_value TestXComponentFindAccessibilityNodeInfosByText(napi_env env, napi_callback_info info);
    static napi_value TestXComponentFindFocusedAccessibilityNode(napi_env env, napi_callback_info info);
    static napi_value TestXComponentFindNextFocusAccessibilityNode(napi_env env, napi_callback_info info);
    static napi_value TestXComponentSendAccessibilityAsyncEvent(napi_env env, napi_callback_info info);
    static napi_value TestXComponentExecuteAccessibilityAction(napi_env env, napi_callback_info info);
    static napi_value TestXComponentClearFocusedFocusAccessibilityNode(napi_env env, napi_callback_info info);
    static napi_value TestXComponentGetAccessibilityNodeCursorPosition(napi_env env, napi_callback_info info);
    
    static napi_value TestGetXComponentId(napi_env env, napi_callback_info info);
    static napi_value TestOnSurfaceCreated(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponentSize_Height(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponentSize_Width(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponentOffset_x(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponentOffset_y(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponent_TouchEvent(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponent_MouseEvent(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponentpointtool_tiltx(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponentpointtool_tilty(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponentpointtool_type(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponent_RegisterMouseEventCallback(napi_env env, napi_callback_info info);
    // Callback, called by ACE XComponent
    void OnSurfaceCreated(OH_NativeXComponent* component, void* window);

    void OnSurfaceChanged(OH_NativeXComponent* component, void* window);

    void OnSurfaceDestroyed(OH_NativeXComponent* component, void* window);

    void DispatchTouchEvent(OH_NativeXComponent* component, void* window);

    void DispatchMouseEvent(OH_NativeXComponent* component, void* window);
    
    void InterfaceDesignTest(OH_NativeXComponent* nativeXComponent);
    
    void setElementInfo(ArkUI_AccessibilityElementInfo* elementInfo, int32_t i);

public:
    static std::unordered_map<std::string, PluginRender*> instance_;
    static OH_NativeXComponent_Callback callback_;
    static uint32_t isCreated_;
    static uint32_t xcHeight_;
    static uint32_t xcWidth_;
    static uint32_t toolType_;
    static float tiltX_;
    static float tiltY_;
    static uint32_t mousecallback_;
    static double off_x;
    static double off_y;
    static uint32_t touchType;
    static OH_NativeXComponent_TouchEvent testTouchEvent_;
    static OH_NativeXComponent_MouseEvent testMouseEvent_;
    static OH_NativeXComponent_MouseEvent_Callback mouseEventcallback_;

    OH_NativeXComponent* component_;
    EGLCore* eglCore_;

    std::string id_;
    uint64_t width_;
    uint64_t height_;

    double x_;
    double y_;
    OH_NativeXComponent_TouchEvent touchEvent_;
    OH_NativeXComponent_MouseEvent mouseEvent_;
    
    ArkUI_AccessibilityProviderCallbacks* accessibilityProviderCallbacks_;
};

#endif // _PLUGIN_RENDER_H_