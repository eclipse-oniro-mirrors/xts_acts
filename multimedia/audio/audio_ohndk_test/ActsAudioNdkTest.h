/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#ifndef ACTS_OH_AUDIO_NDK_TEST_H
#define ACTS_OH_AUDIO_NDK_TEST_H

#include "gtest/gtest.h"
#include "native_audiostreambuilder.h"
#include "native_audiocapturer.h"

constexpr int32_t SAMPLE_RATE_48000 = 48000;
constexpr int32_t CHANNEL_2 = 2;

namespace OHOS {
namespace AudioStandard {
class ActsAudioNdkTest : public testing::Test {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);
    // create a capturer type builder
    static OH_AudioStreamBuilder* CreateCapturerBuilder();
    // create a renderer type builder
    static OH_AudioStreamBuilder* CreateRenderBuilder();
};

class OHAudioCapturerReadCallbackMock {
public:
    void OnReadData(OH_AudioCapturer* capturer, void* userData,
    void* buffer,
    int32_t bufferLen)
    {
        exeCount_++;
        if (executor_) {
            executor_(capturer, userData, buffer, bufferLen);
        }
    }

    void Install(std::function<void(OH_AudioCapturer*, void*, void*, int32_t)> executor)
    {
        executor_ = executor;
    }

    uint32_t GetExeCount()
    {
        return exeCount_;
    }
private:
    std::function<void(OH_AudioCapturer*, void*, void*, int32_t)> executor_;
    std::atomic<uint32_t> exeCount_ = 0;
};

class OHAudioRendererWriteCallbackMock {
public:
    void OnWriteData(OH_AudioRenderer* renderer, void* userData,
    void* buffer,
    int32_t bufferLen)
    {
        exeCount_++;
        if (executor_) {
            executor_(renderer, userData, buffer, bufferLen);
        }
    }

    void Install(std::function<void(OH_AudioRenderer*, void*, void*, int32_t)> executor)
    {
        executor_ = executor;
    }

    uint32_t GetExeCount()
    {
        return exeCount_;
    }
private:
    std::function<void(OH_AudioRenderer*, void*, void*, int32_t)> executor_;
    std::atomic<uint32_t> exeCount_ = 0;
};
} // namespace AudioStandard
} // namespace OHOS

#endif // ACTS_OH_AUDIO_NDK_TEST_H