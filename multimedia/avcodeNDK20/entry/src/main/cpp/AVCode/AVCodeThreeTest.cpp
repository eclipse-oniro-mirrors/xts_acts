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

#include "AVCode/AVCode_Test.h"
#include "common/Common.h"
#include <condition_variable>
#include <cstdint>
#include <fcntl.h>
#include <fstream>
#include <memory>
#include <multimedia/player_framework/avcodec_audio_channel_layout.h>
#include <multimedia/player_framework/media_types.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <multimedia/player_framework/native_avbuffer_info.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_audiodecoder.h>
#include <multimedia/player_framework/native_avcodec_audioencoder.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avmuxer.h>
#include <multimedia/player_framework/native_avsource.h>
#include <mutex>
#include <native_window/external_window.h>
#include <ohaudio/native_audiostreambuilder.h>
#include <queue>
#include <shared_mutex>
#include <string>
#include <sys/stat.h> // 用于获取文件大小
// using namespace OHOS;
// using namespace OHOS::MediaAVCodec;
#include <cmath>
#include <cstdio>
#include <fcntl.h>
#include <iostream>
#include <string>
#include <thread>

// 视频帧宽度。
static int32_t g_width = 320;
// 视频帧高度。
static int32_t g_height = 240;
// 视频像素格式。
static OH_AVPixelFormat g_pixelFormat = AV_PIXEL_FORMAT_NV12;
// 视频宽跨距。
static int32_t g_widthStride = 0;
// 视频高跨距。
static int32_t g_heightStride = 0;
// 编码器实例指针。
static OH_AVCodec *g_videoEnc = nullptr;

struct CodecBufferInfo {
    CodecBufferInfo(uint32_t index, OH_AVBuffer *buffer) : index(index), buffer(buffer), isValid(true) {}
    CodecBufferInfo(uint32_t index, OH_AVFormat *parameter) : index(index), parameter(parameter), isValid(true) {}
    // 回调buffer。
    OH_AVBuffer *buffer = nullptr;
    // Surface模式下，输入回调的随帧参数，需要注册随帧通路后使用。
    OH_AVFormat *parameter = nullptr;
    // 回调buffer对应的index。
    uint32_t index = 0;
    // 判断当前buffer信息是否有效。
    bool isValid = true;
};

class CodecBufferQueue {
public:
    // 将回调buffer的信息传入队列。
    void Enqueue(const std::shared_ptr<CodecBufferInfo> bufferInfo)
    {
        std::unique_lock<std::mutex> lock(mutex_);
        bufferQueue_.push(bufferInfo);
        cond_.notify_all();
    }

    // 获取回调buffer的信息。
    std::shared_ptr<CodecBufferInfo> Dequeue(int32_t timeoutMs = 1000)
    {
        std::unique_lock<std::mutex> lock(mutex_);
        (void)cond_.wait_for(lock, std::chrono::milliseconds(timeoutMs), [this]() { return !bufferQueue_.empty(); });
        if (bufferQueue_.empty()) {
            return nullptr;
        }
        std::shared_ptr<CodecBufferInfo> bufferInfo = bufferQueue_.front();
        bufferQueue_.pop();
        return bufferInfo;
    }

    // 清空队列，之前的回调buffer设置为不可用。
    void Flush()
    {
        std::unique_lock<std::mutex> lock(mutex_);
        while (!bufferQueue_.empty()) {
            std::shared_ptr<CodecBufferInfo> bufferInfo = bufferQueue_.front();
            // Flush、Stop、Reset、Destroy操作之后，之前回调的buffer信息设置为无效。
            bufferInfo->isValid = false;
            bufferQueue_.pop();
        }
    }

private:
    std::mutex mutex_;
    std::condition_variable cond_;
    std::queue<std::shared_ptr<CodecBufferInfo>> bufferQueue_;
};

static std::string g_filePath;

