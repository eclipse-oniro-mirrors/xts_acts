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
#include <limits>
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
constexpr uint32_t DEFAULT_BITRATE = 1000000;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
const char *INP_DIR_720 = "/data/test/media/1280_720_nv.yuv";
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
} // namespace
namespace OHOS {
namespace Media {
class HwEncSetParamNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();
};
} // namespace Media
} // namespace OHOS

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

void HwEncSetParamNdkTest::SetUpTestCase()
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
void HwEncSetParamNdkTest::TearDownTestCase() {}
void HwEncSetParamNdkTest::SetUp() {}
void HwEncSetParamNdkTest::TearDown()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
}
namespace {
/**
 * @tc.number    : RESET_BITRATE_001
 * @tc.name      : reset bitrate use illegal value
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_001, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, -1);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, LONG_MAX);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_BITRATE_002
 * @tc.name      : reset bitrate in CQ mode
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_002, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE >> 1);
        EXPECT_NE(AV_ERR_OK, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_BITRATE_003
 * @tc.name      : reset bitrate in CBR mode ,gop size -1
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_003, TestSize.Level0)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_BITRATE_004
 * @tc.name      : reset bitrate in CBR mode ,gop size 0
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_004, TestSize.Level0)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_BITRATE_005
 * @tc.name      : reset bitrate in CBR mode ,gop size 1s
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_005, TestSize.Level0)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_BITRATE_006
 * @tc.name      : reset bitrate in VBR mode
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_006, TestSize.Level0)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_BITRATE_007
 * @tc.name      : reset bitrate use illegal value, h265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_007, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, -1);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, LONG_MAX);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_BITRATE_008
 * @tc.name      : reset bitrate in CQ mode, h265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_008, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE >> 1);
        EXPECT_NE(AV_ERR_OK, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_BITRATE_009
 * @tc.name      : reset bitrate in CBR mode ,gop size -1, h265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_009, TestSize.Level0)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_BITRATE_010
 * @tc.name      : reset bitrate in CBR mode ,gop size 0, h265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_010, TestSize.Level0)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_BITRATE_011
 * @tc.name      : reset bitrate in CBR mode ,gop size 1s, h265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_011, TestSize.Level0)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_BITRATE_012
 * @tc.name      : reset bitrate in vbr mode h265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_BITRATE_012, TestSize.Level0)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_FRAMERATE_001
 * @tc.name      : reset framerate use illegal value
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_001, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, -1.0);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : RESET_FRAMERATE_012
 * @tc.name      : reset framerate use illegal value
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_012, TestSize.Level0)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, -1.0);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : RESET_FRAMERATE_013
 * @tc.name      : reset framerate use max value
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_013, TestSize.Level0)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DBL_MAX);
        EXPECT_EQ(AV_ERR_OK, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : RESET_FRAMERATE_014
 * @tc.name      : reset framerate use max value
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_014, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DBL_MAX);
        EXPECT_EQ(AV_ERR_OK, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : RESET_FRAMERATE_002
 * @tc.name      : reset framerate in CQ mode
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_002, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_r_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_FRAMERATE_003
 * @tc.name      : reset framerate in CBR mode, gop size -1
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_003, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_r_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_FRAMERATE_004
 * @tc.name      : reset framerate in CBR mode, gop size 0
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_004, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_r_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_FRAMERATE_005
 * @tc.name      : reset framerate in CBR mode, gop size 1s
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_005, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_r_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_FRAMERATE_006
 * @tc.name      : reset framerate in VBR mode, gop size 1s
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_006, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_r_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_FRAMERATE_007
 * @tc.name      : reset framerate in CQ mode hevc
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_007, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_r_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_FRAMERATE_008
 * @tc.name      : reset framerate in CBR mode, gop size -1 hevc
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_008, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_r_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_FRAMERATE_009
 * @tc.name      : reset framerate in CBR mode, gop size 0 hevc
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_009, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_r_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_FRAMERATE_010
 * @tc.name      : reset framerate in CBR mode, gop size 1s hevc
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_010, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_r_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_FRAMERATE_011
 * @tc.name      : reset framerate in VBR mode, gop size 1s hevc
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_FRAMERATE_011, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_r_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : RESET_QP_001
 * @tc.name      : reset QP with illegal parameter
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_001, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, -1);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, -1);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, 200);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, 200);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : RESET_QP_002
 * @tc.name      : reset QP with illegal parameter
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_002, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, -1);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, -1);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, 200);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, 200);
        EXPECT_EQ(AV_ERR_INVALID_VAL, vEncSample->SetParameter(format));
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_003
 * @tc.name      : reset QP in cq mode, use buffer->setparameter
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_003, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_b_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_004
 * @tc.name      : reset QP in CQ mode, use setparameter
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_004, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_005
 * @tc.name      : reset QP in CBR mode, use buffer->setparameter
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_005, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_b_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_006
 * @tc.name      : reset QP in CBR mode, use setparameter
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_006, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_007
 * @tc.name      : reset QP in VBR mode, use buffer->setparameter
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_007, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_b_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_008
 * @tc.name      : reset QP in VBR mode, use setparameter
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_008, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_009
 * @tc.name      : reset QP in cq mode, use buffer->setparameter H265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_009, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_b_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_010
 * @tc.name      : reset QP in CQ mode, use setparameter H265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_010, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_011
 * @tc.name      : reset QP in CBR mode, use buffer->setparameter h265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_011, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_b_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_012
 * @tc.name      : reset QP in CBR mode, use setparameter h265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_012, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_013
 * @tc.name      : reset QP in VBR mode, use buffer->setparameter h265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_013, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_b_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : RESET_QP_014
 * @tc.name      : reset QP in VBR mode, use setparameter h265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, RESET_QP_014, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : SET_PROFILE_001
 * @tc.name      : set profile main
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_PROFILE_001, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        vEncSample->OUT_DIR = "/data/test/media/pq_vivid.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : SET_PROFILE_002
 * @tc.name      : set profile main10
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_PROFILE_002, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        vEncSample->OUT_DIR = "/data/test/media/pq_vivid.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : SET_PROFILE_003
 * @tc.name      : set profile high
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_PROFILE_003, TestSize.Level1)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = AVC_PROFILE_HIGH;
        vEncSample->OUT_DIR = "/data/test/media/1280_720_30_10Mb.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : SET_PROFILE_004
 * @tc.name      : set profile main
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_PROFILE_004, TestSize.Level1)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = AVC_PROFILE_MAIN;
        vEncSample->OUT_DIR = "/data/test/media/1280_720_30_10Mb.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : SET_PROFILE_005
 * @tc.name      : set profile main
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_PROFILE_005, TestSize.Level1)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = AVC_PROFILE_BASELINE;
        vEncSample->OUT_DIR = "/data/test/media/1280_720_30_10Mb.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : SET_RANGE_FLAG_001
 * @tc.name      : set range flag true HEVC
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_RANGE_FLAG_001, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_fullrange.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : SET_RANGE_FLAG_002
 * @tc.name      : set range flag true
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_RANGE_FLAG_002, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_fullrange.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : SET_COLORSPACE_001
 * @tc.name      : set color space parameter
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_COLORSPACE_001, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_cs.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : SET_COLORSPACE_002
 * @tc.name      : set color space parameter HEVC
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_COLORSPACE_002, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_cs.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : SET_FORCE_IDR_001
 * @tc.name      : request i frame HEVC
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_FORCE_IDR_001, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableForceIDR = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_i.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}

/**
 * @tc.number    : SET_FORCE_IDR_002
 * @tc.name      : request i frame
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, SET_FORCE_IDR_002, TestSize.Level1)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableForceIDR = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_i.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : COLORSPACE_CONFIG_001
 * @tc.name      : COLORSPACE
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, COLORSPACE_CONFIG_001, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = 100;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = 10000;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = 10000;
        vEncSample->OUT_DIR = "/data/test/media/vbr_i.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_INVALID_VAL, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_INVALID_STATE, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : COLORSPACE_CONFIG_002
 * @tc.name      : COLORSPACE 264
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, COLORSPACE_CONFIG_002, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT709;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_BT709;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT709;
        vEncSample->OUT_DIR = "/data/test/media/bt_709_h264.h264";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : COLORSPACE_CONFIG_003
 * @tc.name      : COLORSPACE 265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, COLORSPACE_CONFIG_003, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT709;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_BT709;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT709;
        vEncSample->OUT_DIR = "/data/test/media/bt_709_h265.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : COLORSPACE_CONFIG_004
 * @tc.name      : COLORSPACE 265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, COLORSPACE_CONFIG_004, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 0;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT2020;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_PQ;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_NCL;
        vEncSample->OUT_DIR = "/data/test/media/bt_2020_PQ_h265.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : COLORSPACE_CONFIG_005
 * @tc.name      : COLORSPACE 265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, COLORSPACE_CONFIG_005, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 0;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT2020;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_HLG;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_NCL;
        vEncSample->OUT_DIR = "/data/test/media/bt_2020_HLG_h265.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : COLORSPACE_CONFIG_006
 * @tc.name      : COLORSPACE 265
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, COLORSPACE_CONFIG_006, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 0;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_P3D65;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_PQ;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_NCL;
        vEncSample->OUT_DIR = "/data/test/media/bt_2020_P3D65_h265.h265";
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    } else {
        return;
    }
}

/**
 * @tc.number    : FRAMENUM_JUDGMENT_001
 * @tc.name      : Increase frame rate judgment
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, FRAMENUM_JUDGMENT_001, TestSize.Level0)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->OUT_DIR = "/data/test/media/1280_720_nv.h264";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecName));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(25, vEncSample->outCount);
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
/**
 * @tc.number    : FRAMENUM_JUDGMENT_002
 * @tc.name      : Increase frame rate judgment
 * @tc.desc      : function test
 */
HWTEST_F(HwEncSetParamNdkTest, FRAMENUM_JUDGMENT_002, TestSize.Level0)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->OUT_DIR = "/data/test/media/EN_1280_720_nv.h265";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = 30;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        ASSERT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(g_codecNameHEVC));
        ASSERT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
        ASSERT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
        ASSERT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
        vEncSample->WaitForEOS();
        ASSERT_EQ(25, vEncSample->outCount);
        ASSERT_EQ(AV_ERR_OK, vEncSample->errCount);
    }
}
}
