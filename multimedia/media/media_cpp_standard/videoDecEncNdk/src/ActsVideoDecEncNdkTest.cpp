/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <string>
#include "gtest/gtest.h"
#include "native_avcodec_videodecoder.h"
#include "native_avcodec_videoencoder.h"
#include "native_avcodec_base.h"
#include "native_avformat.h"
#include "VDecEncNdkSample.h"
#include "syscap_ndk.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
using namespace OHOS::Media;

namespace {
class ActsVideoDecEncNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

void ActsVideoDecEncNdkTest::SetUpTestCase() {}
void ActsVideoDecEncNdkTest::TearDownTestCase() {}
void ActsVideoDecEncNdkTest::SetUp() {}
void ActsVideoDecEncNdkTest::TearDown() {}
const string MIME_TYPE_AVC = "video/avc";
const string MIME_TYPE_MPEG4 = "video/mp4v-es";
constexpr uint32_t DEFAULT_WIDTH = 320;
constexpr uint32_t DEFAULT_HEIGHT = 240;
constexpr uint32_t DEFAULT_PIXELFORMAT = 2;
constexpr double DEFAULT_FRAMERATE = 60;
const char* READPATH = "/data/media/out_320_240_10s.h264";

bool CheckDecDesc(map<string, int> InDesc, OH_AVFormat* OutDesc)
{
    int32_t out ;
    for (const auto& t: InDesc) {
        bool res = OH_AVFormat_GetIntValue(OutDesc, t.first.c_str(), &out);
        cout << "key: " << t.first << "; out: " << out <<endl;
        if (!res) {
            cout << "OH_AVFormat_GetIntValue Fail. key:" << t.first << endl;
            return false;
        }
        if (out != t.second) {
            cout << "OH_AVFormat_GetIntValue error. key: " << t.first
            << "; expect: "<< t.second
            << ", actual: "<< out << endl;
            return false;
        }
        out = 0;
    }

    double dout;
    bool res = OH_AVFormat_GetDoubleValue(OutDesc, OH_MD_KEY_FRAME_RATE, &dout);
    if (!res || abs(dout - DEFAULT_FRAMERATE) > 1e-6) {
        cout << "OH_AVFormat_GetDoubleValue error. key: " << OH_MD_KEY_FRAME_RATE << endl;
    }
    return true;
}

bool SetFormat(struct OH_AVFormat *format, map<string, int> mediaDescription)
{
    const char *key;
    for (const auto& t: mediaDescription) {
        key = t.first.c_str();
        if (not OH_AVFormat_SetIntValue(format, key, t.second)) {
            cout << "OH_AV_FormatPutIntValue Fail. format key: " << t.first
            << ", value: "<< t.second << endl;
            return false;
        }
    }
    return true;
}

struct OH_AVFormat* createFormat()
{
    OH_AVFormat *DefaultFormat = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(DefaultFormat, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(DefaultFormat, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    OH_AVFormat_SetIntValue(DefaultFormat, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIXELFORMAT);
    OH_AVFormat_SetDoubleValue(DefaultFormat, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAMERATE);
    OH_AVFormat_SetStringValue(DefaultFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    return DefaultFormat;
}

bool CanUseVideoCodec()
{
    return canIUse("SystemCapability.Multimedia.Media.CodecBase") &&
        canIUse("SystemCapability.Multimedia.Media.VideoDecoder") &&
        canIUse("SystemCapability.Multimedia.Media.VideoEncoder");
}
}

/**
 * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0100
 * @tc.name      : stop at end of stream
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsVideoDecEncNdkTest, SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0100, TestSize.Level1)
{
    if (!CanUseVideoCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0100 ignore" <<endl;
        return;
    }
    VDecEncNdkSample *vDecEncSample = new VDecEncNdkSample();
    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoDec);

    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_MPEG4);
    videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoEnc);
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetSavePath("/data/media/video_001.h264");
    
    OH_AVFormat *VideoFormat = OH_AVFormat_Create();
    ASSERT_NE(nullptr, VideoFormat);
    map<string, int> VideoParam = {
        {OH_MD_KEY_WIDTH, DEFAULT_WIDTH},
        {OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT},
        {OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIXELFORMAT},
    };
    ASSERT_EQ(true, SetFormat(VideoFormat, VideoParam));
    OH_AVFormat_SetIntValue(VideoFormat, OH_MD_KEY_TRACK_TYPE, MEDIA_TYPE_VID);
    OH_AVFormat_SetDoubleValue(VideoFormat, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAMERATE);

    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureDec(VideoFormat));
    OH_AVFormat *OutDescDec = OH_VideoDecoder_GetOutputDescription(videoDec);
    ASSERT_NE(nullptr, OutDescDec);
    ASSERT_EQ(true, CheckDecDesc(VideoParam, OutDescDec));

    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureEnc(VideoFormat));
    OH_AVFormat *OutDescEnc = OH_VideoEncoder_GetOutputDescription(videoEnc);
    ASSERT_NE(nullptr, OutDescEnc);

    ASSERT_EQ(AV_ERR_OK, vDecEncSample->GetSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->SetOutputSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());

    while (!vDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StopDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StopEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseEnc());
    videoEnc = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseDec());
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->CalcuError());
}

/**
 * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0200
 * @tc.name      : reset at end of stream
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsVideoDecEncNdkTest, SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0200, TestSize.Level1)
{
    if (!CanUseVideoCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0200 ignore" <<endl;
        return;
    }
    VDecEncNdkSample *vDecEncSample = new VDecEncNdkSample();

    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoDec);
    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoEnc);
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetSavePath("/data/media/video_002.h264");
    
    OH_AVFormat *VideoFormat = createFormat();
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureDec(VideoFormat));
    OH_AVFormat_SetIntValue(VideoFormat, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CBR);
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureEnc(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->GetSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->SetOutputSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->SetParameterEnc(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->SetParameterDec(VideoFormat));

    while (!vDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ResetDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ResetEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseEnc());
    videoEnc = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseDec());
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->CalcuError());
}

 /**
 * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0300
 * @tc.name      : release at end of stream
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsVideoDecEncNdkTest, SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0300, TestSize.Level1)
{
    if (!CanUseVideoCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0300 ignore" <<endl;
        return;
    }
    VDecEncNdkSample *vDecEncSample = new VDecEncNdkSample();

    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoDec);
    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoEnc);
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetSavePath("/data/media/video_003.h264");
    
    OH_AVFormat *VideoFormat = createFormat();
    OH_AVFormat_SetIntValue(VideoFormat, OH_MD_KEY_PROFILE, AVC_PROFILE_BASELINE);

    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureDec(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureEnc(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->GetSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->SetOutputSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());

    while (!vDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseEnc());
    videoEnc = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseDec());
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->CalcuError());
}

/**
* @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0400
* @tc.name      : flush at running
* @tc.desc      : Basic function test
*/
HWTEST_F(ActsVideoDecEncNdkTest, SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0400, TestSize.Level1)
{
    if (!CanUseVideoCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0400 ignore" <<endl;
        return;
    }
    VDecEncNdkSample *vDecEncSample = new VDecEncNdkSample();

    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoDec);
    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoEnc);
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetEosState(false);
    vDecEncSample->SetSavePath("/data/media/video_004.h264");
    
