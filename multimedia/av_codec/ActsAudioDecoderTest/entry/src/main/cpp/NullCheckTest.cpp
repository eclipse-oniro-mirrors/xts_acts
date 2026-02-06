/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include <fstream>
#include <iostream>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include <queue>
#include <string>
#include <thread>
#include "include/AvcodecAudioAvBufferDecoderDemoTest.h"
#include "include/CommonToolTest.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioBufferDemo;

namespace {
// Sample rate constants
constexpr int32_t SAMPLE_RATE_16000 = 16000;

// Channel count constants
constexpr int32_t CHANNEL_COUNT_1 = 1;

// Index constants
constexpr int32_t INDEX_INVALID = -1;
constexpr int32_t INDEX_0 = 0;

// Timeout constants
constexpr int32_t TIMEOUT_20000 = 20000;
} // namespace

namespace Acts {
namespace AudioDecoder {

/**
 * @tc.name   NULL_CHECK_001
 * @tc.number NULL_CHECK_001
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_001()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(nullptr);
    ASSERT_EQ(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_002
 * @tc.number NULL_CHECK_002
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_002()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByName(nullptr);
    ASSERT_EQ(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_NE(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_003
 * @tc.number NULL_CHECK_003
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_003()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Destroy(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_004
 * @tc.number NULL_CHECK_004
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_004()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_005
 * @tc.number NULL_CHECK_005
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_005()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(nullptr, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_006
 * @tc.number NULL_CHECK_006
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_006()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_007
 * @tc.number NULL_CHECK_007
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_007()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Prepare(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_008
 * @tc.number NULL_CHECK_008
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_008()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_009
 * @tc.number NULL_CHECK_009
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_009()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_010
 * @tc.number NULL_CHECK_010
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_010()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_011
 * @tc.number NULL_CHECK_011
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_011()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(nullptr);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_012
 * @tc.number NULL_CHECK_012
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_012()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; // 8000hz
    OH_AVErrCode result0;
    OH_AVFormat* result1;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_013
 * @tc.number NULL_CHECK_013
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_013()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; // 8000hz
    uint32_t index;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_014
 * @tc.number NULL_CHECK_014
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_014()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; // 8000hz
    uint32_t index;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_015
 * @tc.number NULL_CHECK_015
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_015()
{
    OH_AVCodec* codec = nullptr;
    bool* isValid = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->IsValid(nullptr, isValid);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_016
 * @tc.number NULL_CHECK_016
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_016()
{
    OH_AVCodec* codec = nullptr;
    bool* isValid = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    isValid = nullptr;
    result0 = aDecBufferDemo->IsValid(codec, isValid);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_017
 * @tc.number NULL_CHECK_017
 * @tc.desc   null check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_017()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = 1;
    int32_t sampleRate = 8000; // 8000hz
    uint32_t index;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_018
 * @tc.number NULL_CHECK_018
 * @tc.desc   SetIntBuffer - format null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_018()
{
    std::vector<int32_t> vDepth = { 0 };
    int32_t* trackIdsDepth = vDepth.data();

    bool ret = OH_AVFormat_SetIntBuffer(nullptr, OH_MD_KEY_REFERENCE_TRACK_IDS, trackIdsDepth, vDepth.size());
    ASSERT_EQ(ret, false);
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_019
 * @tc.number NULL_CHECK_019
 * @tc.desc   SetIntBuffer - key null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_019()
{
    OH_AVFormat* format = OH_AVFormat_Create();
    std::vector<int32_t> vDepth = { 0 };
    int32_t* trackIdsDepth = vDepth.data();

    bool ret = OH_AVFormat_SetIntBuffer(format, nullptr, trackIdsDepth, vDepth.size());
    OH_AVFormat_Destroy(format);

    ASSERT_EQ(ret, false);
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_020
 * @tc.number NULL_CHECK_020
 * @tc.desc   SetIntBuffer - addr null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_020()
{
    OH_AVFormat* format = OH_AVFormat_Create();
    std::vector<int32_t> vDepth = { 0 };

    bool ret = OH_AVFormat_SetIntBuffer(format, OH_MD_KEY_REFERENCE_TRACK_IDS, nullptr, vDepth.size());
    OH_AVFormat_Destroy(format);

    ASSERT_EQ(ret, false);
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_021
 * @tc.number NULL_CHECK_021
 * @tc.desc   SetIntBuffer - size is zero
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_021()
{
    OH_AVFormat* format = OH_AVFormat_Create();
    std::vector<int32_t> vDepth = { 0 };
    int32_t* trackIdsDepth = vDepth.data();

    bool ret = OH_AVFormat_SetIntBuffer(format, OH_MD_KEY_REFERENCE_TRACK_IDS, trackIdsDepth, 0);
    OH_AVFormat_Destroy(format);

    ASSERT_EQ(ret, false);
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_022
 * @tc.number NULL_CHECK_022
 * @tc.desc   GetIntBuffer - format null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_022()
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_023
 * @tc.number NULL_CHECK_023
 * @tc.desc   GetIntBuffer - key null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_023()
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_024
 * @tc.number NULL_CHECK_024
 * @tc.desc   GetIntBuffer - addr null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_024()
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_025
 * @tc.number NULL_CHECK_025
 * @tc.desc   GetIntBuffer - size null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_025()
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
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_026
 * @tc.number NULL_CHECK_026
 * @tc.desc   QueryInputBuffer - codec null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_026()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    uint32_t index = INDEX_INVALID;
    result0 = OH_AudioCodec_QueryInputBuffer(nullptr, &index, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_027
 * @tc.number NULL_CHECK_027
 * @tc.desc   QueryInputBuffer - index null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_027()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = OH_AudioCodec_QueryInputBuffer(codec, nullptr, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_028
 * @tc.number NULL_CHECK_028
 * @tc.desc   GetInputBuffer - codec null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_028()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    uint32_t index = INDEX_INVALID;
    result0 = OH_AudioCodec_QueryInputBuffer(codec, &index, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_OK);

    OH_AVBuffer* inputBuf = OH_AudioCodec_GetInputBuffer(nullptr, index);
    ASSERT_EQ(inputBuf, nullptr);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_029
 * @tc.number NULL_CHECK_029
 * @tc.desc   QueryOutputBuffer - codec null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_029()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    uint32_t index = INDEX_INVALID;
    result0 = OH_AudioCodec_QueryOutputBuffer(nullptr, &index, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_030
 * @tc.number NULL_CHECK_030
 * @tc.desc   QueryOutputBuffer - index null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_030()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = OH_AudioCodec_QueryOutputBuffer(codec, nullptr, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   NULL_CHECK_031
 * @tc.number NULL_CHECK_031
 * @tc.desc   GetOutputBuffer - codec null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int NULL_CHECK_031()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_16000;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    ASSERT_NE(codec, nullptr);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    uint32_t index = INDEX_0;
    OH_AVBuffer* outputBuf = OH_AudioCodec_GetOutputBuffer(nullptr, index);
    ASSERT_EQ(outputBuf, nullptr);

    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}
} // namespace AudioDecoder
}