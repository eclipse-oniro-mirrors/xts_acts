/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include <string>

#include "gtest/gtest.h"
#include "native_avcodec_videoencoder.h"
#include "native_averrors.h"
#include "videoenc_api11_sample.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"

namespace {
OH_AVCodec *venc_ = NULL;
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
OH_AVFormat *format = nullptr;
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr uint32_t DEFAULT_KEY_FRAME_INTERVAL = 1000;
constexpr uint32_t DEFAULT_BITRATE = 10000000;
constexpr double DEFAULT_FRAME_RATE = 30.0;
OH_AVPixelFormat DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
const char *INP_DIR_720 = "/data/test/media/1280_720_nv.yuv";
} // namespace
namespace OHOS {
namespace Media {
class HwEncTemporalNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();

protected:
    const char *inpDir720 = "/data/test/media/1280_720_nv.yuv";
    const char *inpDir720Array[16] = {"/data/test/media/1280_720_nv.yuv",    "/data/test/media/1280_720_nv_1.yuv",
                                      "/data/test/media/1280_720_nv_2.yuv",  "/data/test/media/1280_720_nv_3.yuv",
                                      "/data/test/media/1280_720_nv_7.yuv",  "/data/test/media/1280_720_nv_10.yuv",
                                      "/data/test/media/1280_720_nv_13.yuv", "/data/test/media/1280_720_nv_4.yuv",
                                      "/data/test/media/1280_720_nv_8.yuv",  "/data/test/media/1280_720_nv_11.yuv",
                                      "/data/test/media/1280_720_nv_14.yuv", "/data/test/media/1280_720_nv_5.yuv",
                                      "/data/test/media/1280_720_nv_9.yuv",  "/data/test/media/1280_720_nv_12.yuv",
                                      "/data/test/media/1280_720_nv_15.yuv", "/data/test/media/1280_720_nv_6.yuv"};
};
} // namespace Media
} // namespace OHOS

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

