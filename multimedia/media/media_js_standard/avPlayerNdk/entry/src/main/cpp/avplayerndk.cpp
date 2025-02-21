/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <arpa/nameser.h>
#include <fcntl.h>
#include <map>
#include <js_native_api.h>
#include "multimedia/player_framework/avplayer.h"
#include "multimedia/player_framework/avplayer_base.h"
#include "multimedia/player_framework/native_averrors.h"
#include "native_window/external_window.h"
#include "native_image/native_image.h"
#include "GLES3/gl32.h"
#include "EGL/egl.h"
#include <sys/stat.h>
#include <fstream>
#include <unistd.h>
#include <hilog/log.h>

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
#define PARAM_DURATION 10000
#define PARAM_0666 0666
#define PARAM_0666 0666
#define PATH "/data/storage/el2/base/files/demo.mp4"

#define LOG_MSG_TAG "AVPlayerNdk"
#define LOG(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGE(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGD(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))

void InitGLES(EGLDisplay &display, EGLContext &context, EGLSurface &surface)
{
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, NULL, NULL);
    EGLint numConfigs;
    const EGLint configAttribs[] = {EGL_RED_SIZE,  PARAM_8, EGL_GREEN_SIZE,      PARAM_8,
                                    EGL_BLUE_SIZE, PARAM_8, EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT,
                                    EGL_NONE};
    EGLConfig config;
    eglChooseConfig(display, configAttribs, &config, PARAM_1, &numConfigs);
    const EGLint surfaceAttribs[] = {EGL_WIDTH, PARAM_400, EGL_HEIGHT, PARAM_600, EGL_NONE};
    surface = eglCreatePbufferSurface(display, config, surfaceAttribs);
    const EGLint contextAttribs[] = {EGL_CONTEXT_CLIENT_VERSION, PARAM_3, EGL_NONE};
    context = eglCreateContext(display, config, EGL_NO_CONTEXT, contextAttribs);
    eglMakeCurrent(display, surface, surface, context);
}

void DestroyGLES(EGLDisplay &display, EGLContext &context, EGLSurface &surface)
{
    eglDestroySurface(display, surface);
    eglDestroyContext(display, context);
    eglTerminate(display);
    eglSwapBuffers(display, surface);
}

static napi_value OhAvPlayerCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    if (player != nullptr) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetURLSourceAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode = OH_AVPlayer_SetURLSource(player, nullptr);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetURLSourceAbnormalTwo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_SetURLSource(nullptr, nullptr);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static int64_t GetFileSize(const char *fileName)
{
    int64_t fileSize = PARAM_0;
    if (fileName != nullptr) {
        struct stat fileStatus;
        fileSize = static_cast<size_t>(fileStatus.st_size);
    }
    return fileSize;
}

static OH_AVErrCode GetFDSourceInfo(OH_AVPlayer *player) {
    char fileName[] = {PATH};
    int fileDescribe = open(fileName, O_RDONLY, PARAM_0666);
    int64_t fileSize = GetFileSize(PATH);
    OH_AVErrCode errCode = OH_AVPlayer_SetFDSource(player, fileDescribe, PARAM_0, fileSize);
    close(fileDescribe);
    return errCode;
}

static napi_value OhAvPlayerSetFDSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    if (GetFDSourceInfo(player) == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetFDSourceAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    if (GetFDSourceInfo(player) == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetFDSourceAbnormalTwo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode = OH_AVPlayer_SetFDSource(player, INVALID_FD, PARAM_0, PARAM_0);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetFDSourceAbnormalThree(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_SetFDSource(nullptr, PARAM_0, PARAM_0, PARAM_0);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static int GetBackParam(int param, OH_AVErrCode errCode)
{
    int backParam = FAIL;
    if (param == PARAM_0) {
        if (errCode != AV_ERR_OK) {
            backParam = SUCCESS;
        }
    } else if (param == PARAM_1) {
        if (errCode == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    return backParam;
}

static napi_value OhAvPlayerSetAudioRendererInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    if (GetFDSourceInfo(player) == AV_ERR_OK) {
        OH_AVErrCode errCode = OH_AVPlayer_SetAudioRendererInfo(player, AUDIOSTREAM_USAGE_UNKNOWN);
        if (errCode == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetAudioInterruptMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    if (GetFDSourceInfo(player) == AV_ERR_OK) {
        OH_AVErrCode errCode = OH_AVPlayer_SetAudioInterruptMode(player,
            AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT);
        if (errCode == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerPrepare(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam, secondParam, thirdParam;
    napi_get_value_int32(env, args[PARAM_0], &firstParam);
    napi_get_value_int32(env, args[PARAM_1], &secondParam);
    napi_get_value_int32(env, args[PARAM_2], &thirdParam);

    OH_AVPlayer *player = OH_AVPlayer_Create();
    if (firstParam == PARAM_1) {
        GetFDSourceInfo(player);
    }
    OH_AVErrCode errCode = ((secondParam == PARAM_1) ? OH_AVPlayer_Prepare(player) : OH_AVPlayer_Prepare(nullptr));
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, GetBackParam(thirdParam, errCode), &result);
    return result;
}

static napi_value OhAvPlayerPlay(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_4;
    napi_value args[PARAM_4] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam, secondParam, thirdParam, fourthParam;
    napi_get_value_int32(env, args[PARAM_0], &firstParam);
    napi_get_value_int32(env, args[PARAM_1], &secondParam);
    napi_get_value_int32(env, args[PARAM_2], &thirdParam);
    napi_get_value_int32(env, args[PARAM_3], &fourthParam);

    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode;
    if (firstParam == PARAM_1) {
        GetFDSourceInfo(player);
    }
    if (secondParam == PARAM_1) {
        OH_AVPlayer_Prepare(player);
    }
    errCode = ((thirdParam == PARAM_1) ? OH_AVPlayer_Play(player) : OH_AVPlayer_Play(nullptr));
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, GetBackParam(fourthParam, errCode), &result);
    return result;
}

static napi_value OhAvPlayerPause(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_5;
    napi_value args[PARAM_5] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam, secondParam, thirdParam, fourthParam, fifthParam;
    napi_get_value_int32(env, args[PARAM_0], &firstParam);
    napi_get_value_int32(env, args[PARAM_1], &secondParam);
    napi_get_value_int32(env, args[PARAM_2], &thirdParam);
    napi_get_value_int32(env, args[PARAM_3], &fourthParam);
    napi_get_value_int32(env, args[PARAM_4], &fifthParam);

    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode;
    if (firstParam == PARAM_1) {
        GetFDSourceInfo(player);
    }
    if (secondParam == PARAM_1) {
        OH_AVPlayer_Prepare(player);
    }
    if (thirdParam == PARAM_1) {
        OH_AVPlayer_Play(player);
    }
    errCode = ((fourthParam == PARAM_1) ? OH_AVPlayer_Pause(player) : OH_AVPlayer_Pause(nullptr));
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, GetBackParam(fifthParam, errCode), &result);
    return result;
}

static napi_value OhAvPlayerStop(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_4;
    napi_value args[PARAM_4] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam, secondParam, thirdParam, fourthParam;
    napi_get_value_int32(env, args[PARAM_0], &firstParam);
    napi_get_value_int32(env, args[PARAM_1], &secondParam);
    napi_get_value_int32(env, args[PARAM_2], &thirdParam);
    napi_get_value_int32(env, args[PARAM_3], &fourthParam);

    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode;
    if (firstParam == PARAM_1) {
        GetFDSourceInfo(player);
    }
    if (secondParam == PARAM_1) {
        OH_AVPlayer_Prepare(player);
    }
    errCode = ((thirdParam == PARAM_1) ? OH_AVPlayer_Stop(player) : OH_AVPlayer_Stop(nullptr));
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, GetBackParam(fourthParam, errCode), &result);
    return result;
}

static napi_value OhAvPlayerReset(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_7;
    napi_value args[PARAM_7] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam, secondParam, thirdParam, fourthParam, fifthParam, sixthParam, seventhParam;
    napi_get_value_int32(env, args[PARAM_0], &firstParam);
    napi_get_value_int32(env, args[PARAM_1], &secondParam);
    napi_get_value_int32(env, args[PARAM_2], &thirdParam);
    napi_get_value_int32(env, args[PARAM_3], &fourthParam);
    napi_get_value_int32(env, args[PARAM_4], &fifthParam);
    napi_get_value_int32(env, args[PARAM_5], &sixthParam);
    napi_get_value_int32(env, args[PARAM_6], &seventhParam);

    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode;
    if (firstParam == PARAM_1) {
        GetFDSourceInfo(player);
    }
    if (secondParam == PARAM_1) {
        OH_AVPlayer_Prepare(player);
    }
    if (thirdParam == PARAM_1) {
        OH_AVPlayer_Play(player);
    }
    if (fourthParam == PARAM_1) {
        OH_AVPlayer_Pause(player);
    }
    if (fifthParam == PARAM_1) {
        OH_AVPlayer_Stop(player);
    }
    errCode = ((sixthParam == PARAM_1) ? OH_AVPlayer_Reset(player) : OH_AVPlayer_Reset(nullptr));
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, GetBackParam(seventhParam, errCode), &result);
    return result;
}

static napi_value OhAvPlayerRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode = OH_AVPlayer_Release(player);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerReleaseAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_Release(nullptr);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerReleaseSync(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode = OH_AVPlayer_ReleaseSync(player);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerReleaseSyncAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_ReleaseSync(nullptr);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetVolume(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode = OH_AVPlayer_SetVolume(player, PARAM_1F, PARAM_1F);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetVolumeAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_SetVolume(nullptr, PARAM_1F, PARAM_1F);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static OH_AVPlayer *GetPrepareAVPlayer()
{
    OH_AVPlayer *player = OH_AVPlayer_Create();
    GetFDSourceInfo(player);
    OH_AVPlayer_Prepare(player);
    return player;
}

static napi_value OhAvPlayerSetAudioEffectMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    OH_AVErrCode errCode = OH_AVPlayer_SetAudioEffectMode(player, EFFECT_NONE);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSeek(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    OH_AVErrCode errCode = OH_AVPlayer_Seek(player, PARAM_1, AV_SEEK_NEXT_SYNC);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSeekAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_Seek(nullptr, PARAM_1, AV_SEEK_NEXT_SYNC);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetCurrentTime(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    OH_AVPlayer_Play(player);
    OH_AVPlayer_Seek(player, PARAM_1, AV_SEEK_NEXT_SYNC);
    int i = PARAM_0;
    int32_t currentTime = -PARAM_1;
    OH_AVErrCode errCode = OH_AVPlayer_GetCurrentTime(player, &currentTime);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetCurrentTimeAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    int32_t currentTime = -PARAM_1;
    OH_AVErrCode errCode = OH_AVPlayer_GetCurrentTime(nullptr, &currentTime);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetVideoWidth(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    int32_t width;
    OH_AVErrCode errCode = OH_AVPlayer_GetVideoWidth(player, &width);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetVideoWidthAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    int32_t width;
    OH_AVErrCode errCode = OH_AVPlayer_GetVideoWidth(nullptr, &width);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetVideoHeight(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    int32_t height = PARAM_0;
    OH_AVErrCode errCode = OH_AVPlayer_GetVideoHeight(player, &height);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetVideoHeightAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    int32_t width;
    OH_AVErrCode errCode = OH_AVPlayer_GetVideoHeight(nullptr, &width);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetPlaybackSpeed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    OH_AVErrCode errCode = OH_AVPlayer_SetPlaybackSpeed(player, AV_SPEED_FORWARD_1_00_X);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetPlaybackSpeedAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_SetPlaybackSpeed(nullptr, AV_SPEED_FORWARD_1_00_X);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetPlaybackSpeedNormalThree(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    OH_AVErrCode errCode = OH_AVPlayer_SetPlaybackSpeed(player, AV_SPEED_FORWARD_3_00_X);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetPlaybackSpeedAbnormalThree(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_SetPlaybackSpeed(nullptr, AV_SPEED_FORWARD_3_00_X);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetPlaybackSpeed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    OH_AVPlayer_SetPlaybackSpeed(player, AV_SPEED_FORWARD_1_00_X);
    AVPlaybackSpeed speed;
    OH_AVErrCode errCode = OH_AVPlayer_GetPlaybackSpeed(player, &speed);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetPlaybackSpeedAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    AVPlaybackSpeed speed;
    OH_AVErrCode errCode = OH_AVPlayer_GetPlaybackSpeed(nullptr, &speed);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetPlaybackSpeedNormalThree(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    OH_AVPlayer_SetPlaybackSpeed(player, AV_SPEED_FORWARD_3_00_X);
    AVPlaybackSpeed speed;
    OH_AVErrCode errCode = OH_AVPlayer_GetPlaybackSpeed(player, &speed);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetPlaybackSpeedAbnormalThree(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    AVPlaybackSpeed speed;
    OH_AVErrCode errCode = OH_AVPlayer_GetPlaybackSpeed(nullptr, &speed);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSelectBitRate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode = OH_AVPlayer_SelectBitRate(player, PARAM_10);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSelectBitRateAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_SelectBitRate(nullptr, PARAM_10);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetVideoSurface(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    EGLDisplay display = nullptr;
    EGLContext context = nullptr;
    EGLSurface surface = nullptr;
    InitGLES(display, context, surface);
    GLuint textureId = PARAM_0;
    glGenTextures(ONEVAL, &textureId);
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *window = OH_NativeImage_AcquireNativeWindow(image);
    if (window != nullptr) {
        OH_AVPlayer *player = OH_AVPlayer_Create();
        GetFDSourceInfo(player);
        OH_AVErrCode errCode = OH_AVPlayer_SetVideoSurface(player, window);
        if (errCode == AV_ERR_OK) {
            backParam = SUCCESS;
        }
        OH_AVPlayer_ReleaseSync(player);
        OH_NativeWindow_DestroyNativeWindow(window);
    }
    DestroyGLES(display, context, surface);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetVideoSurfaceAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_SetVideoSurface(nullptr, nullptr);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetVideoSurfaceAbnormalTwo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode = OH_AVPlayer_SetVideoSurface(player, nullptr);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}
static napi_value OhAvPlayerSetVideoSurfaceAbnormalThree(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    EGLDisplay display = nullptr;
    EGLContext context = nullptr;
    EGLSurface surface = nullptr;
    InitGLES(display, context, surface);
    GLuint textureId = PARAM_0;
    glGenTextures(ONEVAL, &textureId);
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *window = OH_NativeImage_AcquireNativeWindow(image);
    if (window != nullptr) {
        OH_AVErrCode errCode = OH_AVPlayer_SetVideoSurface(nullptr, window);
        if (errCode != AV_ERR_OK) {
            backParam = SUCCESS;
        }
        OH_NativeWindow_DestroyNativeWindow(window);
    }
    DestroyGLES(display, context, surface);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetDuration(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    int32_t duration;
    OH_AVErrCode errCode = OH_AVPlayer_GetDuration(player, &duration);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetDurationAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    int32_t duration;
    OH_AVErrCode errCode = OH_AVPlayer_GetDuration(nullptr, &duration);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetState(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_5;
    napi_value args[PARAM_5] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam, secondParam, thirdParam, fourthParam, fifthParam;
    napi_get_value_int32(env, args[PARAM_0], &firstParam);
    napi_get_value_int32(env, args[PARAM_1], &secondParam);
    napi_get_value_int32(env, args[PARAM_2], &thirdParam);
    napi_get_value_int32(env, args[PARAM_3], &fourthParam);
    napi_get_value_int32(env, args[PARAM_4], &fifthParam);

    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVErrCode errCode;
    AVPlayerState state;
    if (firstParam == PARAM_1) {
        GetFDSourceInfo(player);
    }
    if (secondParam == PARAM_1) {
        OH_AVPlayer_Prepare(player);
    }
    if (thirdParam == PARAM_1) {
        OH_AVPlayer_Play(player);
    }
    errCode = ((fourthParam == PARAM_1) ? OH_AVPlayer_GetState(player, &state) : OH_AVPlayer_GetState(nullptr, &state));
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, GetBackParam(fourthParam, errCode), &result);
    return result;
}

static napi_value OhAvPlayerIsPlaying(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    if (OH_AVPlayer_Play(player) == AV_ERR_OK) {
        bool isPlaying = OH_AVPlayer_IsPlaying(player);
        if (isPlaying == true) {
            backParam = SUCCESS;
        }
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerIsPlayingAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    bool isPlaying = OH_AVPlayer_IsPlaying(player);
    if (isPlaying != true) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerIsLooping(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    if (OH_AVPlayer_SetLooping(player, true) == AV_ERR_OK) {
        bool isPlaying = OH_AVPlayer_IsLooping(player);
        if (isPlaying == true) {
            backParam = SUCCESS;
        }
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerIsLoopingAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    bool isPlaying = OH_AVPlayer_IsLooping(nullptr);
    if (isPlaying != true) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetLooping(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    OH_AVErrCode errCode = OH_AVPlayer_SetLooping(player, true);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetLoopingAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_SetLooping(nullptr, true);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

typedef struct NdkAVPlayerUser {
    using OnInfoFunc = std::function<void(OH_AVPlayer *player, OH_AVFormat *infoBody)>;
    static void CreateSurface(NdkAVPlayerUser *ndkAVPlayerUser);
    static void DestroySurface(NdkAVPlayerUser *ndkAVPlayerUser);

    NdkAVPlayerUser();
    NdkAVPlayerUser(const NdkAVPlayerUser &other) = delete;
    NdkAVPlayerUser& operator=(const NdkAVPlayerUser &other) = delete;
    ~NdkAVPlayerUser();

    void OnSeekDoneCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnSpeedDoneCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnBitRateDoneCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnEosCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnStateChangeCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnPositionUpdateCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnVolumeChangeCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnMessageCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnVideoSizeChangedCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnBufferingUpdateCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnBitRateCollectedCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnAudioInterruptCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnDurationUpdateCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnNotifyIsLiveStream(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnTrackChangedCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnTrackInfoUpdate(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnSubtitleInfoCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnAudioDeviceChangeCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void OnDrmInfoUpdatedCb(OH_AVPlayer *player, OH_AVFormat *infoBody);
    void HandleOnInfoStateChange(OH_AVPlayer *player, AVPlayerState state);

    std::map<uint32_t, OnInfoFunc> onInfoFuncs_;
    OH_AVPlayer *player = nullptr;
    EGLDisplay display = nullptr;
    EGLContext context = nullptr;
    EGLSurface surface = nullptr;
    OH_NativeImage *image = nullptr;
    OHNativeWindow *window = nullptr;

    int32_t errorCode = AV_ERR_UNKNOWN;

    int32_t isLiveStream = -1;
    int32_t seekDonePosition = -1;
    int32_t position = -1;
    int32_t messageType = -1;
    int32_t state = -1;
    int32_t stateChangeReason = -1;
    int32_t audioOutputChangeReason = -1;
    int32_t isEos = -1;
    AVPlayerState avState = AV_IDLE;
    AVPlaybackSpeed speed = AV_SPEED_FORWARD_1_00_X;

    float volume = 0.0;
    int64_t duration = -1;

    int32_t width = -1;
    int32_t height = -1;

    AVPlayerBufferingType bufferType = AVPLAYER_BUFFERING_START;
    int32_t bufferValue = -1;

    uint32_t *bitRates = nullptr;
    size_t bitRatesSize = 0;
    uint32_t bitRateDone = 0;

    int32_t interruptType = -1;
    int32_t interruptForce = -1;
    int32_t interruptHint = -1;
} NdkAVPlayerUser;

void NdkAVPlayerUser::CreateSurface(NdkAVPlayerUser *ndkAVPlayerUser)
{
    if (ndkAVPlayerUser == nullptr) {
        return;
    }
    EGLDisplay display = nullptr;
    EGLContext context = nullptr;
    EGLSurface surface = nullptr;
    InitGLES(ndkAVPlayerUser->display, ndkAVPlayerUser->context, ndkAVPlayerUser->surface);
    GLuint textureId = PARAM_0;
    glGenTextures(ONEVAL, &textureId);
    ndkAVPlayerUser->image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    ndkAVPlayerUser->window = OH_NativeImage_AcquireNativeWindow(ndkAVPlayerUser->image);
}

void NdkAVPlayerUser::DestroySurface(NdkAVPlayerUser *ndkAVPlayerUser)
{
    if (ndkAVPlayerUser == nullptr) {
        return;
    }
    if (ndkAVPlayerUser->window) {
        OH_NativeWindow_DestroyNativeWindow(ndkAVPlayerUser->window);
    }
    DestroyGLES(ndkAVPlayerUser->display, ndkAVPlayerUser->context, ndkAVPlayerUser->surface);
    ndkAVPlayerUser->display = nullptr;
    ndkAVPlayerUser->context = nullptr;
    ndkAVPlayerUser->surface = nullptr;
    ndkAVPlayerUser->image = nullptr;
    ndkAVPlayerUser->window = nullptr;
}

NdkAVPlayerUser::NdkAVPlayerUser()
{
    onInfoFuncs_ = {
        { AV_INFO_TYPE_SEEKDONE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnSeekDoneCb(player, infoBody); } },
        { AV_INFO_TYPE_SPEEDDONE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) {OnSpeedDoneCb(player, infoBody); } },
        { AV_INFO_TYPE_BITRATEDONE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnBitRateDoneCb(player, infoBody); } },
        { AV_INFO_TYPE_EOS,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnEosCb(player, infoBody); } },
        { AV_INFO_TYPE_STATE_CHANGE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnStateChangeCb(player, infoBody); } },
        { AV_INFO_TYPE_POSITION_UPDATE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnPositionUpdateCb(player, infoBody); } },
        { AV_INFO_TYPE_MESSAGE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnMessageCb(player, infoBody);} },
        { AV_INFO_TYPE_VOLUME_CHANGE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnVolumeChangeCb(player, infoBody); } },
        { AV_INFO_TYPE_RESOLUTION_CHANGE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnVideoSizeChangedCb(player, infoBody); } },
        { AV_INFO_TYPE_BUFFERING_UPDATE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnBufferingUpdateCb(player, infoBody); } },
        { AV_INFO_TYPE_BITRATE_COLLECT,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnBitRateCollectedCb(player, infoBody); } },
        { AV_INFO_TYPE_INTERRUPT_EVENT,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnAudioInterruptCb(player, infoBody); } },
        { AV_INFO_TYPE_DURATION_UPDATE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnDurationUpdateCb(player, infoBody); } },
        { AV_INFO_TYPE_IS_LIVE_STREAM,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnNotifyIsLiveStream(player, infoBody); } },
        { AV_INFO_TYPE_TRACKCHANGE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnTrackChangedCb(player, infoBody); } },
        { AV_INFO_TYPE_TRACK_INFO_UPDATE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnTrackInfoUpdate(player, infoBody); } },
        { AV_INFO_TYPE_SUBTITLE_UPDATE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnSubtitleInfoCb(player, infoBody); } },
        { AV_INFO_TYPE_AUDIO_OUTPUT_DEVICE_CHANGE,
            [this](OH_AVPlayer *player, OH_AVFormat *infoBody) { OnAudioDeviceChangeCb(player, infoBody); } },
    };
}

NdkAVPlayerUser::~NdkAVPlayerUser()
{
    if (bitRates != nullptr) {
        delete[] bitRates;
    }
    DestroySurface(this);
}

void NdkAVPlayerUser::OnSeekDoneCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_SEEK_POSITION, &this->seekDonePosition);
    LOG("AV_INFO_TYPE_SEEKDONE value: %d", this->seekDonePosition);
}

void NdkAVPlayerUser::OnSpeedDoneCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    int32_t infoValue = -1;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_PLAYBACK_SPEED, &infoValue);
    this->speed = static_cast<AVPlaybackSpeed>(infoValue);
    LOG("AV_INFO_TYPE_SPEEDDONE infoValue: %d", infoValue);
}

void NdkAVPlayerUser::OnBitRateDoneCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    // OH_AVFormat can not store uint32_t: 1. change to int32_t, 2. store, 3. transport, 4. get change to uint32_t
    int32_t infoValue = -1;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_BITRATE, &infoValue);
    this->bitRateDone = static_cast<uint32_t>(infoValue);
    LOG("AV_INFO_TYPE_BITRATEDONE infoValue: %d", infoValue);
}

