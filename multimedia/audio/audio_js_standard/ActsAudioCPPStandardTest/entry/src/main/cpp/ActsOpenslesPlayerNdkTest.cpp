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

#include <SLES/OpenSLES.h>
#include <SLES/OpenSLES_OpenHarmony.h>
#include <SLES/OpenSLES_Platform.h>
#include <string>
#include "include/FileUtilsTest.h"
#include "hilog/log.h"

#undef LOG_DOMAIN
#define LOG_DOMAIN 0x0001
#undef LOG_TAG
#define LOG_TAG "ActsAudioTest"

using namespace std;

namespace {

struct WavHdr {
    /* RIFF Chunk Descriptor */
    uint8_t riff[4] = {'R', 'I', 'F', 'F'}; // RIFF Header Magic header
    uint32_t chunkSize = 0; // RIFF Chunk Size
    uint8_t wave[4] = {'W', 'A', 'V', 'E'}; // WAVE Header
    /* "fmt" sub-chunk */
    uint8_t fmt[4] = {'f', 'm', 't', ' '}; // FMT header
    uint32_t subchunk1Size = 16; // Size of the fmt chunk
    uint16_t audioFormat = 1; // Audio format 1=PCM
    uint16_t numOfChan = 2; // Number of channels 1=Mono 2=Stereo
    uint32_t samplesPerSec = 44100; // Sampling Frequency in Hz
    uint32_t bytesPerSec = 176400; // bytes per second
    uint16_t blockAlign = 2; // 2=16-bit mono, 4=16-bit stereo
    uint16_t bitDepth = 16; // Number of bits per sample
    /* "data" sub-chunk */
    uint8_t subchunk2Id[4] = {'d', 'a', 't', 'a'}; // "data"  string
    uint32_t subchunk2Size = 0; // Sampled data length
};

void SetUpTestCase() {}
void TearDownTestCase() {}
void SetUp() {}
void TearDown() {}

static void BuqqerQueueCallback(SLOHBufferQueueItf sBufferQueueItf, void *pContext, SLuint32 size);

static SLuint32 PlayerStart(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf, FILE *wavFile);

static SLuint32 PlayerStop(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf);

static SLresult OpenSlTest();

static SLresult OpenSlTestConcurrent();

// 音频接口数量常量
const SLuint32 AUDIO_INTERFACE_COUNT = 3;
// 音量分频器常量
const SLmillibel VOLUME_DIVIDER_HALF = 2;
const SLmillibel VOLUME_DIVIDER_LOW = 15;
// 播放等待时间常量（秒）
const int MAX_PLAY_WAIT_TIME_SHORT = 2;
const int MAX_PLAY_WAIT_TIME_MEDIUM = 3;
const int MAX_PLAY_WAIT_TIME_LONG = 5;
//const char* READPATH1 = "/data/audio/S16LE_2_44100.pcm";
//const char* READPATH2 = "/data/audio/S16LE_2_64000.pcm";
const char* READPATH1 = "/data/storage/el2/base/files/audio/S16LE_2_44100.pcm";
const char* READPATH2 = "/data/storage/el2/base/files/audio/S16LE_2_64000.pcm";
FILE *g_wavFile = nullptr;
FILE *g_wavFile1 = nullptr;
FILE *g_wavFile2 = nullptr;
WavHdr g_wavHeader;
WavHdr g_wavHeader1;
WavHdr g_wavHeader2;
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

// 创建并初始化引擎
static SLresult CreateEngine(SLEngineItf *engineEngine)
{
    engineObject = nullptr;
    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "slCreateEngine result: %{public}lu", result);
        return result;
    }
    result = (*engineObject)->Realize(engineObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "engineObject Realize result: %{public}lu", result);
        return result;
    }
    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, engineEngine);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "get engineEngine result: %{public}lu", result);
        return result;
    }
    return SL_RESULT_SUCCESS;
}

// 创建并初始化输出混音器
static SLresult CreateOutputMix(SLEngineItf engineEngine)
{
    outputMixObject = nullptr;
    SLresult result = (*engineEngine)->CreateOutputMix(
        engineEngine, &outputMixObject, 0, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "CreateOutputMix result: %{public}lu", result);
        return result;
    }
    result = (*outputMixObject)->Realize(outputMixObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "outputMix Realize result: %{public}lu", result);
        return result;
    }
    return SL_RESULT_SUCCESS;
}

