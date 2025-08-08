/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "napi/native_api.h"
#include <multimedia/player_framework/avplayer.h>
#include <multimedia/player_framework/avplayer_base.h>
#include <multimedia/player_framework/avplayer_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include "native_image/native_image.h"
#include "native_window/external_window.h"
#include "GLES3/gl32.h"
#include <typeinfo>
#include <fcntl.h>
#include <string>
#include <arpa/nameser.h>
#include <fcntl.h>
#include <js_native_api.h>
#include <sys/stat.h>
#include <unistd.h>
#include <vector>
#include <thread>
#define PARAM_1F (1.0f)
#define INITSUCCESS 0
#define PARAM_0 0
#define PARAM_1 1
#define ONEVAL 1
#define PARAM_10 10
#define FAIL (-1)
#define KNUMBER0 0
#define KNUMBER1 1
#define KNUMBER2 2
#define KNUMBER3 3
#define KNUMBER4 4
#define KNUMBER5 5

static int32_t g_gPlaytime = 100;
static bool g_avInfoTypeStateChange = true;

std::string PREPATH = "/data/storage/el2/base/files/";
std::string PATH = "/data/storage/el2/base/files/testAV.mp4";
std::string OHERPATH = "/data/storage/el2/base/files/test2.mp4";

std::string FileList[] = {"/data/storage/el2/base/files/testAV.mp4",  "/data/storage/el2/base/files/testAV1.mp4",
                          "/data/storage/el2/base/files/testAV2.mp4", "/data/storage/el2/base/files/testAV3.mp4",
                          "/data/storage/el2/base/files/testAV4.mp4", "/data/storage/el2/base/files/testAV5.mp4",
                          "/data/storage/el2/base/files/testAV6.mp4", "/data/storage/el2/base/files/testAV7.mp4",
                          "/data/storage/el2/base/files/testAV8.mp4"};
