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
#ifndef AUDIOTEST_AUDIOTEST_H
#define AUDIOTEST_AUDIOTEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <ohaudio/native_audiostream_base.h>

OH_AudioStreamBuilder *CreateCapturerBuilder();
napi_value AudioCaptureStartInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCapturePauseInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureStopInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureFlushInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetCurrentStateInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetLatencyModeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetStreamIdInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetSamplingRateInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetChannelCountInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetSampleFormatInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetEncodingTypeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetCapturerInfoInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetFrameSizeInCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetTimestampInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetFramesReadInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioCaptureGetOverflowCountInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererStartInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererPauseInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererStopInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererFlushInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetCurrentStateInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetSamplingRateInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetStreamIdInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetChannelCountInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetSampleFormatInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetLatencyModeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetRendererInfoInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetEncodingTypeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetFramesWrittenInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetTimestampInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetTimestampIllegalState(napi_env env, napi_callback_info info);
napi_value AudioRendererGetFrameSizeInCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetSpeedInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererSetSpeedInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererSetVolumeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererSetVolumeSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererSetVolumeWithRampInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererSetVolumeWithRampSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererGetVolumeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetVolumeSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererSetMarkPositionInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererSetMarkPositionSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererCancelMarkInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererCancelMarkSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererGetUnderflowCountInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetUnderflowCountSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererGetChannelLayoutInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetChannelLayoutSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererGetEffectModeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetEffectModeSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererSetEffectModeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererSetEffectModeSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererGetRendererPrivacyInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererSetSilentModeAndMixWithOthersInvPar(napi_env env, napi_callback_info info);
napi_value AudioRendererSetSilentModeAndMixWithOthersSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererGetSilentModeAndMixWithOthersInvPar(napi_env env, napi_callback_info info);
napi_value AudioRendererGetSilentModeAndMixWithOthersSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererSetDefaultOutputDeviceInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererSetDefaultOutputDeviceSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererGetAudioTimestampInfoInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererSetLoudnessGainInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererSetLoudnessGainSuccess(napi_env env, napi_callback_info info);
napi_value AudioRendererGetLoudnessGainInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioRendererGetLoudnessGainSuccess(napi_env env, napi_callback_info info);
napi_value AudioStreamSetSampleFormatInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetEncodingTypeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetLatencyModeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetChannelLayoutInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetChannelLayoutSuccess(napi_env env, napi_callback_info info);
napi_value AudioStreamSetRendererInfoInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetRendererCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetOutDeviceChangeCbInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetCapturerCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetFrameSizeInCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetWriteDataMetaCbInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetWriteDataMetaCbSuccess(napi_env env, napi_callback_info info);
napi_value AudioStreamSetRendererInterruptModeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetRendererWriteDataCbInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetWriteDataCbAdvancedInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioStreamSetWriteDataCbAdvancedSuccess(napi_env env, napi_callback_info info);
napi_value AudioStreamSetRendererErrorCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AudioStreamSetCapturerReadDataCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AudioStreamSetCapturerDeviceChangeCbSuccess(napi_env env, napi_callback_info info);
napi_value AudioStreamSetCapturerInterruptCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AudioStreamSetCapturerErrorCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AudioStreamSetCapturerWillMuteOnIntrptInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceRoleInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceRoleSuccess(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceTypeInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceTypeSuccess(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceIdInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceIdSuccess(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceNameInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceNameSuccess(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceAddressInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceAddressSuccess(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceSampleRatesInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceSampleRatesSuccess(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceChannelCountsInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceChannelCountsSuccess(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceDisplayNameInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceDisplayNameSuccess(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceEncodingTypesInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioDeviceGetDeviceEncodingTypesSuccess(napi_env env, napi_callback_info info);
napi_value AudioGetAudioManagerInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioGetAudioManagerSuccess(napi_env env, napi_callback_info info);
napi_value AudioGetAudioSceneInvalidParam(napi_env env, napi_callback_info info);
napi_value AudioGetAudioSceneSuccess(napi_env env, napi_callback_info info);

#endif // AUDIOTEST_AUDIOTEST_H