// 创建音频播放器
static SLresult CreatePlayer(SLEngineItf engineEngine, SLDataFormat_PCM *pcmFormat)
{
    SLDataLocator_OutputMix slOutputMix = {SL_DATALOCATOR_OUTPUTMIX, outputMixObject};
    SLDataSink slSink = {&slOutputMix, nullptr};
    SLDataLocator_BufferQueue slBufferQueue = {SL_DATALOCATOR_BUFFERQUEUE, 0};
    SLDataSource slSource = {&slBufferQueue, pcmFormat};

    SLresult result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject,
        &slSource, &slSink, AUDIO_INTERFACE_COUNT, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "CreateAudioPlayer result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject)->Realize(pcmPlayerObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "pcmPlayerObject Realize result: %{public}lu", result);
        return result;
    }
    return SL_RESULT_SUCCESS;
}

// 获取播放器接口并注册回调
static SLresult SetupPlayerCallback(FILE *wavFile)
{
    SLresult result = (*pcmPlayerObject)->GetInterface(pcmPlayerObject, SL_IID_PLAY, &playItf);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "get playItf result: %{public}lu", result);
        return result;
    }
    SLVolumeItf volumeItf;
    result = (*pcmPlayerObject)->GetInterface(pcmPlayerObject, SL_IID_VOLUME, &volumeItf);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "get volumeItf result: %{public}lu", result);
        return result;
    }
    SLmillibel pLevel = 0;
    result = (*volumeItf)->GetVolumeLevel(volumeItf, &pLevel);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "GetVolumeLevel result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject)->GetInterface(
        pcmPlayerObject, SL_IID_OH_BUFFERQUEUE, &bufferQueueItf);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "get bufferQueueItf result: %{public}lu", result);
        return result;
    }
    result = (*bufferQueueItf)->RegisterCallback(bufferQueueItf, BuqqerQueueCallback, wavFile);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "RegisterCallback result: %{public}lu", result);
        return result;
    }
    return SL_RESULT_SUCCESS;
}

static SLresult OpenSlTest()
{
    OH_LOG_INFO(LOG_APP, "OpenSlTest enter");

    SLEngineItf engineEngine = nullptr;
    SLresult result = CreateEngine(&engineEngine);
    if (SL_RESULT_SUCCESS != result) {
        return result;
    }
    result = CreateOutputMix(engineEngine);
    if (SL_RESULT_SUCCESS != result) {
        return result;
    }

    SLDataFormat_PCM pcmFormat = {
        SL_DATAFORMAT_PCM, g_wavHeader.numOfChan, g_wavHeader.samplesPerSec * 1000,
        g_wavHeader.bitDepth, 0, 0, 0
    };
    result = CreatePlayer(engineEngine, &pcmFormat);
    if (SL_RESULT_SUCCESS != result) {
        return result;
    }
    result = SetupPlayerCallback(g_wavFile);
    if (SL_RESULT_SUCCESS != result) {
        return result;
    }
    result = PlayerStart(playItf, bufferQueueItf, g_wavFile);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "PlayerStart result: %{public}lu", result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "OpenSlTest return result: %{public}lu", result);
    return result;
}

// 创建两个并发播放器
static SLresult CreateConcurrentPlayers(SLEngineItf engineEngine,
    SLDataFormat_PCM *pcmFormat1, SLDataFormat_PCM *pcmFormat2)
{
    SLDataLocator_OutputMix slOutputMix = {SL_DATALOCATOR_OUTPUTMIX, outputMixObject};
    SLDataSink slSink = {&slOutputMix, nullptr};
    SLDataLocator_BufferQueue slBufferQueue = {SL_DATALOCATOR_BUFFERQUEUE, 0};
    SLDataSource slSource1 = {&slBufferQueue, pcmFormat1};
    SLDataSource slSource2 = {&slBufferQueue, pcmFormat2};

    SLresult result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject1,
        &slSource1, &slSink, AUDIO_INTERFACE_COUNT, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "CreateAudioPlayer pcmPlayerObject1 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject1)->Realize(pcmPlayerObject1, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "Realize pcmPlayerObject1 result: %{public}lu", result);
        return result;
    }

    result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject2,
        &slSource2, &slSink, AUDIO_INTERFACE_COUNT, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "CreateAudioPlayer pcmPlayerObject2 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject2)->Realize(pcmPlayerObject2, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "Realize pcmPlayerObject2 result: %{public}lu", result);
        return result;
    }
    return SL_RESULT_SUCCESS;
}

