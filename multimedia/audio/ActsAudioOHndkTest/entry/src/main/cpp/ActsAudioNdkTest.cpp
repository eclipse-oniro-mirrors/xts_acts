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

#include <mutex>
#include <chrono>
#include <thread>
#include "ActsAudioNdkTest.h"
#include "hilog/log.h"

using namespace std::chrono;

namespace OHOS {
namespace AudioStandard {

static int32_t AudioRendererOnWriteData(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    OHAudioRendererWriteCallbackMock *mockPtr = static_cast<OHAudioRendererWriteCallbackMock*>(userData);
    mockPtr->OnWriteData(renderer, userData, buffer, bufferLen);

    return 0;
}

OH_AudioStreamBuilder* CreateRenderBuilder()
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    return builder;
}

static void SetupWriteCallback(OHAudioRendererWriteCallbackMock& writeCallbackMock,
    int32_t& count, std::mutex& mutex, std::condition_variable& cv)
{
    writeCallbackMock.Install([&count, &mutex, &cv](OH_AudioRenderer* renderer, void* userData,
        void* buffer, int32_t bufferLen) {
        std::lock_guard<std::mutex> lock(mutex);
        cv.notify_one();
        // only execute twice
        if (count > 1) {
            return;
        }
        // sleep time trigger underflow
        if (count == 1) {
            std::this_thread::sleep_for(200ms);
        }
        count++;
    });
}

static OH_AudioRenderer* CreateAndConfigureRenderer(
    OH_AudioStreamBuilder* builder, OHAudioRendererWriteCallbackMock& writeCallbackMock)
{
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLE_RATE_48000);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_2);
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_VOICE_COMMUNICATION;
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &writeCallbackMock);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return nullptr;
    }
    return audioRenderer;
}

/**
 * @tc.name   SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_GetUnderflowCount_0100
 * @tc.number SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_GetUnderflowCount_0100
 * @tc.desc   Test OH_AudioRenderer_GetUnderflowCount interface.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SumMultimediaAudioOhAudioRendererGetUnderflowCount0100()
{
    OH_LOG_ERROR(LOG_APP, "audio native start");
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();

    OHAudioRendererWriteCallbackMock writeCallbackMock;
    OH_AudioRenderer* audioRenderer = CreateAndConfigureRenderer(builder, writeCallbackMock);
    if (audioRenderer == nullptr) {
        return -1;
    }

    std::mutex mutex;
    std::condition_variable cv;
    int32_t count = 0;
    SetupWriteCallback(writeCallbackMock, count, mutex, cv);

    OH_AudioStream_Result result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    std::unique_lock<std::mutex> lock(mutex);
    cv.wait_for(lock, 1s, [&count] {
        // count > 1 ensure sleeped
        return count > 1;
    });
    lock.unlock();

    uint32_t underFlowCount;
    result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (underFlowCount < 0) {
        return -1;
    }

    OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);

    return 0;
}
} // namespace AudioStandard
} // namespace OHOS