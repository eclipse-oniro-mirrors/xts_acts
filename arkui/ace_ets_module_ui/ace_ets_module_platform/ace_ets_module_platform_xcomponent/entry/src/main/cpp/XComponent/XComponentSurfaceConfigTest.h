/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef NATIVEXCOMPONENT_SURFACE_CONFIG_TEST_H
#define NATIVEXCOMPONENT_SURFACE_CONFIG_TEST_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <unordered_map>
#include <native_window/external_window.h>
#include "../render/plugin_render.h"
#include "render/EGLRender.h"
#include "napi/native_api.h"
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>

namespace NativeXComponentSample {
constexpr const int FIRST_ARG = 1;
constexpr const int SECOND_ARG = 2;
constexpr const int THIRD_ARG = 3;
constexpr const int FRAME_COUNT = 50;
class XComponentSurfaceConfigTest {
public:
    ~XComponentSurfaceConfigTest();
    static PluginRender* GetPluginRender(int64_t& id);
    static napi_value ChangeColor(napi_env env, napi_callback_info info);
    static napi_value DrawPattern(napi_env env, napi_callback_info info);
    static napi_value SetSurfaceId(napi_env env, napi_callback_info info);
    static napi_value ChangeSurface(napi_env env, napi_callback_info info);
    static napi_value DestroySurface(napi_env env, napi_callback_info info);
    static napi_value GetXComponentStatus(napi_env env, napi_callback_info info);
    
    static napi_value BindNode(napi_env env, napi_callback_info info);
    static napi_value UnbindNode(napi_env env, napi_callback_info info);
    static napi_value DrawStar(napi_env env, napi_callback_info info);

    static napi_value TestSetSurfaceConfigErrorCode001(napi_env env, napi_callback_info info);
    static napi_value TestSetSurfaceConfigErrorCode002(napi_env env, napi_callback_info info);
    static napi_value TestSurfaceConfigCreateReturnNoNullptr(napi_env env, napi_callback_info info);
public:
    static std::unordered_map<int64_t, PluginRender*> pluginRenderMap_;
    static std::unordered_map<int64_t, OHNativeWindow*> windowMap_;
    
    static std::unordered_map<std::string, ArkUI_NodeHandle> nodeHandleMap_;
    static std::unordered_map<void *, OH_ArkUI_SurfaceCallback *> callbackMap_;
    static std::unordered_map<void *, OH_ArkUI_SurfaceHolder *> surfaceHolderMap_;
    static ArkUI_AccessibilityProvider *provider_;
};
} // namespace NativeXComponentSample
#endif // NATIVEXCOMPONENT_SURFACE_CONFIG_TEST_H
