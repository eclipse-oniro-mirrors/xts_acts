/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef RENDER_HELPER_TEST_H
#define RENDER_HELPER_TEST_H

#include <atomic>
#include <condition_variable>
#include <functional>
#include <mutex>
#include <ohaudio/native_audiorenderer.h>

namespace Acts {
namespace AudioRender {

// 全局标记变量（用于回调）
extern uint32_t g_flag;

// Callback synchronization context structure
struct CallbackSyncContext {
    int32_t& count;
    std::mutex& mutex;
    std::condition_variable& cv;

    CallbackSyncContext(int32_t& c, std::mutex& m, std::condition_variable& cvRef);
};

// Mock class for write callback
class OHAudioRendererWriteCallbackMock {
public:
    void OnWriteData(OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen);
    void Install(std::function<void(OH_AudioRenderer*, void*, void*, int32_t)> executor);
    uint32_t GetExeCount();

private:
    std::function<void(OH_AudioRenderer*, void*, void*, int32_t)> executor_;
    std::atomic<uint32_t> exeCount_{ 0 };
};

// User data structure for callback type tracking
struct UserData {
    enum { WRITE_DATA_CALLBACK, WRITE_DATA_CALLBACK_WITH_RESULT } writeDataCallbackType;
};

// Helper callback functions
int32_t AudioRendererOnWriteData(OH_AudioRenderer* capturer, void* userData, void* buffer, int32_t bufferLen);
void AudioRendererOnMarkReachedCb(OH_AudioRenderer* renderer, uint32_t samplePos, void* userData);
int32_t AudioRendererOnWriteDataMock(OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen);
OH_AudioData_Callback_Result OnWriteDataCallbackWithValidData(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen);
OH_AudioData_Callback_Result OnWriteDataCallbackWithInvalidData(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen);
int32_t OnWriteDataCbMock(OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen);
OH_AudioData_Callback_Result OnWriteDataCbWithValidDataMock(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen);
OH_AudioData_Callback_Result OnWriteDataCbWithInvalidDataMock(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen);

// Device detection helper
bool GetCurrentDeviceIsTV();

// Builder helpers
OH_AudioStreamBuilder* CreateRenderBuilder();
OH_AudioStreamBuilder* InitRenderBuilder();

// Resource cleanup helper
void CleanupAudioResources(OH_AudioStreamBuilder* builder, OH_AudioRenderer* audioRenderer);

// Loudness gain test helper
int TestLoudnessGainSetAndGet(OH_AudioRenderer* audioRenderer, float gainValue);

} // namespace AudioRender
} // namespace Acts

#endif // RENDER_HELPER_TEST_H