void NdkAVPlayerUser::OnEosCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    (void)infoBody;
    LOG("AV_INFO_TYPE_EOS eos");
    this->isEos = 1;
}

void NdkAVPlayerUser::OnStateChangeCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    LOG("AVPlayerOnInfoType AV_INFO_TYPE_STATE_CHANGE");
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_STATE, &this->state);
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_STATE_CHANGE_REASON, &this->stateChangeReason);
    LOG("AV_INFO_TYPE_STATE_CHANGE  state: %d ,stateChangeReason: %d", this->state, this->stateChangeReason);
    this->avState = static_cast<AVPlayerState>(this->state);
    HandleOnInfoStateChange(player, this->avState);
}

void NdkAVPlayerUser::OnPositionUpdateCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_CURRENT_POSITION, &this->position);
    LOGD("AV_INFO_TYPE_POSITION_UPDATE value: %d", this->position);
}

void NdkAVPlayerUser::OnVolumeChangeCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    OH_AVFormat_GetFloatValue(infoBody, OH_PLAYER_VOLUME, &this->volume);
    LOG("AV_INFO_TYPE_VOLUME_CHANGE value: %f", this->volume);
}

void NdkAVPlayerUser::OnMessageCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_MESSAGE_TYPE, &this->messageType);
    LOG("AV_INFO_TYPE_MESSAGE  messageType: %d", this->messageType);
}

