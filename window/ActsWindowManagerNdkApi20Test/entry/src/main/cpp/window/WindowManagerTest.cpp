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

#include "display/Display.h"
#include "display/NativeDisplayManagerErrorCodeTest.h"
#include "display/NativeDisplayManagerTest.h"
#include "window/Window.h"
#include "window/WindowPip.h"

namespace WindowManagerTest {
EXTERN_C_START

static void InitPushWindow(napi_property_descriptor* desc)
{
    napi_property_descriptor descTemp[] = {
        XL("GetWindowId", Window::GetWindowId),
        XL("GetMainWindowId", Window::GetMainWindowId),
        XL("GetDisplayId", Window::GetDisplayId),
        XL("SetWindowStatusBarEnabledInvalidParam", Window::SetWindowStatusBarEnabledInvalidParam),
        XL("SetWindowStatusBarEnabledSystemAbnormal", Window::SetWindowStatusBarEnabledSystemAbnormal),
        XL("GetWindowAvoidAreaInvalidParam", Window::GetWindowAvoidAreaInvalidParam),
        XL("IsWindowShownInvalidParam", Window::IsWindowShownInvalidParam),
        XL("GetWindowPropertiesInvalidParam", Window::GetWindowPropertiesInvalidParam),
        XL("SnapshotOk", Window::SnapshotOk),
        XL("SnapshotInvalidParam", Window::SnapshotInvalidParam),
        XL("SnapshotStateAbnormal", Window::SnapshotStateAbnormal),
        XL("GetAllWindowLayoutInfoListParameterOverride", Window::GetAllWindowLayoutInfoListParameterOverride),
        XL("GetAllWindowLayoutInfoListOkOrDeviceNotSupported",
           Window::GetAllWindowLayoutInfoListOkOrDeviceNotSupported),
        XL("InjectTouchEventParameterOverride", Window::InjectTouchEventParameterOverride),
        XL("InjectTouchEventSystemAbnormal", Window::InjectTouchEventSystemAbnormal),
        XL("InjectTouchEventStateAbnormal", Window::InjectTouchEventStateAbnormal),
        XL("SetWindowPrivacyModeNoPermission", Window::SetWindowPrivacyModeNoPermission),
        XL("WindowManagerErrorCodeOk", Window::WindowManagerErrorCodeOk),
        XL("WindowManagerErrorCodeNoPermission", Window::WindowManagerErrorCodeNoPermission),
        XL("WindowManagerErrorCodeInvalidParam", Window::WindowManagerErrorCodeInvalidParam),
        XL("WindowManagerErrorCodeDeviceNotSupported", Window::WindowManagerErrorCodeDeviceNotSupported),
        XL("WindowManagerErrorCodeInvalidWindowId", Window::WindowManagerErrorCodeInvalidWindowId),
        XL("WindowManagerErrorCodeStateAbnormal", Window::WindowManagerErrorCodeStateAbnormal),
        XL("WindowManagerErrorCodeSystemAbnormal", Window::WindowManagerErrorCodeSystemAbnormal),
        XL("GetWindowAvoidAreaType", Window::GetWindowAvoidAreaType),
        XL("GetWindowType", Window::GetWindowType),
        XL("RegisterMouseEventFilterOkOrServiceError", Window::RegisterMouseEventFilterOkOrServiceError),
        XL("RegisterMouseEventFilterInvaildWindowId", Window::RegisterMouseEventFilterInvaildWindowId),
        XL("UnregisterMouseEventFilterOkOrServiceError", Window::UnregisterMouseEventFilterOkOrServiceError),
        XL("UnregisterMouseEventFilterInvaildWindowId", Window::UnregisterMouseEventFilterInvaildWindowId),
        XL("RegisterTouchEventFilterOkOrServiceError", Window::RegisterTouchEventFilterOkOrServiceError),
        XL("RegisterTouchEventFilterInvaildWindowId", Window::RegisterTouchEventFilterInvaildWindowId),
        XL("UnregisterTouchEventFilterOkOrServiceError", Window::UnregisterTouchEventFilterOkOrServiceError),
        XL("UnregisterTouchEventFilterInvaildWindowId", Window::UnregisterTouchEventFilterInvaildWindowId),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index] = descTemp[index];
    }
}

