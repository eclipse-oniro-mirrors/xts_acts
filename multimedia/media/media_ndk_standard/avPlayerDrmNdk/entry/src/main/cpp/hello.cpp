/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "napi/native_api.h"
#include "multimedia/drm_framework/native_mediakeysystem.h"
#include "multimedia/drm_framework/native_drm_common.h"
#include "multimedia/drm_framework/native_drm_err.h"
#include "multimedia/drm_framework/native_mediakeysession.h"
#include "multimedia/player_framework/avplayer.h"
#include "multimedia/player_framework/avplayer_base.h"
#include "multimedia/player_framework/native_averrors.h"
#include <cstdint>
#include <string>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <time.h>
#include <signal.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include "napi/native_api.h"
#include <cstring>
#include "multimedia/player_framework/native_avdemuxer.h"
#include "multimedia/player_framework/native_avsource.h"
#include "multimedia/player_framework/native_avcodec_base.h"
#include "multimedia/player_framework/native_avbuffer.h"
#include "multimedia/drm_framework/native_drm_common.h"
#include "multimedia/drm_framework/native_drm_err.h"
#include "multimedia/drm_framework/native_mediakeysession.h"
#include "multimedia/drm_framework/native_mediakeysystem.h"
#include "multimedia/player_framework/native_avcodec_audiocodec.h"
#include "multimedia/player_framework/native_avcodec_videodecoder.h"
#include <multimedia/player_framework/native_avcapability.h>

#include <sys/stat.h>
#include <fcntl.h>
#include <hilog/log.h>
// hilog必加的宏，不加无法打印
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // 全局domain宏，标识业务领域
#define LOG_TAG "MY_DRM"  // 全局tag宏，标识模块日志tag

#define CURLEASYGETINFO 200
#define HTTP_TIMEOUT 10

#define PATH "/data/storage/el2/base/haps/entry/files/ChinaDRMLab_Promo_210525-264-30-1080P-10000K.sm4c.ts"
#define BLUE_AREA "com.clearplay.drm"
#define YELLOW_AREA "com.wiseplay.drm"
#define DATA_UUID_LEN 16
#define DATA_BUFF_LEN 12288
#define REQUESTINFODATA                                                                                                \
    {                                                                                                                  \
        0x00, 0x00, 0x00, 0x8B, 0x70, 0x73, 0x73, 0x68, 0x00, 0x00, 0x00, 0x00, 0x3D, 0x5E, 0x6D, 0x35, 0x9B, 0x9A,    \
            0x41, 0xE8, 0xB8, 0x43, 0xDD, 0x3C, 0x6E, 0x72, 0xC4, 0x2C, 0x00, 0x00, 0x00, 0x6B, 0x7B, 0x22, 0x76,      \
            0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x22, 0x3A, 0x22, 0x56, 0x31, 0x2E, 0x30, 0x22, 0x2C, 0x22, 0x63,      \
            0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x49, 0x44, 0x22, 0x3A, 0x22, 0x64, 0x48, 0x4D, 0x74, 0x4D, 0x6A,      \
            0x59, 0x30, 0x4C, 0x54, 0x45, 0x77, 0x4F, 0x44, 0x41, 0x74, 0x59, 0x57, 0x56, 0x7A, 0x22, 0x2C, 0x22,      \
            0x6B, 0x69, 0x64, 0x73, 0x22, 0x3A, 0x5B, 0x22, 0x47, 0x2B, 0x45, 0x6B, 0x2F, 0x2B, 0x58, 0x6D, 0x55,      \
            0x6B, 0x70, 0x42, 0x48, 0x51, 0x67, 0x58, 0x59, 0x57, 0x51, 0x51, 0x49, 0x67, 0x3D, 0x3D, 0x22, 0x5D,      \
            0x2C, 0x22, 0x65, 0x6E, 0x73, 0x63, 0x68, 0x65, 0x6D, 0x61, 0x22, 0x3A, 0x22, 0x63, 0x62, 0x63, 0x31,      \
            0x22, 0x7D                                                                                                 \
    }