void NdkAVPlayerUser::OnVideoSizeChangedCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_VIDEO_WIDTH, &this->width);
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_VIDEO_HEIGHT, &this->height);
    LOG("AV_INFO_TYPE_RESOLUTION_CHANGE width: %d, height: %d", this->width, this->height);
}

void NdkAVPlayerUser::OnBufferingUpdateCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    int32_t infoValue = -1;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_BUFFERING_TYPE, &infoValue);
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_BUFFERING_VALUE, &this->bufferValue);
    this->bufferType = static_cast<AVPlayerBufferingType>(infoValue);
    LOGD("AV_INFO_TYPE_BUFFERING_UPDATE bufferType: %d, bufferValue: %d",
        infoValue, this->bufferValue);
}

void NdkAVPlayerUser::OnBitRateCollectedCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    uint8_t *bitRatesOrigin = nullptr;
    size_t size = 0;
    OH_AVFormat_GetBuffer(infoBody, OH_PLAYER_BITRATE_ARRAY, &bitRatesOrigin, &size);
    this->bitRatesSize = size / sizeof(uint32_t);
    LOG("AV_INFO_TYPE_BITRATE_COLLECT bytes size: %zu, size: %zu", size, this->bitRatesSize);
    if (this->bitRatesSize <= 0 || bitRatesOrigin == nullptr) {
        LOGE("AV_INFO_TYPE_BITRATE_COLLECT invalid bitRates info");
        return;
    }
    this->bitRates = new uint32_t[this->bitRatesSize];
    if (this->bitRates == nullptr) {
        LOGE("AV_INFO_TYPE_BITRATE_COLLECT bitRates is nullptr");
        return;
    }
    for (size_t i = 0; i < this->bitRatesSize; i++) {
        this->bitRates[i] = reinterpret_cast<uint32_t *>(bitRatesOrigin)[i];
        LOGE("AV_INFO_TYPE_BITRATE_COLLECT bitRates[%zu]: %u", i, this->bitRates[i]);
    }
}