// 3. 定义媒体数据源错误码（官方文档示例规范）
enum MediaDataSourceError : int32_t {
    SOURCE_ERROR_IO = PARAM_NEGATIVE_1, // IO错误（如文件打开失败）
    SOURCE_ERROR_EOF = PARAM_NEGATIVE_2 // 已到达文件末尾
};

napi_value AVCodeOHAudioCodecSetParameterOperateUnknown(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    bool isEncoder = true;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, isEncoder);
    OH_AVFormat *invalidFormat = OH_AVFormat_Create();
    OH_AudioCodec_Destroy(codec);
    OH_AVFormat_SetIntValue(invalidFormat, OH_MD_KEY_BITRATE, PARAM_100000);
    OH_AVFormat_SetStringValue(invalidFormat, "UNSUPPORTED_KEY", "invalid_value");
    int32_t setResult = OH_AudioCodec_SetParameter(codec, invalidFormat);
    napi_value retValue = nullptr;
    if (setResult == AV_ERR_UNKNOWN) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioCodecPushInputBufferInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    uint32_t index;
    int32_t inputResult = OH_AudioCodec_PushInputBuffer(codec, index);
    napi_value retValue = nullptr;
    if (inputResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioDecoderSetCallbackInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    OH_AVCodecAsyncCallback callback;
    void *userData = nullptr;
    int32_t callbackResult = OH_AudioDecoder_SetCallback(codec, callback, userData);
    napi_value retValue = nullptr;
    if (callbackResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAudioEncoderSetCallbackInvalidVal(napi_env env, napi_callback_info info)
{
    OH_AVCodec *codec = nullptr;
    OH_AVCodecAsyncCallback callback;
    void *userData = nullptr;
    int32_t callbackResult = OH_AudioEncoder_SetCallback(codec, callback, userData);
    napi_value retValue = nullptr;
    if (callbackResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAACPROFILEHE(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_AACProfile::AAC_PROFILE_HE);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAACPROFILEHE1(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_AACProfile::AAC_PROFILE_HE_V2);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumHEVCProfile1(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_HEVCProfile::HEVC_PROFILE_MAIN_STILL);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumHEVCProfile2(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_HEVCProfile::HEVC_PROFILE_MAIN_10_HDR10);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile1(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_10);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile2(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_12);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile3(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_12_INTRA);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile4(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MULTI_MAIN_10);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile5(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_10_444);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile6(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_12_444);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile7(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_16_444);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile8(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_12_444_INTRA);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile9(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_16_444_INTRA);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile10(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MULTI_MAIN_10_444);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile11(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_10_STILL);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile12(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_12_STILL);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile13(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_10_444_STILL);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile14(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_12_444_STILL);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumVVCProfile15(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_VVCProfile::VVC_PROFILE_MAIN_16_444_STILL);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile1(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_SIMPLE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile2(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_MAIN, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile3(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_SNR_SCALABLE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile4(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_SPATIALLY_SCALABLE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile5(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_HIGH, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile6(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_422, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile7(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_SIMPLE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile8(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_SIMPLE_SCALABLE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile9(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_CORE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile10(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_MAIN, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile11(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_N_BIT, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile12(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_HYBRID, MPEG4_LEVEL_2);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile13(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res =
        OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_BASIC_ANIMATED_TEXTURE, MPEG4_LEVEL_2);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile14(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_SCALABLE_TEXTURE, MPEG4_LEVEL_1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile15(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_SIMPLE_FA, MPEG4_LEVEL_2);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile16(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res =
        OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_ADVANCED_REAL_TIME_SIMPLE, MPEG4_LEVEL_4);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile17(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_CORE_SCALABLE, MPEG4_LEVEL_3);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile18(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY,
                                                           MPEG4_LEVEL_3);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile19(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_ADVANCED_CORE, MPEG4_LEVEL_2);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile20(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res =
        OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_ADVANCED_SCALABLE_TEXTURE, MPEG4_LEVEL_3);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile21(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_ADVANCED_SIMPLE, MPEG4_LEVEL_5);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHH263Profile1(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_H263, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, H263_PROFILE_BASELINE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHH263Profile2(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_H263, false, SOFTWARE);
    bool res =
        OH_AVCapability_AreProfileAndLevelSupported(capability, H263_PROFILE_VERSION_1_BACKWARD_COMPATIBILITY, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVOutputFormat1(napi_env env, napi_callback_info info)
{
    int32_t fd = 1;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_M4A;
    OH_AVMuxer *avmuxer = OH_AVMuxer_Create(fd, format);
    napi_value retValue;
    if (avmuxer != nullptr) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVOutputFormat2(napi_env env, napi_callback_info info)
{
    int32_t fd = 1;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_AMR;
    OH_AVMuxer *avmuxer = OH_AVMuxer_Create(fd, format);
    napi_value retValue;
    if (avmuxer != nullptr) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVOutputFormat3(napi_env env, napi_callback_info info)
{
    int32_t fd = 1;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MP3;
    OH_AVMuxer *avmuxer = OH_AVMuxer_Create(fd, format);
    napi_value retValue;
    if (avmuxer != nullptr) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVOutputFormat4(napi_env env, napi_callback_info info)
{
    int32_t fd = 1;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_WAV;
    OH_AVMuxer *avmuxer = OH_AVMuxer_Create(fd, format);
    napi_value retValue;
    if (avmuxer != nullptr) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVOutputFormat5(napi_env env, napi_callback_info info)
{
    int32_t fd = 1;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_AAC;
    OH_AVMuxer *avmuxer = OH_AVMuxer_Create(fd, format);
    napi_value retValue;
    if (avmuxer != nullptr) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVOutputFormat6(napi_env env, napi_callback_info info)
{
    int32_t fd = 1;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_FLAC;
    OH_AVMuxer *avmuxer = OH_AVMuxer_Create(fd, format);
    napi_value retValue;
    if (avmuxer != nullptr) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVColorPrimary1(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult =
        OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVColorPrimary2(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult =
        OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT470_M);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVColorPrimary3(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult =
        OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT601_625);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVColorPrimary4(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult =
        OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT601_525);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVColorPrimary5(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult =
        OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_SMPTE_ST240);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVColorPrimary6(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult =
        OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_GENERIC_FILM);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVColorPrimary7(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult =
        OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_SMPTE_ST428);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAVColorPrimary8(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_P3DCI);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic1(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic2(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_GAMMA_2_2);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic3(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_GAMMA_2_8);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic4(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT601);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic5(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_SMPTE_ST240);

    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}
napi_value EnumOHTransferCharacteristic6(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_LOG);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}
napi_value EnumOHTransferCharacteristic7(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_LOG_SQRT);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic8(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_IEC_61966_2_4);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic9(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT1361);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic10(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_IEC_61966_2_1);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic11(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT2020_10BIT);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic12(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_Create();
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT2020_12BIT);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHTransferCharacteristic13(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                             OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_SMPTE_ST428);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHMatrixCoefficient1(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                             OH_MatrixCoefficient::MATRIX_COEFFICIENT_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHMatrixCoefficient2(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                             OH_MatrixCoefficient::MATRIX_COEFFICIENT_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHMatrixCoefficient3(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                             OH_MatrixCoefficient::MATRIX_COEFFICIENT_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHMatrixCoefficient4(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                             OH_MatrixCoefficient::MATRIX_COEFFICIENT_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHMatrixCoefficient5(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                             OH_MatrixCoefficient::MATRIX_COEFFICIENT_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHMatrixCoefficient6(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                             OH_MatrixCoefficient::MATRIX_COEFFICIENT_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHMatrixCoefficient7(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                             OH_MatrixCoefficient::MATRIX_COEFFICIENT_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHMatrixCoefficient8(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                             OH_MatrixCoefficient::MATRIX_COEFFICIENT_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHMatrixCoefficient9(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                             OH_MatrixCoefficient::MATRIX_COEFFICIENT_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHMatrixCoefficient10(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                             OH_MatrixCoefficient::MATRIX_COEFFICIENT_UNSPECIFIED);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHBitsPerSample1(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_BITS_PER_CODED_SAMPLE, OH_BitsPerSample::SAMPLE_U8);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHBitsPerSample2(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_BITS_PER_CODED_SAMPLE, OH_BitsPerSample::SAMPLE_U8P);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHBitsPerSample3(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_BITS_PER_CODED_SAMPLE, OH_BitsPerSample::SAMPLE_S16P);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHBitsPerSample4(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_BITS_PER_CODED_SAMPLE, OH_BitsPerSample::SAMPLE_S24P);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHBitsPerSample5(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_BITS_PER_CODED_SAMPLE, OH_BitsPerSample::SAMPLE_S32P);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHBitsPerSample6(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult = OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_BITS_PER_CODED_SAMPLE, OH_BitsPerSample::SAMPLE_F32P);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}
napi_value EnumOHBitsPerSample7(napi_env env, napi_callback_info info)
{
    const char *videoMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_VideoEncoder_CreateByMime(videoMime);
    // 获取编解码器能力
    OH_AVCodec_GetCapability(videoMime, true);
    OH_AVFormat *avformat = OH_AVFormat_CreateVideoFormat(videoMime, g_width, g_height);
    // 设置必要参数（如宽、高、像素格式）
    bool setResult =
        OH_AVFormat_SetIntValue(avformat, OH_MD_KEY_BITS_PER_CODED_SAMPLE, OH_BitsPerSample::INVALID_WIDTH);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value AVCodeOHAVDataSource(napi_env env, napi_callback_info info)
{
    std::string filePath = "test.mp4";
    int32_t fd = open(filePath.c_str(), O_RDONLY);
    struct stat fileStatus {};
    int64_t fileSize = 0;
    if (stat(filePath.c_str(), &fileStatus) == 0) {
        fileSize = static_cast<int64_t>(fileStatus.st_size);
    }
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd, 0, fileSize);
    napi_value retValue;
    if (source == nullptr) {
        printf("OH_AVSource_CreateWithDataSource success!\n");
        napi_create_int32(env, 0, &retValue); // 创建成功，返回0
    } else {
        printf("OH_AVSource_CreateWithDataSource failed!\n");
        napi_create_int32(env, 1, &retValue); // 创建失败，返回1
    }
    return retValue;
}

napi_value EnumOHCoreHdrType1(napi_env env, napi_callback_info info)
{
    // 创建媒体格式对象
    OH_AVFormat *format = OH_AVFormat_Create();
    // 设置HDR类型为VIVID
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_IS_HDR_VIVID, OH_CORE_HDR_TYPE_NONE);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHCoreHdrType2(napi_env env, napi_callback_info info)
{
    // 创建媒体格式对象
    OH_AVFormat *format = OH_AVFormat_Create();
    // 设置HDR类型为VIVID
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_IS_HDR_VIVID, OH_CORE_HDR_TYPE_VIVID);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}


napi_value EnumOHScalingMode1(napi_env env, napi_callback_info info)
{
    // 创建媒体格式对象
    OH_AVFormat *format = OH_AVFormat_Create();
    // 设置HDR类型为VIVID
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_SCALING_MODE, SCALING_MODE_SCALE_TO_WINDOW);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHScalingMode2(napi_env env, napi_callback_info info)
{
    // 创建媒体格式对象
    OH_AVFormat *format = OH_AVFormat_Create();
    // 设置HDR类型为VIVID
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_SCALING_MODE, SCALING_MODE_SCALE_CROP);
    napi_value retValue;
    if (setResult == true) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

