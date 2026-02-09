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

#include "napi/native_api.h"
#include <arpa/nameser.h>
#include <fcntl.h>
#include <map>
#include <js_native_api.h>
#include "multimedia/player_framework/avplayer.h"
#include "multimedia/player_framework/avplayer_base.h"
#include "multimedia/player_framework/avtranscoder.h"
#include "multimedia/player_framework/avtranscoder_base.h"
#include "multimedia/player_framework/native_averrors.h"
#include "multimedia/player_framework/native_avcodec_base.h"
#include "native_window/external_window.h"
#include "native_image/native_image.h"
#include "GLES3/gl32.h"
#include "EGL/egl.h"
#include <sys/stat.h>
#include <fstream>
#include <unistd.h>
#include <hilog/log.h>
#include <thread>
#include <vector>
#include <string>
#include <future>
#include <chrono>

#define FAIL (-1)
#define SUCCESS 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define PARAM_5 5
#define PARAM_6 6
#define PARAM_0666 0666
#define LOG_MSG_TAG "AVTransCoderNdk"
#define LOG(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGE(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))
#define LOGD(format, ...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, 0xFF00, LOG_MSG_TAG, format, ##__VA_ARGS__))

#define DST_ERROR_PATH "/data/storage/el2/base/files/dst_error.mp4"

static int32_t g_gDelytime100 = 100;
static int32_t g_gDelytime200 = 200;

const int32_t DEFAULT_AUDIOBITRATE = 200000;
const int32_t DEFAULT_VIDEOBITRATE = 3000000;
const int32_t DEFAULT_WIDTH = 720;
const int32_t DEFAULT_HEIGTH = 480;
const int32_t MAX_PROGRESS = 100;

typedef struct NdkAVTransCoderUser {
    using StateChangeFunc = std::function<void()>;

    NdkAVTransCoderUser();
    NdkAVTransCoderUser(const NdkAVTransCoderUser &other) = delete;
    NdkAVTransCoderUser& operator=(const NdkAVTransCoderUser &other) = delete;
    ~NdkAVTransCoderUser();

    void OnStateChangeCb(OH_AVTranscoder *transcoder, OH_AVTranscoder_State state);
    void OnErrorCb(OH_AVTranscoder *transcoder, int32_t errorCode, const char *errorMsg);
    void OnProgressUpdateCb(OH_AVTranscoder *transcoder, int curProgress);
    void InitTransCoder(int32_t srcFd, int64_t offset, int64_t length, int32_t dstFd);
    std::map<uint32_t, StateChangeFunc> stateChangeFuncs_;

    OH_AVTranscoder *transcoder = nullptr;
    OH_AVTranscoder_Config *config = nullptr;
    int32_t errorCode = AV_ERR_UNKNOWN;
    int32_t callbackError = AV_ERR_UNKNOWN;
    int32_t returnError = AV_ERR_UNKNOWN;
    OH_AVTranscoder_State transCoderState = AVTRANSCODER_PREPARED;
    int progress = 0;
    int inStartStateCount = 0;
} NdkAVTransCoderUser;
NdkAVTransCoderUser::NdkAVTransCoderUser()
{
}
NdkAVTransCoderUser::~NdkAVTransCoderUser()
{
    if (this->transcoder != nullptr) {
        OH_AVTranscoder_Release(this->transcoder);
        this->transcoder = nullptr;
    }
    if (this->config != nullptr) {
        OH_AVTranscoderConfig_Release(this->config);
        this->config = nullptr;
    }
}
static void AvTransCoderStateChangeCbImpl(OH_AVTranscoder *transcoder, OH_AVTranscoder_State state, void *userData)
{
    LOG("AvTransCoderStateChangeCbImpl state: %{public}d", state);
    NdkAVTransCoderUser *ndkAVTransCoderUser = reinterpret_cast<NdkAVTransCoderUser *>(userData);
    if (ndkAVTransCoderUser == nullptr || transcoder == nullptr) {
        LOGE("AvTransCoderStateChangeCbImpl ndkAVTransCoderUser or transcoder is nullptr");
        return;
    }
    ndkAVTransCoderUser->OnStateChangeCb(transcoder, state);
}