void NdkAVPlayerUser::OnAudioInterruptCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_AUDIO_INTERRUPT_TYPE, &this->interruptType);
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_AUDIO_INTERRUPT_FORCE, &this->interruptForce);
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_AUDIO_INTERRUPT_HINT, &this->interruptHint);
    LOG("AV_INFO_TYPE_INTERRUPT_EVENT interruptType: %d, interruptForce: %d"
        ", interruptHint: %d", this->interruptType, this->interruptForce,
        this->interruptHint);
}

void NdkAVPlayerUser::OnDurationUpdateCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    OH_AVFormat_GetLongValue(infoBody, OH_PLAYER_DURATION, &this->duration);
    LOG("AV_INFO_TYPE_DURATION_UPDATE value: %lld", static_cast<long long>(this->duration));
}

void NdkAVPlayerUser::OnNotifyIsLiveStream(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_IS_LIVE_STREAM, &this->isLiveStream);
    LOG("AV_INFO_TYPE_IS_LIVE_STREAM value: %d", this->isLiveStream);
}

void NdkAVPlayerUser::OnTrackChangedCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    (void)infoBody;
    LOG("AV_INFO_TYPE_TRACKCHANGE, currently not support, do nothing");
}

void NdkAVPlayerUser::OnTrackInfoUpdate(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    (void)infoBody;
    LOG("AV_INFO_TYPE_TRACK_INFO_UPDATE, currently not support, do nothing");
}

void NdkAVPlayerUser::OnSubtitleInfoCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    (void)infoBody;
    LOG("AV_INFO_TYPE_SUBTITLE_UPDATE, currently not support, do nothing");
}

void NdkAVPlayerUser::OnAudioDeviceChangeCb(OH_AVPlayer *player, OH_AVFormat *infoBody)
{
    (void)player;
    OH_AVFormat_GetIntValue(infoBody, OH_PLAYER_AUDIO_DEVICE_CHANGE_REASON,
        &this->audioOutputChangeReason);
    LOG("AV_INFO_TYPE_AUDIO_OUTPUT_DEVICE_CHANGE value: %d",
        this->audioOutputChangeReason);
}

void NdkAVPlayerUser::HandleOnInfoStateChange(OH_AVPlayer *player, AVPlayerState state)
{
    if (player == nullptr) {
        return;
    }
    int32_t ret = -1;
    switch (state) {
    case AV_IDLE: {
        LOG("HandleOnInfoStateChange AVPlayerState AV_IDLE");
        break;
    }
    case AV_INITIALIZED: {
        LOG("HandleOnInfoStateChange AVPlayerState AV_INITIALIZED");
        NdkAVPlayerUser::CreateSurface(this);
        ret = OH_AVPlayer_SetVideoSurface(player, this->window);
        LOG("HandleOnInfoStateChange OH_AVPlayer_SetVideoSurface ret:%d", ret);
        ret = OH_AVPlayer_Prepare(player);
        if (ret != AV_ERR_OK) {
            // handle exception and error
            LOGE("player %s", "HandleOnInfoStateChange OH_AVPlayer_Prepare error");
        }
        break;
    }
    case AV_PREPARED:
        LOG("HandleOnInfoStateChange AVPlayerState AV_PREPARED");
        break;
    case AV_PLAYING:
        LOG("HandleOnInfoStateChange AVPlayerState AV_PLAYING");
        break;
    case AV_PAUSED:
        LOG("HandleOnInfoStateChange AVPlayerState AV_PAUSED");
        break;
    case AV_STOPPED:
        LOG("HandleOnInfoStateChange AVPlayerState AV_STOPPED");
        break;
    case AV_COMPLETED:
        LOG("HandleOnInfoStateChange AVPlayerState AV_COMPLETED");
        break;
    case AV_ERROR:
        LOG("HandleOnInfoStateChange AVPlayerState AV_ERROR");
        break;
    case AV_RELEASED:
        LOG("HandleOnInfoStateChange AVPlayerState AV_RELEASED");
        NdkAVPlayerUser::DestroySurface(this);
        break;
    default:
        break;
    }
}

