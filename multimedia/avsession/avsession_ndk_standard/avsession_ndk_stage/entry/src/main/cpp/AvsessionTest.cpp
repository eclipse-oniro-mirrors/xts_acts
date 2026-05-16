/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS~~~" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <cstdint>
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "sssss"

#include "napi/native_api.h"
#include "hilog/log.h"

#include <cstdint>
#include <cstdio>
#include <vector>
#include <thread>
#include <fstream>
#include "napi/native_api.h"
#include "hilog/log.h"

#include "multimedia/av_session/native_avmetadata.h"
#include "multimedia/av_session/native_avsession.h"
#include "multimedia/av_session/native_avsession_errors.h"
#include <variant>

#include <cstring>


enum AVSessionError {
    AV_SESSION_ERROR_SUCCESSED = 0,
    AV_META_ERROR_CREATE_BUILDER_FAILED = 1000,
    AV_META_ERROR_SET_TITLE_FAILED,
    AV_META_ERROR_SET_ARTIST_FAILED,
    AV_META_ERROR_SET_AUTHOR_FAILED,
    AV_META_ERROR_SET_ALBUM_FAILED,
    AV_META_ERROR_SET_WRITER_FAILED,
    AV_META_ERROR_SET_COMPOSER_FAILED,
    AV_META_ERROR_SET_DURATION_FAILED,
    AV_META_ERROR_SET_MEDIA_IMAGE_URI_FAILED,
    AV_META_ERROR_SET_SUBTITLE_FAILED,
    AV_META_ERROR_SET_DESCRIPTION_FAILED,
    AV_META_ERROR_SET_LYRIC_FAILED,
    AV_META_ERROR_SET_ASSET_ID_FAILED,
    AV_META_ERROR_SET_PREVIOUS_ASSET_ID_FAILED,
    AV_META_ERROR_SET_NEXT_ASSET_ID_FAILED,
    AV_META_ERROR_SET_SKIP_INTERVALS_FAILED,
    AV_META_ERROR_SET_DISPLAY_TAGS_FAILED,
    AV_META_ERROR_GENERATE_AV_METADATA_FAILED,
    AV_META_ERROR_DESTROY_BUILDER_FAILED,
    AV_META_ERROR_INVALID_PARA,

    AV_SESSION_ERR_CREATE_FAILED = 2000,
    AV_SESSION_ERR_ACTIVATE_FAILED,
    AV_SESSION_ERR_DEACTIVATE_FAILED,
    AV_SESSION_ERR_SET_AV_METADATA_FAILED,
    AV_SESSION_ERR_SET_PLAYBACK_STATE_FAILED,
    AV_SESSION_ERR_SET_PLAYBACK_POSITION_FAILED,
    AV_SESSION_ERR_SET_BUFFERED_TIME_FAILED,
    AV_SESSION_ERR_SET_ACTIVE_ITEM_ID_FAILED,
    AV_SESSION_ERR_SET_SPEED_FAILED,
    AV_SESSION_ERR_SET_FAVORITE_FAILED,
    AV_SESSION_ERR_SET_LOOP_MODE_FAILED,
    AV_SESSION_ERR_REGISTER_COMMAND_CALLBACK_FAILED,
    AV_SESSION_ERR_UNREGISTER_COMMAND_CALLBACK_FAILED,
    AV_SESSION_ERR_REGISTER_FORWARD_CALLBACK_FAILED,
    AV_SESSION_ERR_UNREGISTER_FORWARD_CALLBACK_FAILED,
    AV_SESSION_ERR_REGISTER_REWIND_CALLBACK_FAILED,
    AV_SESSION_ERR_UNREGISTER_REWIND_CALLBACK_FAILED,
    AV_SESSION_ERR_REGISTER_SEEK_CALLBACK_FAILED,
    AV_SESSION_ERR_UNREGISTER_SEEK_CALLBACK_FAILED,
    AV_SESSION_ERR_REGISTER_SPEED_CALLBACK_FAILED,
    AV_SESSION_ERR_UNREGISTER_SPEED_CALLBACK_FAILED,
    AV_SESSION_ERR_REGISTER_SET_LOOP_MODE_CALLBACK_FAILED,
    AV_SESSION_ERR_UNREGISTER_SET_LOOP_MODE_CALLBACK_FAILED,
    AV_SESSION_ERR_REGISTER_TOGGLE_FAVORITE_CALLBACK_FAILED,
    AV_SESSION_ERR_UNREGISTER_TOGGLE_FAVORITE_CALLBACK_FAILED,
    AV_SESSION_ERR_REGISTER_PLAY_FROM_ASSET_ID_CALLBACK_FAILED,
    AV_SESSION_ERR_UNREGISTER_PLAY_FROM_ASSET_ID_CALLBACK_FAILED,
    AV_SESSION_ERR_CHECK_AND_REGISTER_FAILED,
    AV_SESSION_ERR_UNKNOWN,
    AV_SESSION_ERR_INVALID_PARA
};