static void AvTransCoderErrorCbImpl(OH_AVTranscoder *transcoder, int32_t errorCode, const char *errorMsg,
    void *userData)
{
    LOG("AvTransCoderErrorCbImpl errorCode: %{public}d, errorMsg: %{public}s", errorCode,
        errorMsg == nullptr ? "unknown" : errorMsg);
    NdkAVTransCoderUser *ndkAVTransCoderUser = reinterpret_cast<NdkAVTransCoderUser *>(userData);
    if (ndkAVTransCoderUser == nullptr || transcoder == nullptr) {
        LOGE("AvTransCoderErrorCbImpl ndkAVTransCoderUser or transcoder is nullptr");
        return;
    }
    ndkAVTransCoderUser->OnErrorCb(transcoder, errorCode, errorMsg);
}
static void AvTransCoderProgressUpdateCbImpl(OH_AVTranscoder *transcoder, int progress, void *userData)
{
    LOG("AvTransCoderProgressUpdateCbImpl progress: %{public}d", progress);
    NdkAVTransCoderUser *ndkAVTransCoderUser = reinterpret_cast<NdkAVTransCoderUser *>(userData);
    if (ndkAVTransCoderUser == nullptr || transcoder == nullptr) {
        LOGE("AvTransCoderProgressUpdateCbImpl ndkAVTransCoderUser or transcoder is nullptr");
        return;
    }
    ndkAVTransCoderUser->OnProgressUpdateCb(transcoder, progress);
}
void NdkAVTransCoderUser::InitTransCoder(int32_t srcFd, int64_t offset, int64_t length, int32_t dstFd)
{
    this->transcoder = OH_AVTranscoder_Create();
    if (transcoder == nullptr) {
        LOGE("NdkAVTransCoderUser InitTransCoder transcoder is nullptr");
        return;
    }
    OH_AVTranscoder_SetStateCallback(transcoder, AvTransCoderStateChangeCbImpl, this);
    OH_AVTranscoder_SetErrorCallback(transcoder, AvTransCoderErrorCbImpl, this);
    OH_AVTranscoder_SetProgressUpdateCallback(transcoder, AvTransCoderProgressUpdateCbImpl, this);

    this->config = OH_AVTranscoderConfig_Create();
    if (this->config == nullptr) {
        LOGE("NdkAVTransCoderUser InitTransCoder OH_AVTranscoderConfig_Create failed");
        return;
    }
    OH_AVTranscoderConfig_SetSrcFD(config, srcFd, offset, length);
    OH_AVTranscoderConfig_SetDstFD(this->config, dstFd);
    OH_AVTranscoderConfig_SetDstFileType(this->config, AV_OUTPUT_FORMAT_MPEG_4);
}

void NdkAVTransCoderUser::OnProgressUpdateCb(OH_AVTranscoder *transcoder, int curProgress)
{
    LOG("NdkAVTransCoderUser OnProgressUpdateCb progress: %{public}d", curProgress);
    this->progress = curProgress;
}

void NdkAVTransCoderUser::OnErrorCb(OH_AVTranscoder *transcoder, int32_t errorCode, const char *errorMsg)
{
    LOG("NdkAVTransCoderUser OnErrorCb errorCode: %{public}d ,errorMsg: %{public}s",
        errorCode, errorMsg == nullptr ? "unknown" : errorMsg);
    this->errorCode = errorCode;
    this->callbackError = errorCode;
}

void NdkAVTransCoderUser::OnStateChangeCb(OH_AVTranscoder *transcoder, OH_AVTranscoder_State state)
{
    this->transCoderState = state;
    if (transcoder == nullptr) {
        return;
    }
    int32_t ret = -1;
    switch (state) {
    case AVTRANSCODER_PREPARED: {
        this->transCoderState = AVTRANSCODER_PREPARED;
        LOG("OnStateChangeCb OH_AVTranscoder_State AVTRANSCODER_STARTED");
        if (this->stateChangeFuncs_.count(AVTRANSCODER_PREPARED) > 0) {
            this->stateChangeFuncs_[AVTRANSCODER_PREPARED]();
        }
        break;
    }
    case AVTRANSCODER_STARTED: {
        this->transCoderState = AVTRANSCODER_STARTED;
        LOG("OnStateChangeCb OH_AVTranscoder_State AVTRANSCODER_STARTED");
        if (this->stateChangeFuncs_.count(AVTRANSCODER_STARTED) > 0) {
            this->stateChangeFuncs_[AVTRANSCODER_STARTED]();
        }
        break;
    }
    case AVTRANSCODER_PAUSED: {
        this->transCoderState = AVTRANSCODER_PAUSED;
        if (this->stateChangeFuncs_.count(AVTRANSCODER_PAUSED) > 0) {
            this->stateChangeFuncs_[AVTRANSCODER_PAUSED]();
        }
        LOG("OnStateChangeCb OH_AVTranscoder_State AVTRANSCODER_PAUSED");
        break;
    }
    case AVTRANSCODER_CANCELLED: {
        this->transCoderState = AVTRANSCODER_CANCELLED;
        if (this->stateChangeFuncs_.count(AVTRANSCODER_CANCELLED) > 0) {
            this->stateChangeFuncs_[AVTRANSCODER_CANCELLED]();
        }
        LOG("OnStateChangeCb OH_AVTranscoder_State AVTRANSCODER_CANCELLED");
        break;
    }
    case AVTRANSCODER_COMPLETED: {
        this->transCoderState = AVTRANSCODER_COMPLETED;
        if (this->stateChangeFuncs_.count(AVTRANSCODER_COMPLETED) > 0) {
            this->stateChangeFuncs_[AVTRANSCODER_COMPLETED]();
        }
        LOG("OnStateChangeCb OH_AVTranscoder_State AVTRANSCODER_COMPLETED");
        break;
    }
    default:
        break;
    }
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

void parseBasicArgs(napi_env env, napi_callback_info info,
    int32_t *srcFd, int64_t *srcOffset, int64_t *length, int32_t *dstFd)
{
    size_t argc = PARAM_4;
    napi_value args[PARAM_4] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[PARAM_0], srcFd);
    napi_get_value_int64(env, args[PARAM_1], srcOffset);
    napi_get_value_int64(env, args[PARAM_2], length);
    napi_get_value_int32(env, args[PARAM_3], dstFd);
}
int32_t waitAvTransCoderStateChange(NdkAVTransCoderUser *transcoderUser, OH_AVTranscoder_State state)
{
    while (state != transcoderUser->transCoderState) {
        std::this_thread::sleep_for(std::chrono::milliseconds(g_gDelytime100));
        LOG("waitAvTransCoderStateChange currentState:%{public}d", transcoderUser->transCoderState);
        if (transcoderUser->callbackError != AV_ERR_UNKNOWN && transcoderUser->callbackError != AV_ERR_OK) {
            LOGE("waitAvTransCoderStateChange errorCode:%{public}d", transcoderUser->callbackError);
            return transcoderUser->callbackError;
        }
    }
    return SUCCESS;
}