    OH_AVFormat *VideoFormat = createFormat();
    OH_AVFormat_SetIntValue(VideoFormat, OH_MD_KEY_PROFILE, AVC_PROFILE_HIGH);

    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureDec(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureEnc(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->GetSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->SetOutputSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());

    while (vDecEncSample->GetFrameCount() < 100) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->FlushDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->FlushEnc());
    vDecEncSample->ReRead();
    vDecEncSample->ResetDecParam();
    vDecEncSample->ResetEncParam();
    vDecEncSample->SetEosState(true);
    vDecEncSample->SetSavePath("/data/media/video_004_2.h264");

    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());

    while (!vDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseEnc());
    videoEnc = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseDec());
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->CalcuError());
}


/**
 * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0500
 * @tc.name      : flush dec at eos and restart
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsVideoDecEncNdkTest, SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0500, TestSize.Level1)
{
    if (!CanUseVideoCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0500 ignore" <<endl;
        return;
    }
    VDecEncNdkSample *vDecEncSample = new VDecEncNdkSample();

    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoDec);
    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoEnc);
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetEosState(false);
    vDecEncSample->SetSavePath("/data/media/video_005.h264");
    
    OH_AVFormat *VideoFormat = createFormat();
    OH_AVFormat_SetIntValue(VideoFormat, OH_MD_KEY_PROFILE, AVC_PROFILE_MAIN);

    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureDec(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureEnc(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->GetSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->SetOutputSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());

    while (!vDecEncSample->GetDecEosState()) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->CalcuError());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->FlushDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->FlushEnc());
    vDecEncSample->ReRead();
    vDecEncSample->ResetDecParam();
    vDecEncSample->ResetEncParam();
    vDecEncSample->SetSavePath("/data/media/video_005_2.h264");
    vDecEncSample->SetEosState(true);
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->CalcuError());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());

    while (!vDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseEnc());
    videoEnc = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseDec());
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->CalcuError());
}


/**
 * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0600
 * @tc.name      : stop at running and restart to eos
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsVideoDecEncNdkTest, SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0600, TestSize.Level1)
{
    if (!CanUseVideoCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0600 ignore" <<endl;
        return;
    }
    VDecEncNdkSample *vDecEncSample = new VDecEncNdkSample();

    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoDec);
    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoEnc);
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetEosState(false);
    vDecEncSample->SetSavePath("/data/media/video_006.h264");
    
    OH_AVFormat *VideoFormat = createFormat();
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureDec(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureEnc(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->GetSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->SetOutputSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());

    while (vDecEncSample->GetFrameCount() < 100) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StopDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StopEnc());
    vDecEncSample->ReRead();
    vDecEncSample->ResetDecParam();
    vDecEncSample->ResetEncParam();
    vDecEncSample->SetEosState(true);
    vDecEncSample->SetSavePath("/data/media/video_006_2.h264");
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());

    while (!vDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StopDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StopEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseEnc());
    videoEnc = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseDec());
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->CalcuError());
}


/**
 * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0700
 * @tc.name      : stop dec at eos and restart to eos
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsVideoDecEncNdkTest, SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0700, TestSize.Level1)
{
    if (!CanUseVideoCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0700 ignore" <<endl;
        return;
    }
    VDecEncNdkSample *vDecEncSample = new VDecEncNdkSample();

    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoDec);
    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    ASSERT_NE(nullptr, videoEnc);
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetEosState(false);
    vDecEncSample->SetSavePath("/data/media/video_007.h264");
    
    OH_AVFormat *VideoFormat = createFormat();
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureDec(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ConfigureEnc(VideoFormat));
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->GetSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->SetOutputSurface());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->PrepareDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());

    while (!vDecEncSample->GetDecEosState()) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StopDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->FlushEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->CalcuError());
    vDecEncSample->ReRead();
    vDecEncSample->ResetDecParam();
    vDecEncSample->ResetEncParam();
    vDecEncSample->SetSavePath("/data/media/video_007_2.h264");
    vDecEncSample->SetEosState(true);
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StartDec());

    while (!vDecEncSample->GetEncEosState()) {};
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StopDec());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->StopEnc());
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseEnc());
    videoEnc = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->ReleaseDec());
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    ASSERT_EQ(AV_ERR_OK, vDecEncSample->CalcuError());
}