void HwEncTemporalNdkTest::SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (memcpy_s(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != 0)
        cout << "memcpy failed" << endl;
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (memcpy_s(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc, strlen(tmpCodecNameHevc)) != 0)
        cout << "memcpy failed" << endl;
    cout << "codecname_hevc: " << g_codecNameHEVC << endl;
}
void HwEncTemporalNdkTest::TearDownTestCase() {}
void HwEncTemporalNdkTest::SetUp() {}
void HwEncTemporalNdkTest::TearDown()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
}
namespace {
/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0020
 * @tc.name      : OOH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_REFERENCE_MODE error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_API_0020, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIX_FMT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, DEFAULT_KEY_FRAME_INTERVAL);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_ENABLE_TEMPORAL_SCALABILITY, 1);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_REFERENCE_MODE, 3);
        ret = OH_VideoEncoder_Configure(venc_, format);
        if (!access("/system/lib64/media/", 0)) {
            ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
        } else {
            ASSERT_EQ(ret, AV_ERR_OK);
        }
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_API_0030
 * @tc.name      : OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_SIZE para error
 * @tc.desc      : api test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_API_0030, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        ASSERT_NE(nullptr, venc_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIX_FMT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, DEFAULT_KEY_FRAME_INTERVAL);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_ENABLE_TEMPORAL_SCALABILITY, 1);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_SIZE, 30);
        ret = OH_VideoEncoder_Configure(venc_, format);
        if (!access("/system/lib64/media/", 0)) {
            ASSERT_EQ(ret, AV_ERR_INVALID_VAL);
        } else {
            ASSERT_EQ(ret, AV_ERR_OK);
        }
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0010
 * @tc.name      : 调用使能接口
 * @tc.desc      : api test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0010, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    format = OH_AVCapability_GetFeatureProperties(cap, VIDEO_ENCODER_TEMPORAL_SCALABILITY);
    if (cap && format) {
        OH_AVFormat_Destroy(format);
        int32_t temporalGopSize = 2;
        if (!access("/system/lib64/media/", 0)) {
            auto vEncSample = make_unique<VEncAPI11Sample>();
            cout << "running on phone=========="<< endl;
            ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
            vEncSample->TEMPORAL_ENABLE = true;
            ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        } else {
            auto vEncSample = make_unique<VEncAPI11Sample>();
            cout << "running on rk=========="<< endl;
            ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
            vEncSample->TEMPORAL_ENABLE = true;
            ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        }
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0020
 * @tc.name      : 未使能，配置相邻模式分层编码,h264 buffer
 * @tc.desc      : api test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0020, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0020.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->TEMPORAL_ENABLE = false;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = 2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0030
 * @tc.name      : 未使能，配置相邻模式分层编码,h265 surf
 * @tc.desc      : api test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0030, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0030.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = false;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = 2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0040
 * @tc.name      : 配置跨帧模式分层编码,默认gopsize,h265 surf
 * @tc.desc      : api test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0040, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0040.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_DEFAULT = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0440
 * @tc.name      : 配置相邻模式分层编码,默认gopsize,h265 surf
 * @tc.desc      : api test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0440, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0440.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_DEFAULT = true;
        int32_t temporalGopSize = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0050
 * @tc.name      : h265，surf相邻参考模式分层编码。时域gop size为2
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0050, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0050.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = 2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0060
 * @tc.name      : h265，surf相邻参考模式分层编码。时域gop size为I帧间隔-1
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0060, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0060.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;

        int32_t temporalGopSize = vEncSample->DEFAULT_FRAME_RATE-1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0070
 * @tc.name      : h265，surf跨帧参考模式分层编码。时域gop size为2
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0070, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0070.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0080
 * @tc.name      : h265，surf跨帧参考模式分层编码  时域gop size为I帧间隔-1
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0080, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0080.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = vEncSample->DEFAULT_FRAME_RATE-1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0090
 * @tc.name      : h264 buffer 相邻参考模式分层编码 时域gop size为任意合法值
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0090, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0090.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = 3;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0100
 * @tc.name      : h264 buffer 跨帧参考模式分层编码 时域gop size为任意合法值
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0100, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0100.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 3;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0110
 * @tc.name      : h264 surf 相邻参考模式分层编码 时域gop size为任意合法值
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0110, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0110.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = 5;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0120
 * @tc.name      : h264 surf 跨帧参考模式分层编码 时域gop size为5
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0120, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0120.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 5;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0130
 * @tc.name      : h265 buffer 相邻参考模式分层编码 时域gop size为任意合法值
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0130, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0130.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = 6;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0140
 * @tc.name      : h265 buffer 跨帧参考模式分层编码 时域gop size为8
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0140, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0140.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 8;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0150
 * @tc.name      : h265 surf 相邻参考模式分层编码 时域gop size为任意合法值
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0150, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0150.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = 9;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0160
 * @tc.name      : h265 surf 跨帧参考模式分层编码 时域gop size为12
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0160, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0160.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 12;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0170
 * @tc.name      : h265 surf分层编码过程中强制I帧，检查相邻分层结构是否刷新
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0170, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0170.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = 3;
        vEncSample->enableForceIDR = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_TEMPORAL_ENCODE_FUNCTION_0180
 * @tc.name      : h265 surf分层编码过程中强制I帧，检查跨帧分层结构是否刷新
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_TEMPORAL_ENCODE_FUNCTION_0180, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0180.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 4;
        vEncSample->enableForceIDR = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_001
 * @tc.name      : LTR count设置为非法值
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_001, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_001.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->Reset());
        vEncSample->ltrParam.ltrCount = 11;
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder());
    }
}