static void InitPushWindowPip1(napi_property_descriptor* desc)
{
    int32_t offset = 34;
    napi_property_descriptor descTemp[] = {
        XL("CreatePipConfigOk", WindowPip::CreatePipConfigOk),
        XL("CreatePipConfigIncorrectParam", WindowPip::CreatePipConfigIncorrectParam),
        XL("SetPipMainWindowIdOkOrDeviceNotSupported", WindowPip::SetPipMainWindowIdOkOrDeviceNotSupported),
        XL("SetPipMainWindowIdIncorrectParam", WindowPip::SetPipMainWindowIdIncorrectParam),
        XL("SetPipTemplateTypeOkOrDeviceNotSupported", WindowPip::SetPipTemplateTypeOkOrDeviceNotSupported),
        XL("SetPipTemplateTypeIncorrectParam", WindowPip::SetPipTemplateTypeIncorrectParam),
        XL("SetPipRectOkOrDeviceNotSupported", WindowPip::SetPipRectOkOrDeviceNotSupported),
        XL("SetPipRectIncorrectParam", WindowPip::SetPipRectIncorrectParam),
        XL("SetPipControlGroupOkOrDeviceNotSupported", WindowPip::SetPipControlGroupOkOrDeviceNotSupported),
        XL("SetPipControlGroupIncorrectParam", WindowPip::SetPipControlGroupIncorrectParam),
        XL("SetPipNapiEnvOkOrDeviceNotSupported", WindowPip::SetPipNapiEnvOkOrDeviceNotSupported),
        XL("SetPipNapiEnvIncorrectParam", WindowPip::SetPipNapiEnvIncorrectParam),
        XL("CreatePipOkOrDeviceNotSupported", WindowPip::CreatePipOkOrDeviceNotSupported),
        XL("CreatePipPipInternalError", WindowPip::CreatePipPipInternalError),
        XL("StartPipPipCreateFailed", WindowPip::StartPipPipCreateFailed),
        XL("StartPipIncorrectParam", WindowPip::StartPipIncorrectParam),
        XL("StartPipPipStateAbnormal", WindowPip::StartPipPipStateAbnormal),
        XL("StartPipPipInternalError", WindowPip::StartPipPipInternalError),
        XL("StopPipIncorrectParam", WindowPip::StopPipIncorrectParam),
        XL("StopPipPipDestroyFailed", WindowPip::StopPipPipDestroyFailed),
        XL("StopPipInternalError", WindowPip::StopPipInternalError),
        XL("UpdatePipContentSizeIncorrectParam", WindowPip::UpdatePipContentSizeIncorrectParam),
        XL("UpdatePipContentSizeInternalError", WindowPip::UpdatePipContentSizeInternalError),
        XL("UpdatePipControlStatusIncorrectParam", WindowPip::UpdatePipControlStatusIncorrectParam),
        XL("UpdatePipControlStatusInternalError", WindowPip::UpdatePipControlStatusInternalError),
        XL("SetPipControlEnabledIncorrectParam", WindowPip::SetPipControlEnabledIncorrectParam),
        XL("SetPipControlEnabledInternalError", WindowPip::SetPipControlEnabledInternalError),
        XL("SetPipInitialSurfaceRectParameterOverride", WindowPip::SetPipInitialSurfaceRectParameterOverride),
        XL("SetPipInitialSurfaceRectOk", WindowPip::SetPipInitialSurfaceRectOk),
        XL("SetPipInitialSurfaceRectIncorrectParam", WindowPip::SetPipInitialSurfaceRectIncorrectParam),
        XL("SetPipInitialSurfaceRectPipInternalError", WindowPip::SetPipInitialSurfaceRectPipInternalError),
        XL("UnsetPipInitialSurfaceRectParameterOverride", WindowPip::UnsetPipInitialSurfaceRectParameterOverride),
        XL("UnsetPipInitialSurfaceRectOk", WindowPip::UnsetPipInitialSurfaceRectOk),
        XL("UnsetPipInitialSurfaceRectIncorrectParam", WindowPip::UnsetPipInitialSurfaceRectIncorrectParam),
        XL("UnsetPipInitialSurfaceRectPipInternalError", WindowPip::UnsetPipInitialSurfaceRectPipInternalError),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void InitPushWindowPip2(napi_property_descriptor* desc)
{
    int32_t offset = 69;
    napi_property_descriptor descTemp[] = {
        XL("RegisterStartPipCallbackOkOrDeviceNotSupported", WindowPip::RegisterStartPipCallbackOkOrDeviceNotSupported),
        XL("RegisterStartPipCallbackIncorrectParam", WindowPip::RegisterStartPipCallbackIncorrectParam),
        XL("RegisterStartPipCallbackInternalError", WindowPip::RegisterStartPipCallbackInternalError),
        XL("UnregisterStartPipCallbackOkOrDeviceNotSupported",
           WindowPip::UnregisterStartPipCallbackOkOrDeviceNotSupported),
        XL("UnregisterStartPipCallbackIncorrectParam", WindowPip::UnregisterStartPipCallbackIncorrectParam),
        XL("UnregisterStartPipCallbackInternalError", WindowPip::UnregisterStartPipCallbackInternalError),
        XL("UnregisterAllStartPipCallbacksOkOrDeviceNotSupported",
           WindowPip::UnregisterAllStartPipCallbacksOkOrDeviceNotSupported),
        XL("UnregisterAllStartPipCallbacksIncorrectParam", WindowPip::UnregisterAllStartPipCallbacksIncorrectParam),
        XL("UnregisterAllStartPipCallbacksInternalError", WindowPip::UnregisterAllStartPipCallbacksInternalError),
        XL("RegisterLifecycleListenerOkOrDeviceNotSupported",
           WindowPip::RegisterLifecycleListenerOkOrDeviceNotSupported),
        XL("RegisterLifecycleListenerIncorrectParam", WindowPip::RegisterLifecycleListenerIncorrectParam),
        XL("RegisterLifecycleListenerInternalError", WindowPip::RegisterLifecycleListenerInternalError),
        XL("UnregisterLifecycleListenerOkOrDeviceNotSupported",
           WindowPip::UnregisterLifecycleListenerOkOrDeviceNotSupported),
        XL("UnregisterLifecycleListenerIncorrectParam", WindowPip::UnregisterLifecycleListenerIncorrectParam),
        XL("UnregisterLifecycleListenerInternalError", WindowPip::UnregisterLifecycleListenerInternalError),
        XL("UnregisterAllLifecycleListenersOkOrDeviceNotSupported",
           WindowPip::UnregisterAllLifecycleListenersOkOrDeviceNotSupported),
        XL("UnregisterAllLifecycleListenersIncorrectParam", WindowPip::UnregisterAllLifecycleListenersIncorrectParam),
        XL("UnregisterAllLifecycleListenersInternalError", WindowPip::UnregisterAllLifecycleListenersInternalError),
        XL("RegisterControlEventListenerOkOrDeviceNotSupported",
           WindowPip::RegisterControlEventListenerOkOrDeviceNotSupported),
        XL("RegisterControlEventListenerIncorrectParam", WindowPip::RegisterControlEventListenerIncorrectParam),
        XL("RegisterControlEventListenerInternalError", WindowPip::RegisterControlEventListenerInternalError),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void InitPushWindowPip3(napi_property_descriptor* desc)
{
    int32_t offset = 90;
    napi_property_descriptor descTemp[] = {
        XL("UnregisterControlEventListenerOkOrDeviceNotSupported",
           WindowPip::UnregisterControlEventListenerOkOrDeviceNotSupported),
        XL("UnregisterControlEventListenerIncorrectParam", WindowPip::UnregisterControlEventListenerIncorrectParam),
        XL("UnregisterControlEventListenerInternalError", WindowPip::UnregisterControlEventListenerInternalError),
        XL("UnregisterAllControlEventListenersOkOrDeviceNotSupported",
           WindowPip::UnregisterAllControlEventListenersOkOrDeviceNotSupported),
        XL("UnregisterAllControlEventListenersIncorrectParam",
           WindowPip::UnregisterAllControlEventListenersIncorrectParam),
        XL("UnregisterAllControlEventListenersInternalError",
           WindowPip::UnregisterAllControlEventListenersInternalError),
        XL("RegisterResizeListenerOkOrDeviceNotSupported", WindowPip::RegisterResizeListenerOkOrDeviceNotSupported),
        XL("RegisterResizeListenerIncorrectParam", WindowPip::RegisterResizeListenerIncorrectParam),
        XL("RegisterResizeListenerInternalError", WindowPip::RegisterResizeListenerInternalError),
        XL("UnregisterResizeListenerOkOrDeviceNotSupported", WindowPip::UnregisterResizeListenerOkOrDeviceNotSupported),
        XL("UnregisterResizeListenerIncorrectParam", WindowPip::UnregisterResizeListenerIncorrectParam),
        XL("UnregisterResizeListenerInternalError", WindowPip::UnregisterResizeListenerInternalError),
        XL("UnregisterAllResizeListenersOkOrDeviceNotSupported",
           WindowPip::UnregisterAllResizeListenersOkOrDeviceNotSupported),
        XL("UnregisterAllResizeListenersIncorrectParam", WindowPip::UnregisterAllResizeListenersIncorrectParam),
        XL("UnregisterAllResizeListenersInternalError", WindowPip::UnregisterAllResizeListenersInternalError),
        XL("WindowManagerErrorCodeCreateFailed", WindowPip::WindowManagerErrorCodeCreateFailed),
        XL("WindowManagerErrorCodePipStateAbnormal", WindowPip::WindowManagerErrorCodePipStateAbnormal),
        XL("WindowManagerErrorCodePipRepeatedOperation", WindowPip::WindowManagerErrorCodePipRepeatedOperation),
        XL("WindowManagerErrorCodeIncorrectParam", WindowPip::WindowManagerErrorCodeIncorrectParam),
        XL("PictureInPicturePipStatePart1", WindowPip::PictureInPicturePipStatePart1),
        XL("PictureInPicturePipStatePart2", WindowPip::PictureInPicturePipStatePart2),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void InitPushDisplay(napi_property_descriptor* desc)
{
    int32_t offset = 111;
    napi_property_descriptor descTemp[] = {
        XL("CaptureScreenPixelmapInvalidParamOrDeviceNotSupported",
           Display::CaptureScreenPixelmapInvalidParamOrDeviceNotSupported),
        XL("CaptureScreenPixelmapNoPermission", Display::CaptureScreenPixelmapNoPermission),
        XL("GetDisplaySourceMode001", NativeDisplayManagerTest::GetDisplaySourceMode001),
        XL("GetDisplaySourceMode002", NativeDisplayManagerTest::GetDisplaySourceMode002),
        XL("GetDisplaySourceMode003", NativeDisplayManagerTest::GetDisplaySourceMode003),
        XL("GetDisplaySourceMode", NativeDisplayManagerTest::GetDisplaySourceMode),
        XL("GetFoldDisplayMode", NativeDisplayManagerTest::GetFoldDisplayMode),
        XL("DisplayManagerErrorCode401", NativeDisplayManagerErrorCodeTest::DisplayManagerErrorCode401),
        XL("DisplayManagerErrorCode801", NativeDisplayManagerErrorCodeTest::DisplayManagerErrorCode801),
        XL("DisplayManagerErrorCode1400001", NativeDisplayManagerErrorCodeTest::DisplayManagerErrorCode1400001),
        XL("DisplayManagerErrorCode1400003", NativeDisplayManagerErrorCodeTest::DisplayManagerErrorCode1400003),
        XL("DisplayManagerErrorCode1400004", NativeDisplayManagerErrorCodeTest::DisplayManagerErrorCode1400004),
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static napi_value Init(napi_env env, napi_value exports)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }
    napi_property_descriptor desc[123] = {};
    InitPushWindow(desc);
    InitPushWindowPip1(desc);
    InitPushWindowPip2(desc);
    InitPushWindowPip3(desc);
    InitPushDisplay(desc);
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }
    return exports;
}
EXTERN_C_END

static napi_module windowndkapi20Module = { .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "windowndkapi20",
    .nm_priv = ((void*)0),
    .reserved = { 0 } };

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&windowndkapi20Module);
}
} // namespace NativeXComponentTest
