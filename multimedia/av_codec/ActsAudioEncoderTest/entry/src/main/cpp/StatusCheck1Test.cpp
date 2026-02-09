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

#include "StatusCheck1Test.h"
#include "AvcodecAudioAvbufferEncoderDemo.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioAacEncDemo;

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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    uint32_t index;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    uint32_t index;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    uint32_t index;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_UNKNOWN);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    uint32_t index;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_UNKNOWN);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_UNKNOWN);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    uint32_t index;
    OH_AVErrCode result0;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->SetCallback(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