// 设置两个播放器的接口和音量
static SLresult SetupConcurrentPlayerInterfaces()
{
    SLresult result = (*pcmPlayerObject1)->GetInterface(
        pcmPlayerObject1, SL_IID_PLAY, &playItf1);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "get playItf1 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject2)->GetInterface(pcmPlayerObject2, SL_IID_PLAY, &playItf2);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "get playItf2 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject1)->GetInterface(pcmPlayerObject1, SL_IID_VOLUME, &volumeItf1);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "get volumeItf1 result: %{public}lu", result);
        return result;
    }

    SLmillibel level1 = 0;
    (*volumeItf1)->GetMaxVolumeLevel(volumeItf1, &level1);
    level1 = (SLmillibel)(level1 / VOLUME_DIVIDER_HALF);
    (*volumeItf1)->SetVolumeLevel(volumeItf1, level1);

    (*pcmPlayerObject2)->GetInterface(pcmPlayerObject2, SL_IID_VOLUME, &volumeItf2);
    SLmillibel level2 = 0;
    (*volumeItf2)->GetMaxVolumeLevel(volumeItf2, &level2);
    level2 = (SLmillibel)(level2 / VOLUME_DIVIDER_LOW);
    (*volumeItf2)->SetVolumeLevel(volumeItf2, level2);
    return SL_RESULT_SUCCESS;
}

// 设置两个播放器的缓冲队列回调
static SLresult SetupConcurrentCallbacks()
{
    SLresult result = (*pcmPlayerObject1)->GetInterface(
        pcmPlayerObject1, SL_IID_OH_BUFFERQUEUE, &bufferQueueItf1);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "get bufferQueueItf1 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject2)->GetInterface(
        pcmPlayerObject2, SL_IID_OH_BUFFERQUEUE, &bufferQueueItf2);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "get bufferQueueItf2 result: %{public}lu", result);
        return result;
    }
    result = (*bufferQueueItf1)->RegisterCallback(
        bufferQueueItf1, BuqqerQueueCallback, g_wavFile1);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "RegisterCallback1 result: %{public}lu", result);
        return result;
    }
    result = (*bufferQueueItf2)->RegisterCallback(
        bufferQueueItf2, BuqqerQueueCallback, g_wavFile2);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "RegisterCallback2 result: %{public}lu", result);
        return result;
    }
    return SL_RESULT_SUCCESS;
}

static SLresult OpenSlTestConcurrent()
{
    OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent start");

    SLEngineItf engineEngine = nullptr;
    SLresult result = CreateEngine(&engineEngine);
    if (SL_RESULT_SUCCESS != result) {
        return result;
    }
    result = CreateOutputMix(engineEngine);
    if (SL_RESULT_SUCCESS != result) {
        return result;
    }

    SLDataFormat_PCM pcmFormat1 = {
        SL_DATAFORMAT_PCM, g_wavHeader1.numOfChan, g_wavHeader1.samplesPerSec * 1000,
        g_wavHeader1.bitDepth, 0, 0, 0
    };
    SLDataFormat_PCM pcmFormat2 = {
        SL_DATAFORMAT_PCM, g_wavHeader2.numOfChan, g_wavHeader2.samplesPerSec * 1000,
        g_wavHeader2.bitDepth, 0, 0, 0
    };

    result = CreateConcurrentPlayers(engineEngine, &pcmFormat1, &pcmFormat2);
    if (SL_RESULT_SUCCESS != result) {
        return result;
    }
    result = SetupConcurrentPlayerInterfaces();
    if (SL_RESULT_SUCCESS != result) {
        return result;
    }
    result = SetupConcurrentCallbacks();
    if (SL_RESULT_SUCCESS != result) {
        return result;
    }

    result = PlayerStart(playItf1, bufferQueueItf1, g_wavFile1);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "playItf1 PlayerStart result: %{public}lu", result);
        return result;
    }
    result = PlayerStart(playItf2, bufferQueueItf2, g_wavFile2);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "playItf2 PlayerStart result: %{public}lu", result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent return result: %{public}lu", result);
    return result;
}