using Param = std::variant<std::string, double, bool>;
using ParamList = std::vector<Param>;
static OH_AVSession *g_avsession = nullptr;

AVSessionError AVMetadataBuilderSetAssetId(OH_AVMetadataBuilder* builder, const Param& param)
{
    const std::string& assetId = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetAssetId(builder, assetId.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_ASSET_ID_FAILED;
}

AVSessionError AVMetadataBuilderSetTitle(OH_AVMetadataBuilder* builder, const Param& param)
{
    const std::string& title = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetTitle(builder, title.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_TITLE_FAILED;
}

AVSessionError AVMetadataBuilderSetArtist(OH_AVMetadataBuilder* builder, const Param& param)
{
    const std::string& artist = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetArtist(builder, artist.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_ARTIST_FAILED;
}

AVSessionError AVMetadataBuilderSetAuthor(OH_AVMetadataBuilder* builder, const Param& param)
{
    const std::string& author = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetAuthor(builder, author.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_AUTHOR_FAILED;
}

AVSessionError AVMetadataBuilderSetAlbum(OH_AVMetadataBuilder* builder, const Param& param)
{
    const  std::string& album = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetAlbum(builder, album.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_ALBUM_FAILED;
}

AVSessionError AVMetadataBuilderSetWriter(OH_AVMetadataBuilder* builder, const Param& param)
{
    const std::string& writer = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetWriter(builder, writer.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_WRITER_FAILED;
}

AVSessionError AVMetadataBuilderSetComposer(OH_AVMetadataBuilder* builder, const Param& param)
{
    const std::string& composer = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetComposer(builder, composer.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_COMPOSER_FAILED;
}

AVSessionError AVMetadataBuilderSetMediaImageUri(OH_AVMetadataBuilder* builder, const Param& param)
{
    const std::string& mediaImageUri = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetMediaImageUri(builder, mediaImageUri.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_MEDIA_IMAGE_URI_FAILED;
}

AVSessionError AVMetadataBuilderSetSubtitle(OH_AVMetadataBuilder* builder, const Param& param)
{
    const std::string& subtitle = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetSubtitle(builder, subtitle.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_SUBTITLE_FAILED;
}

AVSessionError AVMetadataBuilderSetDescription(OH_AVMetadataBuilder* builder, const Param& param)
{
    const std::string& description = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetDescription(builder, description.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_DESCRIPTION_FAILED;
}

AVSessionError AVMetadataBuilderSetLyric(OH_AVMetadataBuilder* builder, const Param& param)
{
    const std::string& lyric = std::get<std::string>(param);
    if (OH_AVMetadataBuilder_SetLyric(builder, lyric.c_str()) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_LYRIC_FAILED;
}

AVSessionError AVMetadataBuilderSetSkipIntervals(OH_AVMetadataBuilder* builder, const Param& param)
{
    const double value = std::get<double>(param);
    if (value < 0 || value > static_cast<int32_t>(std::numeric_limits<int32_t>::max())) {
        return AV_META_ERROR_INVALID_PARA;
    }
    AVMetadata_SkipIntervals skipIntervals = static_cast<AVMetadata_SkipIntervals>(value);
    if (OH_AVMetadataBuilder_SetSkipIntervals(builder, skipIntervals) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_SKIP_INTERVALS_FAILED;
}

AVSessionError AVMetadataBuilderSetDisplayTags(OH_AVMetadataBuilder* builder, const Param& param)
{
    const double value = std::get<double>(param);
    if (value < 0 || value > std::numeric_limits<int32_t>::max()) {
        return AV_META_ERROR_INVALID_PARA;
    }
    uint32_t displayTags = static_cast<uint32_t>(value);
    if (OH_AVMetadataBuilder_SetDisplayTags(builder, displayTags) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_DISPLAY_TAGS_FAILED;
}

AVSessionError AVMetadataBuilderSetDuration(OH_AVMetadataBuilder* builder, const Param& param)
{
    const double value = std::get<double>(param);
    if (value < 0 || value > static_cast<double>(std::numeric_limits<int64_t>::max())) {
        return AV_META_ERROR_INVALID_PARA;
    }
    int64_t duration = static_cast<int64_t>(value);
    if (OH_AVMetadataBuilder_SetDuration(builder, duration) == AVMETADATA_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_META_ERROR_SET_DURATION_FAILED;
}

using BuilderSetFunctionPtr = AVSessionError (*)(OH_AVMetadataBuilder*, const Param&);
BuilderSetFunctionPtr g_builderSetList[] = {
    AVMetadataBuilderSetTitle,
    AVMetadataBuilderSetArtist,
    AVMetadataBuilderSetAuthor,
    AVMetadataBuilderSetAlbum,
    AVMetadataBuilderSetWriter,
    AVMetadataBuilderSetComposer,
    AVMetadataBuilderSetMediaImageUri,
    AVMetadataBuilderSetSubtitle,
    AVMetadataBuilderSetDescription,
    AVMetadataBuilderSetLyric,
    AVMetadataBuilderSetAssetId,
    AVMetadataBuilderSetSkipIntervals,
    AVMetadataBuilderSetDisplayTags,
    AVMetadataBuilderSetDuration
};

AVSessionError AVSessionSetPlaybackState(OH_AVSession* avsession, const Param& param)
{
    AVSession_PlaybackState playbackState = static_cast<AVSession_PlaybackState>(std::get<double>(param));
    if (OH_AVSession_SetPlaybackState(avsession, playbackState) == AV_SESSION_ERR_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_SESSION_ERR_SET_PLAYBACK_STATE_FAILED;
}

AVSessionError AVSessionSetFavorite(OH_AVSession* avsession, const Param& param)
{
    OH_LOG_ERROR(LOG_APP, "into AVSessionSetFavorite check 1");
    bool favorite = std::get<bool>(param);
    OH_LOG_ERROR(LOG_APP, "into AVSessionSetFavorite check 2 %{public}d", favorite);
    if (OH_AVSession_SetFavorite(avsession, favorite) == AV_SESSION_ERR_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_SESSION_ERR_SET_FAVORITE_FAILED;
}

AVSessionError AVSessionSetLoopMode(OH_AVSession* avsession, const Param& param)
{
    OH_LOG_ERROR(LOG_APP, "into AVSessionSetLoopMode check 1");
    AVSession_LoopMode loopMode = static_cast<AVSession_LoopMode>(std::get<double>(param));
    OH_LOG_ERROR(LOG_APP, "into AVSessionSetLoopMode check 2 %{public}d", loopMode);
    if (OH_AVSession_SetLoopMode(avsession, loopMode) == AV_SESSION_ERR_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_SESSION_ERR_SET_LOOP_MODE_FAILED;
}

AVSessionError AVSessionSetPlaybackPosition(OH_AVSession* avsession, const Param& param1, const Param& param2)
{
    AVSession_PlaybackPosition playbackPosition;
    playbackPosition.elapsedTime = static_cast<int64_t>(std::get<double>(param1));
    playbackPosition.updateTime = static_cast<int64_t>(std::get<double>(param2));
    if (OH_AVSession_SetPlaybackPosition(avsession, &playbackPosition) == AV_SESSION_ERR_SUCCESS) {
        return AV_SESSION_ERROR_SUCCESSED;
    }
    return AV_SESSION_ERR_SET_PLAYBACK_POSITION_FAILED;
}

using SetSessionFunctionPtr = AVSessionError (*)(OH_AVSession*, const Param&);
SetSessionFunctionPtr g_setSessionFunctions[] = {
    AVSessionSetPlaybackState,
    AVSessionSetFavorite,
    AVSessionSetLoopMode
};

static int g_cmdCallbackCount = 0;
static int g_forwardCallbackCount = 0;
static int g_rewindCallbackCount = 0;
static int g_seekCallbackCount = 0;
static int g_speedCallbackCount = 0;
static int g_loopCallbackCount = 0;
static int g_favoriteCallbackCount = 0;
static int g_fromAssetIdCallbackCount = 0;

static OH_AVSessionCallback_OnCommand cmd_callback = [](OH_AVSession* session,
    AVSession_ControlCommand command, void* userData) -> AVSessionCallback_Result {
    g_cmdCallbackCount++;
    OH_LOG_DEBUG(LOG_APP, "cmd_callback called, count: %d", g_cmdCallbackCount);
    return AVSESSION_CALLBACK_RESULT_SUCCESS;
};

static OH_AVSessionCallback_OnFastForward forward_callback = [](OH_AVSession* session,
    uint32_t seekTime, void* userData) -> AVSessionCallback_Result {
    g_forwardCallbackCount++;
    OH_LOG_DEBUG(LOG_APP, "forward_callback called, count: %d", g_forwardCallbackCount);
    return AVSESSION_CALLBACK_RESULT_SUCCESS;
};

static OH_AVSessionCallback_OnRewind rewind_callback = [](OH_AVSession* session,
    uint32_t seekTime, void* userData) -> AVSessionCallback_Result {
    g_rewindCallbackCount++;
    OH_LOG_DEBUG(LOG_APP, "rewind_callback called, count: %d", g_rewindCallbackCount);
    return AVSESSION_CALLBACK_RESULT_SUCCESS;
};

static OH_AVSessionCallback_OnSeek seek_callback = [](OH_AVSession* session, uint64_t seekTime,
    void* userData) -> AVSessionCallback_Result {
    g_seekCallbackCount++;
    OH_LOG_DEBUG(LOG_APP, "seek_callback called, count: %d", g_seekCallbackCount);
    return AVSESSION_CALLBACK_RESULT_SUCCESS;
};

static OH_AVSessionCallback_OnSetLoopMode loop_callback = [](OH_AVSession* session, AVSession_LoopMode curLoopMode,
    void* userData) -> AVSessionCallback_Result {
    g_loopCallbackCount++;
    OH_LOG_DEBUG(LOG_APP, "loop_callback called, count: %d", g_loopCallbackCount);
    return AVSESSION_CALLBACK_RESULT_SUCCESS;
};

static OH_AVSessionCallback_OnToggleFavorite favorite_callback = [](OH_AVSession* session, const char* assetId,
    void* userData) -> AVSessionCallback_Result {
    g_favoriteCallbackCount++;
    OH_LOG_DEBUG(LOG_APP, "favorite_callback called, count: %d", g_favoriteCallbackCount);
    return AVSESSION_CALLBACK_RESULT_SUCCESS;
};

static AVSessionError RegisterCommandCallback(OH_AVSession* session)
{
    AVSession_ControlCommand command = CONTROL_CMD_PLAY;
    const char* userData = "this is a register command callback userdata";
    AVSession_ErrCode ret = OH_AVSession_RegisterCommandCallback(session, command, cmd_callback,
                                                                 (void *)(userData));
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "register command ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_REGISTER_COMMAND_CALLBACK_FAILED;
    }

    return AV_SESSION_ERROR_SUCCESSED;
}

static AVSessionError UnregisterCommandCallback(OH_AVSession* session)
{
    AVSession_ControlCommand command = CONTROL_CMD_PLAY;
    AVSession_ErrCode ret = OH_AVSession_UnregisterCommandCallback(session, command, cmd_callback);
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "register command ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_UNREGISTER_COMMAND_CALLBACK_FAILED;
    }

    return AV_SESSION_ERROR_SUCCESSED;
}

static AVSessionError RegisterForwardCallback(OH_AVSession* session)
{
    int userData = 1;
    AVSession_ErrCode ret = OH_AVSession_RegisterForwardCallback(session, forward_callback, (void *)(&userData));
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "RegisterForwardCallback ret is: %{public}s", ret == 0 ? "success" : "failed");
        return AV_SESSION_ERR_REGISTER_FORWARD_CALLBACK_FAILED;
    }
    return AV_SESSION_ERROR_SUCCESSED;
}

static AVSessionError UnregisterForwardCallback(OH_AVSession* session)
{
    AVSession_ErrCode ret = OH_AVSession_UnregisterForwardCallback(session, forward_callback);
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "AVSessionUnregisterForwardCallback ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_UNREGISTER_FORWARD_CALLBACK_FAILED;
    }
    return AV_SESSION_ERROR_SUCCESSED;
}

static AVSessionError RegisterRewindCallback(OH_AVSession* session)
{
    int userData = 1;
    AVSession_ErrCode ret = OH_AVSession_RegisterRewindCallback(session, rewind_callback, (void *)(&userData));
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "AVSessionRegisterRewindCallback ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_REGISTER_REWIND_CALLBACK_FAILED;
    }
    return AV_SESSION_ERROR_SUCCESSED;
}


static AVSessionError UnregisterRewindCallback(OH_AVSession* session)
{
    AVSession_ErrCode ret =  OH_AVSession_UnregisterRewindCallback(session, rewind_callback);
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "AVSessionUnregisterRewindCallback ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_UNREGISTER_REWIND_CALLBACK_FAILED;
    }
    return AV_SESSION_ERROR_SUCCESSED;
}

static AVSessionError RegisterSeekCallback(OH_AVSession* session)
{
    int userData = 1;
    AVSession_ErrCode ret = OH_AVSession_RegisterSeekCallback(session, seek_callback, (void *)(&userData));
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "RegisterSeekCallback ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_REGISTER_REWIND_CALLBACK_FAILED;
    }

    return AV_SESSION_ERROR_SUCCESSED;
}


static AVSessionError UnregisterSeekCallback(OH_AVSession* session)
{
    AVSession_ErrCode ret = OH_AVSession_UnregisterSeekCallback(session, seek_callback);
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "UnregisterSeekCallback ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_UNREGISTER_SEEK_CALLBACK_FAILED;
    }

    return AV_SESSION_ERROR_SUCCESSED;
}


static AVSessionError RegisterSetLoopModeCallback(OH_AVSession* session)
{
    int userData = 1;
    AVSession_ErrCode ret = OH_AVSession_RegisterSetLoopModeCallback(session, loop_callback, (void *)(&userData));
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "RegisterSetLoopModeCallback ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_REGISTER_SET_LOOP_MODE_CALLBACK_FAILED;
    }

    return AV_SESSION_ERROR_SUCCESSED;
}


static AVSessionError UnregisterSetLoopModeCallback(OH_AVSession* session)
{
    AVSession_ErrCode ret = OH_AVSession_UnregisterSetLoopModeCallback(session, loop_callback);
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "UnregisterSetLoopModeCallback ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_UNREGISTER_SET_LOOP_MODE_CALLBACK_FAILED;
    }

    return AV_SESSION_ERROR_SUCCESSED;
}

static AVSessionError RegisterToggleFavoriteCallback(OH_AVSession* session)
{
    int userData = 1;
    AVSession_ErrCode ret = OH_AVSession_RegisterToggleFavoriteCallback(
        session, favorite_callback, (void *)(&userData));
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "RegisterToggleFavoriteCallback ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_REGISTER_TOGGLE_FAVORITE_CALLBACK_FAILED;
    }

    return AV_SESSION_ERROR_SUCCESSED;
}

static AVSessionError UnregisterToggleFavoriteCallback(OH_AVSession* session)
{
    AVSession_ErrCode ret = OH_AVSession_UnregisterToggleFavoriteCallback(session, favorite_callback);
    if (ret != AV_SESSION_ERR_SUCCESS) {
        OH_LOG_DEBUG(LOG_APP, "UnregisterToggleFavoriteCallback ret is :%{public}s", ret == 0 ? "success" : "falid");
        return AV_SESSION_ERR_UNREGISTER_TOGGLE_FAVORITE_CALLBACK_FAILED;
    }

    return AV_SESSION_ERROR_SUCCESSED;
}


AVSessionError RegisterAllCallback(OH_AVSession* session)
{
    AVSessionError ret = RegisterCommandCallback(session);
    if (ret != AV_SESSION_ERROR_SUCCESSED) {
        return ret;
    }
    ret = RegisterForwardCallback(session);
    if (ret != AV_SESSION_ERROR_SUCCESSED) {
        return ret;
    }
    ret = RegisterRewindCallback(session);
    if (ret != AV_SESSION_ERROR_SUCCESSED) {
        return ret;
    }
    ret = RegisterSetLoopModeCallback(session);
    if (ret != AV_SESSION_ERROR_SUCCESSED) {
        return ret;
    }
    ret = RegisterToggleFavoriteCallback(session);
    if (ret != AV_SESSION_ERROR_SUCCESSED) {
        return ret;
    }
    return AV_SESSION_ERROR_SUCCESSED;
}

AVSessionError UnregisterAllCallback(OH_AVSession* session)
{
    UnregisterCommandCallback(session);
    UnregisterForwardCallback(session);
    UnregisterRewindCallback(session);
    UnregisterSeekCallback(session);
    UnregisterSetLoopModeCallback(session);
    UnregisterToggleFavoriteCallback(session);
    return AV_SESSION_ERROR_SUCCESSED;
}

/**
 * TESTNAME : AVSessionTestAll
 * params = [sessionType, sessionTag, bundleName, abilityName,# create avsession para
 *           title, artist, author, album, writer, composer, duration,
 *           mediaImageUri, subtitle, description, lyric, assetId,
 *           previousAssetId, nextAssetId, intervals, tags, # build avmetadata
 *           playbackState bufferedTime, activeItemId, speed，isFavorite,
 *           loopMode, playbackPosition]  # avsession property para
 * variable         Type
 * sessionType:     AVSession_Type;
 * sessionTag:      char*
 * bundleName:      char*
 * abilityName:     char*
 * title:           char*
 * artist:          char*
 * author:          char*
 * album:           char*
 * writer:          char*
 * composer:        char*
 * mediaImageUri:   char*
 * subtitle:        char*
 * description:     char*
 * lyric:           char*
 * assetId:         char*
 * intervals:       AVMetadata_SkipIntervals
 * tags:            uint32_t
 * duration:        int64_t
 * playbackState:   AVSession_PlaybackState
 * bufferedTime:    uint64_t  
 * speed:           uint32_t  
 * isFavorite:      bool
 * loopMode:        loopMode
 * elapsedTime      int64_t
 * updateTime       int64_t
 */
static AVSessionError TestAVSessionTestAll(const ParamList& params)
{
    const int avSessionTestAllParaCnt = 23;
    AVSessionError err = AV_SESSION_ERROR_SUCCESSED;
    if (params.size() != avSessionTestAllParaCnt) { return AV_SESSION_ERR_INVALID_PARA; }
    int listIdx = 0;
    AVSession_Type sessionType = static_cast<AVSession_Type>(std::get<double>(params[listIdx++]));
    const std::string& sessionTag = std::get<std::string>(params[listIdx++]);
    const std::string& bundleName = std::get<std::string>(params[listIdx++]);
    const std::string& abilityName = std::get<std::string>(params[listIdx++]);
    OH_AVSession* session = nullptr;
    AVSessionError result;
    int ret = OH_AVSession_Create(
        sessionType, sessionTag.c_str(), bundleName.c_str(), abilityName.c_str(), &session);
    if (ret != AV_SESSION_ERR_SUCCESS) { return AV_SESSION_ERR_CREATE_FAILED; }
    OH_AVMetadataBuilder *builder = nullptr;
    ret = OH_AVMetadataBuilder_Create(&builder);
    if (ret != AVMETADATA_SUCCESS) {
        err = AV_META_ERROR_CREATE_BUILDER_FAILED;
        goto out_session;
    }
    for (int i = 0; i < sizeof(g_builderSetList) / sizeof(BuilderSetFunctionPtr); ++i) {
        result = g_builderSetList[i](builder, params[listIdx++]);
        if (result != AV_SESSION_ERROR_SUCCESSED) {
            err = result;
            goto out_session;
        }
    }
    OH_AVMetadata *metaData;
    ret = OH_AVMetadataBuilder_GenerateAVMetadata(builder, &metaData);
    if (ret != AVMETADATA_SUCCESS) {
        ret = AV_META_ERROR_GENERATE_AV_METADATA_FAILED;
        goto out_builder;
    }
    ret = OH_AVSession_SetAVMetadata(session, metaData);
    if (ret != AVMETADATA_SUCCESS) {  return AV_META_ERROR_GENERATE_AV_METADATA_FAILED; }
    for (int i = 0; i < sizeof(g_setSessionFunctions) / sizeof(SetSessionFunctionPtr); ++i) {
        result = g_setSessionFunctions[i](session, params[listIdx++]);
        if (result != AV_SESSION_ERROR_SUCCESSED) {
            err = result;
            goto out_meta;
        }
    }
    result = AVSessionSetPlaybackPosition(session, params[listIdx], params[listIdx + 1]);
    if (result != AV_SESSION_ERROR_SUCCESSED) {
        err = result;
        goto out_meta;
    }
    ret = RegisterAllCallback(session);
    if (ret != AV_SESSION_ERROR_SUCCESSED) { err = static_cast<AVSessionError>(ret); }
    UnregisterAllCallback(session);
out_meta:
    OH_AVMetadata_Destroy(metaData);
out_builder:
    OH_AVMetadataBuilder_Destroy(builder);
out_session:
    OH_AVSession_Destroy(session);
    return err;
}


/**
 * TESTNAME : Create
 * variable         Type
 * sessionType      AVSession_Type
 * sessionTag       char*
 * bundleName       char*
 * abilityName      char*
 */
AVSessionError TestAVSessionCreate(const ParamList& params)
{
    OH_AVSession* session;
    const AVSession_Type sessionType = static_cast<AVSession_Type>(std::get<double>(params[0]));
    const std::string& sessionTag = std::get<std::string>(params[1]);
    const std::string& bundleName = std::get<std::string>(params[2]);
    const std::string& abilityName = std::get<std::string>(params[3]);

    AVSession_ErrCode ret = OH_AVSession_Create(sessionType, sessionTag.c_str(),
        bundleName.c_str(), abilityName.c_str(), &session);
    if (ret != AV_SESSION_ERR_SUCCESS) { return AV_SESSION_ERR_CREATE_FAILED; }

    OH_AVSession_Destroy(session);
    return AV_SESSION_ERROR_SUCCESSED;
}


/**
 * TESTNAME : SetPlaybackState
 * params = [speed]
 * variable         Type
 * PlaybackState    AVSession_PlaybackState
*/
AVSessionError TestAVSessionSetPlaybackState(const ParamList& params)
{
    if (params.size() != 1) {return AV_SESSION_ERR_INVALID_PARA;}
    OH_AVSession* session;
    AVSessionError returnValue;
    AVSession_ErrCode ret = OH_AVSession_Create(SESSION_TYPE_AUDIO, "oh_av_session_test_001",
        "com.xxx.hmxx", "ndkxx", &session);
    if (ret != AV_SESSION_ERR_SUCCESS) { return AV_SESSION_ERR_CREATE_FAILED; }

    returnValue = AVSessionSetPlaybackState(session, params[0]);
    OH_AVSession_Destroy(session);
    return returnValue;
}


/**
 * TESTNAME : SetFavorite
 * params = [favorite]
 * variable    Type
 * favorite    bool
*/
AVSessionError TestAVSessionSetFavorite(const ParamList& params)
{
    if (params.size() != 1) {return AV_SESSION_ERR_INVALID_PARA;}
    OH_AVSession* session;
    AVSessionError returnValue;
    AVSession_ErrCode ret = OH_AVSession_Create(SESSION_TYPE_AUDIO, "oh_av_session_test_001",
        "com.xxx.hmxx", "ndkxx", &session);
    if (ret != AV_SESSION_ERR_SUCCESS) { return AV_SESSION_ERR_CREATE_FAILED; }

    returnValue = AVSessionSetFavorite(session,  params[0]);
    OH_AVSession_Destroy(session);
    return returnValue;
}

/**
 * TESTNAME : SetLoopMode
 * params = [setLoopMode]
 * variable       Type
 * setLoopMode    AVSession_LoopMode
*/
AVSessionError TestAVSessionSetLoopMode(const ParamList& params)
{
    if (params.size() != 1) {return AV_SESSION_ERR_INVALID_PARA;}
    OH_AVSession* session;
    AVSessionError returnValue;
    AVSession_ErrCode ret = OH_AVSession_Create(SESSION_TYPE_AUDIO, "oh_av_session_test_001",
        "com.xxx.hmxx", "ndkxx", &session);
    if (ret != AV_SESSION_ERR_SUCCESS) { return AV_SESSION_ERR_CREATE_FAILED; }

    returnValue = AVSessionSetLoopMode(session,  params[0]);
    OH_AVSession_Destroy(session);
    return returnValue;
}

/**
 * TESTNAME : SetPlaybackPosition
 * params = [elapsedTime, updateTime]
 * variable         Type
 * elapsedTime      uint64_t
 * updateTime       uint64_t
*/
AVSessionError TestAVSessionSetPlaybackPosition(const ParamList& params)
{
    const int kExpectedParamCount = 2;
    if (params.size() != kExpectedParamCount) {return AV_SESSION_ERR_INVALID_PARA;}
    OH_AVSession* session;
    AVSessionError returnValue;
    AVSession_ErrCode ret = OH_AVSession_Create(SESSION_TYPE_AUDIO, "oh_av_session_test_001",
        "com.xxx.hmxx", "ndkxx", &session);
    if (ret != AV_SESSION_ERR_SUCCESS) { return AV_SESSION_ERR_CREATE_FAILED; }

    returnValue = AVSessionSetPlaybackPosition(session, params[0], params[1]);
    OH_AVSession_Destroy(session);
    return returnValue;
}

/**
 * TESTNAME : SetPlaybackPosition
 * params = []
 * title:           char*
 * artist:          char*
 * author:          char*
 * album:           char*
 * writer:          char*
 * composer:        char*
 * mediaImageUri:   char*
 * subtitle:        char*
 * description:     char*
 * lyric:           char*
 * assetId:         char*
 * intervals:       AVMetadata_SkipIntervals
 * tags:            uint32_t
 * duration:        int64_t
 */
AVSessionError TestAVSessionSetAVMetaData(const ParamList& params)
{
    const int avSessionSetAvMetaDataParaCnt = 14;
    if (params.size() != avSessionSetAvMetaDataParaCnt) { return AV_SESSION_ERR_INVALID_PARA; }
    OH_AVSession* session;
    AVSessionError returnValue;
    int ret = OH_AVSession_Create(SESSION_TYPE_AUDIO, "oh_av_session_test_001",
        "com.xxx.hmxx", "ndkxx", &session);
    if (ret != AV_SESSION_ERR_SUCCESS) { return AV_SESSION_ERR_CREATE_FAILED; }

    OH_AVMetadataBuilder *builder = nullptr;
    ret = OH_AVMetadataBuilder_Create(&builder);
    if (ret != AVMETADATA_SUCCESS) {
        returnValue = AV_META_ERROR_CREATE_BUILDER_FAILED;
        goto clean_session;
    }

    for (int i = 0; i < sizeof(g_builderSetList) / sizeof(BuilderSetFunctionPtr); ++i) {
        returnValue = g_builderSetList[i](builder, params[i]);
        if (returnValue != AV_SESSION_ERROR_SUCCESSED) { goto clean_builder; }
    }
    OH_AVMetadata* metaData;
    ret = OH_AVMetadataBuilder_GenerateAVMetadata(builder, &metaData);
    if (ret != AVMETADATA_SUCCESS) {
        returnValue = AV_META_ERROR_GENERATE_AV_METADATA_FAILED;
        goto clean_builder;
    }
    ret = OH_AVSession_SetAVMetadata(session, metaData);
    if (ret != AVMETADATA_SUCCESS) {
        returnValue = AV_SESSION_ERR_SET_AV_METADATA_FAILED;
    }
    
clean_metadata:
    OH_AVMetadata_Destroy(metaData);
clean_builder:
    OH_AVMetadataBuilder_Destroy(builder);
clean_session:
    OH_AVSession_Destroy(session);
    return returnValue;
}

static napi_value AVSessionActivate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_LOG_INFO(LOG_APP, "OH_AVSession_Activate");
    AVSession_ErrCode ret = OH_AVSession_Create(SESSION_TYPE_AUDIO, "oh_av_session_test_001",
        "com.xxx.hmxx", "ndkxx", &g_avsession);
    if (ret != 0){
        OH_LOG_INFO(LOG_APP, "OH_AVSession_Create failed");
        napi_create_int32(env, ret, &result);
        return result;
    }
    AVSession_ErrCode avErrCode = OH_AVSession_Activate(g_avsession);
    napi_create_int32(env, avErrCode, &result);
    OH_AVSession_Destroy(g_avsession);
    return result;
}

static napi_value AVSessionDeActivate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_LOG_INFO(LOG_APP, "OH_AVSession_Deactivate");
    AVSession_ErrCode ret = OH_AVSession_Create(SESSION_TYPE_AUDIO, "oh_av_session_test_001",
        "com.xxx.hmxx", "ndkxx", &g_avsession);
    if (ret != 0){
        OH_LOG_INFO(LOG_APP, "OH_AVSession_Create failed");
        napi_create_int32(env, ret, &result);
        return result;
    }
    AVSession_ErrCode avErrCode = OH_AVSession_Deactivate(g_avsession);
    napi_create_int32(env, avErrCode, &result);
    OH_AVSession_Destroy(g_avsession);
    return result;
}

static napi_value AVSessionGetSessionId(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_LOG_INFO(LOG_APP, "OH_AVSession_GetSessionId");
    AVSession_ErrCode ret = OH_AVSession_Create(SESSION_TYPE_AUDIO, "oh_av_session_test_001",
        "com.xxx.hmxx", "ndkxx", &g_avsession);
    if (ret != 0){
        OH_LOG_INFO(LOG_APP, "OH_AVSession_Create failed");
        napi_create_int32(env, ret, &result);
        return result;
    }
    const char* sessionId = "123";
    AVSession_ErrCode avErrCode = OH_AVSession_GetSessionId(g_avsession, &sessionId);
    napi_create_int32(env, avErrCode, &result);
    OH_AVSession_Destroy(g_avsession);
    return result;
}

static napi_value AVSessionGetSessionType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_LOG_INFO(LOG_APP, "OH_AVSession_GetSessionType");
    AVSession_ErrCode ret = OH_AVSession_Create(SESSION_TYPE_AUDIO, "oh_av_session_test_001",
        "com.xxx.hmxx", "ndkxx", &g_avsession);
    if (ret != 0){
        OH_LOG_INFO(LOG_APP, "OH_AVSession_Create failed");
        napi_create_int32(env, ret, &result);
        return result;
    }
    AVSession_Type sessionType;
    AVSession_ErrCode avErrCode = OH_AVSession_GetSessionType(g_avsession, &sessionType);
    napi_create_int32(env, avErrCode, &result);
    OH_AVSession_Destroy(g_avsession);
    return result;
}

using TestFunction = AVSessionError (*)(const ParamList&);

std::unordered_map<std::string, TestFunction> testFunctions = {
    {"CreateAVSessionTest", TestAVSessionCreate},
    {"SetPlaybackState", TestAVSessionSetPlaybackState},
    {"SetFavorite", TestAVSessionSetFavorite},
    {"SetLoopMode", TestAVSessionSetLoopMode},
    {"SetPlaybackPosition", TestAVSessionSetPlaybackPosition},
    {"SetAVMetaData", TestAVSessionSetAVMetaData},
    {"TestAll", TestAVSessionTestAll}
};

static AVSessionError FindAndDoTest(const std::string& functionName, const ParamList& params)
{
    auto it = testFunctions.find(functionName);
    if (it == testFunctions.end()) {
        return AV_SESSION_ERR_UNKNOWN;
    }

    return it->second(params);
}

static napi_value RunTest(napi_env env, napi_callback_info info)
{
    const int expected_index = 2;
    size_t expected_argc = 2;
    size_t argc = 2;
    napi_value args[expected_index] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc != expected_argc) {
        napi_throw_error(env, nullptr, "Invalid number of arguments");
        return nullptr;
    }
    char functionName[256];
    size_t functionNameLength;
    if (napi_get_value_string_utf8(env, args[0], functionName, sizeof(functionName), &functionNameLength) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get function name");
        return nullptr;
    }
    napi_valuetype valueType;
    if (napi_typeof(env, args[1], &valueType) != napi_ok || valueType != napi_object) {
        napi_throw_error(env, nullptr, "Invalid arguments type");
        return nullptr;
    }
    ParamList params;
    uint32_t paramCount;
    if (napi_get_array_length(env, args[1], &paramCount) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get arguments length");
        return nullptr;
    }
    for (uint32_t i = 0; i < paramCount; ++i) {
        napi_value paramValue;
        if (napi_get_element(env, args[1], i, &paramValue) != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to get argument value");
            return nullptr;
        }
        napi_valuetype paramType;
        if (napi_typeof(env, paramValue, &paramType) != napi_ok) {
            napi_throw_error(env, nullptr, "Failed to get argument type");
            return nullptr;
        }
        if (paramType == napi_string) {
            char paramStr[256];
            size_t paramStrLength;
            if (napi_get_value_string_utf8(env, paramValue, paramStr, sizeof(paramStr), &paramStrLength) != napi_ok) {
                napi_throw_error(env, nullptr, "Failed to get string argument");
                return nullptr;
            }
            params.emplace_back(std::string(paramStr, paramStrLength));
        } else if (paramType == napi_number) {
            double paramDouble;
            if (napi_get_value_double(env, paramValue, &paramDouble) != napi_ok) {
                napi_throw_error(env, nullptr, "Failed to get number argument");
                return nullptr;
            }
            params.emplace_back(paramDouble);
        } else if (paramType == napi_boolean) {
            bool paramBool;
            OH_LOG_ERROR(LOG_APP, "into napi_boolean check");
            if (napi_get_value_bool(env, paramValue, &paramBool) != napi_ok) {
                napi_throw_error(env, nullptr, "Failed to get boolean argument");
                return nullptr;
            }
            params.emplace_back(paramBool);
        } else {
            napi_throw_error(env, nullptr, "Invalid argument type");
            return nullptr;
        }
    }

    AVSessionError result = FindAndDoTest(functionName, params);

    napi_value returnValue;
    napi_create_int32(env, static_cast<int32_t>(result), &returnValue);
    return returnValue;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "runTest", nullptr, RunTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"AVSessionActivate", nullptr, AVSessionActivate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AVSessionDeActivate", nullptr, AVSessionDeActivate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AVSessionGetSessionId", nullptr, AVSessionGetSessionId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AVSessionGetSessionType", nullptr, AVSessionGetSessionType, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}