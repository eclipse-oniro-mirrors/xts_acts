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
#include <cstdlib>
#include <multimedia/av_session/native_avmetadata.h>
#include <multimedia/av_session/native_avsession.h>
#include <multimedia/av_session/native_avsession_errors.h>

static int32_t g_trueValue = PARAM_1;
static int32_t g_falseValue = PARAM_0;
static int32_t g_errorCode401 = PARAM_401;

AVSession_PlaybackState CheckPlaybackState(int32_t PlaybackState)
{
    if (PlaybackState == PLAYBACK_STATE_INITIAL) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_PREPARING) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_PLAYING) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_PAUSED) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_FAST_FORWARDING) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_REWINDED) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_STOPPED) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_COMPLETED) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_RELEASED) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_ERROR) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_IDLE) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_BUFFERING) {
        return AVSession_PlaybackState(PlaybackState);
    } else if (PlaybackState == PLAYBACK_STATE_MAX) {
        return AVSession_PlaybackState(PlaybackState);
    } else {
        return AVSession_PlaybackState(PARAM_NEGATIVE_2);
    }
}

AVMetadata_SkipIntervals CheckSkipIntervals(int32_t SkipIntervals)
{
    if (SkipIntervals == SECONDS_10) {
        return AVMetadata_SkipIntervals(SkipIntervals);
    } else if (SkipIntervals == SECONDS_15) {
        return AVMetadata_SkipIntervals(SkipIntervals);
    } else if (SkipIntervals == SECONDS_30) {
        return AVMetadata_SkipIntervals(SkipIntervals);
    } else {
        return AVMetadata_SkipIntervals(PARAM_NEGATIVE_2);
    }
}

AVSession_Type CheckType(int32_t Type)
{
    if (Type == SESSION_TYPE_AUDIO) {
        return AVSession_Type(Type);
    } else if (Type == SESSION_TYPE_VIDEO) {
        return AVSession_Type(Type);
    } else if (Type == SESSION_TYPE_VOICE_CALL) {
        return AVSession_Type(Type);
    } else if (Type == SESSION_TYPE_VIDEO_CALL) {
        return AVSession_Type(Type);
    } else {
        return AVSession_Type(PARAM_NEGATIVE_2);
    }
}

AVSession_LoopMode CheckLoopMode(int32_t LoopMode)
{
    if (LoopMode == LOOP_MODE_SEQUENCE) {
        return AVSession_LoopMode(LoopMode);
    } else if (LoopMode == LOOP_MODE_SINGLE) {
        return AVSession_LoopMode(LoopMode);
    } else if (LoopMode == LOOP_MODE_LIST) {
        return AVSession_LoopMode(LoopMode);
    } else if (LoopMode == LOOP_MODE_SHUFFLE) {
        return AVSession_LoopMode(LoopMode);
    } else if (LoopMode == LOOP_MODE_CUSTOM) {
        return AVSession_LoopMode(LoopMode);
    } else {
        return CheckLoopMode(PARAM_NEGATIVE_2);
    }
}

AVSession_ControlCommand CheckControlCommand(int32_t ControlCommand)
{
    if (ControlCommand == CONTROL_CMD_INVALID) {
        return AVSession_ControlCommand(ControlCommand);
    } else if (ControlCommand == CONTROL_CMD_PAUSE) {
        return AVSession_ControlCommand(ControlCommand);
    } else if (ControlCommand == CONTROL_CMD_STOP) {
        return AVSession_ControlCommand(ControlCommand);
    } else if (ControlCommand == CONTROL_CMD_PLAY_NEXT) {
        return AVSession_ControlCommand(ControlCommand);
    } else if (ControlCommand == CONTROL_CMD_PLAY_PREVIOUS) {
        return AVSession_ControlCommand(ControlCommand);
    } else {
        return AVSession_ControlCommand(PARAM_NEGATIVE_2);
    }
}