static void SetInt32NamedProperty(napi_env env, napi_value object, const char* key, int32_t value)
{
    napi_value temp = nullptr;
    napi_create_int32(env, value, &temp);
    napi_set_named_property(env, object, key, temp);
    return;
}

static void SetUserNamedProperty(napi_env env, napi_value object, const char* key, NdkAVTransCoderUser **transcoderUser)
{
    napi_value temp = nullptr;
    napi_create_external(env, reinterpret_cast<void *>(*transcoderUser), nullptr, nullptr, &temp);
    napi_set_named_property(env, object, "userData", temp);
    return;
}

static napi_value OhAvTransCoderNdkTest(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    parseBasicArgs(env, info, &srcFd, &srcOffset, &length, &dstFd);

    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    OH_AVErrCode errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    if (errCode != AV_ERR_OK) {
        napi_get_undefined(env, &result);
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
    if (errCode != AV_ERR_OK) {
        napi_get_undefined(env, &result);
        delete transcoderUser;
        return result;
    }
    napi_create_external(env, reinterpret_cast<void *>(transcoderUser), nullptr, nullptr, &result);
    return result;
}

static napi_value OhCheckAvTransCoderComplete(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[0], &ptr);
    NdkAVTransCoderUser *transcoderUser = reinterpret_cast<NdkAVTransCoderUser *>(ptr);
    if (AVTRANSCODER_COMPLETED == transcoderUser->transCoderState) {
        LOGE("OhCheckAvTransCoderComplete transCoderState is AVTRANSCODER_COMPLETED");
        backParam = SUCCESS;
        delete transcoderUser;
        transcoderUser = nullptr;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvTransCoderNdkSetResolutionError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;

    size_t argc = PARAM_5;
    napi_value args[PARAM_5] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t srcFd = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &srcFd);
    int64_t srcOffset = PARAM_0;
    napi_get_value_int64(env, args[PARAM_1], &srcOffset);
    int64_t length = PARAM_0;
    napi_get_value_int64(env, args[PARAM_2], &length);
    int32_t width = PARAM_0;
    napi_get_value_int32(env, args[PARAM_3], &width);
    int32_t height = PARAM_0;
    napi_get_value_int32(env, args[PARAM_4], &height);
    int fileDescribe = open(DST_ERROR_PATH, O_CREAT | O_RDWR, PARAM_0666);
    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, fileDescribe);
    OH_AVTranscoderConfig_SetDstVideoResolution(transcoderUser->config, width, height);
    backParam = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    LOG("Transcoder OhAvTransCoderNdkSetResolutionError ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    close(fileDescribe);
    delete transcoderUser;
    return result;
}

static napi_value OhAvTransCoderPrepareParamError1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    OH_AVErrCode err = OH_AVTranscoder_Prepare(transcoder, nullptr);
    backParam = err;
    LOG("Transcoder OhAvTransCoderPrepareParamError1 ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    OH_AVTranscoder_Release(transcoder);
    return result;
}

static napi_value OhAvTransCoderPrepareParamError2(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    size_t argc = PARAM_3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t srcFd = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &srcFd);
    int64_t srcOffset = PARAM_0;
    napi_get_value_int64(env, args[PARAM_1], &srcOffset);
    int64_t length = PARAM_0;
    napi_get_value_int64(env, args[PARAM_2], &length);

    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVTranscoderConfig_SetSrcFD(config, srcFd, srcOffset, length);
    int fileDescribe = open(DST_ERROR_PATH, O_CREAT | O_RDWR, PARAM_0666);
    OH_AVTranscoderConfig_SetDstFD(config, fileDescribe);
    OH_AVTranscoderConfig_SetDstFileType(config, AV_OUTPUT_FORMAT_MPEG_4);
    OH_AVErrCode err = OH_AVTranscoder_Prepare(nullptr, config);
    backParam = err;
    LOG("Transcoder OhAvTransCoderPrepareParamError2 ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    close(fileDescribe);
    return result;
}

