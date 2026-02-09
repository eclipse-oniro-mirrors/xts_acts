/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <iostream>
#include <cstdio>
#include <string>
#include <hilog/log.h>

#include "include/OhosCommonTest.h"
#include "include/SecureMemory.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include "videoenc_sample.h"
#include <multimedia/player_framework/native_avcapability.h>
#include "videoenc_api11_sample.h"
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "VCodecEncoderTest123"

static OH_AVCodec *venc_ = nullptr;
static OH_AVFormat *format = nullptr;

namespace {
constexpr uint32_t VIDEO_WIDTH_1080P = 1920;
constexpr uint32_t VIDEO_HEIGHT_1080P = 1080;
constexpr uint32_t DEFAULT_WIDTH = VIDEO_WIDTH_1080P;
constexpr uint32_t DEFAULT_HEIGHT = VIDEO_HEIGHT_1080P;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t SLEEP_TIME_1S_US = 1000000;
constexpr uint32_t QUALITY_INVALID_101 = 101;
constexpr uint32_t BITRATE_100K = 100000;
constexpr uint32_t INVALID_INDEX_LARGE = 9999999;
constexpr uint32_t INVALID_INDEX_99999 = 99999;
char g_codecName[CODEC_NAME_SIZE] = {};
OH_AVCapability *cap = nullptr;
OHOS::Media::VEncSignal *signal_ = nullptr;

static void TestSetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap == nullptr) {
    } else {
    }
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (tmpCodecName != nullptr) {
        if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != EOK) {
            cout << "memcpy failed" << endl;
        }
    } else {
    }
    cout << "codecname: " << g_codecName << endl;
}

void onError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    cout << "Error errorCode=" << errorCode << endl;
};

void onStreamChanged(OH_AVCodec *codec, OH_AVFormat *fmt, void *userData)
{
    cout << "stream Changed" << endl;
};

void onNeedInputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
{
    VEncSignal *signal = static_cast<VEncSignal *>(userData);
    if (signal == nullptr) {
        return;
    }
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
    cout << "need input data" << endl;
}

void onNewOutputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, OH_AVCodecBufferAttr *attr, void *userData)
{
    cout << "output data" << endl;
    VEncSignal *signal = static_cast<VEncSignal *>(userData);
    if (signal == nullptr) {
        return;
    }
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->attrQueue_.push(*attr);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}
} // namespace

void TestTearDownApi()
{
    if (venc_ != nullptr) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
}

int VideoEncodeIllegalPara0100Test()
{
    venc_ = OH_VideoEncoder_CreateByMime(nullptr);
    ASSERT_EQ(nullptr, venc_);
    return 0;
}

int VideoEncodeIllegalPara0200Test()
{
    venc_ = OH_VideoEncoder_CreateByMime("");
    ASSERT_EQ(nullptr, venc_);
    return 0;
}

int VideoEncodeIllegalPara0300Test()
{
    venc_ = OH_VideoEncoder_CreateByName(nullptr);
    ASSERT_EQ(nullptr, venc_);
    return 0;
}

int VideoEncodeIllegalPara0400Test()
{
    venc_ = OH_VideoEncoder_CreateByName("");
    ASSERT_EQ(nullptr, venc_);
    return 0;
}

int VideoEncodeIllegalPara0500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Destroy(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
}

int VideoEncodeIllegalPara0600Test()
{
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = onError;
    cb_.onStreamChanged = onStreamChanged;
    cb_.onNeedInputData = onNeedInputData;
    cb_.onNeedOutputData = onNewOutputData;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_SetCallback(nullptr, cb_, static_cast<void *>(signal_)));
    return 0;
}

int VideoEncodeIllegalPara0700Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);

        OH_AVCodecAsyncCallback cb2_;
        cb2_.onError = nullptr;
        cb2_.onStreamChanged = nullptr;
        cb2_.onNeedInputData = nullptr;
        cb2_.onNeedOutputData = nullptr;
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_SetCallback(venc_, cb2_, static_cast<void *>(signal_)));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeIllegalPara0800Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        OH_AVCodecAsyncCallback cb_;
        cb_.onError = onError;
        cb_.onStreamChanged = onStreamChanged;
        cb_.onNeedInputData = onNeedInputData;
        cb_.onNeedOutputData = onNewOutputData;
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_SetCallback(venc_, cb_, nullptr));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeIllegalPara0900Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        ret = OH_VideoEncoder_Configure(venc_, nullptr);
        ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
} else {
        return 0;
    }
}

