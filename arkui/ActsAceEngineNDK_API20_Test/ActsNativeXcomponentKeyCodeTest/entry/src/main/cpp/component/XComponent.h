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

#ifndef ACE_C_ARKUI_INTERFACE_XCOMPONENT_TEST_API20_XCOMPONENT_H
#define ACE_C_ARKUI_INTERFACE_XCOMPONENT_TEST_API20_XCOMPONENT_H

#include "component/Component.h"

namespace ArkUICapiTest {
class XComponent : public Component {
public:
    XComponent(ArkUI_NodeType type) : Component(type) {}
    void SetXComponentType(ArkUI_XComponentType type);
    void SetXComponentId(char* id);
    void SetXComponentSurfaceSize(uint32_t width, uint32_t height);
    void PrintXComponentInfo();
};
void OnKeyEvent(ArkUI_NodeEvent* event);
void OnUIKeyEvent(ArkUI_NodeEvent* event);
void OnFocusEvent(OH_NativeXComponent* component, void* window);
void OnBlurEvent(OH_NativeXComponent* component, void* window);
napi_value CreateNativeNode(napi_env env, napi_callback_info info);
napi_value CreateArkUINode(napi_env env, napi_callback_info info);
napi_value GetKeyCodeResult(napi_env env, napi_callback_info info);
}

#endif //ACE_C_ARKUI_INTERFACE_XCOMPONENT_TEST_API20_XCOMPONENT_H
