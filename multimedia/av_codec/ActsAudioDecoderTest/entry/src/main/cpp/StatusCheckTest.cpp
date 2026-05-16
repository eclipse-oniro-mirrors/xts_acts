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
constexpr int32_t SAMPLE_RATE_8000 = 8000;

// Channel count constants
constexpr int32_t CHANNEL_COUNT_1 = 1;

// Index constants
constexpr int32_t INDEX_0 = 0;

// Timeout constants
constexpr int32_t TIMEOUT_20000 = 20000;

// Loop count constants
constexpr int32_t LOOP_COUNT_8 = 8;
} // namespace

namespace Acts {
namespace AudioDecoder {

/**
 * @tc.name   STATUS_CHECK_001
 * @tc.number STATUS_CHECK_001
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_001()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_002
 * @tc.number STATUS_CHECK_002
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_002()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_003
 * @tc.number STATUS_CHECK_003
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_003()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_004
 * @tc.number STATUS_CHECK_004
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_004()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_005
 * @tc.number STATUS_CHECK_005
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_005()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_006
 * @tc.number STATUS_CHECK_006
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_006()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_007
 * @tc.number STATUS_CHECK_007
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_007()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_008
 * @tc.number STATUS_CHECK_008
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_008()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_009
 * @tc.number STATUS_CHECK_009
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_009()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_010
 * @tc.number STATUS_CHECK_010
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_010()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_011
 * @tc.number STATUS_CHECK_011
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_011()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_012
 * @tc.number STATUS_CHECK_012
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_012()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    index = aDecBufferDemo->GetInputIndex();
    index = -1;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_013
 * @tc.number STATUS_CHECK_013
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_013()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_014
 * @tc.number STATUS_CHECK_014
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_014()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_015
 * @tc.number STATUS_CHECK_015
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_015()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_016
 * @tc.number STATUS_CHECK_016
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_016()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_017
 * @tc.number STATUS_CHECK_017
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_017()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_018
 * @tc.number STATUS_CHECK_018
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_018()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_019
 * @tc.number STATUS_CHECK_019
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_019()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_UNKNOWN);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_020
 * @tc.number STATUS_CHECK_020
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_020()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    index = aDecBufferDemo->GetInputIndex();
    index = -1;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_021
 * @tc.number STATUS_CHECK_021
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_021()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_022
 * @tc.number STATUS_CHECK_022
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_022()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_023
 * @tc.number STATUS_CHECK_023
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_023()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_024
 * @tc.number STATUS_CHECK_024
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_024()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_025
 * @tc.number STATUS_CHECK_025
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_025()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_026
 * @tc.number STATUS_CHECK_026
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_026()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_027
 * @tc.number STATUS_CHECK_027
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_027()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_VAL);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_028
 * @tc.number STATUS_CHECK_028
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_028()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    index = aDecBufferDemo->GetInputIndex();
    index = -1;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_029
 * @tc.number STATUS_CHECK_029
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_029()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_030
 * @tc.number STATUS_CHECK_030
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_030()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_031
 * @tc.number STATUS_CHECK_031
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_031()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_032
 * @tc.number STATUS_CHECK_032
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_032()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputData(codec, index);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_033
 * @tc.number STATUS_CHECK_033
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_033()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_034
 * @tc.number STATUS_CHECK_034
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_034()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_035
 * @tc.number STATUS_CHECK_035
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_035()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_036
 * @tc.number STATUS_CHECK_036
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_036()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    index = aDecBufferDemo->GetInputIndex();
    index = -1;
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_037
 * @tc.number STATUS_CHECK_037
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_037()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_038
 * @tc.number STATUS_CHECK_038
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_038()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_039
 * @tc.number STATUS_CHECK_039
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_039()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_040
 * @tc.number STATUS_CHECK_040
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_040()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_041
 * @tc.number STATUS_CHECK_041
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_041()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_042
 * @tc.number STATUS_CHECK_042
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_042()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_043
 * @tc.number STATUS_CHECK_043
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_043()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Flush(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_044
 * @tc.number STATUS_CHECK_044
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_044()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Flush(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_045
 * @tc.number STATUS_CHECK_045
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_045()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_046
 * @tc.number STATUS_CHECK_046
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_046()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_047
 * @tc.number STATUS_CHECK_047
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_047()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_048
 * @tc.number STATUS_CHECK_048
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_048()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Flush(codec);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_049
 * @tc.number STATUS_CHECK_049
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_049()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_050
 * @tc.number STATUS_CHECK_050
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_050()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

int STATUS_CHECK_051()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Stop(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

int STATUS_CHECK_052()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Stop(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

int STATUS_CHECK_053()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_054
 * @tc.number STATUS_CHECK_054
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_054()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    /**
     * @tc.name   STATUS_CHECK_055
     * @tc.number STATUS_CHECK_055
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

int STATUS_CHECK_055()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);

    /**
     * @tc.name   STATUS_CHECK_056
     * @tc.number STATUS_CHECK_056
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

int STATUS_CHECK_056()
{
    OH_AVCodec* codec = nullptr;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
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
    result0 = aDecBufferDemo->Stop(codec);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_057
 * @tc.number STATUS_CHECK_057
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_057()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_058
 * @tc.number STATUS_CHECK_058
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_058()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_059
 * @tc.number STATUS_CHECK_059
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_059()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_060
 * @tc.number STATUS_CHECK_060
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_060()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    uint32_t index;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    index = aDecBufferDemo->GetInputIndex();
    result0 = aDecBufferDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_061
 * @tc.number STATUS_CHECK_061
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_061()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_062
 * @tc.number STATUS_CHECK_062
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_062()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_063
 * @tc.number STATUS_CHECK_063
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_063()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_064
 * @tc.number STATUS_CHECK_064
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_064()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = aDecBufferDemo->Reset(codec);
    result0 = aDecBufferDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_065
 * @tc.number STATUS_CHECK_065
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_065()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    uint32_t index = INDEX_0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = OH_AudioCodec_QueryInputBuffer(codec, &index, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_066
 * @tc.number STATUS_CHECK_066
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_066()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    uint32_t index = INDEX_0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = OH_AudioCodec_QueryInputBuffer(codec, &index, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_OPERATE_NOT_PERMIT);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_067
 * @tc.number STATUS_CHECK_067
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_067()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    uint32_t index = INDEX_0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = OH_AudioCodec_QueryOutputBuffer(codec, &index, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}

/**
 * @tc.name   STATUS_CHECK_068
 * @tc.number STATUS_CHECK_068
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_068()
{
    OH_AVCodec* codec = nullptr;
    OH_AVErrCode result0;
    OH_AVFormat* format = OH_AVFormat_Create();
    int32_t channel = CHANNEL_COUNT_1;
    int32_t sampleRate = SAMPLE_RATE_8000; // 8000hz
    uint32_t index = INDEX_0;
    ADecBufferDemo* aDecBufferDemo = new ADecBufferDemo();
    codec = aDecBufferDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = aDecBufferDemo->Configure(codec, format, channel, sampleRate);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = aDecBufferDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);

    result0 = OH_AudioCodec_QueryOutputBuffer(codec, &index, TIMEOUT_20000);
    ASSERT_EQ(result0, AV_ERR_OPERATE_NOT_PERMIT);
    result0 = aDecBufferDemo->Destroy(codec);
    delete aDecBufferDemo;
    return AV_ERR_OK;
}
} // namespace AudioDecoder
} // namespace Acts