#define OFFLINERESPONSE                                                                                                \
    {                                                                                                                  \
        0x31, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D,    \
            0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61,      \
            0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D                   \
    }
#define ONLINERESPONSE                                                                                                 \
    {                                                                                                                  \
        0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D,    \
            0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61,      \
            0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D                   \
    }

#define CHECK_RETURN(cond, ret)                                                                                        \
    do {                                                                                                               \
        if ((cond)) {                                                                                                  \
            return ret;                                                                                                \
        }                                                                                                              \
    } while (0)
#define UNUSED_PARAMETER(P) (P)

static int64_t GetFileSize(const char *fileName) {
    int64_t fileSize = 0;
    if (fileName != nullptr) {
        struct stat st;
        int fd = open(fileName, O_RDWR);
        fstat(fd, &st);
        fileSize = st.st_size;
        close(fd);
    }
    return fileSize;
}

static const char *judge_uuid() {
    bool isSupport = OH_MediaKeySystem_IsSupported(BLUE_AREA);
    if (isSupport == 1) {
        return BLUE_AREA;
    } else {
        return YELLOW_AREA;
    }
}
int IsCallBack = 0;
void testMediaKeySystemInfo(OH_AVPlayer *play, DRM_MediaKeySystemInfo *mediaKeySystemInfo) {
    printf("\nEnter SetSystemInfo callBack!");
    printf("\ntest count = %d", mediaKeySystemInfo->psshCount);
    for (int i = 0; i < mediaKeySystemInfo->psshCount; i++) {
        printf("\nuuid[%d] = ", i);
        for (int j = 0; j < DATA_UUID_LEN; j++) {
            printf("%.2x", mediaKeySystemInfo->psshInfo[i].uuid[j]);
        }
        printf("\n pussh[%d] = ", i);
        for (int j = 0; j < mediaKeySystemInfo->psshInfo[i].dataLen; j++) {
            printf("%.2x", mediaKeySystemInfo->psshInfo[i].data[j]);
        }
    }
    IsCallBack = 0x55;
}
static napi_value Test_AVPlayer_SetMediaKeySystemInfoCallback(napi_env env, napi_callback_info info) {
    int fileDescribe = open(PATH, O_RDONLY, 0666);
    int64_t fileSize = GetFileSize(PATH);

    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    size_t inSystemLen = 0;
    char *inSystem = nullptr;
    size_t callBackLen = 0;
    char *callBack = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSystemLen);
    inSystem = new char[inSystemLen + 1];
    napi_get_value_string_utf8(env, args[0], inSystem, inSystemLen + 1, &inSystemLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &callBackLen);
    callBack = new char[callBackLen + 1];
    napi_get_value_string_utf8(env, args[1], callBack, callBackLen + 1, &callBackLen);

    OH_AVPlayer *playerHandle = OH_AVPlayer_Create();
    OH_AVPlayer *handle_ptr = nullptr;
    Player_MediaKeySystemInfoCallback callback_ptr = nullptr;
    if (0 != strcmp(inSystem, " ")) {
        handle_ptr = playerHandle;
    }
    if (0 != strcmp(callBack, " ")) {
        callback_ptr = &testMediaKeySystemInfo;
    }

    OH_AVErrCode ret1 = OH_AVPlayer_SetMediaKeySystemInfoCallback(handle_ptr, callback_ptr);
    OH_AVErrCode ret2 = OH_AVPlayer_SetFDSource(playerHandle, fileDescribe, 0, fileSize);
    OH_AVErrCode ret3 = OH_AVPlayer_Prepare(playerHandle);
    OH_AVErrCode ret4 = OH_AVPlayer_Play(playerHandle);
    OH_AVErrCode ret5 = OH_AVPlayer_Release(playerHandle);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK && ret3 == AV_ERR_OK && ret4 == AV_ERR_OK && ret5 == AV_ERR_OK) {
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Test_AVPlayer_GetMediaKeySystemInfo(napi_env env, napi_callback_info info) {
    int fileDescribe = open(PATH, O_RDONLY, 0666);
    int64_t fileSize = GetFileSize(PATH);

    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSystemLen = 0;
    char *inSystem = nullptr;
    size_t callBackLen = 0;
    char *callBack = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSystemLen);
    inSystem = new char[inSystemLen + 1];
    napi_get_value_string_utf8(env, args[0], inSystem, inSystemLen + 1, &inSystemLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &callBackLen);
    callBack = new char[callBackLen + 1];
    napi_get_value_string_utf8(env, args[1], callBack, callBackLen + 1, &callBackLen);

    OH_AVPlayer *playerHandle = OH_AVPlayer_Create();
    if (playerHandle == nullptr) {
        napi_create_int32(env, AV_ERR_INVALID_VAL, &result);
        return result;
    }
    IsCallBack = 0;
    OH_AVErrCode ret1 = OH_AVPlayer_SetMediaKeySystemInfoCallback(playerHandle, &testMediaKeySystemInfo);
    OH_AVErrCode ret2 = OH_AVPlayer_SetFDSource(playerHandle, fileDescribe, 0, fileSize);
    OH_AVErrCode ret3 = OH_AVPlayer_Prepare(playerHandle);
    OH_AVErrCode ret4 = OH_AVPlayer_Play(playerHandle);
    sleep(5);
    DRM_MediaKeySystemInfo getInfo;
    memset(&getInfo, 0, sizeof(DRM_MediaKeySystemInfo));
    OH_AVPlayer *handle_ptr = nullptr;
    DRM_MediaKeySystemInfo *info_ptr = nullptr;
    if (0 != strcmp(inSystem, " ")) {
        handle_ptr = playerHandle;
    }
    if (0 != strcmp(callBack, " ")) {
        info_ptr = &getInfo;
    }
    OH_AVErrCode ret5 = AV_ERR_INVALID_VAL;
    if (IsCallBack == 0x55) {
        IsCallBack = 0;
        ret5 = OH_AVPlayer_GetMediaKeySystemInfo(handle_ptr, info_ptr);
        printf("psshCount = %d\n", getInfo.psshCount);
        for (int i = 0; i < DATA_UUID_LEN; i++) {
            printf("psshinfo.uuid = %x\n", getInfo.psshInfo[0].uuid[i]);
        }
        printf("psshinfo.dateLen = %x\n", getInfo.psshInfo[0].dataLen);
        for (int j = 0; j < getInfo.psshInfo[0].dataLen; j++) {
            printf("psshinfo.date = %x\n", getInfo.psshInfo[0].data[j]);
        }
    }
    OH_AVErrCode ret6 = OH_AVPlayer_Release(playerHandle);

    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK && ret3 == AV_ERR_OK && ret4 == AV_ERR_OK && ret5 == AV_ERR_OK &&
        ret6 == AV_ERR_OK) {
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Test_AVPlayer_SetDecryptionConfig(napi_env env, napi_callback_info info) {
    int fileDescribe = open(PATH, O_RDONLY, 0666);
    int64_t fileSize = GetFileSize(PATH);

    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSystemLen = 0;
    char *inSystem = nullptr;
    size_t callBackLen = 0;
    char *callBack = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &inSystemLen);
    inSystem = new char[inSystemLen + 1];
    napi_get_value_string_utf8(env, args[0], inSystem, inSystemLen + 1, &inSystemLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &callBackLen);
    callBack = new char[callBackLen + 1];
    napi_get_value_string_utf8(env, args[1], callBack, callBackLen + 1, &callBackLen);

    OH_AVPlayer *playerHandle = OH_AVPlayer_Create();
    OH_AVErrCode ret1 = OH_AVPlayer_SetMediaKeySystemInfoCallback(playerHandle, &testMediaKeySystemInfo);
    OH_AVErrCode ret2 = OH_AVPlayer_SetFDSource(playerHandle, fileDescribe, 0, fileSize);

    MediaKeySystem *drmKeySystem = nullptr;
    Drm_ErrCode ret3 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    UNUSED_PARAMETER(ret3);
    MediaKeySession *drmKeySession = nullptr;
    DRM_ContentProtectionLevel contentProtectionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    Drm_ErrCode ret5 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &contentProtectionLevel, &drmKeySession);
    UNUSED_PARAMETER(ret5);
    uint8_t keyData[DATA_BUFF_LEN] = {0};
    int32_t keyDataLen = DATA_BUFF_LEN;

    bool secureVideoPath = false;
    Drm_ErrCode ret6 = OH_MediaKeySession_RequireSecureDecoderModule(drmKeySession, "video/mp4", &secureVideoPath);
    OH_AVErrCode ret7 = OH_AVPlayer_SetDecryptionConfig(playerHandle, drmKeySession, secureVideoPath);
    OH_AVErrCode ret8 = OH_AVPlayer_Prepare(playerHandle);
    OH_AVErrCode ret9 = OH_AVPlayer_Play(playerHandle);
    OH_AVErrCode ret10 = OH_AVPlayer_Release(playerHandle);
    Drm_ErrCode ret11 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret12 = OH_MediaKeySystem_Destroy(drmKeySystem);
    UNUSED_PARAMETER(ret11);
    UNUSED_PARAMETER(ret12);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK && ret6 == DRM_ERR_OK && ret7 == AV_ERR_OK && ret8 == AV_ERR_OK &&
        ret9 == AV_ERR_OK && ret10 == AV_ERR_OK) {
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value test(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t inSystemLen = 0;
    char *inSystem = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    //
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    //     double value0 = 0;
    //     napi_get_value_double(env, args[0], &value0);
    //
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &inSystemLen);
    inSystem = new char[inSystemLen + 1];
    napi_get_value_string_utf8(env, args[1], inSystem, inSystemLen + 1, &inSystemLen);

    int32_t value1 = 5;
    if (strcmp(inSystem, " ") != 0) {
        value1 = 32;
    }
    napi_value sum;
    napi_create_int32(env, value1, &sum);
    return sum;
}

