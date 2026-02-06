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
#ifndef AUDIO1TEST_AUDIOTEST_H
#define AUDIO1TEST_AUDIOTEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>

napi_value AudioRoutingGetAudioRoutingManagerSuccess(napi_env env, napi_callback_info info);
napi_value AudioRoutingGetDevicesInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRoutingGetDevicesSuccess(napi_env env, napi_callback_info info);
napi_value AudioRoutingGetAvailableDevicesInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRoutingGetAvailableDevicesSuccess(napi_env env, napi_callback_info info);
napi_value AudioRoutingGetPreferredOutputDeviceInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRoutingGetPreferredOutputDeviceSuccess(napi_env env, napi_callback_info info);
napi_value AudioRoutingGetPreferredInputDeviceInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRoutingGetPreferredInputDeviceSuccess(napi_env env, napi_callback_info info);
napi_value AudioRoutingRegisterDeviceChangeCbInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRoutingRegisterDeviceChangeCbSuccess(napi_env env, napi_callback_info info);
napi_value AudioRoutingUnregisterDeviceChangeCbInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRoutingUnregisterDeviceChangeCbSuccess(napi_env env, napi_callback_info info);
napi_value AudioRoutingReleaseDevicesInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRoutingReleaseDevicesSuccess(napi_env env, napi_callback_info info);
napi_value AudioRoutingIsMicBlockDetectionSupInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRoutingSetMicBlockStatusCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioSessionGetAudioSessionManagerSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionActivateAudioSessionInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioSessionActivateAudioSessionSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionActivateAudioSessionIllegalState(napi_env env, napi_callback_info info);
napi_value AudioSessionDeactivateAudioSessionInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioSessionDeactivateAudioSessionSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionDeactivateAudioSessionIllegalState(napi_env env, napi_callback_info info);
napi_value AudioSessionRegisterSessionDeactivatedCbInvPar(napi_env env, napi_callback_info info);
napi_value AudioSessionRegisterSessionDeactivatedCbSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionUnregisterSessionDeactivatedCbInvPar(napi_env env, napi_callback_info info);
napi_value AudioSessionUnregisterSessionDeactivatedCbSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionSetSceneInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioSessionSetSceneSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionRegisterStateChangeCbInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioSessionRegisterStateChangeCbSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionUnregisterStateChangeCbInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioSessionUnregisterStateChangeCbSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionSetDefaultOutputDeviceInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioSessionSetDefaultOutputDeviceSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionGetDefaultOutputDeviceInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioSessionGetDefaultOutputDeviceSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionReleaseDevicesInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioSessionReleaseDevicesSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionRegisterCurOutDevChgCbInvParam(napi_env env, napi_callback_info info);
napi_value AudioSessionRegisterCurOutDevChgCbSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionUnregisterCurOutDevChgCbInvParam(napi_env env, napi_callback_info info);
napi_value AudioSessionUnregisterCurOutDevChgCbSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionGetDirectPlaybackSupportSuccess(napi_env env, napi_callback_info info);
napi_value AudioSessionIsAcousticEchoCancelerSupportedInvPar(napi_env env, napi_callback_info info);
napi_value AudioSessionIsAcousticEchoCancelerSupportedSuc(napi_env env, napi_callback_info info);

#endif // AUDIO1TEST_AUDIOTEST_H
