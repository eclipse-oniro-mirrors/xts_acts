/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing fpermissions and
 * limitations under the License.
 */

#include "EGL/egl.h"
#include "GLES3/gl32.h"
#include "multimedia/player_framework/avplayer.h"
#include "multimedia/player_framework/avplayer_base.h"
#include "multimedia/player_framework/native_averrors.h"
#include "napi/native_api.h"
#include "native_image/native_image.h"
#include "native_window/external_window.h"
#include <arpa/nameser.h>
#include <fcntl.h>
#include <fstream>
#include <hilog/log.h>
#include <js_native_api.h>
#include <map>
#include <sys/stat.h>
#include <thread>
#include <unistd.h>

#define INVALID_FD (-1)
#define PARAM_0 0
#define PARAM_1 1
#define FAIL (-1)
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define PARAM_5 5
#define PARAM_6 6
#define PARAM_7 7
#define PARAM_8 8
#define PARAM_10 10
#define PARAM_400 400
#define PARAM_600 600
#define PARAM_1F (1.0f)
#define SUCCESS 0
#define ONEVAL 1
#define PARAM_0666 0666
#define PARAM_WIDTH 1920
#define PARAM_HEIGHT 1080
#define PARAM_FD_PREPARE_WAIT_TIME 2
#define PARAM_DURATION_F2 (-2)
#define PARAM_DURATION 10000
#define PARAM_DURATION_10000 10000
#define PARAM_DURATION_33333333 33333333
#define PARAM_0666 0666
#define PARAM_0666 0666
#define PATH_NO_AUDIO "/data/storage/el2/base/files/demo_no_audio_10s.mp4"
#define PATH "/data/storage/el2/base/files/demo_video_audio_10s.mp4"
#define MOV_PATH "/data/storage/el2/base/files/No_Support_Format.mov"
#define MKV_PATH "/data/storage/el2/base/files/H264_AAC.mkv"
#define MP3_PATH "/data/storage/el2/base/files/01.mp3"
#define AAC_PATH "/data/storage/el2/base/files/AAC_48000_32_1.aac"
#define WAV_PATH "/data/storage/el2/base/files/vorbis_48000_32_1.wav"
static int32_t g_gPlaytime = 100;
int g_currentPathId = 0;
float g_minDelta = 0.001;
int32_t g_duration = PARAM_DURATION_10000;
static napi_env screenCaptureEnv;
static OH_AVPlayer *g_player;
bool g_flag = false;