static napi_value OhAvTransCoderParamError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t bufsize = 0;
    napi_get_value_string_utf8(env, args[PARAM_0], nullptr, 0, &bufsize);
    if (bufsize > 0) {
        char *buffer = new char[bufsize + 1];
        napi_get_value_string_utf8(env, args[PARAM_0], buffer, bufsize + 1, nullptr);
        if (std::strcmp(buffer, "Start") == 0) {
            backParam = OH_AVTranscoder_Start(nullptr);
        } else if (std::strcmp(buffer, "Pause") == 0) {
            backParam = OH_AVTranscoder_Pause(nullptr);
        } else if (std::strcmp(buffer, "Resume") == 0) {
            backParam = OH_AVTranscoder_Resume(nullptr);
        } else if (std::strcmp(buffer, "Cancel") == 0) {
            backParam = OH_AVTranscoder_Cancel(nullptr);
        } else if (std::strcmp(buffer, "Release") == 0) {
            backParam = OH_AVTranscoder_Release(nullptr);
        }
        delete[] buffer;
    }
    LOG("Transcoder OhAvTransCoderParamError ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvTransCoderOperateError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();

    size_t bufsize = 0;
    napi_get_value_string_utf8(env, args[PARAM_0], nullptr, 0, &bufsize);
    if (bufsize > 0) {
        char *buffer = new char[bufsize + 1];
        napi_get_value_string_utf8(env, args[PARAM_0], buffer, bufsize + 1, nullptr);
        if (std::strcmp(buffer, "Start") == 0) {
            backParam = OH_AVTranscoder_Start(transcoder);
        } else if (std::strcmp(buffer, "Pause") == 0) {
            backParam = OH_AVTranscoder_Pause(transcoder);
        } else if (std::strcmp(buffer, "Resume") == 0) {
            backParam = OH_AVTranscoder_Resume(transcoder);
        } else if (std::strcmp(buffer, "Cancel") == 0) {
            backParam = OH_AVTranscoder_Cancel(transcoder);
        }
        delete[] buffer;
    }

    LOG("Transcoder OhAvTransCoderOperateError ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    OH_AVTranscoder_Release(transcoder);
    return result;
}

static napi_value OhAvTransCoderNdkPrepareNotPermit(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    parseBasicArgs(env, info, &srcFd, &srcOffset, &length, &dstFd);

    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    OH_AVErrCode errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Prepare failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Start failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    int32_t ret = waitAvTransCoderStateChange(transcoderUser, AVTRANSCODER_STARTED);
    if (ret != AV_ERR_OK) {
        LOGE("waitAvTransCoderStateChange failed, error code: %{public}d", ret);
        napi_create_int32(env, ret, &result);
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    LOG("Transcoder OhAvTransCoderNdkPrepareNotPermit ret %{public}d", errCode);
    napi_create_int32(env, errCode, &result);
    delete transcoderUser;
    return result;
}

static napi_value OhAvTransCoderNdkCancelled(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    parseBasicArgs(env, info, &srcFd, &srcOffset, &length, &dstFd);
    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    transcoderUser->stateChangeFuncs_ = {
        { AVTRANSCODER_PREPARED,
            [transcoderUser]() {
                OH_AVErrCode errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
                transcoderUser->errorCode = errCode;
                LOG("OH_AVTranscoder_Start errCode:%{public}d", errCode);
            }
        },
        { AVTRANSCODER_STARTED,
            [transcoderUser]() {
                OH_AVErrCode errCode = OH_AVTranscoder_Pause(transcoderUser->transcoder);
                transcoderUser->errorCode = errCode;
                LOG("OH_AVTranscoder_Pause errCode:%{public}d", errCode);
            }
        },
        { AVTRANSCODER_PAUSED,
            [transcoderUser]() {
                OH_AVErrCode errCode = OH_AVTranscoder_Cancel(transcoderUser->transcoder);
                transcoderUser->errorCode = errCode;
                LOG("OH_AVTranscoder_Cancel errCode:%{public}d", errCode);
            }
        }
    };
    OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    while (transcoderUser->transCoderState != AVTRANSCODER_CANCELLED) {
        LOG("Transcoder OhAvTransCoderNdkCancelled current state: %{public}d", transcoderUser->transCoderState);
        std::this_thread::sleep_for(std::chrono::milliseconds(g_gDelytime200));
    }
    backParam = SUCCESS;
    LOG("Transcoder OhAvTransCoderNdkCancelled ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    delete transcoderUser;
    return result;
}

static napi_value OhAvTransCoderSetStateCbError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode err = OH_AVTranscoder_SetStateCallback(nullptr, AvTransCoderStateChangeCbImpl, nullptr);
    backParam = err;
    LOG("Transcoder OhAvTransCoderSetStateCbError ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvTransCoderSetErrorCbError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode err = OH_AVTranscoder_SetErrorCallback(nullptr, AvTransCoderErrorCbImpl, nullptr);
    backParam = err;
    LOG("Transcoder OhAvTransCoderSetErrorCbError ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvTransCoderSetProgressUpdateCbError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVErrCode err = OH_AVTranscoder_SetProgressUpdateCallback(nullptr, AvTransCoderProgressUpdateCbImpl, nullptr);
    backParam = err;
    LOG("Transcoder OhAvTransCoderSetProgressUpdateCbError ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvTransCoderNdkProgressUpdateCb(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    parseBasicArgs(env, info, &srcFd, &srcOffset, &length, &dstFd);

    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    transcoderUser->stateChangeFuncs_ = {
        { AVTRANSCODER_PREPARED,
            [transcoderUser]() {
                OH_AVErrCode errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
                transcoderUser->errorCode = errCode;
                LOG("OH_AVTranscoder_Start errCode:%{public}d", errCode);
            }
        },
    };
    OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    while (transcoderUser->progress != MAX_PROGRESS) {
        LOG("Transcoder OhAvTransCoderNdkProgressUpdateCb current progress: %{public}d", transcoderUser->progress);
        std::this_thread::sleep_for(std::chrono::milliseconds(g_gDelytime200));
    }
    backParam = SUCCESS;
    LOG("Transcoder OhAvTransCoderNdkProgressUpdateCb ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    delete transcoderUser;
    return result;
}

static napi_value OhAvTransCoderConfigSetSrcFDError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;

    size_t argc = PARAM_3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t srcFd = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &srcFd);
    int64_t srcOffset = PARAM_0;
    napi_get_value_int64(env, args[PARAM_1], &srcOffset);
    int64_t length = PARAM_0;
    napi_get_value_int64(env, args[PARAM_2], &length);

    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();

    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    OH_AVErrCode errCode = OH_AVTranscoderConfig_SetSrcFD(config, srcFd, srcOffset, length);
    int fileDescribe = open(DST_ERROR_PATH, O_CREAT | O_RDWR, PARAM_0666);
    OH_AVTranscoderConfig_SetDstFD(config, fileDescribe);
    OH_AVTranscoderConfig_SetDstFileType(config, AV_OUTPUT_FORMAT_MPEG_4);
    LOG("TranscoderConfig OH_AVTranscoderConfig_SetSrcFD ret %{public}d", errCode);
    if (errCode == AV_ERR_OK) {
        backParam = OH_AVTranscoder_Prepare(transcoder, config);
    } else {
        backParam = errCode;
    }
    LOG("TranscoderConfig OhAvTransCoderConfigSetSrcFDError ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    OH_AVTranscoderConfig_Release(config);
    OH_AVTranscoder_Release(transcoder);
    close(fileDescribe);
    return result;
}

static napi_value OhAvTransCoderConfigSetDstFDError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t dstFd = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &dstFd);
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    backParam = OH_AVTranscoderConfig_SetDstFD(config, dstFd);
    LOG("TranscoderConfig OH_AVTranscoderConfig_SetSrcFD ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    OH_AVTranscoderConfig_Release(config);
    return result;
}

static napi_value OhAvTransCoderConfigParamError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t paramNum = PARAM_0;
    napi_get_value_int32(env, args[PARAM_1], &paramNum);

    size_t bufsize = 0;
    napi_get_value_string_utf8(env, args[PARAM_0], nullptr, 0, &bufsize);
    OH_AVTranscoder_Config *config = OH_AVTranscoderConfig_Create();
    if (bufsize > 0) {
        char *buffer = new char[bufsize + 1];
        napi_get_value_string_utf8(env, args[PARAM_0], buffer, bufsize + 1, nullptr);
        if (std::strcmp(buffer, "SetSrcFD") == 0) {
            backParam = OH_AVTranscoderConfig_SetSrcFD(nullptr, PARAM_1, PARAM_1, PARAM_1);
        } else if (std::strcmp(buffer, "SetDstFD") == 0) {
            backParam = OH_AVTranscoderConfig_SetDstFD(nullptr, PARAM_1);
        } else if (std::strcmp(buffer, "SetDstVideoType") == 0) {
            if (paramNum == 0) {
                backParam = OH_AVTranscoderConfig_SetDstVideoType(nullptr, "video/avc");
            } else {
                backParam = OH_AVTranscoderConfig_SetDstVideoType(config, nullptr);
            }
        } else if (std::strcmp(buffer, "SetDstAudioType") == 0) {
            if (paramNum == 0) {
                backParam = OH_AVTranscoderConfig_SetDstAudioType(nullptr, "audio/mp4a-latm");
            } else {
                backParam = OH_AVTranscoderConfig_SetDstAudioType(config, nullptr);
            }
        } else if (std::strcmp(buffer, "SetDstFileType") == 0) {
            backParam = OH_AVTranscoderConfig_SetDstFileType(nullptr, AV_OUTPUT_FORMAT_MPEG_4);
        } else if (std::strcmp(buffer, "SetDstAudioBitrate") == 0) {
            backParam = OH_AVTranscoderConfig_SetDstAudioBitrate(nullptr, DEFAULT_AUDIOBITRATE);
        } else if (std::strcmp(buffer, "SetDstVideoBitrate") == 0) {
            backParam = OH_AVTranscoderConfig_SetDstVideoBitrate(nullptr, DEFAULT_VIDEOBITRATE);
        } else if (std::strcmp(buffer, "SetDstVideoResolution") == 0) {
            backParam = OH_AVTranscoderConfig_SetDstVideoResolution(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGTH);
        } else if (std::strcmp(buffer, "Release") == 0) {
            backParam = OH_AVTranscoderConfig_Release(nullptr);
        }
        delete[] buffer;
    }
    LOG("Transcoder OhAvTransCoderParamError ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    OH_AVTranscoderConfig_Release(config);
    return result;
}

void parseBasicArgsWithInt(napi_env env, napi_callback_info info,
    int32_t *srcFd, int64_t *srcOffset, int64_t *length, int32_t *dstFd, int32_t *number)
{
    size_t argc = PARAM_5;
    napi_value args[PARAM_5] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[PARAM_0], srcFd);
    napi_get_value_int64(env, args[PARAM_1], srcOffset);
    napi_get_value_int64(env, args[PARAM_2], length);
    napi_get_value_int32(env, args[PARAM_3], dstFd);
    napi_get_value_int32(env, args[PARAM_4], number);
}

void parseBasicArgsWithString(napi_env env, napi_callback_info info,
    int32_t *srcFd, int64_t *srcOffset, int64_t *length, int32_t *dstFd, size_t *bufsize, char **buffer)
{
    size_t argc = PARAM_5;
    napi_value args[PARAM_5] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[PARAM_0], srcFd);
    napi_get_value_int64(env, args[PARAM_1], srcOffset);
    napi_get_value_int64(env, args[PARAM_2], length);
    napi_get_value_int32(env, args[PARAM_3], dstFd);
    napi_get_value_string_utf8(env, args[PARAM_4], nullptr, 0, bufsize);
    *buffer = new char[*bufsize + 1];
    napi_status status = napi_get_value_string_utf8(env, args[PARAM_4], *buffer, *bufsize + 1, nullptr);
    if (status != napi_ok) {
        delete[] *buffer;
        *buffer = nullptr;
        return;
    }
}
static napi_value OhAvTransCodeConfigSetDstVideoType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVErrCode errCode = AV_ERR_OK;
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    char *buffer = nullptr;
    size_t bufsize = PARAM_0;
    parseBasicArgsWithString(env, info, &srcFd, &srcOffset, &length, &dstFd, &bufsize, &buffer);

    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    LOG("Transcoder OhAvTransCodeConfigSetDstVideoType video type size: %{public}d, type: %{public}s", bufsize, buffer);
    if (bufsize > 0) {
        errCode = OH_AVTranscoderConfig_SetDstVideoType(transcoderUser->config, buffer);
    } else {
        errCode = OH_AVTranscoderConfig_SetDstVideoType(transcoderUser->config, "");
    }
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoderConfig_SetDstVideoType failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete[] buffer;
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Prepare failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete[] buffer;
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Start failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete[] buffer;
        delete transcoderUser;
        return result;
    }
    int32_t backParam = waitAvTransCoderStateChange(transcoderUser, AVTRANSCODER_COMPLETED);
    LOG("Transcoder OhAvTransCodeConfigSetDstVideoType ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    delete[] buffer;
    delete transcoderUser;
    return result;
}

static napi_value OhAvTransCodeConfigSetDstAudioType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    char *buffer = nullptr;
    size_t bufsize = PARAM_0;
    parseBasicArgsWithString(env, info, &srcFd, &srcOffset, &length, &dstFd, &bufsize, &buffer);
    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    OH_AVErrCode errCode = AV_ERR_OK;
    if (bufsize > 0) {
        errCode = OH_AVTranscoderConfig_SetDstAudioType(transcoderUser->config, buffer);
    } else {
        errCode = OH_AVTranscoderConfig_SetDstAudioType(transcoderUser->config, "");
    }
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoderConfig_SetDstAudioType failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete[] buffer;
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Prepare failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete[] buffer;
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Start failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete[] buffer;
        delete transcoderUser;
        return result;
    }
    int32_t ret = waitAvTransCoderStateChange(transcoderUser, AVTRANSCODER_COMPLETED);
    LOG("Transcoder OhAvTransCodeConfigSetDstAudioType ret %{public}d", ret);
    napi_create_int32(env, ret, &result);
    delete[] buffer;
    delete transcoderUser;
    return result;
}