static void AVPlayerOnInfoCallbackImpl(OH_AVPlayer *player, AVPlayerOnInfoType type, OH_AVFormat *infoBody,
    void *userData)
{
    NdkAVPlayerUser *user = reinterpret_cast<NdkAVPlayerUser *>(userData);
    if (user == nullptr || player == nullptr) {
        LOGE("AVPlayerOnInfoCallbackImpl user is nullptr");
        return;
    }
    LOGD("OnInfo type %d", type);
    if (user->onInfoFuncs_.count(type) > 0) {
        user->onInfoFuncs_[type](player, infoBody);
    } else {
        LOGD("OnInfo: no member func, type %d", type);
    }
    return;
}

static void AVPlayerOnErrorCallbackImpl(OH_AVPlayer *player, int32_t errorCode, const char *errorMsg, void *userData)
{
    LOG("AVPlayerOnErrorCallbackImpl errorCode: %d ,errorMsg: %s",
        errorCode, errorMsg == nullptr ? "unknown" : errorMsg);
    NdkAVPlayerUser *ndkAVPlayerUser = reinterpret_cast<NdkAVPlayerUser *>(userData);
    if (ndkAVPlayerUser == nullptr || player == nullptr) {
        LOGE("AVPlayerOnErrorCallbackImpl ndkAVPlayerUser or player is nullptr");
        return;
    }
    ndkAVPlayerUser->errorCode = errorCode;
}

static napi_value OhAvPlayerSetOnInfoCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam = PARAM_0;
    int secondParam = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &firstParam);
    napi_get_value_int32(env, args[PARAM_1], &secondParam);

    int backParam = FAIL;
    NdkAVPlayerUser *ndkAVPlayerUser = nullptr;
    OH_AVPlayer *player = OH_AVPlayer_Create();

    LOG("call OH_AVPlayer_SetOnInfoCallback");
    if (firstParam == PARAM_1) {
        ndkAVPlayerUser = new NdkAVPlayerUser();
        ndkAVPlayerUser->player = player;
    }
    OH_AVErrCode errCode = OH_AVPlayer_SetOnInfoCallback(player, AVPlayerOnInfoCallbackImpl, ndkAVPlayerUser);
    LOG("OH_AVPlayer_SetOnInfoCallback errCode:%d", errCode);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }

    if (secondParam == PARAM_1) {
        LOG("call OH_AVPlayer_SetOnInfoCallback reset");
        OH_AVErrCode errCode = OH_AVPlayer_SetOnInfoCallback(player, nullptr, ndkAVPlayerUser);
        LOG("OH_AVPlayer_SetOnInfoCallback reset errCode:%d", errCode);
        if (backParam == SUCCESS && errCode == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    if (ndkAVPlayerUser != nullptr) {
        delete ndkAVPlayerUser;
    }
    return result;
}

static napi_value OhAvPlayerSetOnInfoCallbackAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_4;
    napi_value args[PARAM_4] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam = PARAM_0;
    int secondParam = PARAM_0;
    int thirdParam = PARAM_0;
    int fourthParam = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &firstParam);
    napi_get_value_int32(env, args[PARAM_1], &secondParam);
    napi_get_value_int32(env, args[PARAM_2], &thirdParam);
    napi_get_value_int32(env, args[PARAM_3], &fourthParam);

    NdkAVPlayerUser *ndkAVPlayerUser = nullptr;
    OH_AVPlayerOnInfoCallback onInfoCb = nullptr;
    OH_AVPlayer *player = nullptr;

    if (firstParam == PARAM_1) {
        player = OH_AVPlayer_Create();
    }
    if (secondParam == PARAM_1) {
        ndkAVPlayerUser = new NdkAVPlayerUser();
        ndkAVPlayerUser->player = player;
    }
    if (thirdParam == PARAM_1) {
        onInfoCb = AVPlayerOnInfoCallbackImpl;
    }
    LOG("call OH_AVPlayer_SetOnInfoCallback %d %d %d %d", firstParam, secondParam, thirdParam, fourthParam);
    OH_AVErrCode errCode = OH_AVPlayer_SetOnInfoCallback(player, onInfoCb, ndkAVPlayerUser);
    LOG("OH_AVPlayer_SetOnInfoCallback errCode:%d", errCode);

    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, GetBackParam(fourthParam, errCode), &result);
    if (ndkAVPlayerUser != nullptr) {
        delete ndkAVPlayerUser;
    }
    return result;
}

