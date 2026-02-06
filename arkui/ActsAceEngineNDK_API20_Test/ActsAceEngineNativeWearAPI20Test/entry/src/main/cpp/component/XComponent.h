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
    ArkUI_NodeHandle CreateNodeHandle(const std::string &tag);
    void SetXComponentType(ArkUI_XComponentType type);
    void SetXComponentId(char* id);
    void SetXComponentSurfaceSize(uint32_t width, uint32_t height);
    void SetFocusable(bool flag);
    void SetFocusDefault(bool flag);
    void PrintXComponentInfo();
    static void GetKeyEventAction001();
    static void GetKeyEventAction002();
    static void GetKeyEventActionEnum001();
    static void GetKeyEventActionEnum002();
    static void GetKeyEventActionEnum003();
    static void GetKeyEventSourceType001();
    static void GetKeyEventSourceType002();
    static void GetKeyEventDeviceId001();
    static void GetKeyEventDeviceId002();
    static void GetKeyEventTimestamp001();
    static void GetKeyEventTimestamp002();
    static void GetKeyEventModifierKeyStates001();
    static void GetKeyEventModifierKeyStates002();
    static void GetKeyEventNumLockState001();
    static void GetKeyEventNumLockState002();
    static void GetKeyEventCapsLockState001();
    static void GetKeyEventCapsLockState002();
    static void GetKeyEventScrollLockState001();
    static void GetKeyEventScrollLockState002();
};
napi_value ChooseTestFunction(napi_env env, napi_callback_info info);
void OnKeyEvent(OH_NativeXComponent* component, void* window);
void OnFocusEvent(OH_NativeXComponent* component, void* window);
void OnBlurEvent(OH_NativeXComponent* component, void* window);
void OnFrameCallback(OH_NativeXComponent* component, uint64_t timestamp, uint64_t targetTimestamp);
void OnArkUIFrameCallback(ArkUI_NodeHandle node, uint64_t timestamp, uint64_t targetTimestamp);
void UIInputEventCallback(OH_NativeXComponent* component, ArkUI_UIInputEvent* event, ArkUI_UIInputEvent_Type type);
bool OnKeyEventCallbackWithResult(OH_NativeXComponent* component, void* window);
HitTestMode OnTouchInterceptCallback(OH_NativeXComponent* component, ArkUI_UIInputEvent* event);
napi_value GetKeyEventAction(napi_env env, napi_callback_info info);
napi_value GetKeyEventActionEnum(napi_env env, napi_callback_info info);
napi_value GetKeyEventSourceType(napi_env env, napi_callback_info info);
napi_value GetKeyEventDeviceId(napi_env env, napi_callback_info info);
napi_value GetKeyEventTimestamp(napi_env env, napi_callback_info info);
napi_value GetKeyEventModifierKeyStates(napi_env env, napi_callback_info info);
napi_value GetKeyEventNumLockState(napi_env env, napi_callback_info info);
napi_value GetKeyEventCapsLockState(napi_env env, napi_callback_info info);
napi_value GetKeyEventScrollLockState(napi_env env, napi_callback_info info);
napi_value CreateNativeNode(napi_env env, napi_callback_info info);
napi_value AttachNativeRootNode001(napi_env env, napi_callback_info info);
napi_value AttachNativeRootNode002(napi_env env, napi_callback_info info);
napi_value DetachNativeRootNode001(napi_env env, napi_callback_info info);
napi_value DetachNativeRootNode002(napi_env env, napi_callback_info info);
napi_value SetExpectedFrameRateRange001(napi_env env, napi_callback_info info);
napi_value SetExpectedFrameRateRange002(napi_env env, napi_callback_info info);
napi_value SetArkUIExpectedFrameRateRange001(napi_env env, napi_callback_info info);
napi_value SetArkUIExpectedFrameRateRange002(napi_env env, napi_callback_info info);
napi_value RegisterOnFrameCallback001(napi_env env, napi_callback_info info);
napi_value RegisterOnFrameCallback002(napi_env env, napi_callback_info info);
napi_value ArkUIRegisterOnFrameCallback001(napi_env env, napi_callback_info info);
napi_value ArkUIRegisterOnFrameCallback002(napi_env env, napi_callback_info info);
napi_value UnregisterOnFrameCallback001(napi_env env, napi_callback_info info);
napi_value UnregisterOnFrameCallback002(napi_env env, napi_callback_info info);
napi_value ArkUIUnregisterOnFrameCallback001(napi_env env, napi_callback_info info);
napi_value ArkUIUnregisterOnFrameCallback002(napi_env env, napi_callback_info info);
napi_value RegisterUIInputEventCallback001(napi_env env, napi_callback_info info);
napi_value RegisterUIInputEventCallback002(napi_env env, napi_callback_info info);
napi_value RegisterOnTouchInterceptCallback001(napi_env env, napi_callback_info info);
napi_value RegisterOnTouchInterceptCallback002(napi_env env, napi_callback_info info);
napi_value GetNativeAccessibilityProvider001(napi_env env, napi_callback_info info);
napi_value GetNativeAccessibilityProvider002(napi_env env, napi_callback_info info);
napi_value RegisterKeyEventCallbackWithResult001(napi_env env, napi_callback_info info);
napi_value RegisterKeyEventCallbackWithResult002(napi_env env, napi_callback_info info);
napi_value XComponentInitialize001(napi_env env, napi_callback_info info);
napi_value XComponentFinalize001(napi_env env, napi_callback_info info);
napi_value XComponentSetNeedSoftKeyboard001(napi_env env, napi_callback_info info);
napi_value XComponentSetNeedSoftKeyboard002(napi_env env, napi_callback_info info);
napi_value GetExtraMouseEventInfo001(napi_env env, napi_callback_info info);
napi_value GetExtraMouseEventInfo002(napi_env env, napi_callback_info info);
napi_value GetMouseEventModifierKeyStates001(napi_env env, napi_callback_info info);
napi_value GetMouseEventModifierKeyStates002(napi_env env, napi_callback_info info);
napi_value RegisterFocusEventCallback001(napi_env env, napi_callback_info info);
napi_value RegisterFocusEventCallback002(napi_env env, napi_callback_info info);
napi_value RegisterBlurEventCallback001(napi_env env, napi_callback_info info);
napi_value RegisterBlurEventCallback002(napi_env env, napi_callback_info info);
}

#endif //ACE_C_ARKUI_INTERFACE_XCOMPONENT_TEST_API20_XCOMPONENT_H