int VideoEncodeIllegalPara1100Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, BITRATE_100K);
        ret = OH_VideoEncoder_Configure(venc_, format);
        ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
} else {
        return 0;
    }
}

int VideoEncodeIllegalPara1400Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Start(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
}

int VideoEncodeIllegalPara1500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Stop(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
}

int VideoEncodeIllegalPara1600Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Flush(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
}

int VideoEncodeIllegalPara1700Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Reset(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
}

int VideoEncodeIllegalPara1800Test()
{
    format = OH_VideoEncoder_GetOutputDescription(nullptr);
    ASSERT_EQ(format, nullptr);
    return 0;
}

int VideoEncodeIllegalPara1900Test()
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_SetParameter(venc_, nullptr));
    return 0;
}

int VideoEncodeIllegalPara2000Test()
{
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_SetParameter(nullptr, format));
    return 0;
}

int VideoEncodeIllegalPara2100Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        ret = OH_VideoEncoder_GetSurface(venc_, nullptr);
        ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
} else {
        return 0;
    }
}

int VideoEncodeIllegalPara2200Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_FreeOutputData(nullptr, 0);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
}

int VideoEncodeIllegalPara2300Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            OH_AVErrCode ret = AV_ERR_OK;
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_HEIGHT);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ret = OH_VideoEncoder_Configure(venc_, format);
            ASSERT_EQ(ret, AV_ERR_OK);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
            usleep(SLEEP_TIME_1S_US);
            ret = OH_VideoEncoder_FreeOutputData(venc_, INVALID_INDEX_LARGE);
            ASSERT_EQ(ret, AV_ERR_INVALID_STATE);
            return 0;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeIllegalPara2400Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_NotifyEndOfStream(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
}
int VideoEncodeIllegalPara2500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_NotifyEndOfStream(nullptr);
    ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
    return 0;
}

int VideoEncodeIllegalPara2600Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        OH_AVCodecBufferAttr attr;
        attr.pts = -1;
        attr.size = -1;
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

        ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_PushInputData(venc_, 0, attr));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeIllegalPara2700Test()
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_PushInputData(nullptr, 0, attr));
    return 0;
}

int VideoEncodeIllegalPara2800Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        OH_AVCodecBufferAttr attr;
        attr.pts = 0;
        attr.size = 0;
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_PushInputData(nullptr, INVALID_INDEX_99999, attr));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeIllegalPara2900Test()
{
    ASSERT_EQ(nullptr, OH_VideoEncoder_GetInputDescription(nullptr));
    return 0;
}

int VideoEncodeApi0100Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(venc_, nullptr);
        OH_AVCodec *venc_2 = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(venc_2, nullptr);
        OH_VideoEncoder_Destroy(venc_2);
        venc_2 = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi3100Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(venc_, nullptr);
        OH_AVCodec *venc_2 = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(venc_2, nullptr);
        OH_VideoEncoder_Destroy(venc_2);
        venc_2 = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi0200Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(nullptr, venc_);

        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_Configure(venc_, format));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi0300Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(nullptr, venc_);

        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
        ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_Start(venc_));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi0400Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(nullptr, venc_);

        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Stop(venc_));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Stop(venc_));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi0500Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(nullptr, venc_);

        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Stop(venc_));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Reset(venc_));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Reset(venc_));
        return 0;
    } else {
        return -1;
    }
    return 0;
}

