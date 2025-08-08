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
#include <securec.h>
#include "gtest/gtest.h"
#include "native_avcodec_audiocodec.h"
#include "native_averrors.h"
#include "native_avcodec_base.h"
#include "native_avcapability.h"

using namespace std;
using namespace testing::ext;

namespace {
    class AudioCapabilityTest : public testing::Test {
    public:
        static void SetUpTestCase();
        static void TearDownTestCase();
        void SetUp() override;
        void TearDown() override;
    };

    void AudioCapabilityTest::SetUpTestCase() {}
    void AudioCapabilityTest::TearDownTestCase() {}
    void AudioCapabilityTest::SetUp() {}
    void AudioCapabilityTest::TearDown() {}

    bool CheckSampleRate(int32_t* sampleRateList, uint32_t sampleRateNum, OH_AVRange* sampleRateRanges,
                         uint32_t rangesNum)
    {
        bool inFlags = false;
        for (uint32_t i = 0; i < sampleRateNum; i++) {
            for (uint32_t j = 0; j < rangesNum; j++) {
                if (sampleRateList[i] >= sampleRateRanges[j].minVal &&
                    sampleRateList[i] <= sampleRateRanges[j].maxVal) {
                    inFlags = true;
                    break;
                }
            }
            if (!inFlags) {
                return false;
            }
        }
        return true;
    }

} // namespace

/**
 * @tc.number    : AUDIO_CAPABILITY_TEST_001
 * @tc.name      : AUDIO_CAPABILITY_TEST_001
 * @tc.desc      : function test
 */
HWTEST_F(AudioCapabilityTest, AUDIO_CAPABILITY_TEST_001, TestSize.Level2)
{
    OH_AVCapability* capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    ASSERT_NE(capability, nullptr);
    int32_t sampleRateList[] = { 7350, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100,
                                 48000, 64000, 88200, 96000 };
    uint32_t sampleRateNum = 13;
    OH_AVRange* sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, &sampleRateRanges, &rangesNum);
    ASSERT_EQ(ret, AV_ERR_OK);
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    ASSERT_EQ(result, true);
}


/**
 * @tc.number    : AUDIO_CAPABILITY_TEST_002
 * @tc.name      : AUDIO_CAPABILITY_TEST_002
 * @tc.desc      : function test
 */
HWTEST_F(AudioCapabilityTest, AUDIO_CAPABILITY_TEST_002, TestSize.Level2)
{
    OH_AVCapability* capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    ASSERT_NE(capability, nullptr);
    int32_t sampleRateList[] = { 7350, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100,
								 48000, 64000, 88200, 96000 };
    uint32_t sampleRateNum = 13;
    OH_AVRange* sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, &sampleRateRanges, &rangesNum);
    ASSERT_EQ(ret, AV_ERR_OK);
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    ASSERT_EQ(result, true);
}


/**
 * @tc.number    : AUDIO_CAPABILITY_TEST_003
 * @tc.name      : AUDIO_CAPABILITY_TEST_003
 * @tc.desc      : function test
 */
HWTEST_F(AudioCapabilityTest, AUDIO_CAPABILITY_TEST_003, TestSize.Level2)
{
    OH_AVCapability* capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, true);
    ASSERT_NE(capability, nullptr);
    int32_t sampleRateList[] = { 8000, 16000, 22050, 24000, 32000, 44100, 48000, 88200, 96000 };
    uint32_t sampleRateNum = 9;
    OH_AVRange* sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, &sampleRateRanges, &rangesNum);
    ASSERT_EQ(ret, AV_ERR_OK);
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    ASSERT_EQ(result, true);
}


/**
 * @tc.number    : AUDIO_CAPABILITY_TEST_004
 * @tc.name      : AUDIO_CAPABILITY_TEST_004
 * @tc.desc      : function test
 */
HWTEST_F(AudioCapabilityTest, AUDIO_CAPABILITY_TEST_004, TestSize.Level2)
{
    OH_AVCapability* capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
    ASSERT_NE(capability, nullptr);
    int32_t sampleRateList[] = { 8000, 384000 };
    uint32_t sampleRateNum = 2;
    OH_AVRange* sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, &sampleRateRanges, &rangesNum);
    ASSERT_EQ(ret, AV_ERR_OK);
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    ASSERT_EQ(result, true);
}


/**
 * @tc.number    : AUDIO_CAPABILITY_TEST_005
 * @tc.name      : AUDIO_CAPABILITY_TEST_005
 * @tc.desc      : function test
 */
HWTEST_F(AudioCapabilityTest, AUDIO_CAPABILITY_TEST_005, TestSize.Level2)
{
    OH_AVCapability* capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
    ASSERT_NE(capability, nullptr);
    int32_t sampleRateList[] = { 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000 };
    uint32_t sampleRateNum = 12;
    OH_AVRange* sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, &sampleRateRanges, &rangesNum);
    ASSERT_EQ(ret, AV_ERR_OK);
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    ASSERT_EQ(result, true);
}


/**
 * @tc.number    : AUDIO_CAPABILITY_TEST_006
 * @tc.name      : AUDIO_CAPABILITY_TEST_006
 * @tc.desc      : function test
 */
HWTEST_F(AudioCapabilityTest, AUDIO_CAPABILITY_TEST_006, TestSize.Level2)
{
    OH_AVCapability* capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, true);
    ASSERT_NE(capability, nullptr);
    int32_t sampleRateList[] = { 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000 };
    uint32_t sampleRateNum = 9;
    OH_AVRange* sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, &sampleRateRanges, &rangesNum);
    ASSERT_EQ(ret, AV_ERR_OK);
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    ASSERT_EQ(result, true);
}


/**
 * @tc.number    : AUDIO_CAPABILITY_TEST_007
 * @tc.name      : AUDIO_CAPABILITY_TEST_007
 * @tc.desc      : function test
 */
HWTEST_F(AudioCapabilityTest, AUDIO_CAPABILITY_TEST_007, TestSize.Level2)
{
    OH_AVCapability* capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    ASSERT_NE(capability, nullptr);
    int32_t sampleRateList[] = { 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000 };
    uint32_t sampleRateNum = 9;
    OH_AVRange* sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, &sampleRateRanges, &rangesNum);
    ASSERT_EQ(ret, AV_ERR_OK);
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    ASSERT_EQ(result, true);
}