static napi_value OhAvTransCodeConfigSetDstFileType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    int32_t format = PARAM_0;
    parseBasicArgsWithInt(env, info, &srcFd, &srcOffset, &length, &dstFd, &format);

    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    OH_AVErrCode errCode = AV_ERR_OK;
    LOG("Transcoder OhAvTransCodeConfigSetDstFileType format: %{public}d", format);
    OH_AVOutputFormat mimeType = static_cast<OH_AVOutputFormat>(format);
    errCode = OH_AVTranscoderConfig_SetDstFileType(transcoderUser->config, mimeType);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoderConfig_SetDstFileType failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Prepare failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Start failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    int32_t backParam = waitAvTransCoderStateChange(transcoderUser, AVTRANSCODER_COMPLETED);
    LOG("Transcoder OhAvTransCodeConfigSetDstFileType ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    delete transcoderUser;
    return result;
}

static napi_value OhAvTransCodeConfigEnableBFrame(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    bool enableBFrame = false;
    size_t argc = PARAM_5;
    napi_value args[PARAM_5] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[PARAM_0], &srcFd);
    napi_get_value_int64(env, args[PARAM_1], &srcOffset);
    napi_get_value_int64(env, args[PARAM_2], &length);
    napi_get_value_int32(env, args[PARAM_3], &dstFd);
    napi_get_value_bool(env, args[PARAM_4], &enableBFrame);
    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    OH_AVErrCode errCode = OH_AVTranscoderConfig_EnableBFrame(transcoderUser->config, enableBFrame);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoderConfig_EnableBFrame failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Prepare failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Start failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    int32_t backParam = waitAvTransCoderStateChange(transcoderUser, AVTRANSCODER_COMPLETED);
    LOG("Transcoder OhAvTransCodeConfigEnableBFrame ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    delete transcoderUser;
    return result;
}