static void BuqqerQueueCallback(SLOHBufferQueueItf sBufferQueueItf, void *pContext, SLuint32 size)
{
    FILE *wavFile = (FILE *)pContext;
    if (!feof(wavFile)) {
        SLuint8 *buffer = nullptr;
        SLuint32 bufferSize = 0;
        SLresult result = (*sBufferQueueItf)->GetBuffer(sBufferQueueItf, &buffer, &bufferSize);
        if (SL_RESULT_SUCCESS != result) {
            OH_LOG_INFO(LOG_APP, "BuqqerQueueCallback GetBuffer result: %{public}lu", result);
            return ;
        }
        fread(buffer, 1, size, wavFile);
        result = (*sBufferQueueItf)->Enqueue(sBufferQueueItf, buffer, size);
        if (SL_RESULT_SUCCESS != result) {
            OH_LOG_INFO(LOG_APP, "BuqqerQueueCallback Enqueue result: %{public}lu", result);
            return ;
        }
    }
    return ;
}

static SLresult PlayerStart(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf, FILE *wavFile)
{
    OH_LOG_INFO(LOG_APP, "PlayerStart enter");
    SLresult result = (*sPlayItf)->SetPlayState(sPlayItf, SL_PLAYSTATE_PLAYING);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "PlayerStart SetPlayState result: %{public}lu", result);
        return result;
    }
    SLuint32 state = SL_PLAYSTATE_PLAYING;
    result = (*sPlayItf)->GetPlayState(sPlayItf, &state);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "PlayerStart GetPlayState result: %{public}lu", result);
        return result;
    }
    if (!feof(wavFile)) {
        SLuint8* buffer = nullptr;
        SLuint32 bufferSize = 0;
        result = (*sBufferQueueItf)->GetBuffer(sBufferQueueItf, &buffer, &bufferSize);
        if (SL_RESULT_SUCCESS != result) {
            OH_LOG_INFO(LOG_APP, "PlayerStart GetBuffer result: %{public}lu", result);
            return result;
        }
        fread(buffer, 1, bufferSize, wavFile);
        result = (*sBufferQueueItf)->Enqueue(sBufferQueueItf, buffer, bufferSize);
        if (SL_RESULT_SUCCESS != result) {
            OH_LOG_INFO(LOG_APP, "PlayerStart Enqueue result: %{public}lu", result);
            return result;
        }
    }
    OH_LOG_INFO(LOG_APP, "PlayerStart return  result: %{public}lu", result);
    return result;
}

static SLresult PlayerStop(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf)
{
    OH_LOG_INFO(LOG_APP, "PlayerStop enetr");

    SLresult result = (*sPlayItf)->SetPlayState(sPlayItf, SL_PLAYSTATE_STOPPED);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "PlayerStop SetPlayState result: %{public}lu", result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "PlayerStop return  result: %{public}lu", result);
    return result;
}
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100()
{
    // 重新初始化 wavHeader，确保使用默认值
    g_wavHeader1 = WavHdr();
    g_wavHeader2 = WavHdr();
    
    size_t headerSize = sizeof(WavHdr);
    char path[PATH_MAX] = {0x00};
    if ((strlen(READPATH1) >= PATH_MAX) || (realpath(READPATH1, path) == nullptr)) {
        OH_LOG_ERROR(LOG_APP, "Invalid path");
        return -1;
    }
    g_wavFile1 = fopen(path, "rb");
    if (g_wavFile1 == nullptr) {
        OH_LOG_ERROR(LOG_APP, "AudioRendererTest: Unable to open wave file");
        return -1;
    }

    headerSize = sizeof(WavHdr);
    if ((strlen(READPATH2) >= PATH_MAX) || (realpath(READPATH2, path) == nullptr)) {
        OH_LOG_ERROR(LOG_APP, "Invalid path");
        return -1;
    }
    g_wavFile2 = fopen(path, "rb");
    if (g_wavFile2 == nullptr) {
        OH_LOG_ERROR(LOG_APP, "AudioRendererTest: Unable to open wave file");
        return -1;
    }

    SLresult result = OpenSlTestConcurrent();
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }
    // 最大播放时间，避免无限等待
    int maxWaitTime = MAX_PLAY_WAIT_TIME_LONG;
    int waitCount = 0;
    while ((!feof(g_wavFile1) || !feof(g_wavFile2)) && waitCount < maxWaitTime) {
        sleep(1);
        waitCount++;
    }
    result = PlayerStop(playItf1, bufferQueueItf1);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    result = PlayerStop(playItf2, bufferQueueItf2);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }
    (*pcmPlayerObject1)->Destroy(pcmPlayerObject1);
    (*pcmPlayerObject2)->Destroy(pcmPlayerObject2);
    (*outputMixObject)->Destroy(outputMixObject);
    (*engineObject)->Destroy(engineObject);
    return 0;
}