static napi_value OH_AVPlayer_SetURLSource0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_SetURLSource(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_Reset0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_Reset(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_Release0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_Release(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_ReleaseSync0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_ReleaseSync(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetVolume0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_SetVolume(nullptr, 0, 0);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_Seek0100(napi_env env, napi_callback_info info)
{
    int32_t mSeconds = 1000;
    OH_AVErrCode errcode = OH_AVPlayer_Seek(nullptr, mSeconds, AV_SEEK_PREVIOUS_SYNC);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_GetCurrentTime0100(napi_env env, napi_callback_info info)
{
    int32_t *currentTime;
    OH_AVErrCode errcode = OH_AVPlayer_GetCurrentTime(nullptr, currentTime);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_GetVideoWidth0100(napi_env env, napi_callback_info info)
{
    int32_t *videoWidth;
    OH_AVErrCode errcode = OH_AVPlayer_GetVideoWidth(nullptr, videoWidth);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_GetVideoHeight0100(napi_env env, napi_callback_info info)
{
    int32_t *videoHeight;
    OH_AVErrCode errcode = OH_AVPlayer_GetVideoHeight(nullptr, videoHeight);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetPlaybackSpeed0100(napi_env env, napi_callback_info info)
{
    int32_t *videoHeight;
    OH_AVErrCode errcode = OH_AVPlayer_SetPlaybackSpeed(nullptr, AV_SPEED_FORWARD_1_50_X);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetPlaybackRate0100(napi_env env, napi_callback_info info)
{
    float rate = 3;
    OH_AVErrCode errcode = OH_AVPlayer_SetPlaybackRate(nullptr, rate);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_GetPlaybackSpeed0100(napi_env env, napi_callback_info info)
{
    AVPlaybackSpeed speed = AV_SPEED_FORWARD_0_50_X;
    OH_AVErrCode errcode = OH_AVPlayer_GetPlaybackSpeed(nullptr, &speed);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetAudioRendererInfo0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_SetAudioRendererInfo(nullptr, AUDIOSTREAM_USAGE_MOVIE);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetAudioInterruptMode0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_SetAudioInterruptMode(nullptr, AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetAudioEffectMode0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_SetAudioEffectMode(nullptr, EFFECT_DEFAULT);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetVideoSurface0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_SetVideoSurface(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_GetDuration0100(napi_env env, napi_callback_info info)
{
    int32_t *duration;
    OH_AVErrCode errcode = OH_AVPlayer_GetDuration(nullptr, duration);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_GetState0100(napi_env env, napi_callback_info info)
{
    AVPlayerState state = AV_IDLE;
    OH_AVErrCode errcode = OH_AVPlayer_GetState(nullptr, &state);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetLooping0100(napi_env env, napi_callback_info info)
{
    bool loop = false;
    OH_AVErrCode errcode = OH_AVPlayer_SetLooping(nullptr, loop);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void AVPlayerOnError(OH_AVPlayer *player, int32_t errorCode, const char *errorMsg) {}
void AVPlayerOnInfo(OH_AVPlayer *player, AVPlayerOnInfoType Type, int32_t extra) {}
static napi_value OH_AVPlayer_SetPlayerCallback0100(napi_env env, napi_callback_info info)
{
    AVPlayerCallback callback = {AVPlayerOnInfo, AVPlayerOnError};
    OH_AVErrCode errcode = OH_AVPlayer_SetPlayerCallback(nullptr, callback);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_GetCurrentTrack0100(napi_env env, napi_callback_info info)
{
    int32_t trackType = 0;
    int32_t *index = nullptr;
    OH_AVErrCode errcode = OH_AVPlayer_GetCurrentTrack(nullptr, trackType, index);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetMediaKeySystemInfoCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_SetMediaKeySystemInfoCallback(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_GetMediaKeySystemInfo0100(napi_env env, napi_callback_info info)
{
    DRM_MediaKeySystemInfo *mediaKeySystemInfo = nullptr;
    OH_AVErrCode errcode = OH_AVPlayer_GetMediaKeySystemInfo(nullptr, mediaKeySystemInfo);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetDecryptionConfig0100(napi_env env, napi_callback_info info)
{
    MediaKeySession *drmKeySession = nullptr;
    bool secureVideoPath = true;
    OH_AVErrCode errcode = OH_AVPlayer_SetDecryptionConfig(nullptr, drmKeySession, secureVideoPath);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetOnInfoCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_SetOnInfoCallback(nullptr, nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetOnErrorCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_SetOnErrorCallback(nullptr, nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVPlayer_SetVolumeMode0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVPlayer_SetVolumeMode(nullptr, AUDIOSTREAM_VOLUMEMODE_SYSTEM_GLOBAL);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value AVPlaybackSpeed0100(napi_env env, napi_callback_info info)
{
    int32_t *videoHeight;
    OH_AVPlayer *AVPlayer = OH_AVPlayer_Create();
    OH_AVPlayer_SetURLSource(AVPlayer, "internal://app/rawfile/H264_AAC.mp4");
    OH_AVPlayer_Prepare(AVPlayer);
    OH_AVErrCode errcode = OH_AVPlayer_SetPlaybackSpeed(AVPlayer, AV_SPEED_FORWARD_0_50_X);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVPlayer_ReleaseSync(AVPlayer);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value AVPlaybackSpeed0101(napi_env env, napi_callback_info info)
{
    int32_t *videoHeight;
    OH_AVPlayer *AVPlayer = OH_AVPlayer_Create();
    OH_AVPlayer_SetURLSource(AVPlayer, "internal://app/rawfile/H264_AAC.mp4");
    OH_AVPlayer_Prepare(AVPlayer);
    OH_AVErrCode errcode = OH_AVPlayer_SetPlaybackSpeed(AVPlayer, AV_SPEED_FORWARD_1_50_X);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVPlayer_ReleaseSync(AVPlayer);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value AVPlaybackSpeed0102(napi_env env, napi_callback_info info)
{
    int32_t *videoHeight;
    OH_AVPlayer *AVPlayer = OH_AVPlayer_Create();
    OH_AVPlayer_SetURLSource(AVPlayer, "internal://app/rawfile/H264_AAC.mp4");
    OH_AVPlayer_Prepare(AVPlayer);
    OH_AVErrCode errcode = OH_AVPlayer_SetPlaybackSpeed(AVPlayer, AV_SPEED_FORWARD_0_25_X);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVPlayer_ReleaseSync(AVPlayer);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value AVPlaybackSpeed0103(napi_env env, napi_callback_info info)
{
    int32_t *videoHeight;
    OH_AVPlayer *AVPlayer = OH_AVPlayer_Create();
    OH_AVPlayer_SetURLSource(AVPlayer, "internal://app/rawfile/H264_AAC.mp4");
    OH_AVPlayer_Prepare(AVPlayer);
    OH_AVErrCode errcode = OH_AVPlayer_SetPlaybackSpeed(AVPlayer, AV_SPEED_FORWARD_0_125_X);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVPlayer_ReleaseSync(AVPlayer);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void AVPlayerOnInfoCallback(OH_AVPlayer *player, AVPlayerOnInfoType type, OH_AVFormat *infoBody, void *userData)
{
    int32_t bufferingType = {0};
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_BUFFERING_TYPE, &bufferingType);

    AVPlayerBufferingType getType = static_cast<AVPlayerBufferingType>(bufferingType);
    switch (getType) {
        case AVPLAYER_BUFFERING_END:
            OH_LOG_INFO(LOG_APP, "==DEMO== AVPLAYER_BUFFERING_END");
            break;
        case AVPLAYER_BUFFERING_PERCENT:
            OH_LOG_INFO(LOG_APP, "==DEMO== AVPLAYER_BUFFERING_PERCENT");
            break;
        case AVPLAYER_BUFFERING_CACHED_DURATION:
            OH_LOG_INFO(LOG_APP, "==DEMO== AVPLAYER_BUFFERING_CACHED_DURATION");
            break;
        default:
            OH_LOG_INFO(LOG_APP, "==DEMO== Unknown state: %d", getType);
            break;
    }
};
static napi_value AVPlayerBufferingType0100(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AVPlayer *AVPlayer = OH_AVPlayer_Create();
    OH_AVErrCode errcode = OH_AVPlayer_SetOnInfoCallback(AVPlayer, AVPlayerOnInfoCallback, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_AVPlayer_ReleaseSync(AVPlayer);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}


napi_property_descriptor desc[] = {
    {"OH_AVPlayer_SetURLSource0100", nullptr, OH_AVPlayer_SetURLSource0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AVPlayer_Reset0100", nullptr, OH_AVPlayer_Reset0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVPlayer_Release0100", nullptr, OH_AVPlayer_Release0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVPlayer_ReleaseSync0100", nullptr, OH_AVPlayer_ReleaseSync0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AVPlayer_SetVolume0100", nullptr, OH_AVPlayer_SetVolume0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVPlayer_Seek0100", nullptr, OH_AVPlayer_Seek0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVPlayer_GetCurrentTime0100", nullptr, OH_AVPlayer_GetCurrentTime0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AVPlayer_GetVideoWidth0100", nullptr, OH_AVPlayer_GetVideoWidth0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AVPlayer_GetVideoHeight0100", nullptr, OH_AVPlayer_GetVideoHeight0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AVPlayer_SetPlaybackSpeed0100", nullptr, OH_AVPlayer_SetPlaybackSpeed0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_SetPlaybackRate0100", nullptr, OH_AVPlayer_SetPlaybackRate0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_GetPlaybackSpeed0100", nullptr, OH_AVPlayer_GetPlaybackSpeed0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_SetAudioRendererInfo0100", nullptr, OH_AVPlayer_SetAudioRendererInfo0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_SetAudioInterruptMode0100", nullptr, OH_AVPlayer_SetAudioInterruptMode0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_SetAudioEffectMode0100", nullptr, OH_AVPlayer_SetAudioEffectMode0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_SetVideoSurface0100", nullptr, OH_AVPlayer_SetVideoSurface0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_GetDuration0100", nullptr, OH_AVPlayer_GetDuration0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AVPlayer_GetState0100", nullptr, OH_AVPlayer_GetState0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVPlayer_SetLooping0100", nullptr, OH_AVPlayer_SetLooping0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_AVPlayer_SetPlayerCallback0100", nullptr, OH_AVPlayer_SetPlayerCallback0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_GetCurrentTrack0100", nullptr, OH_AVPlayer_GetCurrentTrack0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_SetMediaKeySystemInfoCallback0100", nullptr, OH_AVPlayer_SetMediaKeySystemInfoCallback0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVPlayer_GetMediaKeySystemInfo0100", nullptr, OH_AVPlayer_GetMediaKeySystemInfo0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_SetDecryptionConfig0100", nullptr, OH_AVPlayer_SetDecryptionConfig0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_SetOnInfoCallback0100", nullptr, OH_AVPlayer_SetOnInfoCallback0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_SetOnErrorCallback0100", nullptr, OH_AVPlayer_SetOnErrorCallback0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVPlayer_SetVolumeMode0100", nullptr, OH_AVPlayer_SetVolumeMode0100, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"AVPlaybackSpeed0100", nullptr, AVPlaybackSpeed0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"AVPlaybackSpeed0101", nullptr, AVPlaybackSpeed0101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"AVPlaybackSpeed0102", nullptr, AVPlaybackSpeed0102, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"AVPlaybackSpeed0103", nullptr, AVPlaybackSpeed0103, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"AVPlayerBufferingType0100", nullptr, AVPlayerBufferingType0100, nullptr, nullptr, nullptr, napi_default, nullptr},

};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "avplayerndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
