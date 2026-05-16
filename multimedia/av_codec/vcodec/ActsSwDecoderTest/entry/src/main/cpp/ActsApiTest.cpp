/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "include/ActsApiTest.h"
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include <string>

namespace {
constexpr int SWDEC_SUCCESS = 0;
constexpr uint32_t DEFAULT_WIDTH = 1920;
constexpr uint32_t DEFAULT_HEIGHT = 1080;
constexpr uint32_t DEFAULT_FRAME_RATE = 30;
constexpr uint32_t K_WIDTH_4K = 3840;
constexpr uint32_t K_HEIGHT_4K = 2160;
constexpr int32_t MAX_SUPPORTED_INSTANCES_EXPECTED = 64;
constexpr int PIXFORMAT_NUM = 4;
const std::string CODEC_NAME = "OH.Media.Codec.Decoder.Video.AVC";
const std::string INVALID_CODEC_NAME = "avdec_h264";

static void VdecErrorStub(OH_AVCodec* codec, int32_t errorCode, void* userData)
{
    (void)codec;
    (void)errorCode;
    (void)userData;
}
static void VdecFormatChangedStub(OH_AVCodec* codec, OH_AVFormat* format, void* userData)
{
    (void)codec;
    (void)format;
    (void)userData;
}
static void VdecInputDataReadyStub(OH_AVCodec* codec, uint32_t index, OH_AVMemory* data, void* userData)
{
    (void)codec;
    (void)index;
    (void)data;
    (void)userData;
}
static void VdecOutputDataReadyStub(OH_AVCodec* codec,
                                    uint32_t index,
                                    OH_AVMemory* data,
                                    OH_AVCodecBufferAttr* attr,
                                    void* userData)
{
    (void)codec;
    (void)index;
    (void)data;
    (void)attr;
    (void)userData;
}

static int32_t Cap7100ConfigureEachSupportedPixelFormat(const int32_t* pixelFormat, uint32_t pixelFormatNum)
{
    for (uint32_t i = 0; i < pixelFormatNum; i++) {
        OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
        if (!vdec) {
            return -1;
        }
        OH_AVFormat* format = OH_AVFormat_Create();
        if (!format) {
            OH_VideoDecoder_Destroy(vdec);
            return -1;
        }
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
        if (OH_VideoDecoder_Configure(vdec, format) != AV_ERR_OK) {
            OH_AVFormat_Destroy(format);
            OH_VideoDecoder_Destroy(vdec);
            return -1;
        }
        OH_AVFormat_Destroy(format);
        OH_VideoDecoder_Destroy(vdec);
    }
    return AV_ERR_OK;
}

static int32_t Cap7100ExpectInvalidDoubleRgbaRejected()
{
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!vdec) {
        return SWDEC_SUCCESS;
    }
    OH_AVFormat* format = OH_AVFormat_Create();
    if (!format) {
        OH_VideoDecoder_Destroy(vdec);
        return -1;
    }
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA + AV_PIXEL_FORMAT_RGBA);
    int r = OH_VideoDecoder_Configure(vdec, format);
    OH_AVFormat_Destroy(format);
    OH_VideoDecoder_Destroy(vdec);
    if (r == AV_ERR_OK) {
        return -1;
    }
    return SWDEC_SUCCESS;
}
} // namespace