napi_value AVMetadataErrorCode1(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder **builder = nullptr;
    AVMetadata_Result setResult = OH_AVMetadataBuilder_Create(builder);
    napi_value retValue;
    if (setResult == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataSkipIntervals(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t intervalValue;
    if (napi_get_value_int32(env, args[0], &intervalValue) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Marshall", "获取参数失败");
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_AVMetadataBuilder *builder = nullptr;
    AVMetadata_Result createResult = OH_AVMetadataBuilder_Create(&builder);
    if (createResult != AVMETADATA_SUCCESS || builder == nullptr) {
        napi_throw_error(env, "CREATE_ERROR", "Failed to create metadata builder");
        return nullptr;
    }
    AVMetadata_Result setResult = OH_AVMetadataBuilder_SetSkipIntervals(builder, CheckSkipIntervals(intervalValue));
    OH_AVMetadataBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}
napi_value AVMetadataBuilderCreateSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder **builderPtr = &builder;
    int32_t createResult = OH_AVMetadataBuilder_Create(builderPtr);
    napi_value retValue;
    if (createResult == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderCreateInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder **builderPtr = nullptr;
    int32_t createResult = OH_AVMetadataBuilder_Create(builderPtr);
    napi_value retValue;
    if (createResult == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderDestroyInvalidSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder **builderPtr = &builder;
    OH_AVMetadataBuilder_Create(builderPtr);
    int32_t destroyResult = OH_AVMetadataBuilder_Destroy(builder);
    napi_value retValue;
    if (destroyResult == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderDestroyInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder **builderPtr = nullptr;
    OH_AVMetadataBuilder_Create(builderPtr);
    int32_t destroyResult = OH_AVMetadataBuilder_Destroy(builder);
    napi_value retValue;
    if (destroyResult == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetAssetIdSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *assetId = "video_videoPlayer001";
    int32_t result = OH_AVMetadataBuilder_SetAssetId(builder, assetId);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetAssetIdInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    const char *assetId = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetAssetId(builder, assetId);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetTitleSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *title = "MyVideoPlayer";
    int32_t result = OH_AVMetadataBuilder_SetTitle(builder, title);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetTitleInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    const char *title = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetTitle(builder, title);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetAuthorSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *author = "JayZhou";
    int32_t result = OH_AVMetadataBuilder_SetAuthor(builder, author);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetAuthorInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    const char *author = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetAuthor(builder, author);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetArtistSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *artist = "JayZhou";
    int32_t result = OH_AVMetadataBuilder_SetArtist(builder, artist);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetArtistInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    const char *artist = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetArtist(builder, artist);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetAlbumSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *album = "范特西";
    int32_t result = OH_AVMetadataBuilder_SetAlbum(builder, album);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetAlbumInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    const char *album = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetAlbum(builder, album);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetWriterSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *writer = "方文山";
    int32_t result = OH_AVMetadataBuilder_SetWriter(builder, writer);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetWriterInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    const char *writer = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetWriter(builder, writer);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetComposerSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *writer = "周杰伦";
    int32_t result = OH_AVMetadataBuilder_SetComposer(builder, writer);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetComposerInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    const char *writer = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetComposer(builder, writer);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetDurationSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    int64_t duration = PARAM_200;
    int32_t result = OH_AVMetadataBuilder_SetDuration(builder, duration);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetDurationInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    int64_t duration = PARAM_200;
    int32_t result = OH_AVMetadataBuilder_SetDuration(builder, duration);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetMediaImageUriSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *mediaImageUri = "www.JayZhou.com";
    int32_t result = OH_AVMetadataBuilder_SetMediaImageUri(builder, mediaImageUri);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetMediaImageUriInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    const char *mediaImageUri = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetMediaImageUri(builder, mediaImageUri);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetSubtitleSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *subtitle = "不能说的秘密";
    int32_t result = OH_AVMetadataBuilder_SetSubtitle(builder, subtitle);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetSubtitleInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *subtitle = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetSubtitle(builder, subtitle);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetDescriptionSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *description = "而我已经分不清，你是友情，还是错过的爱情";
    int32_t result = OH_AVMetadataBuilder_SetDescription(builder, description);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetDescriptionInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    const char *description = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetDescription(builder, description);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetLyricSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    const char *lyric = "[ti:Love Story]\n"
                        "[ar:Taylor Swift]\n"
                        "[al:Fearless]\n"
                        "[00:00.500]We were both young when I first saw you\n"
                        "[00:05.200]I close my eyes and the flashback starts\n"
                        "[00:09.800]I'm standing there on a balcony in summer air\n"
                        "[00:14.500]See the lights, see the party, the ball gowns\n"
                        "[00:19.200]See you make your way through the crowd\n"
                        "[00:23.800]And say, \"Hello\"\n"
                        "[00:26.500]Little did I know\n"
                        "[00:29.200]That you were Romeo, you were throwing pebbles\n"
                        "[00:33.800]And my daddy said, \"Stay away from Juliet\"\n"
                        "[00:38.500]And I was crying on the staircase\n"
                        "[00:41.200]Begging you, \"Please don't go\"\n"
                        "[00:44.200]And I said, \"Romeo, take me somewhere we can be alone\n"
                        "[00:49.800]I'll be waiting, all that's left to do is run\n"
                        "[00:54.500]You'll be the prince and I'll be the princess\n"
                        "[00:59.200]It's a love story, baby, just say 'Yes'\"\n"
                        "[01:03.000]We were both young when I first saw you\n";
    int32_t result = OH_AVMetadataBuilder_SetLyric(builder, lyric);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetLyricInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    const char *lyric = nullptr;
    int32_t result = OH_AVMetadataBuilder_SetLyric(builder, lyric);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetSkipIntervalsSuccess(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t intervalValue;
    if (napi_get_value_int32(env, args[0], &intervalValue) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Marshall", "获取参数失败");
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder **builderPtr = &builder;
    AVMetadata_Result createResult = OH_AVMetadataBuilder_Create(builderPtr);
    if (createResult != AVMETADATA_SUCCESS || builder == nullptr) {
        napi_throw_error(env, "CREATE_ERROR", "Failed to create metadata builder");
        return nullptr;
    }
    AVMetadata_SkipIntervals intervals = static_cast<AVMetadata_SkipIntervals>(intervalValue);
    AVMetadata_Result setResult = OH_AVMetadataBuilder_SetSkipIntervals(builder, intervals);
    OH_AVMetadataBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetSkipIntervalsInvalidParam(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t intervalValue;
    if (napi_get_value_int32(env, args[0], &intervalValue) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Marshall", "获取参数失败");
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_AVMetadataBuilder *builder = nullptr;
    AVMetadata_SkipIntervals intervals = static_cast<AVMetadata_SkipIntervals>(intervalValue);
    AVMetadata_Result setResult = OH_AVMetadataBuilder_SetSkipIntervals(builder, intervals);
    OH_AVMetadataBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetDisplayTagsSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    int32_t tags = PARAM_1;
    int32_t result = OH_AVMetadataBuilder_SetDisplayTags(builder, tags);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderSetDisplayTagsInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    int32_t tags = PARAM_1;
    int32_t result = OH_AVMetadataBuilder_SetDisplayTags(builder, tags);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderGenerateAVMetadataSuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    OH_AVMetadata *avMetadata = nullptr;
    int32_t result = OH_AVMetadataBuilder_GenerateAVMetadata(builder, &avMetadata);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataBuilderGenerateAVMetadataInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadata **avMetadata = nullptr;
    int32_t result = OH_AVMetadataBuilder_GenerateAVMetadata(builder, avMetadata);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataDestroySuccess(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    OH_AVMetadata *avMetadata = nullptr;
    OH_AVMetadataBuilder_GenerateAVMetadata(builder, &avMetadata);
    int32_t result = OH_AVMetadata_Destroy(avMetadata);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataDestroyInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadata *avMetadata = nullptr;
    OH_AVMetadata **avMetadataPtr = nullptr;
    OH_AVMetadataBuilder_GenerateAVMetadata(builder, avMetadataPtr);
    int32_t result = OH_AVMetadata_Destroy(avMetadata);
    napi_value retValue;
    if (result == AVMETADATA_ERROR_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataAVSessionType(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t intervalValue;
    if (napi_get_value_int32(env, args[0], &intervalValue) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Marshall", "获取参数失败");
        napi_create_int32(env, -1, &result);
        return result;
    }
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    int32_t createResult =
        OH_AVSession_Create(CheckType(intervalValue), sessionTag, bundleName, abilityName, &avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (createResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataAVSetPlaybackState(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t intervalValue;
    if (napi_get_value_int32(env, args[0], &intervalValue) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Marshall", "获取参数失败");
        napi_create_int32(env, -1, &result);
        return result;
    }
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    int32_t setResult = OH_AVSession_SetPlaybackState(avsession, CheckPlaybackState(intervalValue));
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else if (setResult == g_errorCode401) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataAVSessionLoopMode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t intervalValue;
    if (napi_get_value_int32(env, args[0], &intervalValue) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Marshall", "获取参数失败");
        napi_create_int32(env, -1, &result);
        return result;
    }
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    int32_t setResult = OH_AVSession_SetLoopMode(avsession, CheckLoopMode(intervalValue));
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else if (setResult == g_errorCode401) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVMetadataAVSessionControlCommand(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_value result = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t intervalValue;
    if (napi_get_value_int32(env, args[0], &intervalValue) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Marshall", "获取参数失败");
        napi_create_int32(env, -1, &result);
        return result;
    }
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnCommand commandCallback = [](OH_AVSession *session, AVSession_ControlCommand command,
                                                        void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t setResult = OH_AVSession_RegisterCommandCallback(avsession, CheckControlCommand(intervalValue),
                                                             commandCallback, (void *)(&userData));
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else if (setResult == g_errorCode401) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionCallbackResultFailure(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnCommand commandCallback = [](OH_AVSession *session, AVSession_ControlCommand command,
                                                        void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_FAILURE;
    };
    char *userData = nullptr;
    AVSession_ControlCommand command = CONTROL_CMD_INVALID;
    int32_t callbackResult = commandCallback(avsession, command, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AVSESSION_CALLBACK_RESULT_FAILURE) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionCreateSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    int32_t createResult = OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (createResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionCreateInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    int32_t createResult = OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (createResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionDestroySuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    int32_t destroyResult = OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (destroyResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionDestroyInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    int32_t destroyResult = OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (destroyResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionActivateSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    int32_t activateResult = OH_AVSession_Activate(avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (activateResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionActivateInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    int32_t activateResult = OH_AVSession_Activate(avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (activateResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionDeactivateSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSession_Activate(avsession);
    int32_t deactivateResult = OH_AVSession_Deactivate(avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (deactivateResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionDeactivateInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSession_Activate(avsession);
    int32_t deactivateResult = OH_AVSession_Deactivate(avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (deactivateResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetSessionTypeSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    int32_t getResult = OH_AVSession_GetSessionType(avsession, &sessionType);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetSessionTypeInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    int32_t getResult = OH_AVSession_GetSessionType(avsession, nullptr);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetSessionIdSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    const char *sessionId = "Jay001";
    int32_t getResult = OH_AVSession_GetSessionId(avsession, &sessionId);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetSessionIdInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    const char *sessionId = nullptr;
    int32_t getResult = OH_AVSession_GetSessionId(avsession, &sessionId);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetPlaybackStateSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_PlaybackState playbackState = PLAYBACK_STATE_PLAYING;
    int32_t setResult = OH_AVSession_SetPlaybackState(avsession, playbackState);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetPlaybackStateInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    AVSession_PlaybackState playbackState = PLAYBACK_STATE_PLAYING;
    int32_t setResult = OH_AVSession_SetPlaybackState(avsession, playbackState);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetAVMetadataSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    OH_AVMetadataBuilder *builder = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVMetadata *avmetadata;
    OH_AVMetadataBuilder_Create(&builder);
    OH_AVMetadataBuilder_GenerateAVMetadata(builder, &avmetadata);
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSession_Activate(avsession);
    int32_t setResult = OH_AVSession_SetAVMetadata(avsession, avmetadata);
    OH_AVMetadata_Destroy(avmetadata);
    OH_AVMetadataBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetAVMetadataException(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    OH_AVMetadata *avmetadata = nullptr;
    OH_AVMetadataBuilder_GenerateAVMetadata(builder, &avmetadata);
    int32_t setResult = OH_AVSession_SetAVMetadata(avsession, avmetadata);
    OH_AVSession_Destroy(avsession);
    OH_AVMetadata_Destroy(avmetadata);
    OH_AVMetadataBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SERVICE_EXCEPTION) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetAVMetadataInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    OH_AVMetadata *avmetadata = nullptr;
    OH_AVMetadataBuilder_GenerateAVMetadata(builder, &avmetadata);
    int32_t setResult = OH_AVSession_SetAVMetadata(avsession, avmetadata);
    OH_AVMetadata_Destroy(avmetadata);
    OH_AVMetadataBuilder_Destroy(builder);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetPlaybackPositionSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_PlaybackPosition *playbackPosition =
        static_cast<AVSession_PlaybackPosition *>(malloc(sizeof(AVSession_PlaybackPosition)));
    if (playbackPosition == nullptr) {
        OH_AVSession_Destroy(avsession);
        napi_value retValue;
        napi_create_int32(env, g_falseValue, &retValue);
        return retValue;
    }
    int64_t currentTime = 1694444444444;
    playbackPosition->elapsedTime = PARAM_10000;
    playbackPosition->updateTime = currentTime;
    int32_t setResult = OH_AVSession_SetPlaybackPosition(avsession, playbackPosition);
    free(playbackPosition);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetPlaybackPositionInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    AVSession_PlaybackPosition *playbackPosition;
    int32_t setResult = OH_AVSession_SetPlaybackPosition(avsession, playbackPosition);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetFavoriteSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    bool favorite = true;
    int32_t setResult = OH_AVSession_SetFavorite(avsession, favorite);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetFavoriteInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    bool favorite;
    int32_t setResult = OH_AVSession_SetFavorite(avsession, favorite);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetLoopModeSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_LoopMode loopMode = LOOP_MODE_SINGLE;
    int32_t setResult = OH_AVSession_SetLoopMode(avsession, loopMode);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionSetLoopModeInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    AVSession_LoopMode loopMode;
    int32_t setResult = OH_AVSession_SetLoopMode(avsession, loopMode);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterCommandCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnCommand commandCallback = [](OH_AVSession *session, AVSession_ControlCommand command,
                                                        void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    AVSession_ControlCommand command = CONTROL_CMD_PLAY;
    int32_t callbackResult = OH_AVSession_RegisterCommandCallback(avsession, command, commandCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterCommandCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnCommand commandCallback = [](OH_AVSession *session, AVSession_ControlCommand command,
                                                        void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_FAILURE;
    };
    char *userData = nullptr;
    AVSession_ControlCommand command = CONTROL_CMD_INVALID;
    int32_t callbackResult = OH_AVSession_RegisterCommandCallback(avsession, command, commandCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterCommandCallbackCommandInvalid(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnCommand commandCallback = [](OH_AVSession *session, AVSession_ControlCommand command,
                                                        void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    AVSession_ControlCommand command = CONTROL_CMD_INVALID;
    int32_t callbackResult = OH_AVSession_RegisterCommandCallback(avsession, command, commandCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_CODE_COMMAND_INVALID) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterCommandCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnCommand commandCallback = [](OH_AVSession *session, AVSession_ControlCommand command,
                                                        void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    AVSession_ControlCommand command = CONTROL_CMD_PLAY;
    OH_AVSession_RegisterCommandCallback(avsession, command, commandCallback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterCommandCallback(avsession, command, commandCallback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterCommandCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnCommand commandCallback = [](OH_AVSession *session, AVSession_ControlCommand command,
                                                        void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_FAILURE;
    };
    char *userData = nullptr;
    AVSession_ControlCommand command = CONTROL_CMD_PLAY;
    OH_AVSession_RegisterCommandCallback(avsession, command, commandCallback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterCommandCallback(avsession, command, commandCallback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterCommandCallbackCommandInvalid(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnCommand commandCallback = [](OH_AVSession *session, AVSession_ControlCommand command,
                                                        void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    AVSession_ControlCommand command = CONTROL_CMD_INVALID;
    OH_AVSession_RegisterCommandCallback(avsession, command, commandCallback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterCommandCallback(avsession, command, commandCallback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_CODE_COMMAND_INVALID) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterForwardCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    uint32_t seekTime = PARAM_200;
    OH_AVSessionCallback_OnFastForward fastForwardCallback = [](OH_AVSession *session, uint32_t seekTime,
                                                                void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t callbackResult = OH_AVSession_RegisterForwardCallback(avsession, fastForwardCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterForwardCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnFastForward fastForwardCallback = [](OH_AVSession *session, uint32_t seekTime,
                                                                void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    int32_t callbackResult = OH_AVSession_RegisterForwardCallback(avsession, fastForwardCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterForwardCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnFastForward fastForwardCallback = [](OH_AVSession *session, uint32_t seekTime,
                                                                void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    OH_AVSession_RegisterForwardCallback(avsession, fastForwardCallback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterForwardCallback(avsession, fastForwardCallback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterForwardCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnFastForward fastForwardCallback = [](OH_AVSession *session, uint32_t seekTime,
                                                                void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    int32_t callbackResult = OH_AVSession_UnregisterForwardCallback(avsession, fastForwardCallback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterRewindCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    uint32_t seekTime = PARAM_200;
    OH_AVSessionCallback_OnRewind rewindCallback = [](OH_AVSession *session, uint32_t seekTime,
                                                      void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t callbackResult = OH_AVSession_RegisterRewindCallback(avsession, rewindCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterRewindCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnRewind rewindCallback = [](OH_AVSession *session, uint32_t seekTime,
                                                      void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_FAILURE;
    };
    char *userData;
    int32_t callbackResult = OH_AVSession_RegisterRewindCallback(avsession, rewindCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterRewindCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnRewind rewindCallback = [](OH_AVSession *session, uint32_t seekTime,
                                                      void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    OH_AVSession_RegisterRewindCallback(avsession, rewindCallback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterRewindCallback(avsession, rewindCallback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterRewindCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnRewind rewindCallback = [](OH_AVSession *session, uint32_t seekTime,
                                                      void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_FAILURE;
    };
    int32_t callbackResult = OH_AVSession_UnregisterRewindCallback(avsession, rewindCallback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterSeekCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnSeek seekCallback = [](OH_AVSession *session, uint64_t seekTime,
                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t callbackResult = OH_AVSession_RegisterSeekCallback(avsession, seekCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterSeekCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnSeek seekCallback = [](OH_AVSession *session, uint64_t seekTime,
                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    int32_t callbackResult = OH_AVSession_RegisterSeekCallback(avsession, seekCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterSeekCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnSeek seekCallback = [](OH_AVSession *session, uint64_t seekTime,
                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    OH_AVSession_RegisterSeekCallback(avsession, seekCallback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterSeekCallback(avsession, seekCallback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterSeekCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnSeek seekCallback = [](OH_AVSession *session, uint64_t seekTime,
                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    OH_AVSession_RegisterSeekCallback(avsession, seekCallback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterSeekCallback(avsession, seekCallback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterSetLoopModeCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnSetLoopMode setLoopModeback = [](OH_AVSession *session, AVSession_LoopMode curLoopMode,
                                                            void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t callbackResult = OH_AVSession_RegisterSetLoopModeCallback(avsession, setLoopModeback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterSetLoopModeCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnSetLoopMode setLoopModeback = [](OH_AVSession *session, AVSession_LoopMode curLoopMode,
                                                            void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    int32_t callbackResult = OH_AVSession_RegisterSetLoopModeCallback(avsession, setLoopModeback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterSetLoopModeCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnSetLoopMode setLoopModeback = [](OH_AVSession *session, AVSession_LoopMode curLoopMode,
                                                            void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    OH_AVSession_RegisterSetLoopModeCallback(avsession, setLoopModeback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterSetLoopModeCallback(avsession, setLoopModeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterSetLoopModeCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnSetLoopMode setLoopModeback = [](OH_AVSession *session, AVSession_LoopMode curLoopMode,
                                                            void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    OH_AVSession_RegisterSetLoopModeCallback(avsession, setLoopModeback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterSetLoopModeCallback(avsession, setLoopModeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}
