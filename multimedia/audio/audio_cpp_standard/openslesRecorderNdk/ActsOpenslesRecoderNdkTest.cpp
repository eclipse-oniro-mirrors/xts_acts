/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <securec.h>
#include <iostream>
#include <unistd.h>
#include <OpenSLES.h>
#include <OpenSLES_OpenHarmony.h>
#include <OpenSLES_Platform.h>
#include "audio_info.h"
#include "audio_log.h"
#include "gtest/gtest.h"

using namespace std;
using namespace testing::ext;

namespace {
class ActsOpenslesRecoderNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

void ActsOpenslesRecoderNdkTest::SetUpTestCase() {}
void ActsOpenslesRecoderNdkTest::TearDownTestCase() {}
void ActsOpenslesRecoderNdkTest::SetUp() {}
void ActsOpenslesRecoderNdkTest::TearDown() {}

static void BufferQueueCallback(SLOHBufferQueueItf sBufferQueueItf, void *pContext, SLuint32 size);

static SLresult CaptureStart(SLRecordItf sRecordItf, SLOHBufferQueueItf sBufferQueueItf, FILE *wavFile);

static SLresult CapturePause(SLRecordItf sRecordItf);

static SLresult CaptureStop(SLRecordItf sRecordItf);

static SLresult OpenSLESCaptureTest();

FILE *wavFile_ = nullptr;
SLObjectItf engineObject = nullptr;
SLRecordItf  recordItf;
SLOHBufferQueueItf bufferQueueItf;
SLObjectItf pcmCapturerObject = nullptr;

static SLresult OpenSLESCaptureTest()
{
    AUDIO_INFO_LOG("Enter OpenSLESCaptureTest");
    engineObject = nullptr;
    SLEngineItf engineItf = nullptr;

    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSLESCaptureTest slCreateEngine result: %{public}lu", result);
        return result;
    }
    result = (*engineObject)->Realize(engineObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSLESCaptureTest Realize result: %{public}lu", result);
        return result;
    }
    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, &engineItf);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSLESCaptureTest get engineItf result: %{public}lu", result);
        return result;
    }

    SLDataLocator_IODevice io_device = {
        SL_DATALOCATOR_IODEVICE,
        SL_IODEVICE_AUDIOINPUT,
        SL_DEFAULTDEVICEID_AUDIOINPUT,
        NULL
    };

    SLDataSource audioSource = {
        &io_device,
        NULL
    };

    SLDataLocator_BufferQueue buffer_queue = {
        SL_DATALOCATOR_BUFFERQUEUE,
        3
    };

    SLDataFormat_PCM format_pcm = {
        SL_DATAFORMAT_PCM,
        OHOS::AudioStandard::AudioChannel::MONO,
        OHOS::AudioStandard::AudioSamplingRate::SAMPLE_RATE_44100,
        SL_PCMSAMPLEFORMAT_FIXED_16,
        0,
        0,
        0
    };
    SLDataSink audioSink = {
        &buffer_queue,
        &format_pcm
    };

    result = (*engineItf)->CreateAudioRecorder(engineItf, &pcmCapturerObject,
        &audioSource, &audioSink, 0, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSLESCaptureTest CreateAudioRecorder result: %{public}lu", result);
        return result;
    }
    result = (*pcmCapturerObject)->Realize(pcmCapturerObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSLESCaptureTest Realize result: %{public}lu", result);
        return result;
    }
    result = (*pcmCapturerObject)->GetInterface(pcmCapturerObject, SL_IID_RECORD, &recordItf);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSLESCaptureTest get recordItf result: %{public}lu", result);
        return result;
    }
    result = (*pcmCapturerObject)->GetInterface(pcmCapturerObject, SL_IID_OH_BUFFERQUEUE, &bufferQueueItf);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSLESCaptureTest get bufferQueueItf result: %{public}lu", result);
        return result;
    }
    result = (*bufferQueueItf)->RegisterCallback(bufferQueueItf, BufferQueueCallback, wavFile_);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSLESCaptureTest RegisterCallback result: %{public}lu", result);
        return result;
    }
    AUDIO_INFO_LOG("OpenSLESCaptureTest end");
    return result;
}

