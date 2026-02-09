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


#include "AVSession/AVSession_Test.h"
#include "common/Common.h"
#include "napi/native_api.h"
#include <cstdint>
#include <js_native_api_types.h>
#include <napi/native_api.h>

namespace {
static const uint32_t MAX_NAME_LENGTH = 1024;
}
EXTERN_C_START

static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVMetadataErrorCode1", AVMetadataErrorCode1));
    desc.push_back(XL("AVMetadataSkipIntervals", AVMetadataSkipIntervals));
    desc.push_back(XL("AVMetadataBuilderCreateSuccess", AVMetadataBuilderCreateSuccess));
    desc.push_back(XL("AVMetadataBuilderCreateInvalidParam", AVMetadataBuilderCreateInvalidParam));
    desc.push_back(XL("AVMetadataBuilderDestroyInvalidSuccess", AVMetadataBuilderDestroyInvalidSuccess));
    desc.push_back(XL("AVMetadataBuilderDestroyInvalidParam", AVMetadataBuilderDestroyInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetAssetIdSuccess", AVMetadataBuilderSetAssetIdSuccess));
    desc.push_back(XL("AVMetadataBuilderSetAssetIdInvalidParam", AVMetadataBuilderSetAssetIdInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetTitleSuccess", AVMetadataBuilderSetTitleSuccess));
    desc.push_back(XL("AVMetadataBuilderSetTitleInvalidParam", AVMetadataBuilderSetTitleInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetAuthorSuccess", AVMetadataBuilderSetAuthorSuccess));
    desc.push_back(XL("AVMetadataBuilderSetAuthorInvalidParam", AVMetadataBuilderSetAuthorInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetAlbumSuccess", AVMetadataBuilderSetAlbumSuccess));
    desc.push_back(XL("AVMetadataBuilderSetAlbumInvalidParam", AVMetadataBuilderSetAlbumInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetWriterSuccess", AVMetadataBuilderSetWriterSuccess));
    desc.push_back(XL("AVMetadataBuilderSetWriterInvalidParam", AVMetadataBuilderSetWriterInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetComposerSuccess", AVMetadataBuilderSetComposerSuccess));
    desc.push_back(XL("AVMetadataBuilderSetComposerInvalidParam", AVMetadataBuilderSetComposerInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetDurationSuccess", AVMetadataBuilderSetDurationSuccess));
    desc.push_back(XL("AVMetadataBuilderSetDurationInvalidParam", AVMetadataBuilderSetDurationInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetArtistSuccess", AVMetadataBuilderSetArtistSuccess));
    desc.push_back(XL("AVMetadataBuilderSetArtistInvalidParam", AVMetadataBuilderSetArtistInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetMediaImageUriSuccess", AVMetadataBuilderSetMediaImageUriSuccess));
    desc.push_back(XL("AVMetadataBuilderSetMediaImageUriInvalidParam", AVMetadataBuilderSetMediaImageUriInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetSubtitleSuccess", AVMetadataBuilderSetSubtitleSuccess));
    desc.push_back(XL("AVMetadataBuilderSetSubtitleInvalidParam", AVMetadataBuilderSetSubtitleInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetDescriptionSuccess", AVMetadataBuilderSetDescriptionSuccess));
    desc.push_back(XL("AVMetadataBuilderSetDescriptionInvalidParam", AVMetadataBuilderSetDescriptionInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetLyricSuccess", AVMetadataBuilderSetLyricSuccess));
    desc.push_back(XL("AVMetadataBuilderSetLyricInvalidParam", AVMetadataBuilderSetLyricInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetSkipIntervalsSuccess", AVMetadataBuilderSetSkipIntervalsSuccess));
    desc.push_back(XL("AVMetadataBuilderSetSkipIntervalsInvalidParam", AVMetadataBuilderSetSkipIntervalsInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetDisplayTagsSuccess", AVMetadataBuilderSetDisplayTagsSuccess));
    desc.push_back(XL("AVMetadataBuilderSetDisplayTagsInvalidParam", AVMetadataBuilderSetDisplayTagsInvalidParam));
    desc.push_back(XL("AVMetadataBuilderSetFilterSuccess", AVMetadataBuilderSetFilterSuccess));
    desc.push_back(XL("AVMetadataBuilderSetFilterInvalidParam", AVMetadataBuilderSetFilterInvalidParam));
    desc.push_back(XL("AVMetadataBuilderGenerateAVMetadataSuccess", AVMetadataBuilderGenerateAVMetadataSuccess));
    desc.push_back(
        XL("AVMetadataBuilderGenerateAVMetadataInvalidParam", AVMetadataBuilderGenerateAVMetadataInvalidParam));
    desc.push_back(XL("AVMetadataDestroySuccess", AVMetadataDestroySuccess));
    desc.push_back(XL("AVMetadataDestroyInvalidParam", AVMetadataDestroyInvalidParam));
    desc.push_back(XL("AVMetadataAVSessionType", AVMetadataAVSessionType));
    desc.push_back(XL("AVMetadataAVSetPlaybackState", AVMetadataAVSetPlaybackState));
    desc.push_back(XL("AVMetadataAVSessionLoopMode", AVMetadataAVSessionLoopMode));
    desc.push_back(XL("AVMetadataAVSessionRemoteCastEnabled", AVMetadataAVSessionRemoteCastEnabled));
    desc.push_back(XL("AVMetadataAVSessionControlCommand", AVMetadataAVSessionControlCommand));
    desc.push_back(XL("AVSessionCallbackResultFailure", AVSessionCallbackResultFailure));
}

static void InitPush2(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVSessionDestroyInvalidParam", AVSessionDestroyInvalidParam));
    desc.push_back(XL("AVSessionActivateSuccess", AVSessionActivateSuccess));
    desc.push_back(XL("AVSessionActivateInvalidParam", AVSessionActivateInvalidParam));
    desc.push_back(XL("AVSessionDeactivateSuccess", AVSessionDeactivateSuccess));
    desc.push_back(XL("AVSessionDeactivateInvalidParam", AVSessionDeactivateInvalidParam));
    desc.push_back(XL("AVSessionGetSessionTypeSuccess", AVSessionGetSessionTypeSuccess));
    desc.push_back(XL("AVSessionGetSessionTypeInvalidParam", AVSessionGetSessionTypeInvalidParam));
    desc.push_back(XL("AVSessionGetSessionIdSuccess", AVSessionGetSessionIdSuccess));
    desc.push_back(XL("AVSessionGetSessionIdInvalidParam", AVSessionGetSessionIdInvalidParam));
    desc.push_back(XL("AVSessionSetPlaybackStateSuccess", AVSessionSetPlaybackStateSuccess));
    desc.push_back(XL("AVSessionSetPlaybackStateInvalidParam", AVSessionSetPlaybackStateInvalidParam));
    desc.push_back(XL("AVSessionSetAVMetadataSuccess", AVSessionSetAVMetadataSuccess));
    desc.push_back(XL("AVSessionSetAVMetadataInvalidParam", AVSessionSetAVMetadataInvalidParam));
    desc.push_back(XL("AVSessionSetAVMetadataException", AVSessionSetAVMetadataException));
    desc.push_back(XL("AVSessionSetPlaybackPositionSuccess", AVSessionSetPlaybackPositionSuccess));
    desc.push_back(XL("AVSessionSetPlaybackPositionInvalidParam", AVSessionSetPlaybackPositionInvalidParam));
    desc.push_back(XL("AVSessionSetFavoriteSuccess", AVSessionSetFavoriteSuccess));
    desc.push_back(XL("AVSessionSetFavoriteInvalidParam", AVSessionSetFavoriteInvalidParam));
    desc.push_back(XL("AVSessionSetLoopModeSuccess", AVSessionSetLoopModeSuccess));
    desc.push_back(XL("AVSessionSetLoopModeInvalidParam", AVSessionSetLoopModeInvalidParam));
    desc.push_back(XL("AVSessionSetRemoteCastEnabledSuccess", AVSessionSetRemoteCastEnabledSuccess));
    desc.push_back(XL("AVSessionSetRemoteCastEnabledInvalidParam", AVSessionSetRemoteCastEnabledInvalidParam));
    desc.push_back(XL("AVSessionRegisterCommandCallbackSuccess", AVSessionRegisterCommandCallbackSuccess));
    desc.push_back(XL("AVSessionRegisterCommandCallbackInvalidParam", AVSessionRegisterCommandCallbackInvalidParam));
    desc.push_back(XL("AVSessionUnregisterCommandCallbackSuccess", AVSessionUnregisterCommandCallbackSuccess));
    desc.push_back(
        XL("AVSessionUnregisterCommandCallbackInvalidParam", AVSessionUnregisterCommandCallbackInvalidParam));
    desc.push_back(XL("AVSessionRegisterRewindCallbackSuccess", AVSessionRegisterRewindCallbackSuccess));
    desc.push_back(XL("AVSessionRegisterRewindCallbackInvalidParam", AVSessionRegisterRewindCallbackInvalidParam));
    desc.push_back(XL("AVSessionUnregisterRewindCallbackSuccess", AVSessionUnregisterRewindCallbackSuccess));
    desc.push_back(XL("AVSessionUnregisterRewindCallbackInvalidParam", AVSessionUnregisterRewindCallbackInvalidParam));
    desc.push_back(XL("AVSessionRegisterSeekCallbackSuccess", AVSessionRegisterSeekCallbackSuccess));
    desc.push_back(XL("AVSessionRegisterSeekCallbackInvalidParam", AVSessionRegisterSeekCallbackInvalidParam));
    desc.push_back(XL("AVSessionUnregisterSeekCallbackSuccess", AVSessionUnregisterSeekCallbackSuccess));
    desc.push_back(XL("AVSessionUnregisterSeekCallbackInvalidParam", AVSessionUnregisterSeekCallbackInvalidParam));
}

static void InitPush3(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVSessionRegisterSetLoopModeCallbackSuccess", AVSessionRegisterSetLoopModeCallbackSuccess));
    desc.push_back(
        XL("AVSessionRegisterSetLoopModeCallbackInvalidParam", AVSessionRegisterSetLoopModeCallbackInvalidParam));
    desc.push_back(XL("AVSessionUnregisterSetLoopModeCallbackSuccess", AVSessionUnregisterSetLoopModeCallbackSuccess));
    desc.push_back(
        XL("AVSessionUnregisterSetLoopModeCallbackInvalidParam", AVSessionUnregisterSetLoopModeCallbackInvalidParam));
    desc.push_back(
        XL("AVSessionRegisterToggleFavoriteCallbackSuccess", AVSessionRegisterToggleFavoriteCallbackSuccess));
    desc.push_back(XL("AVSessionRegisterToggleFavoriteCallbackInvalidParam",
        AVSessionRegisterToggleFavoriteCallbackInvalidParam));
    desc.push_back(XL("AVSessionUnregisterToggleFavoriteCallbackSuccess",
        AVSessionUnregisterToggleFavoriteCallbackSuccess));
    desc.push_back(XL("AVSessionUnregisterToggleFavoriteCallbackInvalidParam",
                      AVSessionUnregisterToggleFavoriteCallbackInvalidParam));
    desc.push_back(
        XL("AVSessionUnregisterCommandCallbackCommandInvalid", AVSessionUnregisterCommandCallbackCommandInvalid));
    desc.push_back(
        XL("AVSessionRegisterOutputDeviceChangeCallbackSuccess", AVSessionRegisterOutputDeviceChangeCallbackSuccess));
    desc.push_back(XL("AVSessionRegisterOutputDeviceChangeCallbackInvalidParam",
                      AVSessionRegisterOutputDeviceChangeCallbackInvalidParam));
    desc.push_back(XL("AVSessionUnregisterOutputDeviceChangeCallbackSuccess",
        AVSessionUnregisterOutputDeviceChangeCallbackSuccess));
    desc.push_back(XL("AVSessionUnregisterOutputDeviceChangeCallbackInvalidParam",
        AVSessionUnregisterOutputDeviceChangeCallbackInvalidParam));
    desc.push_back(
        XL("AVSessionRegisterCommandCallbackCommandInvalid", AVSessionRegisterCommandCallbackCommandInvalid));
    desc.push_back(XL("AVSessionRegisterForwardCallbackSuccess", AVSessionRegisterForwardCallbackSuccess));
    desc.push_back(XL("AVSessionRegisterForwardCallbackInvalidParam", AVSessionRegisterForwardCallbackInvalidParam));
    desc.push_back(XL("AVSessionUnregisterForwardCallbackSuccess", AVSessionUnregisterForwardCallbackSuccess));
    desc.push_back(
        XL("AVSessionUnregisterForwardCallbackInvalidParam", AVSessionUnregisterForwardCallbackInvalidParam));
    desc.push_back(XL("AVSessionErrInvalidParam", AVSessionErrInvalidParam));
    desc.push_back(XL("AVSessionErrServiceException", AVSessionErrServiceException));
    desc.push_back(XL("AVSessionErrCodeCommandInvalid", AVSessionErrCodeCommandInvalid));
    desc.push_back(XL("AVSessionCreateSuccess", AVSessionCreateSuccess));
    desc.push_back(XL("AVSessionCreateInvalidParam", AVSessionCreateInvalidParam));
    desc.push_back(XL("AVSessionDestroySuccess", AVSessionDestroySuccess));
    desc.push_back(XL("AVSessionAcquireSessionSuccess", AVSessionAcquireSessionSuccess));
    desc.push_back(XL("AVSessionAcquireSessionInvalidParam", AVSessionAcquireSessionInvalidParam));
    desc.push_back(XL("AVSessionCreateAVCastControllerInvalidParam", AVSessionCreateAVCastControllerInvalidParam));
    desc.push_back(XL("AVSessionStopCastingSuccess", AVSessionStopCastingSuccess));
    desc.push_back(XL("AVSessionStopCastingInvalidParam", AVSessionStopCastingInvalidParam));
    desc.push_back(XL("AVSessionAcquireOutputDeviceSuccess", AVSessionAcquireOutputDeviceSuccess));
    desc.push_back(XL("AVSessionAcquireOutputDeviceInvalidParam", AVSessionAcquireOutputDeviceInvalidParam));
    desc.push_back(XL("AVSessionReleaseOutputDeviceSuccess", AVSessionReleaseOutputDeviceSuccess));
    desc.push_back(XL("AVSessionReleaseOutputDeviceInvalidParam", AVSessionReleaseOutputDeviceInvalidParam));
    desc.push_back(XL("AVSessionGetAVCastCategorySuccess", AVSessionGetAVCastCategorySuccess));
    desc.push_back(XL("AVSessionGetAVCastCategoryInvalidParam", AVSessionGetAVCastCategoryInvalidParam));
}

static void InitPush4(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVSessionGetDeviceIdSuccess", AVSessionGetDeviceIdSuccess));
    desc.push_back(XL("AVSessionGetDeviceIdInvalidParam", AVSessionGetDeviceIdInvalidParam));
    desc.push_back(XL("AVSessionGetDeviceNameSuccess", AVSessionGetDeviceNameSuccess));
    desc.push_back(XL("AVSessionGetDeviceNameInvalidParam", AVSessionGetDeviceNameInvalidParam));
    desc.push_back(XL("AVSessionGetDeviceTypeSuccess", AVSessionGetDeviceTypeSuccess));
    desc.push_back(XL("AVSessionGetDeviceTypeInvalidParam", AVSessionGetDeviceTypeInvalidParam));
    desc.push_back(XL("AVSessionGetSupportedProtocolsSuccess", AVSessionGetSupportedProtocolsSuccess));
    desc.push_back(XL("AVSessionGetSupportedProtocolsInvalidParam", AVSessionGetSupportedProtocolsInvalidParam));
    desc.push_back(XL("AVSessionPlaybackFilterSTATE", AVSessionPlaybackFilterSTATE));
    desc.push_back(XL("AVSessionPlaybackFilterPOSITION", AVSessionPlaybackFilterPOSITION));
    desc.push_back(XL("AVSessionPlaybackFilterSPEED", AVSessionPlaybackFilterSPEED));
    desc.push_back(XL("AVSessionPlaybackFilterVOLUME", AVSessionPlaybackFilterVOLUME));
    desc.push_back(XL("AVSessionOutputDeviceInfo", AVSessionOutputDeviceInfo));
    desc.push_back(XL("AVMediaDescriptionBuilderCreateSuccess", AVMediaDescriptionBuilderCreateSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderCreateInvalidParam", AVMediaDescriptionBuilderCreateInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderDestroySuccess", AVMediaDescriptionBuilderDestroySuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderDestroyInvalidParam", AVMediaDescriptionBuilderDestroyInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetAssetIdSuccess", AVMediaDescriptionBuilderSetAssetIdSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetAssetIdInvalidParam",
        AVMediaDescriptionBuilderSetAssetIdInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetTitleSuccess", AVMediaDescriptionBuilderSetTitleSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetTitleInvalidParam", AVMediaDescriptionBuilderSetTitleInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetSubTitleSuccess", AVMediaDescriptionBuilderSetSubTitleSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetSubTitleInvalidParam",
        AVMediaDescriptionBuilderSetSubTitleInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetArtistSuccess", AVMediaDescriptionBuilderSetArtistSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetArtistInvalidParam",
        AVMediaDescriptionBuilderSetArtistInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetAlbumCoverUriSuccess",
        AVMediaDescriptionBuilderSetAlbumCoverUriSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetAlbumCoverUriInvalidParam",
        AVMediaDescriptionBuilderSetAlbumCoverUriInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetMediaTypeSuccess", AVMediaDescriptionBuilderSetMediaTypeSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetMediaTypeInvalidParam",
        AVMediaDescriptionBuilderSetMediaTypeInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetLyricContentSuccess",
        AVMediaDescriptionBuilderSetLyricContentSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetLyricContentInvalidParam",
        AVMediaDescriptionBuilderSetLyricContentInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetDurationSuccess", AVMediaDescriptionBuilderSetDurationSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetDurationInvalidParam",
        AVMediaDescriptionBuilderSetDurationInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetMediaUriSuccess", AVMediaDescriptionBuilderSetMediaUriSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetMediaUriInvalidParam",
        AVMediaDescriptionBuilderSetMediaUriInvalidParam));
}

static void InitPush5(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVMediaDescriptionBuilderSetStartPositionSuccess",
        AVMediaDescriptionBuilderSetStartPositionSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetStartPositionInvalidParam",
        AVMediaDescriptionBuilderSetStartPositionInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetMediaSizeSuccess", AVMediaDescriptionBuilderSetMediaSizeSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetMediaSizeInvalidParam",
        AVMediaDescriptionBuilderSetMediaSizeInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetAlbumTitleSuccess", AVMediaDescriptionBuilderSetAlbumTitleSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetAlbumTitleInvalidParam",
        AVMediaDescriptionBuilderSetAlbumTitleInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderSetAppNameSuccess", AVMediaDescriptionBuilderSetAppNameSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderSetAppNameInvalidParam",
        AVMediaDescriptionBuilderSetAppNameInvalidParam));
    desc.push_back(XL("AVMediaDescriptionBuilderGenerateAVMediaDescriptionSuccess",
        AVMediaDescriptionBuilderGenerateAVMediaDescriptionSuccess));
    desc.push_back(XL("AVMediaDescriptionBuilderGenerateAVMediaDescriptionInvalidParam",
        AVMediaDescriptionBuilderGenerateAVMediaDescriptionInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetAssetIdSuccess", AVMediaDescriptionGetAssetIdSuccess));
    desc.push_back(XL("AVMediaDescriptionGetAssetIdInvalidParam",
        AVMediaDescriptionGetAssetIdInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetTitleSuccess", AVMediaDescriptionGetTitleSuccess));
    desc.push_back(XL("AVMediaDescriptionGetTitleInvalidParam",
        AVMediaDescriptionGetTitleInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetSubTitleSuccess", AVMediaDescriptionGetSubTitleSuccess));
    desc.push_back(XL("AVMediaDescriptionGetSubTitleInvalidParam",
        AVMediaDescriptionGetSubTitleInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetArtistSuccess", AVMediaDescriptionGetArtistSuccess));
    desc.push_back(XL("AVMediaDescriptionGetArtistInvalidParam", AVMediaDescriptionGetArtistInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetAlbumCoverUriSuccess", AVMediaDescriptionGetAlbumCoverUriSuccess));
    desc.push_back(XL("AVMediaDescriptionGetAlbumCoverUriInvalidParam",
        AVMediaDescriptionGetAlbumCoverUriInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetMediaTypeSuccess", AVMediaDescriptionGetMediaTypeSuccess));
    desc.push_back(XL("AVMediaDescriptionGetMediaTypeInvalidParam", AVMediaDescriptionGetMediaTypeInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetLyricContentSuccess", AVMediaDescriptionGetLyricContentSuccess));
    desc.push_back(XL("AVMediaDescriptionGetLyricContentInvalidParam",
        AVMediaDescriptionGetLyricContentInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetDurationSuccess", AVMediaDescriptionGetDurationSuccess));
    desc.push_back(XL("AVMediaDescriptionGetDurationInvalidParam", AVMediaDescriptionGetDurationInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetMediaUriSuccess", AVMediaDescriptionGetMediaUriSuccess));
    desc.push_back(XL("AVMediaDescriptionGetMediaUriInvalidParam", AVMediaDescriptionGetMediaUriInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetStartPositionSuccess", AVMediaDescriptionGetStartPositionSuccess));
    desc.push_back(XL("AVMediaDescriptionGetStartPositionInvalidParam",
        AVMediaDescriptionGetStartPositionInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetMediaSizeSuccess", AVMediaDescriptionGetMediaSizeSuccess));
    desc.push_back(XL("AVMediaDescriptionGetMediaSizeInvalidParam", AVMediaDescriptionGetMediaSizeInvalidParam));
    desc.push_back(XL("AVMediaDescriptionGetAlbumTitleSuccess", AVMediaDescriptionGetAlbumTitleSuccess));
    desc.push_back(XL("AVMediaDescriptionGetAlbumTitleInvalidParam", AVMediaDescriptionGetAlbumTitleInvalidParam));
}

static void InitPush6(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVMediaDescriptionGetAppNameSuccess", AVMediaDescriptionGetAppNameSuccess));
    desc.push_back(XL("AVMediaDescriptionGetAppNameInvalidParam", AVMediaDescriptionGetAppNameInvalidParam));
    desc.push_back(XL("AVMediaDescriptionDestroySuccess", AVMediaDescriptionDestroySuccess));
    desc.push_back(XL("AVMediaDescriptionDestroyInvalidParam", AVMediaDescriptionDestroyInvalidParam));
    desc.push_back(XL("AVCastControllerDestroyInvalidParam", AVCastControllerDestroyInvalidParam));
    desc.push_back(XL("AVCastControllerGetPlaybackStateInvalidParam", AVCastControllerGetPlaybackStateInvalidParam));
    desc.push_back(XL("AVCastControllerRegisterPlaybackStateChangedCallbackInvalidParam",
        AVCastControllerRegisterPlaybackStateChangedCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerUnregisterPlaybackStateChangedCallbackInvalidParam",
        AVCastControllerUnregisterPlaybackStateChangedCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerRegisterMediaItemChangedCallbackInvalidParam",
        AVCastControllerRegisterMediaItemChangedCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerUnregisterMediaItemChangedCallbackInvalidParam",
        AVCastControllerUnregisterMediaItemChangedCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerRegisterPlayNextCallbackInvalidParam",
        AVCastControllerRegisterPlayNextCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerUnregisterPlayNextCallbackInvalidParam",
        AVCastControllerUnregisterPlayNextCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerRegisterPlayPreviousCallbackInvalidParam",
        AVCastControllerRegisterPlayPreviousCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerUnregisterPlayPreviousCallbackInvalidParam",
        AVCastControllerUnregisterPlayPreviousCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerRegisterSeekDoneCallbackInvalidParam",
        AVCastControllerRegisterSeekDoneCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerUnregisterSeekDoneCallbackInvalidParam",
        AVCastControllerUnregisterSeekDoneCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerRegisterEndOfStreamCallbackInvalidParam",
        AVCastControllerRegisterEndOfStreamCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerUnregisterEndOfStreamCallbackInvalidParam",
        AVCastControllerUnregisterEndOfStreamCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerRegisterErrorCallbackInvalidParam",
        AVCastControllerRegisterErrorCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerUnregisterErrorCallbackInvalidParam",
        AVCastControllerUnregisterErrorCallbackInvalidParam));
    desc.push_back(XL("AVCastControllerSendCommonCommandInvalidParam", AVCastControllerSendCommonCommandInvalidParam));
    desc.push_back(XL("AVCastControllerSendSeekCommandInvalidParam", AVCastControllerSendSeekCommandInvalidParam));
    desc.push_back(XL("AVCastControllerSendFastForwardCommandInvalidParam",
        AVCastControllerSendFastForwardCommandInvalidParam));
    desc.push_back(XL("AVCastControllerSendRewindCommandInvalidParam", AVCastControllerSendRewindCommandInvalidParam));
    desc.push_back(XL("AVCastControllerSendSetSpeedCommandInvalidParam",
        AVCastControllerSendSetSpeedCommandInvalidParam));
    desc.push_back(XL("AVCastControllerSendVolumeCommandInvalidParam", AVCastControllerSendVolumeCommandInvalidParam));
    desc.push_back(XL("AVCastControllerPrepareInvalidParam", AVCastControllerPrepareInvalidParam));
    desc.push_back(XL("AVCastControllerStartInvalidParam", AVCastControllerStartInvalidParam));
}

static void InitPush7(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVSessionGetPlaybackStateInvalidParam", AVSessionGetPlaybackStateInvalidParam));
    desc.push_back(XL("AVSessionGetPlaybackPositionInvalidParam", AVSessionGetPlaybackPositionInvalidParam));
    desc.push_back(XL("AVSessionGetPlaybackSpeedInvalidParam", AVSessionGetPlaybackSpeedInvalidParam));
    desc.push_back(XL("AVSessionGetPlaybackVolumeInvalidParam", AVSessionGetPlaybackVolumeInvalidParam));
    desc.push_back(XL("AVCastControlCommandTypePlay", AVCastControlCommandTypePlay));
    desc.push_back(XL("AVCastControlCommandTypePause", AVCastControlCommandTypePause));
    desc.push_back(XL("AVCastControlCommandTypeStop", AVCastControlCommandTypeStop));
    desc.push_back(XL("AVCastControlCommandTypePlayNext", AVCastControlCommandTypePlayNext));
    desc.push_back(XL("AVCastControlCommandTypePlayPrevious", AVCastControlCommandTypePlayPrevious));
    desc.push_back(XL("AVCastControlCommandTypeFastForward", AVCastControlCommandTypeFastForward));
    desc.push_back(XL("AVCastControlCommandTypeRewind", AVCastControlCommandTypeRewind));
    desc.push_back(XL("AVCastControlCommandTypeSeek", AVCastControlCommandTypeSeek));
    desc.push_back(XL("AVCastControlCommandTypeSetVolume", AVCastControlCommandTypeSetVolume));
    desc.push_back(XL("AVCastControlCommandTypeSetSpeed", AVCastControlCommandTypeSetSpeed));
    desc.push_back(XL("AVSessionPlaybackSpeed0_75X", AVSessionPlaybackSpeed0_75X));
    desc.push_back(XL("AVSessionPlaybackSpeed1_00X", AVSessionPlaybackSpeed1_00X));
    desc.push_back(XL("AVSessionPlaybackSpeed1_25X", AVSessionPlaybackSpeed1_25X));
    desc.push_back(XL("AVSessionPlaybackSpeed1_75X", AVSessionPlaybackSpeed1_75X));
    desc.push_back(XL("AVSessionPlaybackSpeed2_00X", AVSessionPlaybackSpeed2_00X));
    desc.push_back(XL("AVSessionPlaybackSpeed0_50X", AVSessionPlaybackSpeed0_50X));
    desc.push_back(XL("AVSessionPlaybackSpeed1_50X", AVSessionPlaybackSpeed1_50X));
    desc.push_back(XL("AVSession_TypeSESSION_TYPE_PHOTO", AVSession_TypeSESSION_TYPE_PHOTO));
    desc.push_back(XL("AVSessionConnectionStateSTATE_CONNECTING", AVSessionConnectionStateSTATE_CONNECTING));
    desc.push_back(XL("AVSessionConnectionStateSTATE_CONNECTED", AVSessionConnectionStateSTATE_CONNECTED));
    desc.push_back(XL("AVSessionConnectionStateSTATE_DISCONNECTED", AVSessionConnectionStateSTATE_DISCONNECTED));
    desc.push_back(XL("AVSessionAVCastCategoryCATEGORY_LOCAL", AVSessionAVCastCategoryCATEGORY_LOCAL));
    desc.push_back(XL("AVSessionAVCastCategoryCATEGORY_REMOTE", AVSessionAVCastCategoryCATEGORY_REMOTE));
    desc.push_back(XL("AVSessionDeviceTypeDEVICE_TYPE_LOCAL", AVSessionDeviceTypeDEVICE_TYPE_LOCAL));
    desc.push_back(XL("AVSessionDeviceTypeDEVICE_TYPE_TV", AVSessionDeviceTypeDEVICE_TYPE_TV));
desc.push_back(XL("AVSessionDeviceTypeDEVICE_TYPE_SMART_SPEAKER", AVSessionDeviceTypeDEVICE_TYPE_SMART_SPEAKER));
    desc.push_back(XL("AVSessionDeviceTypeDEVICE_TYPE_BLUETOOTH", AVSessionDeviceTypeDEVICE_TYPE_BLUETOOTH));
    desc.push_back(XL("AVSessionProtocolTypeTYPE_LOCAL", AVSessionProtocolTypeTYPE_LOCAL));
    desc.push_back(XL("AVSessionProtocolTypeTYPE_CAST_PLUS_STREAM", AVSessionProtocolTypeTYPE_CAST_PLUS_STREAM));
    desc.push_back(XL("AVSessionProtocolTypeTYPE_DLNA", AVSessionProtocolTypeTYPE_DLNA));
    desc.push_back(XL("AVSessionProtocolTypeTYPE_CAST_PLUS_AUDIO",
        AVSessionProtocolTypeTYPE_CAST_PLUS_AUDIO));
    desc.push_back(XL("AVSession_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST",
        AVSession_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_UNSPECIFIED", AVSession_ERR_CODE_CAST_CONTROL_UNSPECIFIED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_REMOTE_ERROR", AVSession_ERR_CODE_CAST_CONTROL_REMOTE_ERROR));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW",
        AVSession_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_TIMEOUT", AVSession_ERR_CODE_CAST_CONTROL_TIMEOUT));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED",
        AVSession_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED));
}

static void InitPush8(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING",
        AVSession_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED",
        AVSession_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET",
        AVSession_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED",
        AVSession_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED",
        AVSession_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_DEVICE_MISSING",
        AVSession_ERR_CODE_CAST_CONTROL_DEVICE_MISSING));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_INVALID_PARAM",
        AVSession_ERR_CODE_CAST_CONTROL_INVALID_PARAM));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_NO_MEMORY", AVSession_ERR_CODE_CAST_CONTROL_NO_MEMORY));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED",
        AVSession_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED",
        AVSession_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED",
        AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT",
        AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE",
        AVSession_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS",
        AVSession_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND",
        AVSession_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION",
        AVSession_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED",
        AVSession_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE",
        AVSession_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS",
        AVSession_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_READ_ERROR",
        AVSession_ERR_CODE_CAST_CONTROL_IO_READ_ERROR));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY",
        AVSession_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED",
        AVSession_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN",
        AVSession_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN));
}

static void InitPush9(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED",
        AVSession_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES",
        AVSession_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED",
        AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED",
        AVSession_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED",
        AVSession_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED",
        AVSession_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED",
        AVSession_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED",
        AVSession_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED",
        AVSession_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED",
        AVSession_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED",
        AVSession_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_DECODING_FAILED",
        AVSession_ERR_CODE_CAST_CONTROL_DECODING_FAILED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES",
        AVSession_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED",
        AVSession_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED",
        AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED",
        AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED));
    desc.push_back(XL("AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED",
        AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED));
    desc.push_back(XL("AVSession_AVQUEUEITEM_ERROR_NO_MEMORY",
        AVSession_AVQUEUEITEM_ERROR_NO_MEMORY));
}
static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    InitPush4(desc);
    InitPush5(desc);
    InitPush6(desc);
    InitPush7(desc);
    InitPush8(desc);
    InitPush9(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "AVSession",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
