/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
#include "securec.h"
#include "gtest/gtest.h"
#include "audio_info.h"
#include "native_avcodec_base.h"
#include "native_avformat.h"

using namespace std;
using namespace testing::ext;

namespace {
class ActsCodecFormatNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

void ActsCodecFormatNdkTest::SetUpTestCase() {}
void ActsCodecFormatNdkTest::TearDownTestCase() {}
void ActsCodecFormatNdkTest::SetUp() {}
void ActsCodecFormatNdkTest::TearDown() {}

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
}

/**
 * @tc.number    : SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0100
 * @tc.name      : test codec format set key
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsCodecFormatNdkTest, SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0100, TestSize.Level1)
{
    OH_AVFormat *codecFormatIn = OH_AVFormat_Create();
    ASSERT_NE(nullptr, codecFormatIn);
    OH_AVFormat *codecFormatOut = OH_AVFormat_Create();
    ASSERT_NE(nullptr, codecFormatOut);
    map<string, int> CodecParam = {
        {OH_ED_KEY_TIME_STAMP, 200}, // set timestamp 200ms
        {OH_ED_KEY_EOS, 1}, // set end of stream
        {OH_MD_KEY_TRACK_TYPE, 1}, // set track type video
        {OH_MD_KEY_DURATION, 200}, // set key duration 200ms
        {OH_MD_KEY_BITRATE, 48000}, // set key bitrate 48000
        {OH_MD_KEY_MAX_INPUT_SIZE, 2000}, // set key max input size 2000
        {OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, 0}, // set videoencoder bitrate mode CBR
        {OH_MD_KEY_PROFILE, 1}, // set encode profile AVC_PROFILE_BASELINE
        {OH_MD_KEY_I_FRAME_INTERVAL, 1}, // set key i frame 1ms
        {OH_MD_KEY_ROTATION, 90}, // set key rotation 0 degree
    };
    ASSERT_EQ(true, SetFormat(codecFormatIn, CodecParam));
    OH_AVFormat_Copy(codecFormatOut, codecFormatIn);
    ASSERT_EQ(true, CheckDecDesc(CodecParam, codecFormatOut));
    ASSERT_NE(nullptr, OH_AVFormat_DumpInfo(codecFormatOut));
    cout << OH_AVFormat_DumpInfo(codecFormatIn) << endl;
    OH_AVFormat_Destroy(codecFormatIn);
    codecFormatIn = nullptr;
    OH_AVFormat_Destroy(codecFormatOut);
    codecFormatIn = nullptr;
}

/**
 * @tc.number    : SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0200
 * @tc.name      : test codec format set and get value
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsCodecFormatNdkTest, SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0200, TestSize.Level1)
{
    const char *intKey = "int value key";
    const char *longKey = "long value key";
    const char *floatKey = "float value key";
    const char *doubleKey = "double value key";
    const char *stringKey = "string value key";
    const char *stringValue = "string_value";
    int32_t intValue = 1;
    int64_t longValue = 1;
    float floatValue = 1.0;
    double doubleValue = 1.0;

    OH_AVFormat *codecFormatIn = OH_AVFormat_Create();
    ASSERT_NE(nullptr, codecFormatIn);
    OH_AVFormat *codecFormatOut = OH_AVFormat_Create();
    ASSERT_NE(nullptr, codecFormatOut);
    OH_AVFormat_SetIntValue(codecFormatIn, intKey, intValue);
    OH_AVFormat_SetLongValue(codecFormatIn, longKey, longValue);
    OH_AVFormat_SetFloatValue(codecFormatIn, floatKey, floatValue);
    OH_AVFormat_SetDoubleValue(codecFormatIn, doubleKey, doubleValue);
    OH_AVFormat_SetStringValue(codecFormatIn, stringKey, stringValue);

    OH_AVFormat_Copy(codecFormatOut, codecFormatIn);
    int32_t intValueOut;
    OH_AVFormat_GetIntValue(codecFormatOut, intKey, &intValueOut);
    ASSERT_EQ(intValueOut, intValue);
    int64_t longValueOut;
    OH_AVFormat_GetLongValue(codecFormatOut, longKey, &longValueOut);
    ASSERT_EQ(longValueOut, longValue);
    float floatValueOut;
    OH_AVFormat_GetFloatValue(codecFormatOut, floatKey, &floatValueOut);
    ASSERT_EQ(floatValueOut, floatValue);
    double doubleValueOut;
    OH_AVFormat_GetDoubleValue(codecFormatOut, doubleKey, &doubleValueOut);
    ASSERT_EQ(doubleValueOut, doubleValue);
    const char *stringValueOut;
    OH_AVFormat_GetStringValue(codecFormatOut, stringKey, &stringValueOut);
    ASSERT_EQ(*stringValueOut, *stringValue);

    OH_AVFormat_Destroy(codecFormatIn);
    codecFormatIn = nullptr;
    OH_AVFormat_Destroy(codecFormatOut);
    codecFormatOut = nullptr;
}

/**
 * @tc.number    : SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0300
 * @tc.name      : test codec format set and get buffer
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsCodecFormatNdkTest, SUB_MULTIMEDIA_MEDIA_CODEC_FORMAT_0300, TestSize.Level1)
{
    const char *bufferKey = "buffer value key";
    OH_AVFormat *codecFormatIn = OH_AVFormat_Create();
    ASSERT_NE(nullptr, codecFormatIn);
    OH_AVFormat *codecFormatOut = OH_AVFormat_Create();
    ASSERT_NE(nullptr, codecFormatOut);
    int32_t buffernum = 10;
    size_t sizeIn = buffernum * sizeof(uint8_t);
    uint8_t *buffer = reinterpret_cast<uint8_t *>(malloc(sizeIn));
    (void)memset_s(buffer, sizeIn, 1, sizeIn);
    OH_AVFormat_SetBuffer(codecFormatIn, bufferKey, buffer, sizeIn);

    OH_AVFormat_Copy(codecFormatOut, codecFormatIn);
    uint8_t *addrout;
    size_t sizeOut;
    OH_AVFormat_GetBuffer(codecFormatOut, bufferKey, &addrout, &sizeOut);
    ASSERT_EQ(sizeIn, sizeOut);
    for (int32_t i = 0; i < buffernum; i++) {
        ASSERT_EQ(buffer[i], addrout[i]);
    }

    OH_AVFormat_Destroy(codecFormatIn);
    codecFormatIn = nullptr;
    OH_AVFormat_Destroy(codecFormatOut);
    codecFormatOut = nullptr;
}