int VideoEncodeApi0600Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        signal_ = new VEncSignal();
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        OH_AVCodecAsyncCallback cb_;
        cb_.onError = onError;
        cb_.onStreamChanged = onStreamChanged;
        cb_.onNeedInputData = onNeedInputData;
        cb_.onNeedOutputData = onNewOutputData;
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_SetCallback(venc_, cb_, static_cast<void *>(signal_)));

        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, [] { return signal_->inIdxQueue_.size() > 1; });
        uint32_t index = signal_->inIdxQueue_.front();
        OH_AVCodecBufferAttr attr;
        attr.pts = 0;
        attr.size = 0;
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_PushInputData(venc_, index, attr));
        signal_->inIdxQueue_.pop();
        index = signal_->inIdxQueue_.front();
        ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_PushInputData(venc_, index, attr));
        signal_->inIdxQueue_.pop();
        OH_VideoEncoder_Stop(venc_);
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        delete signal_;
        signal_ = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi0700Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Flush(venc_));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Flush(venc_));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi0800Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(nullptr, venc_);

        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Stop(venc_));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Destroy(venc_));
        venc_ = nullptr;
        ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Destroy(venc_));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi0900Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(venc_, nullptr);
        OH_AVCodec *venc_2 = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(venc_2, nullptr);
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Destroy(venc_2));
        venc_2 = nullptr;
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi1000Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(venc_, nullptr);
        OH_AVCodecAsyncCallback cb_;
        cb_.onError = onError;
        cb_.onStreamChanged = onStreamChanged;
        cb_.onNeedInputData = onNeedInputData;
        cb_.onNeedOutputData = onNewOutputData;
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_SetCallback(venc_, cb_, nullptr));
        ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_SetCallback(venc_, cb_, nullptr));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi1100Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(venc_, nullptr);
        format = OH_VideoEncoder_GetOutputDescription(venc_);
        ASSERT_NE(nullptr, format);
        OH_AVFormat_Destroy(format);
        format = OH_VideoEncoder_GetOutputDescription(venc_);
        ASSERT_NE(nullptr, format);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi1200Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(nullptr, venc_);

        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

        ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_SetParameter(venc_, format));
        ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoEncoder_SetParameter(venc_, format));
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi1300Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        ASSERT_NE(nullptr, venc_);
        format = OH_VideoEncoder_GetInputDescription(venc_);
        ASSERT_NE(nullptr, format);
        OH_AVFormat_Destroy(format);
        format = OH_VideoEncoder_GetInputDescription(venc_);
        ASSERT_NE(nullptr, format);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi1400Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CQ));
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, QUALITY_INVALID_101));
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
            return 0;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeApi1410Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CQ));
            ASSERT_EQ(true, OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, -1));
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_Configure(venc_, format));
            return 0;
        }
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeSyncApi0010Test()
{
    uint32_t index;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_QueryInputBuffer(nullptr, &index, -1));
    return 0;
}

int VideoEncodeSyncApi0020Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            uint32_t index;
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Prepare(venc_));
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_QueryInputBuffer(venc_, &index, INT64_MAX));
            return 0;
        }
    }
    return 0;
}

int VideoEncodeSyncApi0030Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        ASSERT_EQ(AV_ERR_OK, OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum));
        if (pixelFormatNum > 0) {
            uint32_t index;
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            ASSERT_NE(nullptr, venc_);
            format = OH_AVFormat_Create();
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Configure(venc_, format));
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Prepare(venc_));
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_Start(venc_));
            ASSERT_EQ(AV_ERR_OK, OH_VideoEncoder_QueryInputBuffer(venc_, &index, INT64_MIN));
            return 0;
        }
    }
    return 0;
}

int VideoEncodeSyncApi0040Test()
{
    ASSERT_EQ(nullptr, OH_VideoEncoder_GetInputBuffer(nullptr, 1));
    return 0;
}

int VideoEncodeSyncApi0050Test()
{
    uint32_t index;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoEncoder_QueryOutputBuffer(nullptr, &index, -1));
    return 0;
}

int VideoEncodeSyncApi0060Test()
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncOutputWaitTime = INT64_MAX;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
    }
    return 0;
}

int VideoEncodeSyncApi0070Test()
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncOutputWaitTime = INT64_MIN;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
        return 0;
    } else {
    }
    return 0;
}

int VideoEncodeSyncApi0080Test()
{
    ASSERT_EQ(nullptr, OH_VideoEncoder_GetOutputBuffer(nullptr, 1));
    return 0;
}

void InitApiTest()
{
    TestSetUpTestCase();
}
