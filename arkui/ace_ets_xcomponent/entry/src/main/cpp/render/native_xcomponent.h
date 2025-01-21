/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#ifndef NATIVE_XCOMPONENT_NATIVE_XCOMPONENT_H
#define NATIVE_XCOMPONENT_NATIVE_XCOMPONENT_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <napi/native_api.h>
#include <string>
#include <unordered_map>

#include "egl_core.h"

namespace NativeXComponentSample1 {
class NativeXcomponent {
public:
    explicit NativeXcomponent(std::string& id);
    ~NativeXcomponent()
    {
        if (eglCore_ != nullptr) {
            eglCore_->Release();
            delete eglCore_;
            eglCore_ = nullptr;
        }
    }
    static NativeXcomponent* GetInstance(std::string& id);
    static void Release(std::string& id);
    static napi_value NapiDrawPattern(napi_env env, napi_callback_info info);
    static napi_value TestGetXComponentStatus(napi_env env, napi_callback_info info);
    void Export(napi_env env, napi_value exports);
    void OnSurfaceChanged(OH_NativeXComponent* component, void* window);
    void OnTouchEvent(OH_NativeXComponent* component, void* window);
    void OnMouseEvent(OH_NativeXComponent* component, void* window);
    void OnHoverEvent(OH_NativeXComponent* component, bool isHover);
    void OnFocusEvent(OH_NativeXComponent* component, void* window);
    void OnBlurEvent(OH_NativeXComponent* component, void* window);
    void OnKeyEvent(OH_NativeXComponent* component, void* window);
    void RegisterCallback(OH_NativeXComponent* nativeXComponent);

public:
    static std::unordered_map<std::string, NativeXcomponent*> instance_;
    EGLCore* eglCore_;
    std::string id_;
    static int32_t hasDraw_;
    static int32_t hasChangeColor_;

private:
    OH_NativeXComponent_Callback renderCallback_;
    OH_NativeXComponent_MouseEvent_Callback mouseCallback_;
    OH_NativeXComponent_RegisterFocusEventCallback registerFocusCallback_;
    OH_NativeXComponent_RegisterKeyEventCallback registerKeyCallback_;
    OH_NativeXComponent_RegisterBlurEventCallback registerBlurCallback_;
    OH_NativeXComponent_RegisterOnFrameCallback registerOnFrameCallback_;
    OH_NativeXComponent_UnregisterOnFrameCallback unregisterCallback_;
};
} // namespace NativeXComponentSample1
#endif // NATIVE_XCOMPONENT_NATIVE_XCOMPONENT_H
