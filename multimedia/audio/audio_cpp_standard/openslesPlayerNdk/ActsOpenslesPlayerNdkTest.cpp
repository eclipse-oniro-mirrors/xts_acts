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

#include "audio_log.h"
#include "audio_info.h"
#include <OpenSLES.h>
#include <OpenSLES_OpenHarmony.h>
#include <string>
#include "gtest/gtest.h"

using namespace std;
using namespace testing::ext;
namespace {
class ActsOpenslesPlayerNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
};

struct WAV_HEADER {
    /* RIFF Chunk Descriptor */
    uint8_t RIFF[4] = {'R', 'I', 'F', 'F'}; // RIFF Header Magic header
    uint32_t ChunkSize = 0; // RIFF Chunk Size
    uint8_t WAVE[4] = {'W', 'A', 'V', 'E'}; // WAVE Header
    /* "fmt" sub-chunk */
    uint8_t fmt[4] = {'f', 'm', 't', ' '}; // FMT header
    uint32_t Subchunk1Size = 16; // Size of the fmt chunk
    uint16_t AudioFormat = 1; // Audio format 1=PCM
    uint16_t NumOfChan = 2; // Number of channels 1=Mono 2=Stereo
    uint32_t SamplesPerSec = 44100; // Sampling Frequency in Hz
    uint32_t bytesPerSec = 176400; // bytes per second
    uint16_t blockAlign = 2; // 2=16-bit mono, 4=16-bit stereo
    uint16_t bitsPerSample = 16; // Number of bits per sample
    /* "data" sub-chunk */
    uint8_t Subchunk2ID[4] = {'d', 'a', 't', 'a'}; // "data"  string
    uint32_t Subchunk2Size = 0; // Sampled data length
};

using wav_hdr = struct WAV_HEADER;

void ActsOpenslesPlayerNdkTest::SetUpTestCase() {}
void ActsOpenslesPlayerNdkTest::TearDownTestCase() {}
void ActsOpenslesPlayerNdkTest::SetUp() {}
void ActsOpenslesPlayerNdkTest::TearDown() {}

static void BuqqerQueueCallback(SLOHBufferQueueItf sBufferQueueItf, void *pContext, SLuint32 size);

static SLuint32 PlayerStart(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf, FILE *wavFile);

static SLuint32 PlayerStop(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf);

static SLresult OpenSlTest();

static SLresult OpenSlTestConcurrent();

const SLuint32 number = 3;
const char* READPATH1 = "/data/audio/S16LE_2_44100.pcm";
const char* READPATH2 = "/data/audio/S16LE_2_64000.pcm";
FILE *wavFile_ = nullptr;
FILE *wavFile1_ = nullptr;
FILE *wavFile2_ = nullptr;
wav_hdr wavHeader_;
wav_hdr wavHeader1_;
wav_hdr wavHeader2_;
SLObjectItf engineObject = nullptr;
SLObjectItf outputMixObject = nullptr;
SLPlayItf playItf;
SLPlayItf playItf1;
SLPlayItf playItf2;
SLVolumeItf volumeItf1;
SLVolumeItf volumeItf2;
SLOHBufferQueueItf bufferQueueItf;
SLOHBufferQueueItf bufferQueueItf1;
SLOHBufferQueueItf bufferQueueItf2;
SLObjectItf pcmPlayerObject = nullptr;
SLObjectItf pcmPlayerObject1 = nullptr;
SLObjectItf pcmPlayerObject2 = nullptr;