static napi_value Test_AudioCodec_SetDecryptionConfig(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t argc_oneLen = 0;
    char *argc_one = nullptr;
    size_t argc_twoLen = 0;
    char *argc_two = nullptr;
    uint32_t argc_three;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &argc_oneLen);
    argc_one = new char[argc_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], argc_one, argc_oneLen + 1, &argc_oneLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &argc_twoLen);
    argc_two = new char[argc_twoLen + 1];
    napi_get_value_string_utf8(env, args[1], argc_two, argc_twoLen + 1, &argc_twoLen);
    napi_get_value_uint32(env, args[2], &argc_three);
    OH_AVCodec *handle = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.AAC");
    if (handle == nullptr) {
        OH_LOG_ERROR(LOG_APP, "testCL_AudioCodec handle is nullptr!");
        ret = AV_ERR_INVALID_VAL;
    } else {
        MediaKeySystem *drmKeySystem = nullptr;
        MediaKeySession *drmKeySession = nullptr;
        DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
        Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
        Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
        bool isSecureAudio = false;
        OH_AVCodec *handle_ptr = nullptr;
        if (0 != strcmp(argc_one, " ")) {
            handle_ptr = handle;
        }
        MediaKeySession *session_ptr = nullptr;
        if (0 != strcmp(argc_two, " ")) {
            session_ptr = drmKeySession;
        }
        isSecureAudio = (bool)argc_three;
        OH_AVErrCode ret3 = OH_AudioCodec_SetDecryptionConfig(handle_ptr, session_ptr, isSecureAudio);
        OH_AVErrCode ret4 = OH_AudioCodec_Destroy(handle);
        Drm_ErrCode ret5 = OH_MediaKeySession_Destroy(drmKeySession);
        Drm_ErrCode ret6 = OH_MediaKeySystem_Destroy(drmKeySystem);
        if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == AV_ERR_OK && ret4 == AV_ERR_OK && ret5 == DRM_ERR_OK &&
            ret6 == DRM_ERR_OK) {
            ret = AV_ERR_OK;
        } else {
            ret = AV_ERR_INVALID_VAL;
        }
    }
    OH_LOG_INFO(LOG_APP, "xx success ret is %{public}d", ret);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Test_VideoDecoder_SetDecryptionConfig(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t argc_oneLen = 0;
    char *argc_one = nullptr;
    size_t argc_twoLen = 0;
    char *argc_two = nullptr;
    uint32_t argc_three;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &argc_oneLen);
    argc_one = new char[argc_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], argc_one, argc_oneLen + 1, &argc_oneLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &argc_twoLen);
    argc_two = new char[argc_twoLen + 1];
    napi_get_value_string_utf8(env, args[1], argc_two, argc_twoLen + 1, &argc_twoLen);
    napi_get_value_uint32(env, args[2], &argc_three);

    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *handle = OH_VideoDecoder_CreateByName(name);
    if (handle == nullptr) {
        OH_LOG_ERROR(LOG_APP, "testCL_VideoDecoder handle is nullptr!");
        ret = AV_ERR_INVALID_VAL;
    } else {
        MediaKeySystem *drmKeySystem = nullptr;
        MediaKeySession *drmKeySession = nullptr;
        DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
        Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
        Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem, &sessionLevel, &drmKeySession);
        bool isSecureAudio = false;
        OH_AVCodec *handle_ptr = nullptr;
        if (0 != strcmp(argc_one, " ")) {
            handle_ptr = handle;
        }
        MediaKeySession *session_ptr = nullptr;
        if (0 != strcmp(argc_two, " ")) {
            session_ptr = drmKeySession;
        }
        isSecureAudio = (bool)argc_three;
        OH_AVErrCode ret3 = OH_VideoDecoder_SetDecryptionConfig(handle_ptr, session_ptr, isSecureAudio);
        OH_AVErrCode ret4 = OH_VideoDecoder_Destroy(handle);
        Drm_ErrCode ret5 = OH_MediaKeySession_Destroy(drmKeySession);
        Drm_ErrCode ret6 = OH_MediaKeySystem_Destroy(drmKeySystem);
        if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK && ret3 == AV_ERR_OK && ret4 == AV_ERR_OK && ret5 == DRM_ERR_OK &&
            ret6 == DRM_ERR_OK) {
            ret = AV_ERR_OK;
        } else {
            ret = AV_ERR_INVALID_VAL;
        }
    }
    OH_LOG_INFO(LOG_APP, "xx success ret is %{public}d", ret);
    napi_create_int32(env, ret, &result);
    return result;
}
// DRM信息监听回调OnDrmInfoChanged实现
static void OnDrmInfoChanged(DRM_MediaKeySystemInfo *drmInfo) { OH_LOG_DEBUG(LOG_APP, "Enter OnDrmInfoChanged!"); }
static napi_value TestAVDemuxer_SetMediaKeySystemInfoCallback(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t args_oneLen = 0;
    char *args_one = nullptr;
    size_t args_twoLen = 0;
    char *args_two = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &args_oneLen);
    args_one = new char[args_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], args_one, args_oneLen + 1, &args_oneLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &args_twoLen);
    args_two = new char[args_twoLen + 1];
    napi_get_value_string_utf8(env, args[1], args_two, args_twoLen + 1, &args_twoLen);
    OH_AVSource *source = nullptr;

    int fileDescribe = open(PATH, O_RDONLY, 0666);
    int64_t fileSize = GetFileSize(PATH);

    if (judge_uuid() == BLUE_AREA) {
        napi_create_int32(env, AV_ERR_OK, &result);
        return result;
    } else {
        source = OH_AVSource_CreateWithFD(fileDescribe, 0, fileSize);
    }
    if (source == nullptr) {
        napi_create_int32(env, -2, &result); // 异常result
        return result;
    }
    // 为资源对象创建对应的解封装器
    OH_AVDemuxer *hdemuxer = OH_AVDemuxer_CreateWithSource(source);
    if (hdemuxer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "create demuxer failed");
        napi_create_int32(env, -3, &result); // 异常result
        return result;
    }
    DRM_MediaKeySystemInfoCallback callback = &OnDrmInfoChanged;
    OH_AVDemuxer *handle_ptr = nullptr;
    if (0 != strcmp(args_one, " ")) {
        handle_ptr = hdemuxer;
    }
    DRM_MediaKeySystemInfoCallback callback_ptr = nullptr;
    if (0 != strcmp(args_two, " ")) {
        callback_ptr = callback;
    }
    OH_AVErrCode ret1 = OH_AVDemuxer_SetMediaKeySystemInfoCallback(handle_ptr, callback_ptr);
    OH_AVErrCode ret2 = OH_AVDemuxer_Destroy(hdemuxer);

    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK) {
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

// DRM信息监听回调OnDrmInfoChangedWithObj实现
static void OnDrmInfoChangedWithObj(OH_AVDemuxer *demuxer, DRM_MediaKeySystemInfo *drmInfo) {
    OH_LOG_DEBUG(LOG_APP, "Enter OnDrmInfoChangedWithObj!");
}
static napi_value TestAVDemuxer_SetDemuxerMediaKeySystemInfoCallback(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t args_oneLen = 0;
    char *args_one = nullptr;
    size_t args_twoLen = 0;
    char *args_two = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &args_oneLen);
    args_one = new char[args_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], args_one, args_oneLen + 1, &args_oneLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &args_twoLen);
    args_two = new char[args_twoLen + 1];
    napi_get_value_string_utf8(env, args[1], args_two, args_twoLen + 1, &args_twoLen);

    napi_create_int32(env, -1, &result); // 异常result
    OH_AVSource *source = nullptr;

    int fileDescribe = open(PATH, O_RDONLY, 0666);
    int64_t fileSize = GetFileSize(PATH);

    if (judge_uuid() == BLUE_AREA) {
        napi_create_int32(env, AV_ERR_OK, &result);
        return result;
    } else {
        source = OH_AVSource_CreateWithFD(fileDescribe, 0, fileSize);
    }
    if (source == nullptr) {
        OH_LOG_ERROR(LOG_APP, "create source failed");
        return result;
    }
    // 为资源对象创建对应的解封装器
    OH_AVDemuxer *hdemuxer = OH_AVDemuxer_CreateWithSource(source);
    if (hdemuxer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "create demuxer failed");
        return result;
    }
    Demuxer_MediaKeySystemInfoCallback callback = &OnDrmInfoChangedWithObj;
    OH_AVDemuxer *handle_ptr = nullptr;
    if (0 != strcmp(args_one, " ")) {
        handle_ptr = hdemuxer;
    }
    Demuxer_MediaKeySystemInfoCallback callback_ptr = nullptr;
    if (0 != strcmp(args_two, " ")) {
        callback_ptr = callback;
    }
    OH_AVErrCode ret1 = OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallback(handle_ptr, callback_ptr);
    OH_AVErrCode ret2 = OH_AVDemuxer_Destroy(hdemuxer);

    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK) {
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value TestAVDemuxer_GetMediaKeySystemInfo(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t args_oneLen = 0;
    char *args_one = nullptr;
    size_t args_twoLen = 0;
    char *args_two = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &args_oneLen);
    args_one = new char[args_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], args_one, args_oneLen + 1, &args_oneLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &args_twoLen);
    args_two = new char[args_twoLen + 1];
    napi_get_value_string_utf8(env, args[1], args_two, args_twoLen + 1, &args_twoLen);

    napi_create_int32(env, -1, &result); // 异常result

    OH_AVSource *source = nullptr;

    int fileDescribe = open(PATH, O_RDONLY, 0666);
    int64_t fileSize = GetFileSize(PATH);

    if (judge_uuid() == BLUE_AREA) {
        napi_create_int32(env, AV_ERR_OK, &result);
        return result;
    } else {
        source = OH_AVSource_CreateWithFD(fileDescribe, 0, fileSize);
    }
    if (source == nullptr) {
        OH_LOG_ERROR(LOG_APP, "create source failed");
        return result;
    }

    // 为资源对象创建对应的解封装器
    OH_AVDemuxer *hdemuxer = OH_AVDemuxer_CreateWithSource(source);
    if (hdemuxer == nullptr) {
        OH_LOG_ERROR(LOG_APP, "create demuxer failed");
        return result;
    }
    Demuxer_MediaKeySystemInfoCallback callback = &OnDrmInfoChangedWithObj;
    OH_AVErrCode ret1 = OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallback(hdemuxer, callback);
    DRM_MediaKeySystemInfo mediaKeySystemInfo;
    memset(&mediaKeySystemInfo, 0x00, sizeof(DRM_MediaKeySystemInfo));
    OH_AVDemuxer *handle_ptr = nullptr;
    if (0 != strcmp(args_one, " ")) {
        handle_ptr = hdemuxer;
    }
    DRM_MediaKeySystemInfo *callback_ptr = nullptr;
    if (0 != strcmp(args_two, " ")) {
        callback_ptr = &mediaKeySystemInfo;
    }
    OH_AVErrCode ret2 = OH_AVDemuxer_GetMediaKeySystemInfo(handle_ptr, callback_ptr);
    if ((ret2 == AV_ERR_OK) && (callback_ptr != nullptr)) {
        OH_LOG_ERROR(LOG_APP, "GetMediaKeySystemInfo count %d", mediaKeySystemInfo.psshCount);
        for (uint32_t i = 0; i < mediaKeySystemInfo.psshCount; i++) {
            OH_LOG_ERROR(LOG_APP, "GetMediaKeySystemInfo print");
            const uint32_t uuidLen = 16;
            for (uint32_t index = 0; index < uuidLen; index++) {
                OH_LOG_ERROR(LOG_APP, "GetMediaKeySystemInfo print uuid %x \n",
                             mediaKeySystemInfo.psshInfo[i].uuid[index]);
            }
            OH_LOG_ERROR(LOG_APP, "GetMediaKeySystemInfo print pssh length %d \n",
                         mediaKeySystemInfo.psshInfo[i].dataLen);
            for (uint32_t k = 0; k < mediaKeySystemInfo.psshInfo[i].dataLen; k++) {
                unsigned char *pssh = static_cast<unsigned char *>(mediaKeySystemInfo.psshInfo[i].data);
                OH_LOG_ERROR(LOG_APP, "GetMediaKeySystemInfo print pssh %x \n", pssh[k]);
            }
        }
    }

    OH_AVErrCode ret3 = OH_AVDemuxer_Destroy(hdemuxer);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK && ret3 == AV_ERR_OK) {
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"Test_AVPlayer_SetMediaKeySystemInfoCallback", nullptr, Test_AVPlayer_SetMediaKeySystemInfoCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_AVPlayer_GetMediaKeySystemInfo", nullptr, Test_AVPlayer_GetMediaKeySystemInfo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Test_AVPlayer_SetDecryptionConfig", nullptr, Test_AVPlayer_SetDecryptionConfig, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Test_AudioCodec_SetDecryptionConfig", nullptr, Test_AudioCodec_SetDecryptionConfig, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Test_VideoDecoder_SetDecryptionConfig", nullptr, Test_VideoDecoder_SetDecryptionConfig, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"TestAVDemuxer_SetMediaKeySystemInfoCallback", nullptr, TestAVDemuxer_SetMediaKeySystemInfoCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"TestAVDemuxer_SetDemuxerMediaKeySystemInfoCallback", nullptr,
         TestAVDemuxer_SetDemuxerMediaKeySystemInfoCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestAVDemuxer_GetMediaKeySystemInfo", nullptr, TestAVDemuxer_GetMediaKeySystemInfo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