/**
 * @tc.number    : LTR_FUNC_002
 * @tc.name      : 能力查询是否支持LTR
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_002, TestSize.Level0)
{
    OH_AVCapability *capa = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char* codecName = OH_AVCapability_GetName(capa);
    if (!strcmp(codecName, "OMX.hisi.video.encoder.hevc")) {
        ASSERT_EQ(true, OH_AVCapability_IsFeatureSupported(capa, VIDEO_ENCODER_LONG_TERM_REFERENCE));
    } else {
        ASSERT_EQ(false, OH_AVCapability_IsFeatureSupported(capa, VIDEO_ENCODER_LONG_TERM_REFERENCE));
    }
}

/**
 * @tc.number    : LTR_FUNC_004
 * @tc.name      : h265 surf模式 count 1 ,mark 第5帧 ,后续帧标记use
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_004, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_004.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_005
 * @tc.name      : h265 surf模式 count 1 ,mark 第5帧 ,后续帧标记use 但poc错误
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_005, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_005.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.useBadLtr = true;
        vEncSample->ltrParam.ltrCount = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_006
 * @tc.name      : h265 surf模式 count 10 ,每隔5帧mark一帧,每个参考帧后面都正确use当前参考帧
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_006, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_006.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 10;
        vEncSample->ltrParam.ltrInterval = 5;
        vEncSample->ltrParam.useLtrIndex = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_007
 * @tc.name      : h265 surf模式 count 10 ,每隔5帧mark一帧,不设置use帧
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_007, TestSize.Level2)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_007.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = false;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 10;
        vEncSample->ltrParam.ltrInterval = 5;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_008
 * @tc.name      : h265 surf模式 count 2 ,每隔5帧mark一帧,所有帧都use第一个参考帧
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_008, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_008.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 2;
        vEncSample->ltrParam.ltrInterval = 5;
        vEncSample->ltrParam.useLtrIndex = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_009
 * @tc.name      : h265 surf模式 ,不设置count ,mark一个参考帧 ,一个被标记为use ,poc正确
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_009, TestSize.Level2)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_009.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->ltrParam.ltrCount = -1;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_010
 * @tc.name      : h265 surf模式,分层编码 和LTR同时设置
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_010, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_010.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->enableLTR = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_DEFAULT = true;
        int32_t temporalGopSize = 0;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_011
 * @tc.name      : count为5,h264 buffer,每隔5帧mark参考帧,且都被正确use
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_011, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = 1280;
        vEncApi11Sample->DEFAULT_HEIGHT = 720;
        vEncApi11Sample->DEFAULT_FRAME_RATE = 30;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_011.h264";
        vEncApi11Sample->enableLTR = true;
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.ltrCount = 5;
        vEncApi11Sample->ltrParam.ltrInterval = 5;
        vEncApi11Sample->ltrParam.useLtrIndex = 1;
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->StartVideoEncoder());
        vEncApi11Sample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_012
 * @tc.name      : h264 surf模式 每隔5帧mark参考帧
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_012, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_012.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 5;
        vEncSample->ltrParam.ltrInterval = 5;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->ltrParam.useLtrIndex = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_013
 * @tc.name      : count为5,h265 buffer,每隔5帧mark参考帧,且都被正确use
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_013, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = 1280;
        vEncApi11Sample->DEFAULT_HEIGHT = 720;
        vEncApi11Sample->DEFAULT_FRAME_RATE = 30;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_013.h265";
        vEncApi11Sample->enableLTR = true;
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.ltrCount = 5;
        vEncApi11Sample->ltrParam.ltrInterval = 5;
        vEncApi11Sample->ltrParam.useLtrIndex = 1;
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->StartVideoEncoder());
        vEncApi11Sample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_014
 * @tc.name      : h265 surf模式 每隔5帧mark参考帧
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_014, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_014.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 5;
        vEncSample->ltrParam.ltrInterval = 5;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->ltrParam.useLtrIndex = 1;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_015
 * @tc.name      : count为5,h264 buffer,每隔5帧mark参考帧,且use自己
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_015, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = 1280;
        vEncApi11Sample->DEFAULT_HEIGHT = 720;
        vEncApi11Sample->DEFAULT_FRAME_RATE = 30;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_015.h264";
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.markAndUseSelf = true;
        vEncApi11Sample->ltrParam.ltrCount = 5;
        vEncApi11Sample->ltrParam.ltrInterval = 5;
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->StartVideoEncoder());
        vEncApi11Sample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->errCount);
    }
}

/**
 * @tc.number    : LTR_FUNC_016
 * @tc.name      : count为5,h265 buffer,每隔5帧mark参考帧,且use自己
 * @tc.desc      : function test
 */