static napi_value OhAvTransCodeConfigSetDstFileTypeError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_object(env, &result);
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    int32_t format = PARAM_0;
    parseBasicArgsWithInt(env, info, &srcFd, &srcOffset, &length, &dstFd, &format);

    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    OH_AVErrCode errCode = AV_ERR_OK;
    LOG("Transcoder OhAvTransCodeConfigSetDstFileType format: %{public}d", format);
    OH_AVOutputFormat mimeType = static_cast<OH_AVOutputFormat>(format);
    errCode = OH_AVTranscoderConfig_SetDstFileType(transcoderUser->config, mimeType);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoderConfig_SetDstFileType failed, error code: %{public}d", errCode);
        SetInt32NamedProperty(env, result, "result", errCode);
        delete transcoderUser;
        transcoderUser = nullptr;
        return result;
    }
    errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Prepare failed, error code: %{public}d", errCode);
        SetInt32NamedProperty(env, result, "result", errCode);
        delete transcoderUser;
        transcoderUser = nullptr;
        return result;
    }
    SetInt32NamedProperty(env, result, "result", errCode);
    SetUserNamedProperty(env, result, "userData", &transcoderUser);
    return result;
}

static napi_value OhCheckAvTransCoderCallBackError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void *ptr = nullptr;
    napi_get_value_external(env, args[0], &ptr);
    NdkAVTransCoderUser *transcoderUser = reinterpret_cast<NdkAVTransCoderUser *>(ptr);
    if (transcoderUser->callbackError != AV_ERR_UNKNOWN && transcoderUser->callbackError != AV_ERR_OK) {
        LOGE("OhCheckAvTransCoderCallBackError, error code: %{public}d", transcoderUser->callbackError);
        backParam = transcoderUser->callbackError;
        delete transcoderUser;
        transcoderUser = nullptr;
    }
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OhAvTransCodeConfigSetDstVideoBitrate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    int32_t videoBitrate = PARAM_0;
    parseBasicArgsWithInt(env, info, &srcFd, &srcOffset, &length, &dstFd, &videoBitrate);

    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    LOG("TranscoderConfig OhAvTransCodeConfigSetDstVideoBitrate audioBitrate: %{public}d", videoBitrate);
    OH_AVErrCode errCode = OH_AVTranscoderConfig_SetDstVideoBitrate(transcoderUser->config, videoBitrate);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoderConfig_SetDstVideoBitrate failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Prepare failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Start failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        delete transcoderUser;
        return result;
    }
    int32_t backParam = waitAvTransCoderStateChange(transcoderUser, AVTRANSCODER_COMPLETED);
    LOG("Transcoder OhAvTransCodeConfigSetDstVideoBitrate ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    delete transcoderUser;
    return result;
}

