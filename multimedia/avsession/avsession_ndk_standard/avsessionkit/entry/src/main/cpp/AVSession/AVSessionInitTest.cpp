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
    desc.push_back(XL("AVMetadataBuilderGenerateAVMetadataSuccess", AVMetadataBuilderGenerateAVMetadataSuccess));
    desc.push_back(
        XL("AVMetadataBuilderGenerateAVMetadataInvalidParam", AVMetadataBuilderGenerateAVMetadataInvalidParam));
    desc.push_back(XL("AVMetadataDestroySuccess", AVMetadataDestroySuccess));
    desc.push_back(XL("AVMetadataDestroyInvalidParam", AVMetadataDestroyInvalidParam));
    desc.push_back(XL("AVMetadataAVSessionType", AVMetadataAVSessionType));
    desc.push_back(XL("AVMetadataAVSetPlaybackState", AVMetadataAVSetPlaybackState));
    desc.push_back(XL("AVMetadataAVSessionLoopMode", AVMetadataAVSessionLoopMode));
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
    desc.push_back(
        XL("AVSessionRegisterToggleFavoriteCallbackInvalidParam", AVSessionRegisterToggleFavoriteCallbackInvalidParam));
    desc.push_back(
        XL("AVSessionUnregisterToggleFavoriteCallbackSuccess", AVSessionUnregisterToggleFavoriteCallbackSuccess));
    desc.push_back(XL("AVSessionUnregisterToggleFavoriteCallbackInvalidParam",
                      AVSessionUnregisterToggleFavoriteCallbackInvalidParam));
    desc.push_back(
        XL("AVSessionUnregisterCommandCallbackCommandInvalid", AVSessionUnregisterCommandCallbackCommandInvalid));
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
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
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