static SLresult OpenSlTest()
{
    AUDIO_INFO_LOG("OpenSlTest enter");
    engineObject = nullptr;
    SLEngineItf engineEngine = nullptr;
    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    // get engine object
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest slCreateEngine result: %{public}lu", result);
        return result;
    }
    result = (*engineObject)->Realize(engineObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest Realize result: %{public}lu", result);
        return result;
    }
    // get engineEngine object
    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, &engineEngine);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest get engineEngine result: %{public}lu", result);
        return result;
    }
    outputMixObject = nullptr;
    result = (*engineEngine)->CreateOutputMix(engineEngine, &outputMixObject, 0, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest CreateOutputMix result: %{public}lu", result);
        return result;
    }
    result = (*outputMixObject)->Realize(outputMixObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest outPut Realize result: %{public}lu", result);
        return result;
    }

    SLDataLocator_OutputMix slOutputMix = {SL_DATALOCATOR_OUTPUTMIX, outputMixObject};
    SLDataSink slSink = {&slOutputMix, nullptr};
    SLDataLocator_BufferQueue slBufferQueue = {
        SL_DATALOCATOR_BUFFERQUEUE,
        0
    };
    SLDataFormat_PCM pcmFormat = {
        SL_DATAFORMAT_PCM,
        wavHeader_.NumOfChan,
        wavHeader_.SamplesPerSec * 1000,
        wavHeader_.bitsPerSample,
        0,
        0,
        0
    };
    SLDataSource slSource = {&slBufferQueue, &pcmFormat};

    result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject,
        &slSource, &slSink, number, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest CreateAudioPlayer result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject)->Realize(pcmPlayerObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest CreateAudioPlayer Realize result: %{public}lu", result);
        return result;
    }
    // get bufferQueueItf object
    result = (*pcmPlayerObject)->GetInterface(pcmPlayerObject, SL_IID_PLAY, &playItf);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest get playItf result: %{public}lu", result);
        return result;
    }
    SLVolumeItf volumeItf;
    result = (*pcmPlayerObject)->GetInterface(pcmPlayerObject, SL_IID_VOLUME, &volumeItf);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest get volumeItf result: %{public}lu", result);
        return result;
    }
    SLmillibel pLevel = 0;
    result = (*volumeItf)->GetVolumeLevel(volumeItf, &pLevel);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest GetVolumeLevel result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject)->GetInterface(pcmPlayerObject, SL_IID_OH_BUFFERQUEUE, &bufferQueueItf);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest get bufferQueueItf result: %{public}lu", result);
        return result;
    }
    result = (*bufferQueueItf)->RegisterCallback(bufferQueueItf, BuqqerQueueCallback, wavFile_);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest RegisterCallback result: %{public}lu", result);
        return result;
    }
    result = PlayerStart(playItf, bufferQueueItf, wavFile_);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTest PlayerStart result: %{public}lu", result);
        return result;
    }
    AUDIO_INFO_LOG("OpenSlTest return  result: %{public}lu", result);
    return result;
}

static SLresult OpenSlTestConcurrent()
{
    AUDIO_INFO_LOG("OpenSlTestConcurrent start");
    engineObject = nullptr;
    SLEngineItf engineEngine = nullptr;
    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent slCreateEngine result: %{public}lu", result);
        return result;
    }
    result = (*engineObject)->Realize(engineObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent Realize result: %{public}lu", result);
        return result;
    }

    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, &engineEngine);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent get engineEngine result: %{public}lu", result);
        return result;
    }

    outputMixObject = nullptr;
    result = (*engineEngine)->CreateOutputMix(engineEngine, &outputMixObject, 0, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent CreateOutputMix result: %{public}lu", result);
        return result;
    }
    result = (*outputMixObject)->Realize(outputMixObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent outPut Realize result: %{public}lu", result);
        return result;
    }
    SLuint32 state;
    result = (*outputMixObject)->GetState(outputMixObject, &state);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent outPut GetState result: %{public}lu", result);
        return result;
    }

    SLDataLocator_OutputMix slOutputMix = {SL_DATALOCATOR_OUTPUTMIX, outputMixObject};
    SLDataSink slSink = {&slOutputMix, nullptr};
    SLDataLocator_BufferQueue slBufferQueue = {
        SL_DATALOCATOR_BUFFERQUEUE,
        0
    };
    SLDataFormat_PCM pcmFormat1 = {
        SL_DATAFORMAT_PCM,
        wavHeader1_.NumOfChan,
        wavHeader1_.SamplesPerSec * 1000,
        wavHeader1_.bitsPerSample,
        0,
        0,
        0
    };
    SLDataFormat_PCM pcmFormat2 = {
        SL_DATAFORMAT_PCM,
        wavHeader2_.NumOfChan,
        wavHeader2_.SamplesPerSec * 1000,
        wavHeader2_.bitsPerSample,
        0,
        0,
        0
    };
    SLDataSource slSource1 = {&slBufferQueue, &pcmFormat1};
    SLDataSource slSource2 = {&slBufferQueue, &pcmFormat2};

    result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject1, &slSource1,
        &slSink, number, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent CreateAudioPlayer pcmPlayerObject1 Realize result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject1)->Realize(pcmPlayerObject1, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent outPut Realize pcmPlayerObject1 result: %{public}lu", result);
        return result;
    }

    result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject2, &slSource2, &slSink,
        number, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent CreateAudioPlayer pcmPlayerObject2 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject2)->Realize(pcmPlayerObject2, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent Realize pcmPlayerObject2 result: %{public}lu", result);
        return result;
    }

    result = (*pcmPlayerObject1)->GetInterface(pcmPlayerObject1, SL_IID_PLAY, &playItf1);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent playItf1 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject2)->GetInterface(pcmPlayerObject2, SL_IID_PLAY, &playItf2);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent playItf2 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject1)->GetInterface(pcmPlayerObject1, SL_IID_VOLUME, &volumeItf1);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent volumeItf1 result: %{public}lu", result);
        return result;
    }

    SLmillibel level1 = 0;
    (*volumeItf1)->GetMaxVolumeLevel(volumeItf1, &level1);
    SLmillibel temp = 2; // SetVolumeLevel level1
    level1 = (SLmillibel) (level1 / temp);
    (*volumeItf1)->SetVolumeLevel(volumeItf1, level1);
    (*pcmPlayerObject2)->GetInterface(pcmPlayerObject2, SL_IID_VOLUME, &volumeItf2);
    SLmillibel level2 = 0;
    (*volumeItf2)->GetMaxVolumeLevel(volumeItf2, &level2);
    temp = 15; // SetVolumeLevel level2
    level2 = (SLmillibel) (level2 / temp);
    (*volumeItf2)->SetVolumeLevel(volumeItf2, level2);

    result = (*pcmPlayerObject1)->GetInterface(pcmPlayerObject1, SL_IID_OH_BUFFERQUEUE, &bufferQueueItf1);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent bufferQueueItf1 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject2)->GetInterface(pcmPlayerObject2, SL_IID_OH_BUFFERQUEUE, &bufferQueueItf2);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent bufferQueueItf2 result: %{public}lu", result);
        return result;
    }
    result = (*bufferQueueItf1)->RegisterCallback(bufferQueueItf1, BuqqerQueueCallback, wavFile1_);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent RegisterCallback1 result: %{public}lu", result);
        return result;
    }
    result = (*bufferQueueItf2)->RegisterCallback(bufferQueueItf2, BuqqerQueueCallback, wavFile2_);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent RegisterCallback2 result: %{public}lu", result);
        return result;
    }
    result = PlayerStart(playItf1, bufferQueueItf1, wavFile1_);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent playItf1 PlayerStart result: %{public}lu", result);
        return result;
    }
    result = PlayerStart(playItf2, bufferQueueItf2, wavFile2_);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("OpenSlTestConcurrent playItf2 PlayerStart result: %{public}lu", result);
        return result;
    }
    AUDIO_INFO_LOG("OpenSlTestConcurrent return  result: %{public}lu", result);
    return result;
}