// 打开音频文件
static int OpenAudioFile(const char* filePath, FILE **wavFile)
{
    char path[PATH_MAX] = {0x00};
    if ((strlen(filePath) >= PATH_MAX) || (realpath(filePath, path) == nullptr)) {
        OH_LOG_ERROR(LOG_APP, "Invalid path");
        return -1;
    }
    *wavFile = fopen(path, "rb");
    if (*wavFile == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Unable to open wave file");
        return -1;
    }
    return 0;
}

// 播放并等待完成
static int PlayAndWait(int maxWaitTime)
{
    int waitCount = 0;
    while (!feof(g_wavFile) && waitCount < maxWaitTime) {
        sleep(1);
        waitCount++;
    }
    SLresult result = PlayerStop(playItf, bufferQueueItf);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }
    return 0;
}

// 销毁播放器资源
static void DestroyPlayerResources()
{
    (*pcmPlayerObject)->Destroy(pcmPlayerObject);
    (*outputMixObject)->Destroy(outputMixObject);
    (*engineObject)->Destroy(engineObject);
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200()
{
    g_wavHeader = WavHdr();

    // 第一次播放
    if (OpenAudioFile(READPATH1, &g_wavFile) != 0) {
        return -1;
    }
    SLresult result = OpenSlTest();
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }
    if (PlayAndWait(MAX_PLAY_WAIT_TIME_MEDIUM) != 0) {
        return -1;
    }
    DestroyPlayerResources();

    // 第二次播放
    if (OpenAudioFile(READPATH2, &g_wavFile) != 0) {
        return -1;
    }
    result = OpenSlTest();
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }
    if (PlayAndWait(MAX_PLAY_WAIT_TIME_SHORT) != 0) {
        return -1;
    }
    DestroyPlayerResources();
    return 0;
}

