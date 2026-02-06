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

#ifndef OSACCOUNT_NATIVE_AV_SESSION_TEST_H
#define OSACCOUNT_NATIVE_AV_SESSION_TEST_H
#include <napi/native_api.h>

napi_value AVMetadataErrorCode1(napi_env env, napi_callback_info info);
napi_value AVMetadataSkipIntervals(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderCreateSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderCreateInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderDestroyInvalidSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderDestroyInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetAssetIdSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetAssetIdInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetTitleSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetTitleInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetAuthorSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetAuthorInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetAlbumSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetAlbumInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetWriterSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetWriterInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetComposerSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetComposerInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetDurationSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetDurationInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetArtistSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetArtistInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetMediaImageUriSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetMediaImageUriInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetSubtitleSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetSubtitleInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetDescriptionSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetDescriptionInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetLyricSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetLyricInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetSkipIntervalsSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetSkipIntervalsInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetDisplayTagsSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderSetDisplayTagsInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderGenerateAVMetadataSuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataBuilderGenerateAVMetadataInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataDestroySuccess(napi_env env, napi_callback_info info);
napi_value AVMetadataDestroyInvalidParam(napi_env env, napi_callback_info info);
napi_value AVMetadataAVSessionType(napi_env env, napi_callback_info info);
napi_value AVMetadataAVSetPlaybackState(napi_env env, napi_callback_info info);
napi_value AVMetadataAVSessionLoopMode(napi_env env, napi_callback_info info);
napi_value AVMetadataAVSessionControlCommand(napi_env env, napi_callback_info info);
napi_value AVSessionCallbackResultFailure(napi_env env, napi_callback_info info);
napi_value AVSessionCreateSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionCreateInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionDestroySuccess(napi_env env, napi_callback_info info);
napi_value AVSessionDestroyInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionActivateSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionActivateInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionDeactivateSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionDeactivateInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionGetSessionTypeSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionGetSessionTypeInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionGetSessionIdSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionGetSessionIdInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionSetPlaybackStateSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionSetPlaybackStateInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionSetAVMetadataSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionSetAVMetadataInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionSetAVMetadataException(napi_env env, napi_callback_info info);
napi_value AVSessionSetPlaybackPositionSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionSetPlaybackPositionInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionSetFavoriteSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionSetFavoriteInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionSetLoopModeSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionSetLoopModeInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterCommandCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterCommandCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterCommandCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterCommandCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterRewindCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterRewindCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterRewindCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterRewindCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterSeekCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterSeekCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterSeekCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterSeekCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterSetLoopModeCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterSetLoopModeCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterSetLoopModeCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterSetLoopModeCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterToggleFavoriteCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterToggleFavoriteCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterToggleFavoriteCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterToggleFavoriteCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterCommandCallbackCommandInvalid(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterCommandCallbackCommandInvalid(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterForwardCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionRegisterForwardCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterForwardCallbackSuccess(napi_env env, napi_callback_info info);
napi_value AVSessionUnregisterForwardCallbackInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionErrInvalidParam(napi_env env, napi_callback_info info);
napi_value AVSessionErrServiceException(napi_env env, napi_callback_info info);
napi_value AVSessionErrCodeCommandInvalid(napi_env env, napi_callback_info info);

#endif // OSACCOUNT_NATIVE_AV_SESSION_TEST_H
