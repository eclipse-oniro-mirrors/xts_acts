/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
#include <atomic>
#include <iostream>
#include <fstream>
#include <queue>
#include <string>
#include <thread>
#include "gtest/gtest.h"
#include "avcodec_audio_avbuffer_decoder_demo.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioBufferDemo;

namespace {
class NullCheckTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

void NullCheckTest::SetUpTestCase() {}
void NullCheckTest::TearDownTestCase() {}
void NullCheckTest::SetUp() {}
void NullCheckTest::TearDown() {}

} // namespace

/**
 * @tc.number    : NULL_CHECK_001
 * @tc.name      : CreateByMime - mime null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_001, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(nullptr);
    ASSERT_EQ(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_002
 * @tc.name      : CreateByName - mime null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_002, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByName(nullptr);
    ASSERT_EQ(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_003
 * @tc.name      : Destroy - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_003, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_004
 * @tc.name      : SetCallback - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_004, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_005
 * @tc.name      : Configure - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_005, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; //8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(nullptr, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_006
 * @tc.name      : Configure - format null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_006, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; //8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    format = nullptr;
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_007
 * @tc.name      : Prepare - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_007, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Prepare(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_008
 * @tc.name      : Start - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_008, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; //8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_009
 * @tc.name      : Stop - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_009, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; //8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Stop(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_010
 * @tc.name      : Flush - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_010, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; //8000hz
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Flush(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_011
 * @tc.name      : Reset - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_011, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_012
 * @tc.name      : GetOutputDescription - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_012, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; //8000hz
    OH_AVErrCode result0;
    OH_AVFormat *result1;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result1 = aDecBufferDemo->GetOutputDescription(nullptr);
    ASSERT_EQ(result1, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_013
 * @tc.name      : PushInputData - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_013, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; //8000hz
    uint32_t index;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(nullptr, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_014
 * @tc.name      : FreeOutputData - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_014, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; //8000hz
    uint32_t index;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetInputIndex();
    index = -1;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetOutputIndex();
    result0 = aDecBufferDemo->FreeOutputData(nullptr, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_015
 * @tc.name      : IsValid - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_015, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    bool *isValid = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->IsValid(nullptr, isValid);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_016
 * @tc.name      : IsValid - isValid null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_016, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    bool *isValid = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    isValid = nullptr;
    result0 = aDecBufferDemo->IsValid(codec, isValid);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}

/**
 * @tc.number    : NULL_CHECK_017
 * @tc.name      : PushInputDataEOS - codec null check
 * @tc.desc      : null check test
 */
