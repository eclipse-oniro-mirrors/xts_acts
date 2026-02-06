/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include <atomic>
#include <fstream>
#include <thread>
#include <mutex>
#include <queue>
#include <string>

#include "gtest/gtest.h"
#include "HdrCodecSample.h"
#include "native_averrors.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"
#include "native_avcodec_videodecoder.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;
namespace OHOS {
namespace Media {
class HDRFuncNdkTest : public testing::Test {
public:
    static void SetUpTestCase(void);
    static void TearDownTestCase(void);
    void SetUp(void);
    void TearDown(void);
};
namespace {
    static OH_AVCapability *cap_h263 = nullptr;
    static string g_codecName263 = "";
    static OH_AVCapability *cap_h264 = nullptr;
    static string g_codecName264 = "";
    static OH_AVCapability *cap_mpeg2 = nullptr;
    static string g_codecNameMpeg2 = "";
    static OH_AVCapability *cap_mpeg4 = nullptr;
    static string g_codecNameMpeg4 = "";
    static OH_AVCapability *cap_sw265 = nullptr;
    static string g_codecNameSw265 = "";
    static OH_AVCapability *cap_h265 = nullptr;
    static string g_codecNameHw265 = "";
}
void HDRFuncNdkTest::SetUpTestCase()
{
    cap_h263 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_H263, false, SOFTWARE);
    g_codecName263 = OH_AVCapability_GetName(cap_h263);
    cout << "g_codecName263: " << g_codecName263 << endl;

    cap_h264 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    g_codecName264 = OH_AVCapability_GetName(cap_h264);
    cout << "g_codecName264: " << g_codecName264 << endl;

    cap_mpeg2 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    g_codecNameMpeg2 = OH_AVCapability_GetName(cap_mpeg2);
    cout << "g_codecNameMpeg2: " << g_codecNameMpeg2 << endl;

    cap_mpeg4 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4_PART2, false, SOFTWARE);
    g_codecNameMpeg4 = OH_AVCapability_GetName(cap_mpeg4);
    cout << "g_codecNameMpeg4: " << g_codecNameMpeg4 << endl;

    cap_sw265 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, SOFTWARE);
    g_codecNameSw265 = OH_AVCapability_GetName(cap_sw265);
    cout << "g_codecNameSw265: " << g_codecNameSw265 << endl;

    cap_h265 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    g_codecNameHw265 = OH_AVCapability_GetName(cap_h265);
    cout << "g_codecNameHw265: " << g_codecNameHw265 << endl;
}
void HDRFuncNdkTest::TearDownTestCase() {}
void HDRFuncNdkTest::SetUp() {}
void HDRFuncNdkTest::TearDown() {}
} // namespace Media
} // namespace OHOS
namespace {
/**
 * @tc.number    : DEMUXER_DEC_ENC_MUXER_FUNC_009
 * @tc.name      : DEMUXER_DEC_ENC_MUXER_FUNC_009
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, DEMUXER_DEC_ENC_MUXER_FUNC_009, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0) && (cap_h265)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        const char *file = "/data/test/media/h263_aac.mp4";
        sample->DEMUXER_FLAG = true;
        sample->bframe = true;
        sample->MIME_TYPE = OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
        ASSERT_EQ(AV_ERR_OK, sample->CreateDemuxerVideocoder(file, g_codecName263, g_codecNameHw265));
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->StartDemuxer());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}

/**
 * @tc.number    : DEMUXER_DEC_ENC_MUXER_FUNC_010
 * @tc.name      : DEMUXER_DEC_ENC_MUXER_FUNC_010
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, DEMUXER_DEC_ENC_MUXER_FUNC_010, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0) && (cap_h265)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        const char *file = "/data/test/media/mpeg2.mp4";
        sample->DEMUXER_FLAG = true;
        sample->bframe = true;
        sample->MIME_TYPE = OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
        ASSERT_EQ(AV_ERR_OK, sample->CreateDemuxerVideocoder(file, g_codecNameMpeg2, g_codecNameHw265));
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->StartDemuxer());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}

/**
 * @tc.number    : DEMUXER_DEC_ENC_MUXER_FUNC_011
 * @tc.name      : DEMUXER_DEC_ENC_MUXER_FUNC_011
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, DEMUXER_DEC_ENC_MUXER_FUNC_011, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0) && (cap_h265)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        const char *file = "/data/test/media/mpeg4_1280x720_30.mp4";
        sample->DEMUXER_FLAG = true;
        sample->bframe = true;
        sample->MIME_TYPE = OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
        ASSERT_EQ(AV_ERR_OK, sample->CreateDemuxerVideocoder(file, g_codecNameMpeg4, g_codecNameHw265));
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->StartDemuxer());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}

/**
 * @tc.number    : DEMUXER_DEC_ENC_MUXER_FUNC_012
 * @tc.name      : DEMUXER_DEC_ENC_MUXER_FUNC_012
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, DEMUXER_DEC_ENC_MUXER_FUNC_012, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0) && (cap_h265)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        const char *file = "/data/test/media/h264_mp3_960x544_30r.mp4";
        sample->DEMUXER_FLAG = true;
        sample->bframe = true;
        sample->MIME_TYPE = OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
        ASSERT_EQ(AV_ERR_OK, sample->CreateDemuxerVideocoder(file, g_codecName264, g_codecNameHw265));
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->StartDemuxer());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}

/**
 * @tc.number    : DEMUXER_DEC_ENC_MUXER_FUNC_013
 * @tc.name      : DEMUXER_DEC_ENC_MUXER_FUNC_013
 * @tc.desc      : function test
 */
HWTEST_F(HDRFuncNdkTest, DEMUXER_DEC_ENC_MUXER_FUNC_013, TestSize.Level1)
{
    if (!access("/system/lib64/media/", 0) && (cap_h265)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        const char *file = "/data/test/media/VID_720.mp4";
        sample->DEMUXER_FLAG = true;
        sample->bframe = true;
        sample->MIME_TYPE = OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
        ASSERT_EQ(AV_ERR_OK, sample->CreateDemuxerVideocoder(file, g_codecNameSw265, g_codecNameHw265));
        ASSERT_EQ(AV_ERR_OK, sample->Configure());
        ASSERT_EQ(AV_ERR_OK, sample->StartDemuxer());
        sample->WaitForEos();
        ASSERT_EQ(0, sample->errorCount);
    }
}
} // namespace