static int g_fileDesc;
static OH_AVPlayer *mainPlayer;
static OH_AVPlayer *temmpPlayer;
static OH_AVPlayer *GlobalAVPlayer()
{
    OH_AVPlayer *player = OH_AVPlayer_Create();
    mainPlayer = player;
    return player;
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

static void OhAvPlayerSetFdSource()
{
    int fileDescribe = open(PATH.c_str(), O_RDONLY, 0666);
    napi_value result = nullptr;
    int64_t fileSize = GetFileSize(PATH.c_str());
    OH_AVErrCode avErrCode = OH_AVPlayer_SetFDSource(mainPlayer, fileDescribe, PARAM_0, fileSize);
    g_avInfoTypeStateChange = false;
}

static void AVPlayerOnError(OH_AVPlayer *player, int32_t, const char *errorMsg)
{
}

static void AVPlayerOnInfo(OH_AVPlayer *player, AVPlayerOnInfoType infoType, int32_t extra)
{
    switch (infoType) {
        case AV_INFO_TYPE_STATE_CHANGE:
            g_avInfoTypeStateChange = true;
            break;
    
        default:
            break;
    }
}
    
#pragma mark - 公用方法
// 获取index下标的属性值
static int getParamAtIndex(int index, napi_env env, napi_callback_info info)
{
    size_t argc = 6;
    napi_value args[6] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    napi_typeof(env, args[index], &valuetype);
    int value;
    napi_get_value_int32(env, args[index], &value);
    return value;
}

// 默认参数播放器
static OH_AVPlayer *GetAVPlayer()
{
    // 创建播放器
    OH_AVPlayer *player = OH_AVPlayer_Create();
    mainPlayer = player;
    if (player != nullptr) {
        // 设置播放器回调方法
        AVPlayerCallback callback = {&AVPlayerOnInfo, &AVPlayerOnError};
        OH_AVPlayer_SetPlayerCallback(player, callback);
        // 设置播放器播放速率
        OH_AVPlayer_SetPlaybackSpeed(player, AV_SPEED_FORWARD_1_00_X);
        // 设置hls播放器使用的码率
        OH_AVPlayer_SelectBitRate(player, PARAM_10);
        // 设置循环播放
        OH_AVPlayer_SetLooping(player, true);
        // 设置播放画面窗口
        GLuint textureId = PARAM_0;
        glGenTextures(ONEVAL, &textureId);
        OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        OHNativeWindow *window = OH_NativeImage_AcquireNativeWindow(image);
        if (window != nullptr) {
            OH_AVPlayer_SetVideoSurface(player, window);
        }
        // 设置播放器的音量
        OH_AVPlayer_SetVolume(player, PARAM_1F, PARAM_1F);
    }
    return player;
}

static napi_value OhAvPlayerSetFdPathIndex(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int index;
    napi_get_value_int32(env, args[PARAM_0], &index);
    std::string filePath = FileList[index];
    int fileDescribe = open(filePath.c_str(), O_RDONLY, 0666);
    if (mainPlayer == nullptr) {
        mainPlayer = OH_AVPlayer_Create();
    }
    int64_t fileSize = GetFileSize(filePath.c_str());
    OH_AVErrCode avErrCode = OH_AVPlayer_SetFDSource(mainPlayer, fileDescribe, PARAM_0, fileSize);
    napi_create_int32(env, avErrCode, &result);
    g_avInfoTypeStateChange = false;
    g_fileDesc = fileDescribe;
    return result;
}
// 创建播放器
static napi_value OhAvPlayerCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVPlayer *player = GetAVPlayer();
    if (player == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

// 设置本地路径
static napi_value OhAvPlayerSetFdPathSource(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(PATH.c_str(), O_RDONLY, 0666);
    napi_value result = nullptr;
    if (mainPlayer == nullptr) {
        mainPlayer = OH_AVPlayer_Create();
    }
    int64_t fileSize = GetFileSize(PATH.c_str());
    OH_AVErrCode avErrCode = OH_AVPlayer_SetFDSource(mainPlayer, fileDescribe, PARAM_0, fileSize);
    napi_create_int32(env, avErrCode, &result);
    g_avInfoTypeStateChange = false;
    g_fileDesc = fileDescribe;
    return result;
}

// 设置本地路径
static napi_value OhAvPlayerSetFdPathSourceTwo(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(OHERPATH.c_str(), O_RDONLY, 0666);
    napi_value result = nullptr;
    if (mainPlayer == nullptr) {
        mainPlayer = OH_AVPlayer_Create();
    }
    int64_t fileSize = GetFileSize(OHERPATH.c_str());
    OH_AVErrCode avErrCode = OH_AVPlayer_SetFDSource(mainPlayer, fileDescribe, PARAM_0, fileSize);
    napi_create_int32(env, avErrCode, &result);
    g_avInfoTypeStateChange = false;
    g_fileDesc = fileDescribe;
    return result;
}

static napi_value OhCloseFile(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_fileDesc > 0) {
        close(g_fileDesc);
        g_fileDesc = 0;
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 准备播放环境，异步缓存媒体数据
static napi_value OhAvPlayerPrepare(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    OH_AVErrCode avErrCode = OH_AVPlayer_Prepare(mainPlayer);
    napi_create_int32(env, avErrCode, &result);
    g_avInfoTypeStateChange = false;
    return result; // 返回0
}

// 获取媒体文件的总时长，精确到毫秒
static napi_value OhAvPlayerGetDuration(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t duration;
    OH_AVErrCode avErrCode = OH_AVPlayer_GetDuration(mainPlayer, &duration);
    if (avErrCode == AV_ERR_OK) {
        napi_create_int32(env, avErrCode, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

// 开始播放
static napi_value OhAvPlayerPlay(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode errCode = OH_AVPlayer_Play(mainPlayer);
    napi_create_int32(env, errCode, &result);
    g_avInfoTypeStateChange = false;
    return result;
}

// 判断播放器是否在播放
static napi_value OhAvPlayerIsPlaying(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVPlayer_Play(mainPlayer);
    bool isPlaying = OH_AVPlayer_IsPlaying(mainPlayer);
    if (isPlaying) {
        napi_create_int32(env, ONEVAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

// 获取播放位置，精确到毫秒
static napi_value OhAvPlayerGetCurrentTime(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t currentTime = -1;
    OH_AVErrCode avErrCode = OH_AVPlayer_GetCurrentTime(mainPlayer, &currentTime);
    if (avErrCode == AV_ERR_OK) {
        napi_create_int32(env, avErrCode, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 暂停播放
static napi_value OhAvPlayerPause(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode errCode = OH_AVPlayer_Pause(mainPlayer);
    napi_create_int32(env, errCode, &result);
    g_avInfoTypeStateChange = false;
    return result;
}

 //获取当前播放状态
static napi_value OhAvPlayerGetState(napi_env env, napi_callback_info info)
{
    const int32_t kMaxSleepAttempts = 4;
    int32_t gSleepTotalTime = 0;
    while (!g_avInfoTypeStateChange) {
        gSleepTotalTime++;
        if (gSleepTotalTime > kMaxSleepAttempts) {
            break;
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(g_gPlaytime));
    }
    
    napi_value result = nullptr;
    AVPlayerState state;
    
    OH_AVErrCode avErrCode = OH_AVPlayer_GetState(mainPlayer, &state);
    if (avErrCode == AV_ERR_OK) {
        napi_create_int32(env, state, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

// 获取当前播放器播放速率
static napi_value OhAvPlayerGetPlaybackSpeed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    AVPlaybackSpeed speed;
    OH_AVErrCode avErrCode = OH_AVPlayer_GetPlaybackSpeed(mainPlayer, &speed);
    if (avErrCode == AV_ERR_OK) {
        napi_create_int32(env, avErrCode, &result);
    }

    return result;
}

// 判断是否循环播放
static napi_value OhAvPlayerIsLooping(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool isPlaying = OH_AVPlayer_IsLooping(mainPlayer);
   
    napi_create_int32(env, isPlaying, &result);
    return result;
}

// 获取当前有效的轨道索引(请将其设置为准备/正在播放/暂停/完成状态)
static napi_value OhAvPlayerGetCurrentTrack(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t index1 = 0;
    OH_AVErrCode avErrCode1 = OH_AVPlayer_SelectTrack(mainPlayer, index1);
    napi_create_int32(env, avErrCode1, &result);
    return result;
    int32_t trackType = 10;
    int32_t index2;
    OH_AVErrCode avErrCode = OH_AVPlayer_GetCurrentTrack(mainPlayer, trackType, &index2);
    if (avErrCode == AV_ERR_OK) {
        napi_create_int32(env, index2, &result);
    }
    return result;
}


// 获取视频高度
static napi_value OhAvPlayerGetVideoHeight(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t height;
    OH_AVErrCode avErrCode = OH_AVPlayer_GetVideoHeight(mainPlayer, &height);
    if (avErrCode == AV_ERR_OK) {
        napi_create_int32(env, avErrCode, &result);
    }
    return result;
}

// 获取视频宽度
static napi_value OhAvPlayerGetVideoWidth(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width;
    OH_AVErrCode avErrCode = OH_AVPlayer_GetVideoWidth(mainPlayer, &width);
    if (avErrCode == AV_ERR_OK) {
        napi_create_int32(env, avErrCode, &result);
    }
    return result;
}

// 取消选择当前音频或字幕轨道
static napi_value OhAvPlayerDeselectTrack(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode avErrCode;
    int32_t index1 = 2;
    OH_AVPlayer_SelectTrack(mainPlayer, index1);
    avErrCode = OH_AVPlayer_DeselectTrack(mainPlayer, index1);
    napi_create_int32(env, avErrCode, &result);
    return result;
}

// 异步释放播放器资源(异步释放保证性能，但无法保证是否释放了播放画面的surfacebuffer。调用者需要保证播放画面窗口的生命周期安全)
static napi_value OhAvPlayerRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    temmpPlayer = mainPlayer;
    mainPlayer = nullptr;
    OH_AVErrCode errCode = OH_AVPlayer_Release(temmpPlayer);
    napi_create_int32(env, errCode, &result);
    g_avInfoTypeStateChange = false;
    return result;
}

//同步释放播放器资源。
static napi_value OhAvPlayerReleaseSync(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    temmpPlayer = mainPlayer;
    mainPlayer = nullptr;
    OH_AVErrCode Release = OH_AVPlayer_ReleaseSync(temmpPlayer);
    napi_create_int32(env, Release, &result);
    return result;
}

// 将播放器恢复到初始状态
static napi_value OhAvPlayerReset(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode avErrCode = OH_AVPlayer_Reset(mainPlayer); // 将播放器恢复到初始状态
    napi_create_int32(env, avErrCode, &result);
    g_avInfoTypeStateChange = false;
    return result;
}

// 改变播放位置
static napi_value OhAvPlayerSeek(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t mSeconds = getParamAtIndex(PARAM_0, env, info);
    int32_t speed = getParamAtIndex(ONEVAL, env, info);
    AVPlayerSeekMode mode;
    if (speed == 0) {
        mode == AV_SEEK_NEXT_SYNC;
    } else if (speed == 1) {
        mode = AV_SEEK_PREVIOUS_SYNC;
    } else {
        OH_AVErrCode avErrCode = AV_ERR_INVALID_VAL;
        napi_create_int32(env, avErrCode, &result);
        return result;
    }
    OH_AVErrCode avErrCode = OH_AVPlayer_Seek(mainPlayer, mSeconds, mode);
    napi_create_int32(env, avErrCode, &result);
    return result;
}

// 设置hls播放器使用的码率
static napi_value OhAvPlayerSelectBitRate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode avErrCode;
    int32_t rateValue = getParamAtIndex(0, env, info);
    if (rateValue <= 0) {
        avErrCode = AV_ERR_INVALID_VAL;
        napi_create_int32(env, avErrCode, &result);
        return result;
    }
    avErrCode = OH_AVPlayer_SelectBitRate(mainPlayer, rateValue);
    napi_create_int32(env, avErrCode, &result);
    return result;
}

// 选择音频或字幕轨道
static napi_value OhAvPlayerSelectTrack(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVPlayer_Play(mainPlayer); // 开始播放
    int32_t index = getParamAtIndex(PARAM_0, env, info);
    OH_AVErrCode avErrCode = OH_AVPlayer_SelectTrack(mainPlayer, index);
    napi_create_int32(env, avErrCode, &result);
    return result;
}
// 设置循环播放
static napi_value OhAvPlayerSetLooping(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode avErrCode;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int boolValue;
    napi_get_value_int32(env, args[PARAM_0], &boolValue);
    if (boolValue == 1 || boolValue == 0) {
        avErrCode =
            (boolValue == 1 ? OH_AVPlayer_SetLooping(mainPlayer, true) : OH_AVPlayer_SetLooping(mainPlayer, false));
        napi_create_int32(env, avErrCode, &result);
        return result;
    }
    avErrCode = AV_ERR_INVALID_VAL;
    napi_create_int32(env, AV_ERR_INVALID_VAL, &result);
    return result;
}

// 设置播放器播放速率
static napi_value OhAvPlayerSetPlaybackSpeed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    AVPlaybackSpeed avPlayerbackSpeed;
    OH_AVErrCode avErrCode;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int index;
    napi_get_value_int32(env, args[PARAM_0], &index);

    switch (index) {
    case KNUMBER1:
        avPlayerbackSpeed = AV_SPEED_FORWARD_0_75_X;
        break;
    case KNUMBER2:
        avPlayerbackSpeed = AV_SPEED_FORWARD_1_00_X;
        break;
    case KNUMBER3:
        avPlayerbackSpeed = AV_SPEED_FORWARD_1_25_X;
        break;
    case KNUMBER4:
        avPlayerbackSpeed = AV_SPEED_FORWARD_1_75_X;
        break;
    case KNUMBER5:
        avPlayerbackSpeed = AV_SPEED_FORWARD_2_00_X;
        break;
    default:
        avErrCode = AV_ERR_INVALID_VAL;
        napi_create_int32(env, avErrCode, &result);
        return result;
    }
    avErrCode = OH_AVPlayer_SetPlaybackSpeed(mainPlayer, avPlayerbackSpeed);
    napi_create_int32(env, avErrCode, &result);
    return result;
}

// 设置播放器回调方法
static napi_value OhAvPlayerSetPlayerCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    AVPlayerCallback cb = {&AVPlayerOnInfo, &AVPlayerOnError};
    OH_AVErrCode avErrCode = OH_AVPlayer_SetPlayerCallback(mainPlayer, cb);
    napi_create_int32(env, avErrCode, &result);
    return result;
}

// 设置播放画面窗口
static napi_value OhAvPlayerSetVideoSurface(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    GLuint textureId = 0;
    glGenTextures(1, &textureId);
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *window = OH_NativeImage_AcquireNativeWindow(image);
    OH_AVErrCode avErrCode = OH_AVPlayer_SetVideoSurface(mainPlayer, window);
    napi_create_int32(env, avErrCode, &result);
    return result;
}

// 设置播放器的音量
static napi_value OhAvPlayerSetVolume(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int volumeleft;
    int volumeright;
    napi_get_value_int32(env, args[0], &volumeleft);
    napi_get_value_int32(env, args[1], &volumeright);
    OH_AVErrCode avErrCode = OH_AVPlayer_SetVolume(mainPlayer, float(volumeleft / 100.0), float(volumeright / 100.0));
    napi_create_int32(env, avErrCode, &result);
    return result;
}


// 停止播放
static napi_value OhAvPlayerStop(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode oH_AVErrCode = OH_AVPlayer_Stop(mainPlayer);
    napi_create_int32(env, oH_AVErrCode, &result);
    g_avInfoTypeStateChange = false;
    return result;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OhAvPlayerCreate", nullptr, OhAvPlayerCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerPrepare", nullptr, OhAvPlayerPrepare, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerGetDuration", nullptr, OhAvPlayerGetDuration, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerPlay", nullptr, OhAvPlayerPlay, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerIsPlaying", nullptr, OhAvPlayerIsPlaying, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerGetCurrentTime", nullptr, OhAvPlayerGetCurrentTime, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OhAvPlayerPause", nullptr, OhAvPlayerPause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerGetState", nullptr, OhAvPlayerGetState, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerGetPlaybackSpeed", nullptr, OhAvPlayerGetPlaybackSpeed, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OhAvPlayerIsLooping", nullptr, OhAvPlayerIsLooping, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerGetCurrentTrack", nullptr, OhAvPlayerGetCurrentTrack, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OhAvPlayerGetVideoHeight", nullptr, OhAvPlayerGetVideoHeight, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OhAvPlayerGetVideoWidth", nullptr, OhAvPlayerGetVideoWidth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerDeselectTrack", nullptr, OhAvPlayerDeselectTrack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerRelease", nullptr, OhAvPlayerRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerReleaseSync", nullptr, OhAvPlayerReleaseSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerReset", nullptr, OhAvPlayerReset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerSeek", nullptr, OhAvPlayerSeek, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerSelectBitRate", nullptr, OhAvPlayerSelectBitRate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerSelectTrack", nullptr, OhAvPlayerSelectTrack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerSetLooping", nullptr, OhAvPlayerSetLooping, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerSetPlayerCallback", nullptr, OhAvPlayerSetPlayerCallback, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OhAvPlayerSetPlaybackSpeed", nullptr, OhAvPlayerSetPlaybackSpeed, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OhAvPlayerSetFdPathSource", nullptr, OhAvPlayerSetFdPathSource, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OhAvPlayerSetVideoSurface", nullptr, OhAvPlayerSetVideoSurface, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OhAvPlayerSetVolume", nullptr, OhAvPlayerSetVolume, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerStop", nullptr, OhAvPlayerStop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerSetFdPathIndex", nullptr, OhAvPlayerSetFdPathIndex, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OhCloseFile", nullptr, OhCloseFile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OhAvPlayerSetFdPathSourceTwo", nullptr, OhAvPlayerSetFdPathSourceTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
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
    .nm_modname = "avplayerndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}