static napi_value OhAvPlayerSetOnInfoCallbackWithPrepare(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = SUCCESS;

    OH_AVPlayer *player = OH_AVPlayer_Create();
    NdkAVPlayerUser ndkAVPlayerUser;
    ndkAVPlayerUser.player = player;
    OH_AVPlayer_SetOnInfoCallback(player, AVPlayerOnInfoCallbackImpl, &ndkAVPlayerUser);
    GetFDSourceInfo(player);
    sleep(PARAM_FD_PREPARE_WAIT_TIME);
    if (ndkAVPlayerUser.avState != AV_PREPARED) {
        LOGE("OhAvPlayerSetOnInfoCallbackWithPrepare avState:%d", ndkAVPlayerUser.avState);
        backParam = FAIL;
    }
    if (ndkAVPlayerUser.width != PARAM_WIDTH) {
        LOGE("OhAvPlayerSetOnInfoCallbackWithPrepare width:%d", ndkAVPlayerUser.width);
        backParam = FAIL;
    }
    if (ndkAVPlayerUser.height != PARAM_HEIGHT) {
        LOGE("OhAvPlayerSetOnInfoCallbackWithPrepare height:%d", ndkAVPlayerUser.height);
        backParam = FAIL;
    }
    if (ndkAVPlayerUser.duration != PARAM_DURATION) {
        LOGE("OhAvPlayerSetOnInfoCallbackWithPrepare duration:%lld", static_cast<long long>(ndkAVPlayerUser.duration));
        backParam = FAIL;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetOnErrorCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam = PARAM_0;
    int secondParam = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &firstParam);
    napi_get_value_int32(env, args[PARAM_1], &secondParam);

    int backParam = FAIL;
    NdkAVPlayerUser *ndkAVPlayerUser = nullptr;
    OH_AVPlayer *player = OH_AVPlayer_Create();

    LOG("call OH_AVPlayer_SetOnErrorCallback");
    if (firstParam == PARAM_1) {
        ndkAVPlayerUser = new NdkAVPlayerUser();
        ndkAVPlayerUser->player = player;
    }
    OH_AVErrCode errCode = OH_AVPlayer_SetOnErrorCallback(player, AVPlayerOnErrorCallbackImpl, ndkAVPlayerUser);
    LOG("OH_AVPlayer_SetOnErrorCallback errCode:%d", errCode);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }

    if (secondParam == PARAM_1) {
        LOG("call OH_AVPlayer_SetOnErrorCallback reset");
        OH_AVErrCode errCode = OH_AVPlayer_SetOnErrorCallback(player, nullptr, ndkAVPlayerUser);
        LOG("OH_AVPlayer_SetOnErrorCallback reset errCode:%d", errCode);
        if (backParam == SUCCESS && errCode == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    if (ndkAVPlayerUser != nullptr) {
        delete ndkAVPlayerUser;
    }
    return result;
}

static napi_value OhAvPlayerSetOnErrorCallbackAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_4;
    napi_value args[PARAM_4] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam = PARAM_0;
    int secondParam = PARAM_0;
    int thirdParam = PARAM_0;
    int fourthParam = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &firstParam);
    napi_get_value_int32(env, args[PARAM_1], &secondParam);
    napi_get_value_int32(env, args[PARAM_2], &thirdParam);
    napi_get_value_int32(env, args[PARAM_3], &fourthParam);

    NdkAVPlayerUser *ndkAVPlayerUser = nullptr;
    OH_AVPlayerOnErrorCallback onErrorCb = nullptr;
    OH_AVPlayer *player = nullptr;

    if (firstParam == PARAM_1) {
        player = OH_AVPlayer_Create();
    }
    if (secondParam == PARAM_1) {
        ndkAVPlayerUser = new NdkAVPlayerUser();
        ndkAVPlayerUser->player = player;
    }
    if (thirdParam == PARAM_1) {
        onErrorCb = AVPlayerOnErrorCallbackImpl;
    }
    LOG("call OH_AVPlayer_SetOnErrorCallback %d %d %d %d", firstParam, secondParam, thirdParam, fourthParam);
    OH_AVErrCode errCode = OH_AVPlayer_SetOnErrorCallback(player, onErrorCb, ndkAVPlayerUser);
    LOG("OH_AVPlayer_SetOnErrorCallback errCode:%d", errCode);

    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, GetBackParam(fourthParam, errCode), &result);

    if (ndkAVPlayerUser != nullptr) {
        delete ndkAVPlayerUser;
    }
    return result;
}

static void AVPlayerOnError(OH_AVPlayer *player, int32_t errorCode, const char *errorMsg) {}
static void AVPlayerOnInfo(OH_AVPlayer *player, AVPlayerOnInfoType Type, int32_t extra) {}

static napi_value OhAvPlayerSetPlayerCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = OH_AVPlayer_Create();
    AVPlayerCallback cb = { &AVPlayerOnInfo, &AVPlayerOnError };
    OH_AVErrCode errCode = OH_AVPlayer_SetPlayerCallback(player, cb);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetPlayerCallbackAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    AVPlayerCallback cb = { nullptr, nullptr };
    OH_AVErrCode errCode = OH_AVPlayer_SetPlayerCallback(nullptr, cb);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSetPlayerCallbackAbnormalTwo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    AVPlayerCallback cb = { &AVPlayerOnInfo, &AVPlayerOnError };
    OH_AVErrCode errCode = OH_AVPlayer_SetPlayerCallback(nullptr, cb);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}