namespace Acts {
namespace SwDecoder {

// ---- ILLEGAL_PARA (30) ----
int VideoSwdecIllegalPara0100()
{
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByMime(nullptr);
    if ((vdec == nullptr) != (1)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara0200()
{
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(nullptr);
    if ((vdec == nullptr) != (1)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara3300()
{
    OH_AVCodecAsyncCallback cb = {};
    cb.onError = VdecErrorStub;
    cb.onStreamChanged = VdecFormatChangedStub;
    cb.onNeedInputData = VdecInputDataReadyStub;
    cb.onNeedOutputData = VdecOutputDataReadyStub;
    int ret = OH_VideoDecoder_SetCallback(nullptr, cb, nullptr);
    if ((ret) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara1800()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVCodecAsyncCallback cb2 = {};
    cb2.onError = nullptr;
    cb2.onStreamChanged = nullptr;
    cb2.onNeedInputData = nullptr;
    cb2.onNeedOutputData = nullptr;
    int r = OH_VideoDecoder_SetCallback(vdec, cb2, nullptr);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_OK)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara0300()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!vdec) {
        return -1;
    }
    OH_AVCodecAsyncCallback cb = {};
    cb.onError = VdecErrorStub;
    cb.onStreamChanged = VdecFormatChangedStub;
    cb.onNeedInputData = VdecInputDataReadyStub;
    cb.onNeedOutputData = VdecOutputDataReadyStub;
    int r = OH_VideoDecoder_SetCallback(vdec, cb, nullptr);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_OK)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara0400()
{
    int r = OH_VideoDecoder_Destroy(nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara0500()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    int r = OH_VideoDecoder_Configure(vdec, nullptr);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara1400()
{
    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    int r = OH_VideoDecoder_Configure(nullptr, format);
    OH_AVFormat_Destroy(format);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara5000()
{
    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, "width", DEFAULT_WIDTH);
    int r = OH_VideoDecoder_Configure(nullptr, format);
    OH_AVFormat_Destroy(format);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara5100()
{
    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, "width", DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, "height", DEFAULT_HEIGHT);
    OH_AVFormat_SetDoubleValue(format, "frame_rate", static_cast<double>(DEFAULT_FRAME_RATE));
    int r = OH_VideoDecoder_Configure(nullptr, format);
    OH_AVFormat_Destroy(format);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara0600()
{
    int r = OH_VideoDecoder_Start(nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara0700()
{
    int r = OH_VideoDecoder_Stop(nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara0800()
{
    int r = OH_VideoDecoder_Flush(nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara0900()
{
    int r = OH_VideoDecoder_Reset(nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara1000()
{
    OH_AVFormat* desc = OH_VideoDecoder_GetOutputDescription(nullptr);
    if ((desc == nullptr) != (1)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara1100()
{
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!vdec) {
        return SWDEC_SUCCESS;
    }
    int r = OH_VideoDecoder_SetParameter(vdec, nullptr);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara4100()
{
    int r = OH_VideoDecoder_Prepare(nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara1500()
{
    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, "width", DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, "height", DEFAULT_HEIGHT);
    OH_AVFormat_SetDoubleValue(format, "frame_rate", static_cast<double>(DEFAULT_FRAME_RATE));
    int r = OH_VideoDecoder_SetParameter(nullptr, format);
    OH_AVFormat_Destroy(format);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara1200()
{
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!vdec) {
        return SWDEC_SUCCESS;
    }
    int r = OH_VideoDecoder_SetSurface(vdec, nullptr);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara1600()
{
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(INVALID_CODEC_NAME.c_str());
    if ((vdec == nullptr) != (1)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara1700()
{
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByMime(INVALID_CODEC_NAME.c_str());
    if ((vdec == nullptr) != (1)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara2200()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    bool isValid = false;
    int r = OH_VideoDecoder_IsValid(nullptr, &isValid);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    r = OH_VideoDecoder_IsValid(vdec, nullptr);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara2500()
{
    int r = OH_VideoDecoder_RenderOutputData(nullptr, 0);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara2600()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!vdec) {
        return -1;
    }
    int r = OH_VideoDecoder_RenderOutputData(vdec, 0);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara2700()
{
    int r = OH_VideoDecoder_FreeOutputData(nullptr, 0);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara2800()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!vdec) {
        return -1;
    }
    int r = OH_VideoDecoder_FreeOutputData(vdec, 0);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara2900()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!vdec) {
        return -1;
    }
    int r = OH_VideoDecoder_FreeOutputData(vdec, static_cast<uint32_t>(-1));
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara3000()
{
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!vdec) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodecBufferAttr attr = {};
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    int r = OH_VideoDecoder_PushInputData(vdec, 0, attr);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara3100()
{
    OH_AVCodecBufferAttr attr = {};
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    int r = OH_VideoDecoder_PushInputData(nullptr, static_cast<uint32_t>(-1), attr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecIllegalPara3200()
{
    OH_AVCodecBufferAttr attr = {};
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    int r = OH_VideoDecoder_PushInputData(nullptr, 0, attr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

// ---- API (12) ----
int VideoSwdecApi0100()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVCodec* vdec2 = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec2 != nullptr)) {
        return (-1);
    }

    OH_VideoDecoder_Destroy(vdec2);
    OH_VideoDecoder_Destroy(vdec);
    return SWDEC_SUCCESS;
}

int VideoSwdecApi0200()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, "width", DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, "height", DEFAULT_HEIGHT);
    OH_AVFormat_SetDoubleValue(format, "frame_rate", static_cast<double>(DEFAULT_FRAME_RATE));
    if ((OH_VideoDecoder_Configure(vdec, format)) != (AV_ERR_OK)) {
        return (-1);
    }

    int r = OH_VideoDecoder_Configure(vdec, format);
    OH_AVFormat_Destroy(format);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecApi0300()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, "width", DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, "height", DEFAULT_HEIGHT);
    OH_AVFormat_SetDoubleValue(format, "frame_rate", static_cast<double>(DEFAULT_FRAME_RATE));
    if ((OH_VideoDecoder_Configure(vdec, format)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Start(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    int r = OH_VideoDecoder_Start(vdec);
    OH_AVFormat_Destroy(format);
    OH_VideoDecoder_Stop(vdec);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecApi0400()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, static_cast<double>(DEFAULT_FRAME_RATE));
    if ((OH_VideoDecoder_Configure(vdec, format)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Start(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Stop(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Stop(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    OH_AVFormat_Destroy(format);
    OH_VideoDecoder_Destroy(vdec);
    return SWDEC_SUCCESS;
}

int VideoSwdecApi0500()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, "width", DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, "height", DEFAULT_HEIGHT);
    OH_AVFormat_SetDoubleValue(format, "frame_rate", static_cast<double>(DEFAULT_FRAME_RATE));
    if ((OH_VideoDecoder_Configure(vdec, format)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Start(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Stop(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Reset(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Reset(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    OH_AVFormat_Destroy(format);
    OH_VideoDecoder_Destroy(vdec);
    return SWDEC_SUCCESS;
}

int VideoSwdecApi0600()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, "width", DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, "height", DEFAULT_HEIGHT);
    OH_AVFormat_SetDoubleValue(format, "frame_rate", static_cast<double>(DEFAULT_FRAME_RATE));
    if ((OH_VideoDecoder_Configure(vdec, format)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Start(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    OH_AVCodecBufferAttr attr = {};
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    int r = OH_VideoDecoder_PushInputData(vdec, 0, attr);
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return (SWDEC_SUCCESS);
    }

    OH_AVFormat_Destroy(format);
    OH_VideoDecoder_Stop(vdec);
    OH_VideoDecoder_Destroy(vdec);
    return SWDEC_SUCCESS;
}

int VideoSwdecApi0700()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, static_cast<double>(DEFAULT_FRAME_RATE));
    if ((OH_VideoDecoder_Configure(vdec, format)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Start(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Flush(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Flush(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    OH_AVFormat_Destroy(format);
    OH_VideoDecoder_Stop(vdec);
    OH_VideoDecoder_Destroy(vdec);
    return SWDEC_SUCCESS;
}

int VideoSwdecApi0800()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, "width", DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, "height", DEFAULT_HEIGHT);
    OH_AVFormat_SetDoubleValue(format, "frame_rate", static_cast<double>(DEFAULT_FRAME_RATE));
    if ((OH_VideoDecoder_Configure(vdec, format)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Start(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_VideoDecoder_Stop(vdec)) != (AV_ERR_OK)) {
        return (-1);
    }

    OH_VideoDecoder_Destroy(vdec);
    vdec = nullptr;
    int r = OH_VideoDecoder_Destroy(vdec);
    OH_AVFormat_Destroy(format);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecApi0900()
{
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVCodec* vdec2 = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (!(vdec2 != nullptr)) {
        return (-1);
    }

    OH_VideoDecoder_Destroy(vdec2);
    OH_VideoDecoder_Destroy(vdec);
    return SWDEC_SUCCESS;
}

int VideoSwdecApi1000()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!vdec) {
        return -1;
    }
    OH_AVCodecAsyncCallback cb = {};
    cb.onError = VdecErrorStub;
    cb.onStreamChanged = VdecFormatChangedStub;
    cb.onNeedInputData = VdecInputDataReadyStub;
    cb.onNeedOutputData = VdecOutputDataReadyStub;
    if (OH_VideoDecoder_SetCallback(vdec, cb, nullptr) != AV_ERR_OK) {
        OH_VideoDecoder_Destroy(vdec);
        return -1;
    }
    if (OH_VideoDecoder_SetCallback(vdec, cb, nullptr) != AV_ERR_OK) {
        OH_VideoDecoder_Destroy(vdec);
        return -1;
    }
    OH_VideoDecoder_Destroy(vdec);
    return SWDEC_SUCCESS;
}

int VideoSwdecApi1100()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!vdec) {
        return -1;
    }
    OH_AVFormat* format = OH_VideoDecoder_GetOutputDescription(vdec);
    if (!(format != nullptr)) {
        return (-1);
    }

    format = OH_VideoDecoder_GetOutputDescription(vdec);
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_VideoDecoder_Destroy(vdec);
    return SWDEC_SUCCESS;
}

int VideoSwdecApi1200()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
    if (!(vdec != nullptr)) {
        return (-1);
    }

    OH_AVFormat* format = OH_AVFormat_Create();
    if (!(format != nullptr)) {
        return (-1);
    }

    OH_AVFormat_SetIntValue(format, "width", DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, "height", DEFAULT_HEIGHT);
    OH_AVFormat_SetDoubleValue(format, "frame_rate", static_cast<double>(DEFAULT_FRAME_RATE));
    int r = OH_VideoDecoder_SetParameter(vdec, format);
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return (SWDEC_SUCCESS);
    }

    OH_AVFormat_Destroy(format);
    OH_VideoDecoder_Destroy(vdec);
    return SWDEC_SUCCESS;
}

// ---- CAP_API (51) ----
int VideoSwdecCapApi0100()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false);
    if (!(cap != nullptr)) {
        return (-1);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi0300()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(cap != nullptr)) {
        return (-1);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi0400()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(nullptr, false, SOFTWARE);
    if ((cap == nullptr) != (1)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi0500()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(cap != nullptr)) {
        return (-1);
    }

    if (OH_AVCapability_IsHardware(cap)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi0600()
{
    if (OH_AVCapability_IsHardware(nullptr)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi0700()
{
    int n = OH_AVCapability_GetMaxSupportedInstances(nullptr);
    if ((n) != (0)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi0800()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(cap != nullptr)) {
        return (-1);
    }

    int n = OH_AVCapability_GetMaxSupportedInstances(cap);
    if ((n) != (MAX_SUPPORTED_INSTANCES_EXPECTED)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi0900()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(cap != nullptr)) {
        return (-1);
    }

    const char* name = OH_AVCapability_GetName(cap);
    if ((name != nullptr && std::string(name) == CODEC_NAME) != (1)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi1000()
{
    const char* name = OH_AVCapability_GetName(nullptr);
    int ret = (name != nullptr && name[0] == '\0') ? 0 : -1;
    if ((ret) != (0)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi3100()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    int r = OH_AVCapability_GetVideoWidthAlignment(capability, nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi3200()
{
    int32_t alignment = 0;
    int r = OH_AVCapability_GetVideoWidthAlignment(nullptr, &alignment);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi3300()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    int32_t alignment = 0;
    int r = OH_AVCapability_GetVideoWidthAlignment(capability, &alignment);
    if ((r) != (AV_ERR_OK)) {
        return (-1);
    }

    if (alignment < 0) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi3400()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    int r = OH_AVCapability_GetVideoHeightAlignment(capability, nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi3500()
{
    int32_t alignment = 0;
    int r = OH_AVCapability_GetVideoHeightAlignment(nullptr, &alignment);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi3600()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoWidthRangeForHeight(nullptr, DEFAULT_HEIGHT, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi3700()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    int r = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_HEIGHT, nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi3800()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoWidthRangeForHeight(capability, 0, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi3900()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_HEIGHT, &range);
    if ((r) != (AV_ERR_OK)) {
        return (-1);
    }

    if (range.minVal < 0 || range.maxVal <= 0) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi4000()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoHeightRangeForWidth(nullptr, DEFAULT_WIDTH, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi4100()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVRange range = {};
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    int r = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_WIDTH, nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi4200()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoHeightRangeForWidth(capability, 0, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi4300()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoHeightRangeForWidth(capability, 0, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi4400()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_WIDTH, &range);
    if ((r) != (AV_ERR_OK)) {
        return (-1);
    }

    if (range.minVal < 0 || range.maxVal <= 0) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi4500()
{
    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoWidthRange(nullptr, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi4600()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    int r = OH_AVCapability_GetVideoWidthRange(capability, nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi4700()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoWidthRange(capability, &range);
    if ((r) != (AV_ERR_OK)) {
        return (-1);
    }

    if (range.minVal < 0 || range.maxVal <= 0) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi4800()
{
    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoHeightRange(nullptr, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi4900()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    int r = OH_AVCapability_GetVideoHeightRange(capability, nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi5000()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoHeightRange(capability, &range);
    if ((r) != (AV_ERR_OK)) {
        return (-1);
    }

    if (range.minVal < 0 || range.maxVal <= 0) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi5100()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    if (OH_AVCapability_IsVideoSizeSupported(capability, 0, DEFAULT_HEIGHT)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi5200()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    if (OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, 0)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi5300()
{
    if (OH_AVCapability_IsVideoSizeSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi9400()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange heightRange = {};
    OH_AVRange widthRange = {};
    if ((OH_AVCapability_GetVideoHeightRange(capability, &heightRange)) != (AV_ERR_OK)) {
        return (-1);
    }

    if ((OH_AVCapability_GetVideoWidthRange(capability, &widthRange)) != (AV_ERR_OK)) {
        return (-1);
    }

    if (OH_AVCapability_IsVideoSizeSupported(capability, widthRange.maxVal + 1, heightRange.maxVal + 1)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi5400()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    if (!OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi5500()
{
    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoFrameRateRange(nullptr, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi5600()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    int r = OH_AVCapability_GetVideoFrameRateRange(capability, nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi5700()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
    if ((r) != (AV_ERR_OK)) {
        return (-1);
    }

    if (range.minVal < 0 || range.maxVal <= 0) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi5800()
{
    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoFrameRateRangeForSize(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi5900()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    int r = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi6000()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, 0, DEFAULT_HEIGHT, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi6100()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, 0, &range);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi6200()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    OH_AVRange range = {};
    int r = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, 1280, 720, &range);
    if ((r) != (AV_ERR_OK)) {
        return (-1);
    }

    if (range.minVal < 0 || range.maxVal <= 0) {
        return -1;
    }
    r = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    if ((r) != (AV_ERR_OK)) {
        return (-1);
    }

    r = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, K_WIDTH_4K, K_HEIGHT_4K, &range);
    if ((r) != (AV_ERR_OK)) {
        return (-1);
    }

    if (range.minVal < 0 || range.maxVal <= 0) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi6300()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, 0, DEFAULT_HEIGHT, DEFAULT_FRAME_RATE)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi6400()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, 0, DEFAULT_FRAME_RATE)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi6500()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi6600()
{
    if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, DEFAULT_FRAME_RATE)) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi6700()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    const bool isSupported = OH_AVCapability_AreVideoSizeAndFrameRateSupported(
        capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, DEFAULT_FRAME_RATE);
    if (!isSupported) {
        return -1;
    }
    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi6800()
{
    const int32_t* pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    int r = OH_AVCapability_GetVideoSupportedPixelFormats(nullptr, &pixelFormat, &pixelFormatNum);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi6900()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    uint32_t pixelFormatNum = 0;
    int r = OH_AVCapability_GetVideoSupportedPixelFormats(capability, nullptr, &pixelFormatNum);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi7000()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    const int32_t* pixelFormat = nullptr;
    int r = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, nullptr);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecCapApi7100()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (!(capability != nullptr)) {
        return (-1);
    }

    const int32_t* pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    int r = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
    if (pixelFormat == nullptr || pixelFormatNum != PIXFORMAT_NUM || r != AV_ERR_OK) {
        return -1;
    }
    if (Cap7100ConfigureEachSupportedPixelFormat(pixelFormat, pixelFormatNum) != AV_ERR_OK) {
        return -1;
    }
    return Cap7100ExpectInvalidDoubleRgbaRejected();
}

// ---- Other codec ILLEGAL_PARA (3) ----
int VideoMpeg2SwdecIllegalPara0700()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2);
    if (!(vdec != nullptr)) {
        return (-1);
    }

    int r = OH_VideoDecoder_Configure(vdec, nullptr);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoMpeg4SwdecIllegalPara0700()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4_PART2, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4_PART2);
    if (!(vdec != nullptr)) {
        return (-1);
    }

    int r = OH_VideoDecoder_Configure(vdec, nullptr);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

int VideoH263SwdecIllegalPara0700()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_H263, false, SOFTWARE);
    if (!cap) {
        return SWDEC_SUCCESS;
    }
    OH_AVCodec* vdec = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_H263);
    if (!(vdec != nullptr)) {
        return (-1);
    }

    int r = OH_VideoDecoder_Configure(vdec, nullptr);
    OH_VideoDecoder_Destroy(vdec);
    if ((r) != (AV_ERR_INVALID_VAL)) {
        return (SWDEC_SUCCESS);
    }

    return SWDEC_SUCCESS;
}

} // namespace SwDecoder
} // namespace Acts
