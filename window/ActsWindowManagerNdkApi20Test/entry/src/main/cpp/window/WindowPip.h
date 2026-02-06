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

#ifndef ACTSWINDOWNDKAPI20TEST_WINDOWPIP_H
#define ACTSWINDOWNDKAPI20TEST_WINDOWPIP_H

#include "window/Window.h"

namespace WindowPip {

napi_value CreatePipConfigOk(napi_env env, napi_callback_info info);
napi_value CreatePipConfigIncorrectParam(napi_env env, napi_callback_info info);
napi_value SetPipMainWindowIdOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value SetPipMainWindowIdIncorrectParam(napi_env env, napi_callback_info info);
napi_value SetPipTemplateTypeOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value SetPipTemplateTypeIncorrectParam(napi_env env, napi_callback_info info);
napi_value SetPipRectOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value SetPipRectIncorrectParam(napi_env env, napi_callback_info info);
napi_value SetPipControlGroupOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value SetPipControlGroupIncorrectParam(napi_env env, napi_callback_info info);
napi_value SetPipNapiEnvOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value SetPipNapiEnvIncorrectParam(napi_env env, napi_callback_info info);
napi_value CreatePipOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value CreatePipPipInternalError(napi_env env, napi_callback_info info);
napi_value StartPipPipCreateFailed(napi_env env, napi_callback_info info);
napi_value StartPipIncorrectParam(napi_env env, napi_callback_info info);
napi_value StartPipPipStateAbnormal(napi_env env, napi_callback_info info);
napi_value StartPipPipInternalError(napi_env env, napi_callback_info info);
napi_value StopPipIncorrectParam(napi_env env, napi_callback_info info);
napi_value StopPipPipDestroyFailed(napi_env env, napi_callback_info info);
napi_value StopPipInternalError(napi_env env, napi_callback_info info);
napi_value UpdatePipContentSizeIncorrectParam(napi_env env, napi_callback_info info);
napi_value UpdatePipContentSizeInternalError(napi_env env, napi_callback_info info);
napi_value UpdatePipControlStatusIncorrectParam(napi_env env, napi_callback_info info);
napi_value UpdatePipControlStatusInternalError(napi_env env, napi_callback_info info);
napi_value SetPipControlEnabledIncorrectParam(napi_env env, napi_callback_info info);
napi_value SetPipControlEnabledInternalError(napi_env env, napi_callback_info info);
napi_value SetPipInitialSurfaceRectParameterOverride(napi_env env, napi_callback_info info);
napi_value SetPipInitialSurfaceRectOk(napi_env env, napi_callback_info info);
napi_value SetPipInitialSurfaceRectIncorrectParam(napi_env env, napi_callback_info info);
napi_value SetPipInitialSurfaceRectPipInternalError(napi_env env, napi_callback_info info);
napi_value UnsetPipInitialSurfaceRectParameterOverride(napi_env env, napi_callback_info info);
napi_value UnsetPipInitialSurfaceRectOk(napi_env env, napi_callback_info info);
napi_value UnsetPipInitialSurfaceRectIncorrectParam(napi_env env, napi_callback_info info);
napi_value UnsetPipInitialSurfaceRectPipInternalError(napi_env env, napi_callback_info info);
napi_value RegisterStartPipCallbackOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value RegisterStartPipCallbackIncorrectParam(napi_env env, napi_callback_info info);
napi_value RegisterStartPipCallbackInternalError(napi_env env, napi_callback_info info);
napi_value UnregisterStartPipCallbackOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value UnregisterStartPipCallbackIncorrectParam(napi_env env, napi_callback_info info);
napi_value UnregisterStartPipCallbackInternalError(napi_env env, napi_callback_info info);
napi_value UnregisterAllStartPipCallbacksOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value UnregisterAllStartPipCallbacksIncorrectParam(napi_env env, napi_callback_info info);
napi_value UnregisterAllStartPipCallbacksInternalError(napi_env env, napi_callback_info info);
napi_value RegisterLifecycleListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value RegisterLifecycleListenerIncorrectParam(napi_env env, napi_callback_info info);
napi_value RegisterLifecycleListenerInternalError(napi_env env, napi_callback_info info);
napi_value UnregisterLifecycleListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value UnregisterLifecycleListenerIncorrectParam(napi_env env, napi_callback_info info);
napi_value UnregisterLifecycleListenerInternalError(napi_env env, napi_callback_info info);
napi_value UnregisterAllLifecycleListenersOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value UnregisterAllLifecycleListenersIncorrectParam(napi_env env, napi_callback_info info);
napi_value UnregisterAllLifecycleListenersInternalError(napi_env env, napi_callback_info info);
napi_value RegisterControlEventListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value RegisterControlEventListenerIncorrectParam(napi_env env, napi_callback_info info);
napi_value RegisterControlEventListenerInternalError(napi_env env, napi_callback_info info);
napi_value UnregisterControlEventListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value UnregisterControlEventListenerIncorrectParam(napi_env env, napi_callback_info info);
napi_value UnregisterControlEventListenerInternalError(napi_env env, napi_callback_info info);
napi_value UnregisterAllControlEventListenersOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value UnregisterAllControlEventListenersIncorrectParam(napi_env env, napi_callback_info info);
napi_value UnregisterAllControlEventListenersInternalError(napi_env env, napi_callback_info info);
napi_value RegisterResizeListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value RegisterResizeListenerIncorrectParam(napi_env env, napi_callback_info info);
napi_value RegisterResizeListenerInternalError(napi_env env, napi_callback_info info);
napi_value UnregisterResizeListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value UnregisterResizeListenerIncorrectParam(napi_env env, napi_callback_info info);
napi_value UnregisterResizeListenerInternalError(napi_env env, napi_callback_info info);
napi_value UnregisterAllResizeListenersOkOrDeviceNotSupported(napi_env env, napi_callback_info info);
napi_value UnregisterAllResizeListenersIncorrectParam(napi_env env, napi_callback_info info);
napi_value UnregisterAllResizeListenersInternalError(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodeCreateFailed(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodePipStateAbnormal(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodePipRepeatedOperation(napi_env env, napi_callback_info info);
napi_value WindowManagerErrorCodeIncorrectParam(napi_env env, napi_callback_info info);
napi_value PictureInPicturePipStatePart1(napi_env env, napi_callback_info info);
napi_value PictureInPicturePipStatePart2(napi_env env, napi_callback_info info);

};

#endif //ACTSWINDOWNDKAPI20TEST_WINDOWPIP_H