static void BuqqerQueueCallback(SLOHBufferQueueItf sBufferQueueItf, void *pContext, SLuint32 size)
{
    FILE *wavFile = (FILE *)pContext;
    if (!feof(wavFile)) {
        SLuint8 *buffer = nullptr;
        SLuint32 pSize = 0;
        SLresult result = (*bufferQueueItf)->GetBuffer(sBufferQueueItf, &buffer, &pSize);
        if (SL_RESULT_SUCCESS != result) {
            AUDIO_INFO_LOG("BuqqerQueueCallback GetBuffer result: %{public}lu", result);
            return ;
        }
        fread(buffer, 1, size, wavFile);
        result = (*bufferQueueItf)->Enqueue(sBufferQueueItf, buffer, size);
        if (SL_RESULT_SUCCESS != result) {
            AUDIO_INFO_LOG("BuqqerQueueCallback Enqueue result: %{public}lu", result);
            return ;
        }
    }
    return ;
}

static SLresult PlayerStart(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf, FILE *wavFile)
{
    AUDIO_INFO_LOG("PlayerStart enter");
    SLresult result = (*playItf)->SetPlayState(sPlayItf, SL_PLAYSTATE_PLAYING);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("PlayerStart SetPlayState result: %{public}lu", result);
        return result;
    }
    SLuint32 state = SL_PLAYSTATE_PLAYING;
    result = (*playItf)->GetPlayState(sPlayItf, &state);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("PlayerStart GetPlayState result: %{public}lu", result);
        return result;
    }
    if (!feof(wavFile)) {
        SLuint8* buffer = nullptr;
        SLuint32 pSize = 0;
        result = (*bufferQueueItf)->GetBuffer(sBufferQueueItf, &buffer, &pSize);
        if (SL_RESULT_SUCCESS != result) {
            AUDIO_INFO_LOG("PlayerStart GetBuffer result: %{public}lu", result);
            return result;
        }
        fread(buffer, 1, pSize, wavFile);
        result = (*bufferQueueItf)->Enqueue(sBufferQueueItf, buffer, pSize);
        if (SL_RESULT_SUCCESS != result) {
            AUDIO_INFO_LOG("PlayerStart Enqueue result: %{public}lu", result);
            return result;
        }
    }
    AUDIO_INFO_LOG("PlayerStart return  result: %{public}lu", result);
    return result;
}