HWTEST_F(HwEncTemporalNdkTest, LTR_FUNC_016, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = 1280;
        vEncApi11Sample->DEFAULT_HEIGHT = 720;
        vEncApi11Sample->DEFAULT_FRAME_RATE = 30;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_016.h265";
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.markAndUseSelf = true;
        vEncApi11Sample->ltrParam.ltrCount = 5;
        vEncApi11Sample->ltrParam.ltrInterval = 5;
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->StartVideoEncoder());
        vEncApi11Sample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncApi11Sample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_UNIFORMLY_ENCODE_FUNCTION_0100
 * @tc.name      : uniformly temporal buffer 264 encode,tgop 2
 * @tc.desc      : func test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_UNIFORMLY_ENCODE_FUNCTION_0100, TestSize.Level0)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0100.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = 2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : VIDEO_UNIFORMLY_ENCODE_FUNCTION_0200
 * @tc.name      : uniformly temporal buffer 264 encode,tgop 3
 * @tc.desc      : func test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_UNIFORMLY_ENCODE_FUNCTION_0200, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0200.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = 3;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
    }
}

/**
 * @tc.number    : VIDEO_UNIFORMLY_ENCODE_FUNCTION_0300
 * @tc.name      : uniformly temporal buffer 265 encode,tgop 2
 * @tc.desc      : func test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_UNIFORMLY_ENCODE_FUNCTION_0300, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0300.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = 2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_UNIFORMLY_ENCODE_FUNCTION_0400
 * @tc.name      : uniformly temporal buffer 265 encode,tgop 4
 * @tc.desc      : func test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_UNIFORMLY_ENCODE_FUNCTION_0400, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0400.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = 4;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_UNIFORMLY_ENCODE_FUNCTION_0500
 * @tc.name      : uniformly temporal buffer 265 encode,tgop 5
 * @tc.desc      : func test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_UNIFORMLY_ENCODE_FUNCTION_0500, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0500.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = 5;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
    }
}

/**
 * @tc.number    : VIDEO_UNIFORMLY_ENCODE_FUNCTION_0600
 * @tc.name      : uniformly temporal surface 264 encode,tgop 2
 * @tc.desc      : func test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_UNIFORMLY_ENCODE_FUNCTION_0600, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0600.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = 2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_UNIFORMLY_ENCODE_FUNCTION_0700
 * @tc.name      : uniformly temporal surface 264 encode,tgop 3
 * @tc.desc      : func test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_UNIFORMLY_ENCODE_FUNCTION_0700, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0700.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = 3;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
    }
}

/**
 * @tc.number    : VIDEO_UNIFORMLY_ENCODE_FUNCTION_0800
 * @tc.name      : uniformly temporal surface 265 encode,tgop 2
 * @tc.desc      : func test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_UNIFORMLY_ENCODE_FUNCTION_0800, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0800.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = 2;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_UNIFORMLY_ENCODE_FUNCTION_0900
 * @tc.name      : uniformly temporal surface 265 encode,tgop 4
 * @tc.desc      : func test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_UNIFORMLY_ENCODE_FUNCTION_0900, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0900.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = 4;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : VIDEO_UNIFORMLY_ENCODE_FUNCTION_1000
 * @tc.name      : uniformly temporal buffer 265 encode,tgop 5
 * @tc.desc      : func test
 */
HWTEST_F(HwEncTemporalNdkTest, VIDEO_UNIFORMLY_ENCODE_FUNCTION_1000, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_1000.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = 1280;
        vEncSample->DEFAULT_HEIGHT = 720;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = 5;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize));
    }
}
} // namespace