static napi_value OhAvPlayerSetPlayerCallbackAbnormalThree(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    AVPlayerCallback cb = { nullptr, nullptr };
    OH_AVPlayer *player = GetPrepareAVPlayer();
    OH_AVErrCode errCode = OH_AVPlayer_SetPlayerCallback(player, cb);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSelectTrack(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    OH_AVErrCode errCode = OH_AVPlayer_SelectTrack(player, PARAM_0);
    if (errCode == AV_ERR_OK) {
        backParam = SUCCESS;
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerSelectTrackAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_SelectTrack(nullptr, PARAM_0);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerDeselectTrack(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    if (OH_AVPlayer_SelectTrack(player, PARAM_0) == AV_ERR_OK) {
        OH_AVErrCode errCode = OH_AVPlayer_DeselectTrack(player, PARAM_0);
        if (errCode == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerDeselectTrackAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_DeselectTrack(nullptr, PARAM_0);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetCurrentTrack(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVPlayer *player = GetPrepareAVPlayer();
    if (OH_AVPlayer_SelectTrack(player, PARAM_0) == AV_ERR_OK) {
        int32_t trackType = PARAM_0;
        int32_t index = FAIL;
        OH_AVErrCode errCode = OH_AVPlayer_GetCurrentTrack(player, trackType, &index);
        if (errCode == AV_ERR_OK) {
            backParam = SUCCESS;
        }
    }
    OH_AVPlayer_ReleaseSync(player);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvPlayerGetCurrentTrackAbnormalOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    int32_t trackType = PARAM_0;
    int32_t index = FAIL;
    OH_AVErrCode errCode = OH_AVPlayer_GetCurrentTrack(nullptr, trackType, &index);
    if (errCode != AV_ERR_OK) {
        backParam = SUCCESS;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"AvPlayerCreate", nullptr, OhAvPlayerCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetURLSourceAbnormalOne", nullptr, OhAvPlayerSetURLSourceAbnormalOne, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AvPlayerSetURLSourceAbnormalTwo", nullptr, OhAvPlayerSetURLSourceAbnormalTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetFDSource", nullptr, OhAvPlayerSetFDSource, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetFDSourceAbnormalOne", nullptr, OhAvPlayerSetFDSourceAbnormalOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetFDSourceAbnormalTwo", nullptr, OhAvPlayerSetFDSourceAbnormalTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetFDSourceAbnormalThree", nullptr, OhAvPlayerSetFDSourceAbnormalThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerPrepare", nullptr, OhAvPlayerPrepare, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerPlay", nullptr, OhAvPlayerPlay, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerPause", nullptr, OhAvPlayerPause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerStop", nullptr, OhAvPlayerStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerReset", nullptr, OhAvPlayerReset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerRelease", nullptr, OhAvPlayerRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerReleaseAbnormalOne", nullptr, OhAvPlayerReleaseAbnormalOne, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"AvPlayerReleaseSync", nullptr, OhAvPlayerReleaseSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerReleaseSyncAbnormalOne", nullptr, OhAvPlayerReleaseSyncAbnormalOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetVolume", nullptr, OhAvPlayerSetVolume, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetVolumeAbnormalOne", nullptr, OhAvPlayerSetVolumeAbnormalOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSeek", nullptr, OhAvPlayerSeek, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSeekAbnormalOne", nullptr, OhAvPlayerSeekAbnormalOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerGetCurrentTime", nullptr, OhAvPlayerGetCurrentTime, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerGetCurrentTimeAbnormalOne", nullptr, OhAvPlayerGetCurrentTimeAbnormalOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerGetVideoWidth", nullptr, OhAvPlayerGetVideoWidth, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerGetVideoWidthAbnormalOne", nullptr, OhAvPlayerGetVideoWidthAbnormalOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerGetVideoHeight", nullptr, OhAvPlayerGetVideoHeight, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerGetVideoHeightAbnormalOne", nullptr, OhAvPlayerGetVideoHeightAbnormalOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetPlaybackSpeed", nullptr, OhAvPlayerSetPlaybackSpeed, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetPlaybackSpeedAbnormalOne", nullptr, OhAvPlayerSetPlaybackSpeedAbnormalOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerGetPlaybackSpeed", nullptr, OhAvPlayerGetPlaybackSpeed, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerGetPlaybackSpeedAbnormalOne", nullptr, OhAvPlayerGetPlaybackSpeedAbnormalOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSelectBitRate", nullptr, OhAvPlayerSelectBitRate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSelectBitRateAbnormalOne", nullptr, OhAvPlayerSelectBitRateAbnormalOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetVideoSurface", nullptr, OhAvPlayerSetVideoSurface, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetVideoSurfaceAbnormalOne", nullptr, OhAvPlayerSetVideoSurfaceAbnormalOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetVideoSurfaceAbnormalTwo", nullptr, OhAvPlayerSetVideoSurfaceAbnormalTwo, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetVideoSurfaceAbnormalThree", nullptr, OhAvPlayerSetVideoSurfaceAbnormalThree, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerGetDuration", nullptr, OhAvPlayerGetDuration, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerGetDurationAbnormalOne", nullptr, OhAvPlayerGetDurationAbnormalOne, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AvPlayerGetState", nullptr, OhAvPlayerGetState, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerIsPlaying", nullptr, OhAvPlayerIsPlaying, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerIsPlayingAbnormalOne", nullptr, OhAvPlayerIsPlayingAbnormalOne, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AvPlayerIsLooping", nullptr, OhAvPlayerIsLooping, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerIsLoopingAbnormalOne", nullptr, OhAvPlayerIsLoopingAbnormalOne, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AvPlayerSetLooping", nullptr, OhAvPlayerSetLooping, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetLoopingAbnormalOne", nullptr, OhAvPlayerSetLoopingAbnormalOne, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AvPlayerSetPlayerCallback", nullptr, OhAvPlayerSetPlayerCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetPlayerCallbackAbnormalOne", nullptr, OhAvPlayerSetPlayerCallbackAbnormalOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetPlayerCallbackAbnormalTwo", nullptr, OhAvPlayerSetPlayerCallbackAbnormalTwo, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetPlayerCallbackAbnormalThree", nullptr, OhAvPlayerSetPlayerCallbackAbnormalThree, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSelectTrack", nullptr, OhAvPlayerSelectTrack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSelectTrackAbnormalOne", nullptr, OhAvPlayerSelectTrackAbnormalOne, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AvPlayerDeselectTrack", nullptr, OhAvPlayerDeselectTrack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerDeselectTrackAbnormalOne", nullptr, OhAvPlayerDeselectTrackAbnormalOne, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AvPlayerGetCurrentTrack", nullptr, OhAvPlayerGetCurrentTrack, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerGetCurrentTrackAbnormalOne", nullptr, OhAvPlayerGetCurrentTrackAbnormalOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetOnInfoCallback", nullptr, OhAvPlayerSetOnInfoCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetOnInfoCallbackAbnormal", nullptr, OhAvPlayerSetOnInfoCallbackAbnormal, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetOnInfoCallbackWithPrepare", nullptr, OhAvPlayerSetOnInfoCallbackWithPrepare, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"AvPlayerSetOnErrorCallback", nullptr, OhAvPlayerSetOnErrorCallback, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetOnErrorCallbackAbnormal", nullptr, OhAvPlayerSetOnErrorCallbackAbnormal, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetAudioRendererInfo", nullptr, OhAvPlayerSetAudioRendererInfo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetAudioInterruptMode", nullptr, OhAvPlayerSetAudioInterruptMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetAudioEffectMode", nullptr, OhAvPlayerSetAudioEffectMode, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"AvPlayerSetPlaybackSpeedNormalThree", nullptr, OhAvPlayerSetPlaybackSpeedNormalThree, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerSetPlaybackSpeedAbnormalThree", nullptr, OhAvPlayerSetPlaybackSpeedAbnormalThree, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerGetPlaybackSpeedNormalThree", nullptr, OhAvPlayerGetPlaybackSpeedNormalThree, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AvPlayerGetPlaybackSpeedAbnormalThree", nullptr, OhAvPlayerGetPlaybackSpeedAbnormalThree, nullptr,
            nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "avplayer",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