static SLresult PlayerStop(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf)
{
    AUDIO_INFO_LOG("PlayerStop enetr");

    SLresult result = (*playItf)->SetPlayState(sPlayItf, SL_PLAYSTATE_STOPPED);
    if (SL_RESULT_SUCCESS != result) {
        AUDIO_INFO_LOG("PlayerStop SetPlayState result: %{public}lu", result);
        return result;
    }
    AUDIO_INFO_LOG("PlayerStop return  result: %{public}lu", result);
    return result;
}
}

/**
 * @tc.number    : SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100
 * @tc.name      : Pcm gemischte Wiedergabe
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsOpenslesPlayerNdkTest, SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100, TestSize.Level1)
{
    size_t headerSize = sizeof(wav_hdr);
    char path[PATH_MAX + 1] = {0x00};
    if ((strlen(READPATH1) > PATH_MAX) || (realpath(READPATH1, path) == nullptr)) {
        AUDIO_ERR_LOG("Invalid path");
        return ;
    }
    wavFile1_ = fopen(path, "rb");
    if (wavFile1_ == nullptr) {
        AUDIO_INFO_LOG("AudioRendererTest: Unable to open wave file");
        return ;
    }
    fread(&wavHeader1_, 1, headerSize, wavFile1_);

    headerSize = sizeof(wav_hdr);
    if ((strlen(READPATH2) > PATH_MAX) || (realpath(READPATH2, path) == nullptr)) {
        AUDIO_ERR_LOG("Invalid path");
        return ;
    }
    wavFile2_ = fopen(path, "rb");
    if (wavFile2_ == nullptr) {
        AUDIO_INFO_LOG("AudioRendererTest: Unable to open wave file");
        return ;
    }
    fread(&wavHeader2_, 1, headerSize, wavFile2_);
    SLresult result = OpenSlTestConcurrent();
    ASSERT_EQ(SL_RESULT_SUCCESS, result);
    while (!feof(wavFile1_) || !feof(wavFile2_)) {
        sleep(1);
    }
    result = PlayerStop(playItf1, bufferQueueItf1);
    ASSERT_EQ(SL_RESULT_SUCCESS, result);

    result = PlayerStop(playItf2, bufferQueueItf2);
    ASSERT_EQ(SL_RESULT_SUCCESS, result);
    (*pcmPlayerObject1)->Destroy(pcmPlayerObject1);
    (*pcmPlayerObject2)->Destroy(pcmPlayerObject2);
    (*engineObject)->Destroy(engineObject);
    (*outputMixObject)->Destroy(outputMixObject);
}

/**
 * @tc.number    : SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200
 * @tc.name      : Pcm spielt weiter
 * @tc.desc      : Basic function test
 */
HWTEST_F(ActsOpenslesPlayerNdkTest, SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200, TestSize.Level1)
{
    size_t headerSize = sizeof(wav_hdr);
        char path[PATH_MAX + 1] = {0x00};
        if ((strlen(READPATH1) > PATH_MAX) || (realpath(READPATH1, path) == nullptr)) {
            AUDIO_ERR_LOG("Invalid path");
            return ;
        }
        wavFile_ = fopen(path, "rb");
        if (wavFile_ == nullptr) {
            AUDIO_INFO_LOG("AudioRendererTest: Unable to open wave file");
            return ;
        }
        fread(&wavHeader_, 1, headerSize, wavFile_);

        SLresult result = OpenSlTest();
        ASSERT_EQ(SL_RESULT_SUCCESS, result);

        while (!feof(wavFile_)) {
            sleep(1);
        }
        result = PlayerStop(playItf, bufferQueueItf);
        ASSERT_EQ(SL_RESULT_SUCCESS, result);
        (*pcmPlayerObject)->Destroy(pcmPlayerObject);

        char path2[PATH_MAX + 1] = {0x00};
        if ((strlen(READPATH2) > PATH_MAX) || (realpath(READPATH2, path2) == nullptr)) {
            AUDIO_ERR_LOG("Invalid path");
            return ;
        }
        wavFile_ = fopen(path2, "rb");
        if (wavFile_ == nullptr) {
            AUDIO_INFO_LOG("AudioRendererTest: Unable to open wave file");
            return ;
        }
        fread(&wavHeader_, 1, headerSize, wavFile_);

        result = OpenSlTest();
        ASSERT_EQ(SL_RESULT_SUCCESS, result);

        while (!feof(wavFile_)) {
            sleep(1);
        }
        result = PlayerStop(playItf, bufferQueueItf);
        ASSERT_EQ(SL_RESULT_SUCCESS, result);
        (*pcmPlayerObject)->Destroy(pcmPlayerObject);
}