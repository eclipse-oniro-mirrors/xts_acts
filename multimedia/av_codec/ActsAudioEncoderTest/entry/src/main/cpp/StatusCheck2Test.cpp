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
#include "StatusCheck2Test.h"
#include <hilog/log.h>
#include "AvcodecAudioAvbufferEncoderDemo.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "MY_TAG"

using namespace std;
using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioAacEncDemo;

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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Flush(codec);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Flush(codec);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Flush(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Flush(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Flush(codec);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Flush(codec);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Flush(codec);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   STATUS_CHECK_051
 * @tc.number STATUS_CHECK_051
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_051()
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   STATUS_CHECK_052
 * @tc.number STATUS_CHECK_052
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_052()
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   STATUS_CHECK_053
 * @tc.number STATUS_CHECK_053
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_053()
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   STATUS_CHECK_055
 * @tc.number STATUS_CHECK_055
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_055()
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}

/**
 * @tc.name   STATUS_CHECK_056
 * @tc.number STATUS_CHECK_056
 * @tc.desc   status check test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int STATUS_CHECK_056()
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
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Stop(codec);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    int32_t channel = 1;       // channel1
    int32_t sampleRate = 8000; // 8000hz
    int64_t bitRate = 64000;   // 64K
    int32_t sampleFormat = SAMPLE_S16LE;
    int32_t sampleBit = 16;
    int32_t complexity = 10;
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Configure(
        codec, format, channel, sampleRate, bitRate, sampleFormat, sampleBit, complexity);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Start(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    result0 = audioBufferAacEncDemo->PushInputData(codec, index);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    index = audioBufferAacEncDemo->GetInputIndex();
    index = -1;
    result0 = audioBufferAacEncDemo->PushInputDataEOS(codec, index);
    ASSERT_NE(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Flush(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Stop(codec);
    ASSERT_EQ(result0, AV_ERR_INVALID_STATE);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Reset(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
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
    AudioBufferAacEncDemo* audioBufferAacEncDemo = new AudioBufferAacEncDemo();
    codec = audioBufferAacEncDemo->CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_G711MU);
    ASSERT_NE(codec, nullptr);
    result0 = audioBufferAacEncDemo->Reset(codec);
    result0 = audioBufferAacEncDemo->Destroy(codec);
    ASSERT_EQ(result0, AV_ERR_OK);
    delete audioBufferAacEncDemo;
    return OH_AUDIO_STATUS_SUCCESS;
}