static napi_value OhAvTransCodeConfigSetDstAudioBitrate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_object(env, &result);
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    int32_t dstFd = PARAM_0;
    int32_t audioBitrate = PARAM_0;
    parseBasicArgsWithInt(env, info, &srcFd, &srcOffset, &length, &dstFd, &audioBitrate);

    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    LOG("TranscoderConfig OhAvTransCodeConfigSetDstAudioBitrate audioBitrate: %{public}d", audioBitrate);
    OH_AVErrCode errCode = OH_AVTranscoderConfig_SetDstAudioBitrate(transcoderUser->config, audioBitrate);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoderConfig_SetDstAudioBitrate failed, error code: %{public}d", errCode);
        SetInt32NamedProperty(env, result, "result", errCode);
        delete transcoderUser;
        transcoderUser = nullptr;
        return result;
    }
    errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    if (errCode != AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Prepare failed, error code: %{public}d", errCode);
        SetInt32NamedProperty(env, result, "result", errCode);
        delete transcoderUser;
        transcoderUser = nullptr;
        return result;
    }
    errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
    LOG("Transcoder OhAvTransCodeConfigSetDstAudioBitrate OH_AVTranscoder_Start ret %{public}d", errCode);
    SetInt32NamedProperty(env, result, "result", errCode);
    SetUserNamedProperty(env, result, "userData", &transcoderUser);
    return result;
}

static napi_value OhAvTransCodeConfigSetDstVideoResolution(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    size_t argc = PARAM_6;
    napi_value args[PARAM_6] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t srcFd = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &srcFd);
    int64_t srcOffset = PARAM_0;
    napi_get_value_int64(env, args[PARAM_1], &srcOffset);
    int64_t length = PARAM_0;
    napi_get_value_int64(env, args[PARAM_2], &length);
    int32_t dstFd = PARAM_0;
    napi_get_value_int32(env, args[PARAM_3], &dstFd);
    int32_t width = PARAM_0;
    napi_get_value_int32(env, args[PARAM_4], &width);
    int32_t height = PARAM_0;
    napi_get_value_int32(env, args[PARAM_5], &height);

    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, dstFd);
    transcoderUser->stateChangeFuncs_ = {
        { AVTRANSCODER_PREPARED,
            [transcoderUser]() {
                OH_AVErrCode errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
                transcoderUser->errorCode = errCode;
                LOG("OH_AVTranscoder_Start errCode:%{public}d", errCode);
            }
        },
    };
    OH_AVErrCode errCode = AV_ERR_OK;
    errCode = OH_AVTranscoderConfig_SetDstVideoResolution(transcoderUser->config, width, height);
    if (errCode == AV_ERR_OK) {
        errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
        if (errCode == AV_ERR_OK) {
            while (transcoderUser->transCoderState != AVTRANSCODER_COMPLETED) {
                LOG("Transcoder OhAvTransCodeConfigSetDstVideoResolution current state: %{public}d",
                    transcoderUser->transCoderState);
                std::this_thread::sleep_for(std::chrono::milliseconds(g_gDelytime200));
            }
            backParam = SUCCESS;
        } else {
            backParam = errCode;
        }
    } else {
        backParam = errCode;
    }
    LOG("Transcoder OhAvTransCodeConfigSetDstVideoResolution ret %{public}d", backParam);
    napi_create_int32(env, backParam, &result);
    delete transcoderUser;
    return result;
}
void parseSrcArgs(napi_env env, napi_callback_info info, int32_t *srcFd, int64_t *srcOffset, int64_t *length)
{
    size_t argc = PARAM_3;
    napi_value args[PARAM_3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[PARAM_0], srcFd);
    napi_get_value_int64(env, args[PARAM_1], srcOffset);
    napi_get_value_int64(env, args[PARAM_2], length);
}
static napi_value OhAvTransCoderErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t srcFd = PARAM_0;
    int64_t srcOffset = PARAM_0;
    int64_t length = PARAM_0;
    parseSrcArgs(env, info, &srcFd, &srcOffset, &length);
    int fileDescribe = open(DST_ERROR_PATH, O_CREAT | O_RDWR, PARAM_0666);
    NdkAVTransCoderUser *transcoderUser = new NdkAVTransCoderUser();
    transcoderUser->InitTransCoder(srcFd, srcOffset, length, fileDescribe);
    OH_AVErrCode errCode = OH_AVTranscoder_Prepare(transcoderUser->transcoder, transcoderUser->config);
    if (errCode == AV_ERR_OK) {
        LOGE("OH_AVTranscoder_Prepare Success");
        if (transcoderUser->callbackError == AV_ERR_UNKNOWN || transcoderUser->callbackError == AV_ERR_OK) {
            errCode = OH_AVTranscoder_Start(transcoderUser->transcoder);
        } else {
            errCode = static_cast<OH_AVErrCode>(transcoderUser->callbackError);
        }
    }
    napi_create_int32(env, errCode, &result);
    delete transcoderUser;
    close(fileDescribe);
    return result;
}