static void BufferQueueCallback(SLOHBufferQueueItf sBufferQueueItf, void *pContext, SLuint32 size)
{
    AUDIO_INFO_LOG("Enter BufferQueueCallback");
    FILE *wavFile = (FILE *)pContext;
    if (wavFile != nullptr) {
        SLuint8 *buffer = nullptr;
        SLuint32 pSize = 0;
        SLresult result = (*bufferQueueItf)->GetBuffer(sBufferQueueItf, &buffer, &pSize);
        if (SL_RESULT_SUCCESS != result) {
            AUDIO_INFO_LOG("BufferQueueCallback GetBuffer result: %{public}lu", result);
            return ;
        }
        if (buffer != nullptr) {
            AUDIO_INFO_LOG("BufferQueueCallback, length, pSize:%{public}lu, size: %{public}lu.",
                pSize, size);
            fwrite(buffer, 1, pSize, wavFile);
            result = (*bufferQueueItf)->Enqueue(sBufferQueueItf, buffer, size);
            if (SL_RESULT_SUCCESS != result) {
                AUDIO_INFO_LOG("BufferQueueCallback Enqueue result: %{public}lu", result);
                return ;
            }
        } else {
            AUDIO_INFO_LOG("BufferQueueCallback, buffer is null or pSize: %{public}lu, size: %{public}lu.",
                pSize, size);
        }
    }
    AUDIO_INFO_LOG("BufferQueueCallback end");
    return;
}

static SLresult CaptureStart(SLRecordItf sRecordItf, SLOHBufferQueueItf sBufferQueueItf, FILE *wavFile)
{
    AUDIO_INFO_LOG("Enter CaptureStart");
    SLresult result = (*recordItf)->SetRecordState(sRecordItf, SL_RECORDSTATE_RECORDING);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("CaptureStart SetRecordState result: %{public}lu", result);
        return result;
    }
    SLuint32 state = SL_RECORDSTATE_RECORDING;
    result = (*recordItf)->GetRecordState(sRecordItf, &state);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("CaptureStart GetRecordState result: %{public}lu", result);
        return result;
    }
    if (wavFile != nullptr) {
        SLuint8* buffer = nullptr;
        SLuint32 pSize = 0;
        result = (*bufferQueueItf)->GetBuffer(sBufferQueueItf, &buffer, &pSize);
        if (SL_RESULT_SUCCESS != result) {
            AUDIO_INFO_LOG("CaptureStart GetBuffer result: %{public}lu", result);
            return result;
        }
        if (buffer != nullptr) {
            AUDIO_INFO_LOG("CaptureStart, enqueue buffer length: %{public}lu.", pSize);
            fwrite(buffer, 1, pSize, wavFile);
            result = (*bufferQueueItf)->Enqueue(sBufferQueueItf, buffer, pSize);
            if (SL_RESULT_SUCCESS != result) {
                AUDIO_INFO_LOG("CaptureStart Enqueue result: %{public}lu", result);
                return result;
            }
        } else {
            AUDIO_INFO_LOG("CaptureStart, buffer is null or pSize: %{public}lu.", pSize);
        }
    }
    AUDIO_INFO_LOG("CaptureStart return result: %{public}lu", result);
    return result;
}

static SLresult CapturePause(SLRecordItf sRecordItf)
{
    AUDIO_INFO_LOG("Enter CapturePause");
    SLresult result = (*recordItf)->SetRecordState(sRecordItf, SL_RECORDSTATE_PAUSED);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("CapturePause SetRecordState result: %{public}lu", result);
        return result;
    }
    AUDIO_INFO_LOG("CapturePause return  result: %{public}lu", result);
    return result;
}

static SLresult CaptureStop(SLRecordItf sRecordItf)
{
    AUDIO_INFO_LOG("Enter CaptureStop");
    fflush(wavFile_);
    SLresult result = (*recordItf)->SetRecordState(sRecordItf, SL_RECORDSTATE_STOPPED);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("CapturePause SetRecordState result: %{public}lu", result);
        return result;
    }
    (*pcmCapturerObject)->Destroy(pcmCapturerObject);
    fclose(wavFile_);
    wavFile_ = nullptr;
    AUDIO_INFO_LOG("CaptureStop return  result: %{public}lu", result);
    return result;
}
}

/**
 * @tc.number    : SUB_MULTIMEDIA_AUDIO_OPENSELES_RECODER_FUNCTION_0100
 * @tc.name      : stop at end of stream
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsOpenslesRecoderNdkTest, SUB_MULTIMEDIA_AUDIO_OPENSELES_RECODER_FUNCTION_0100, TestSize.Level1)
{
    string filePath = "/data/test.pcm";
    wavFile_ = fopen(filePath.c_str(), "wb");
    if (wavFile_ == nullptr) {
        AUDIO_INFO_LOG("OpenSL ES capture: Unable to open file");
        return ;
    }
    SLresult result = OpenSLESCaptureTest();
    ASSERT_EQ(SL_RESULT_SUCCESS, result);
    result = CaptureStart(recordItf, bufferQueueItf, wavFile_);
    ASSERT_EQ(SL_RESULT_SUCCESS, result);
    result = CapturePause(recordItf);
    ASSERT_EQ(SL_RESULT_SUCCESS, result);
    result = CaptureStop(recordItf);
    ASSERT_EQ(SL_RESULT_SUCCESS, result);
}