// 测试引擎不支持的设备创建接口
static int TestEngineCreateDevices(SLEngineItf engineEngine)
{
    SLresult result1 = (*engineEngine)->CreateLEDDevice(
        engineEngine, nullptr, 0, 0, nullptr, nullptr);
    if (result1 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result2 = (*engineEngine)->CreateVibraDevice(
        engineEngine, nullptr, 0, 0, nullptr, nullptr);
    if (result2 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result4 = (*engineEngine)->CreateListener(
        engineEngine, nullptr, 0, nullptr, nullptr);
    if (result4 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result5 = (*engineEngine)->Create3DGroup(
        engineEngine, nullptr, 0, nullptr, nullptr);
    if (result5 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result6 = (*engineEngine)->CreateMetadataExtractor(
        engineEngine, nullptr, nullptr, 0, nullptr, nullptr);
    if (result6 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result7 = (*engineEngine)->CreateExtensionObject(
        engineEngine, nullptr, nullptr, 0, 0, nullptr, nullptr);
    if (result7 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    return 0;
}

// 测试引擎不支持的查询接口
static int TestEngineQueryInterfaces(SLEngineItf engineEngine)
{
    SLresult result8 = (*engineEngine)->QueryNumSupportedInterfaces(
        engineEngine, 0, nullptr);
    if (result8 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result9 = (*engineEngine)->QuerySupportedInterfaces(
        engineEngine, 0, 0, nullptr);
    if (result9 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result10 = (*engineEngine)->QueryNumSupportedExtensions(
        engineEngine, nullptr);
    if (result10 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result11 = (*engineEngine)->QuerySupportedExtension(
        engineEngine, 0, nullptr, nullptr);
    if (result11 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result12 = (*engineEngine)->IsExtensionSupported(
        engineEngine, nullptr, nullptr);
    if (result12 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100()
{
    SLEngineItf engineEngine = nullptr;
    engineObject = nullptr;
    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }
    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, &engineEngine);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    if (TestEngineCreateDevices(engineEngine) != 0) {
        return -1;
    }
    if (TestEngineQueryInterfaces(engineEngine) != 0) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200()
{
    SLObjectItf engineObject_;
    SLresult result = slCreateEngine(&engineObject_, 0, nullptr, 0, nullptr, nullptr);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    SLresult result1 = (*engineObject_)->RegisterCallback(engineObject_, nullptr, nullptr);
    if (result1 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    (*engineObject_)->AbortAsyncOperation(engineObject_);

    SLresult result2 = (*engineObject_)->SetPriority(engineObject_, 0, SL_BOOLEAN_FALSE);
    if (result2 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result3 = (*engineObject_)->GetPriority(engineObject_, nullptr, nullptr);
    if (result3 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result4 = (*engineObject_)->SetLossOfControlInterfaces(engineObject_, 0, nullptr, false);
    if (result4 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    return 0;
}

// 初始化测试用播放器
static int InitTestPlayer(SLEngineItf *engineEngine)
{
    engineObject = nullptr;
    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }
    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, engineEngine);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    pcmPlayerObject = nullptr;
    SLDataLocator_OutputMix slOutputMix = {SL_DATALOCATOR_OUTPUTMIX, outputMixObject};
    SLDataSink slSink = {&slOutputMix, nullptr};
    SLDataLocator_BufferQueue slBufferQueue = {SL_DATALOCATOR_BUFFERQUEUE, 0};
    SLDataFormat_PCM pcmFormat = {
        SL_DATAFORMAT_PCM, g_wavHeader.numOfChan, g_wavHeader.samplesPerSec * 1000,
        g_wavHeader.bitDepth, 0, 0, 0};
    SLDataSource slSource = {&slBufferQueue, &pcmFormat};
    result = (*(*engineEngine))->CreateAudioPlayer(*engineEngine, &pcmPlayerObject,
        &slSource, &slSink, AUDIO_INTERFACE_COUNT, nullptr, nullptr);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }
    return 0;
}

// 测试PlayItf不支持的接口
static int TestPlayItfUnsupported(SLPlayItf sPlayItf)
{
    SLresult result1 = (*sPlayItf)->GetDuration(sPlayItf, nullptr);
    if (result1 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result2 = (*sPlayItf)->GetPositionUpdatePeriod(sPlayItf, nullptr);
    if (result2 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result3 = (*sPlayItf)->RegisterCallback(sPlayItf, nullptr, nullptr);
    if (result3 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result4 = (*sPlayItf)->SetCallbackEventsMask(sPlayItf, 0);
    if (result4 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result5 = (*sPlayItf)->GetCallbackEventsMask(sPlayItf, 0);
    if (result5 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result6 = (*sPlayItf)->SetMarkerPosition(sPlayItf, 0);
    if (result6 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result7 = (*sPlayItf)->GetMarkerPosition(sPlayItf, nullptr);
    if (result7 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result8 = (*sPlayItf)->SetPositionUpdatePeriod(sPlayItf, 0);
    if (result8 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result9 = (*sPlayItf)->ClearMarkerPosition(sPlayItf);
    if (result9 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result10 = (*sPlayItf)->GetPosition(sPlayItf, nullptr);
    if (result10 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300()
{
    SLEngineItf engineEngine = nullptr;
    if (InitTestPlayer(&engineEngine) != 0) {
        return -1;
    }

    playItf = nullptr;
    SLresult result = (*pcmPlayerObject)->GetInterface(
        pcmPlayerObject, SL_IID_PLAY, &playItf);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    return TestPlayItfUnsupported(playItf);
}

// 测试VolumeItf不支持的接口
static int TestVolumeItfUnsupported(SLVolumeItf sVolumeItf)
{
    SLresult result1 = (*sVolumeItf)->SetMute(sVolumeItf, SL_BOOLEAN_FALSE);
    if (result1 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result2 = (*sVolumeItf)->GetMute(sVolumeItf, nullptr);
    if (result2 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result3 = (*sVolumeItf)->EnableStereoPosition(sVolumeItf, SL_BOOLEAN_FALSE);
    if (result3 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result4 = (*sVolumeItf)->IsEnabledStereoPosition(sVolumeItf, nullptr);
    if (result4 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result5 = (*sVolumeItf)->SetStereoPosition(sVolumeItf, 0);
    if (result5 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    SLresult result6 = (*sVolumeItf)->GetStereoPosition(sVolumeItf, nullptr);
    if (result6 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400()
{
    SLEngineItf engineEngine = nullptr;
    if (InitTestPlayer(&engineEngine) != 0) {
        return -1;
    }

    SLVolumeItf volumeItf = nullptr;
    SLresult result = (*pcmPlayerObject)->GetInterface(
        pcmPlayerObject, SL_IID_VOLUME, &volumeItf);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    return TestVolumeItfUnsupported(volumeItf);
}