static napi_value OhAvPlayerNdkPlayVideo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t srcFd = PARAM_0;
    napi_get_value_int32(env, args[PARAM_0], &srcFd);
    int64_t length = PARAM_0;
    napi_get_value_int64(env, args[PARAM_1], &length);

    OH_AVPlayer *player = OH_AVPlayer_Create();
    OH_AVPlayer_SetFDSource(player, srcFd, PARAM_0, length);
    OH_AVErrCode errCode = OH_AVPlayer_Prepare(player);
    napi_create_int32(env, errCode, &result);
    OH_AVPlayer_ReleaseSync(player);
    return result;
}

static napi_value OhAvTransCoderCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AVTranscoder *transcoder = OH_AVTranscoder_Create();
    int32_t res = 1;
    if (transcoder != nullptr) {
        res = 0;
    }
    OH_AVTranscoder_Release(transcoder);
    napi_create_int32(env, res, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
    {"AvTransCoderNdkSetResolutionError", nullptr, OhAvTransCoderNdkSetResolutionError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderPrepareParamError1", nullptr, OhAvTransCoderPrepareParamError1, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderPrepareParamError2", nullptr, OhAvTransCoderPrepareParamError2, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderParamError", nullptr, OhAvTransCoderParamError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderOperateError", nullptr, OhAvTransCoderOperateError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderNdkCancelled", nullptr, OhAvTransCoderNdkCancelled, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderSetStateCbError", nullptr, OhAvTransCoderSetStateCbError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderSetErrorCbError", nullptr, OhAvTransCoderSetErrorCbError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderSetProgressUpdateCbError", nullptr, OhAvTransCoderSetProgressUpdateCbError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderNdkProgressUpdateCb", nullptr, OhAvTransCoderNdkProgressUpdateCb, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderConfigSetSrcFDError", nullptr, OhAvTransCoderConfigSetSrcFDError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderConfigParamError", nullptr, OhAvTransCoderConfigParamError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderConfigSetDstFDError", nullptr, OhAvTransCoderConfigSetDstFDError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCodeConfigSetDstVideoType", nullptr, OhAvTransCodeConfigSetDstVideoType, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCodeConfigSetDstAudioType", nullptr, OhAvTransCodeConfigSetDstAudioType, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCodeConfigSetDstFileType", nullptr, OhAvTransCodeConfigSetDstFileType, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCodeConfigSetDstAudioBitrate", nullptr, OhAvTransCodeConfigSetDstAudioBitrate, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCodeConfigSetDstVideoBitrate", nullptr, OhAvTransCodeConfigSetDstVideoBitrate, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCodeConfigEnableBFrame", nullptr, OhAvTransCodeConfigEnableBFrame, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCodeConfigSetDstVideoResolution", nullptr, OhAvTransCodeConfigSetDstVideoResolution, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderErrorCode", nullptr, OhAvTransCoderErrorCode, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderNdkPrepareNotPermit", nullptr, OhAvTransCoderNdkPrepareNotPermit, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvPlayerNdkPlayVideo", nullptr, OhAvPlayerNdkPlayVideo, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderNdkTest", nullptr, OhAvTransCoderNdkTest, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"CheckAvTransCoderComplete", nullptr, OhCheckAvTransCoderComplete, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCodeConfigSetDstFileTypeError", nullptr, OhAvTransCodeConfigSetDstFileTypeError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"CheckAvTransCoderCallBackError", nullptr, OhCheckAvTransCoderCallBackError, nullptr,
        nullptr, nullptr, napi_default, nullptr},
    {"AvTransCoderCreate", nullptr, OhAvTransCoderCreate, nullptr,
        nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "avTransCoderNdk",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