HWTEST_F(NullCheckTest, NULL_CHECK_017, TestSize.Level2)
{
    OH_AVCodec *codec = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; //8000hz
    uint32_t index;
    OH_AVErrCode result0;
    ADecBufferDemo *aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputDataEOS(nullptr, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}


/**
 * @tc.number    : NULL_CHECK_018
 * @tc.name      : NULL_CHECK_018
 * @tc.desc      : SetIntBuffer - format null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_018, TestSize.Level2)
{
    std::vector<int32_t> vDepth = { 0 };
    int32_t* trackIdsDepth = vDepth.data();

    bool ret = OH_AVFormat_SetIntBuffer(nullptr, OH_MD_KEY_REFERENCE_TRACK_IDS, trackIdsDepth, vDepth.size());
    ASSERT_EQ(ret, false);
}


/**
 * @tc.number    : NULL_CHECK_019
 * @tc.name      : NULL_CHECK_019
 * @tc.desc      : SetIntBuffer - key null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_019, TestSize.Level2)
{
    OH_AVFormat* format = OH_AVFormat_Create();
    std::vector<int32_t> vDepth = { 0 };
    int32_t* trackIdsDepth = vDepth.data();

    bool ret = OH_AVFormat_SetIntBuffer(format, nullptr, trackIdsDepth, vDepth.size());
    OH_AVFormat_Destroy(format);

    ASSERT_EQ(ret, false);
}


/**
 * @tc.number    : NULL_CHECK_020
 * @tc.name      : NULL_CHECK_020
 * @tc.desc      : SetIntBuffer - addr null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_020, TestSize.Level2)
{
    OH_AVFormat* format = OH_AVFormat_Create();
    std::vector<int32_t> vDepth = { 0 };

    bool ret = OH_AVFormat_SetIntBuffer(format, OH_MD_KEY_REFERENCE_TRACK_IDS, nullptr, vDepth.size());
    OH_AVFormat_Destroy(format);

    ASSERT_EQ(ret, false);
}


/**
 * @tc.number    : NULL_CHECK_021
 * @tc.name      : NULL_CHECK_021
 * @tc.desc      : SetIntBuffer - size is zero
 */
HWTEST_F(NullCheckTest, NULL_CHECK_021, TestSize.Level2)
{
    OH_AVFormat* format = OH_AVFormat_Create();
    std::vector<int32_t> vDepth = { 0 };
    int32_t* trackIdsDepth = vDepth.data();

    bool ret = OH_AVFormat_SetIntBuffer(format, OH_MD_KEY_REFERENCE_TRACK_IDS, trackIdsDepth, 0);
    OH_AVFormat_Destroy(format);

    ASSERT_EQ(ret, false);
}


/**
 * @tc.number    : NULL_CHECK_022
 * @tc.name      : NULL_CHECK_022
 * @tc.desc      : GetIntBuffer - format null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_022, TestSize.Level2)
{
    OH_AVFormat* format = OH_AVFormat_Create();
    std::vector<int32_t> vDepth = { 0 };
    int32_t* trackIdsDepth = vDepth.data();

    bool ret = OH_AVFormat_SetIntBuffer(format, OH_MD_KEY_REFERENCE_TRACK_IDS, trackIdsDepth, vDepth.size());
    ASSERT_EQ(ret, true);

    int32_t* getBuffer = nullptr;
    size_t getSize = 0;
    ret = OH_AVFormat_GetIntBuffer(nullptr, OH_MD_KEY_REFERENCE_TRACK_IDS, &getBuffer, &getSize);

    OH_AVFormat_Destroy(format);
    ASSERT_EQ(ret, false);
}


/**
 * @tc.number    : NULL_CHECK_023
 * @tc.name      : NULL_CHECK_023
 * @tc.desc      : GetIntBuffer - key null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_023, TestSize.Level2)
{
    OH_AVFormat* format = OH_AVFormat_Create();
    std::vector<int32_t> vDepth = { 0 };
    int32_t* trackIdsDepth = vDepth.data();

    bool ret = OH_AVFormat_SetIntBuffer(format, OH_MD_KEY_REFERENCE_TRACK_IDS, trackIdsDepth, vDepth.size());
    ASSERT_EQ(ret, true);

    int32_t* getBuffer = nullptr;
    size_t getSize = 0;
    ret = OH_AVFormat_GetIntBuffer(format, nullptr, &getBuffer, &getSize);

    OH_AVFormat_Destroy(format);
    ASSERT_EQ(ret, false);
}


/**
 * @tc.number    : NULL_CHECK_024
 * @tc.name      : NULL_CHECK_024
 * @tc.desc      : GetIntBuffer - addr null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_024, TestSize.Level2)
{
    OH_AVFormat* format = OH_AVFormat_Create();
    std::vector<int32_t> vDepth = { 0 };
    int32_t* trackIdsDepth = vDepth.data();

    bool ret = OH_AVFormat_SetIntBuffer(format, OH_MD_KEY_REFERENCE_TRACK_IDS, trackIdsDepth, vDepth.size());
    ASSERT_EQ(ret, true);

    size_t getSize = 0;
    ret = OH_AVFormat_GetIntBuffer(format, OH_MD_KEY_REFERENCE_TRACK_IDS, nullptr, &getSize);

    OH_AVFormat_Destroy(format);
    ASSERT_EQ(ret, false);
}


/**
 * @tc.number    : NULL_CHECK_025
 * @tc.name      : NULL_CHECK_025
 * @tc.desc      : GetIntBuffer - size null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_025, TestSize.Level2)
{
    OH_AVFormat* format = OH_AVFormat_Create();
    std::vector<int32_t> vDepth = { 0 };
    int32_t* trackIdsDepth = vDepth.data();

    bool ret = OH_AVFormat_SetIntBuffer(format, OH_MD_KEY_REFERENCE_TRACK_IDS, trackIdsDepth, vDepth.size());
    ASSERT_EQ(ret, true);

    int32_t* getBuffer = nullptr;
    ret = OH_AVFormat_GetIntBuffer(format, OH_MD_KEY_REFERENCE_TRACK_IDS, &getBuffer, nullptr);

    OH_AVFormat_Destroy(format);
    ASSERT_EQ(ret, false);
}


/**
 * @tc.number    : NULL_CHECK_026
 * @tc.name      : NULL_CHECK_026
 * @tc.desc      : QueryInputBuffer - codec null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_026, TestSize.Level2)
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    uint32_t index = -1;
    result0 = OH_AudioCodec_QueryInputBuffer(nullptr, &index, 20000);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}


/**
 * @tc.number    : NULL_CHECK_027
 * @tc.name      : NULL_CHECK_027
 * @tc.desc      : QueryInputBuffer - index null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_027, TestSize.Level2)
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = OH_AudioCodec_QueryInputBuffer(codec, nullptr, 20000);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}


/**
 * @tc.number    : NULL_CHECK_028
 * @tc.name      : NULL_CHECK_028
 * @tc.desc      : GetInputBuffer - codec null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_028, TestSize.Level2)
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    uint32_t index = -1;
    result0 = OH_AudioCodec_QueryInputBuffer(codec, &index, 20000);
    ASSERT_EQ(result0, AV_ERR_OK);

    OH_AVBuffer* inputBuf = OH_AudioCodec_GetInputBuffer(nullptr, index);
    ASSERT_EQ(inputBuf, nullptr);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}


/**
 * @tc.number    : NULL_CHECK_029
 * @tc.name      : NULL_CHECK_029
 * @tc.desc      : QueryOutputBuffer - codec null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_029, TestSize.Level2)
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    uint32_t index = -1;
    result0 = OH_AudioCodec_QueryOutputBuffer(nullptr, &index, 20000);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}


/**
 * @tc.number    : NULL_CHECK_030
 * @tc.name      : NULL_CHECK_030
 * @tc.desc      : QueryOutputBuffer - index null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_030, TestSize.Level2)
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = OH_AudioCodec_QueryOutputBuffer(codec, nullptr, 20000);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}


/**
 * @tc.number    : NULL_CHECK_031
 * @tc.name      : NULL_CHECK_031
 * @tc.desc      : GetOutputBuffer - codec null check
 */
HWTEST_F(NullCheckTest, NULL_CHECK_031, TestSize.Level2)
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    uint32_t index = 0;
    OH_AVBuffer* outputBuf = OH_AudioCodec_GetOutputBuffer(nullptr, index);
    ASSERT_EQ(outputBuf, nullptr);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
}