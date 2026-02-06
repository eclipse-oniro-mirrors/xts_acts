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
#ifndef AUDIOENUMTEST_AUDIOENUMTEST_H
#define AUDIOENUMTEST_AUDIOENUMTEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>

napi_value AudioStreamEncodingTypeAudioVividCode(napi_env env, napi_callback_info info);
napi_value AudioStreamEncodingTypeEAc3Code(napi_env env, napi_callback_info info);
napi_value AudioStreamDirectPlayBackBitStreamSupportedCode(napi_env env, napi_callback_info info);
napi_value AudioStreamDirectPlayBackPcmSupportedCode(napi_env env, napi_callback_info info);
napi_value AudioStreamStateInvalidCode(napi_env env, napi_callback_info info);
napi_value AudioStreamStateNewCode(napi_env env, napi_callback_info info);
napi_value AudioStreamStatePreparedCode(napi_env env, napi_callback_info info);
napi_value AudioStreamStateRunningCode(napi_env env, napi_callback_info info);
napi_value AudioStreamStateStoppedCode(napi_env env, napi_callback_info info);
napi_value AudioStreamStateReleasedCode(napi_env env, napi_callback_info info);
napi_value AudioStreamStatePausedCode(napi_env env, napi_callback_info info);
napi_value AudioStreamSourceTypeUnprocessedCode(napi_env env, napi_callback_info info);
napi_value AudioStreamSourceTypeLiveCode(napi_env env, napi_callback_info info);
napi_value AudioStreamEffectDefaultCode(napi_env env, napi_callback_info info);
napi_value AudioStreamFastStatusNormalCode(napi_env env, napi_callback_info info);
napi_value AudioStreamFastStatusFastCode(napi_env env, napi_callback_info info);
napi_value AudioSceneRingingCode(napi_env env, napi_callback_info info);
napi_value AudioScenePhoneCallCode(napi_env env, napi_callback_info info);
napi_value AudioSceneVoiceChatCode(napi_env env, napi_callback_info info);
napi_value AudioRingerModeSilentCode(napi_env env, napi_callback_info info);
napi_value AudioRingerModeVibrateCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceRoleInputCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeWiredHeadphonesCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeBluetoothScoCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeBluetoothA2dpCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeMicCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeUsbHeadsetCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeDisplayPortCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeRemoteCastCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeUsbDeviceCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeAccessoryCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeHdmiCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeLineDigitalCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeHearingAidCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceTypeNearlinkCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceUsageMediaInputCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceUsageMediaAllCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceUsageCallOutputCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceUsageCallInputCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceUsageCallAllCode(napi_env env, napi_callback_info info);
napi_value AudioStreamEventRoutingChangedCode(napi_env env, napi_callback_info info);
napi_value AudioStreamInterruptForceCode(napi_env env, napi_callback_info info);
napi_value AudioStreamInterruptShareCode(napi_env env, napi_callback_info info);
napi_value AudioStreamInterruptHintNoneCode(napi_env env, napi_callback_info info);
napi_value AudioStreamInterruptHintResumeCode(napi_env env, napi_callback_info info);
napi_value AudioStreamInterruptHintPauseCode(napi_env env, napi_callback_info info);
napi_value AudioStreamInterruptHintStopCode(napi_env env, napi_callback_info info);
napi_value AudioStreamInterruptHintDuckCode(napi_env env, napi_callback_info info);
napi_value AudioStreamInterruptHintUnduckCode(napi_env env, napi_callback_info info);
napi_value AudioStreamInterruptHintMuteCode(napi_env env, napi_callback_info info);
napi_value AudioStreamInterruptHintUnmuteCode(napi_env env, napi_callback_info info);
napi_value AudioStreamReasonUnknownCode(napi_env env, napi_callback_info info);
napi_value AudioStreamReasonOldDeviceAvailableCode(napi_env env, napi_callback_info info);
napi_value AudioStreamReasonOldDeviceUnavailableCode(napi_env env, napi_callback_info info);
napi_value AudioStreamReasonOverrodeCode(napi_env env, napi_callback_info info);
napi_value AudioStreamReasonSessionActivatedCode(napi_env env, napi_callback_info info);
napi_value AudioStreamReasonStreamPriorityChangedCode(napi_env env, napi_callback_info info);
napi_value AudioDeviceChangeTypeDisconnectCode(napi_env env, napi_callback_info info);
napi_value AudioSessionStateChangeHintResumeCode(napi_env env, napi_callback_info info);
napi_value AudioSessionStateChangeHintPauseCode(napi_env env, napi_callback_info info);
napi_value AudioSessionStateChangeHintStopCode(napi_env env, napi_callback_info info);
napi_value AudioSessionStateChangeHintTimeOutStopCode(napi_env env, napi_callback_info info);
napi_value AudioSessionStateChangeHintDuckCode(napi_env env, napi_callback_info info);
napi_value AudioSessionStateChangeHintUnduckCode(napi_env env, napi_callback_info info);
napi_value DeviceChangeRecommendToContinueCode(napi_env env, napi_callback_info info);
napi_value DeviceChangeRecommendToStopCode(napi_env env, napi_callback_info info);
napi_value AudioSessionStateChangedEventCode(napi_env env, napi_callback_info info);
napi_value AudioSessionStateChangedEventStateChangeHintCode(napi_env env, napi_callback_info info);

#endif // AUDIOENUMTEST_AUDIOENUMTEST_H
