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

#ifndef HDRCODEC_SAMPLE_H
#define HDRCODEC_SAMPLE_H

#include <iostream>
#include <cstdio>
#include <unistd.h>
#include <atomic>
#include <fstream>
#include <thread>
#include <mutex>
#include <queue>
#include <string>
#include <unordered_map>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include "nocopyable.h"
#include <multimedia/player_framework/native_avmemory.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_averrors.h>

namespace OHOS {
namespace Media {
class VSignal {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::queue<uint32_t> inIdxQueue_;
    std::queue<uint32_t> outIdxQueue_;
    std::queue<OH_AVCodecBufferAttr> attrQueue_;
    std::queue<OH_AVMemory *> inBufferQueue_;
    std::queue<OH_AVMemory *> outBufferQueue_;
};

class HDRCodecNdkSample : public NoCopyable {
public:
    HDRCodecNdkSample() = default;
    ~HDRCodecNdkSample();
    int32_t CreateCodec();
    int32_t Configure();
    int32_t Start();
    int32_t Release();
    void WaitForEos();
    void ReleaseInFile();
    void StopInloop();
    void InputFunc();
    void FlushBuffer();
    void SwitchInputFile();
    int32_t ReConfigure();
    int32_t RepeatCall();
    std::string INP_DIR = "/data/test/media/1920_1080_10_30Mb.h264";
    bool needEncode = false;
    bool needTransCode = false;
    uint32_t DEFAULT_WIDTH = 3840;
    uint32_t DEFAULT_HEIGHT = 2160;
    double DEFAULT_FRAME_RATE = 30.0;

    uint32_t REPEAT_START_STOP_BEFORE_EOS = 0;
    uint32_t REPEAT_START_FLUSH_BEFORE_EOS = 0;
    uint32_t REPEAT_START_FLUSH_STOP_BEFORE_EOS = 0;
    uint32_t frameCount_ = 0;
    uint32_t repeat_time = 0;
    uint32_t frameCountDec = 0;
    uint32_t frameCountEnc = 0;
    int32_t DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
    bool needOutputFile;
    VSignal *decSignal;
    std::unique_ptr<std::thread> inputLoop_;
    OH_AVCodec *vdec_;
    OH_AVCodec *venc_;
    uint32_t errorCount = 0;
    bool timedOut = false;
    std::mutex mtx;
    std::condition_variable cv_;
    std::atomic<bool> isRunning_{false};
    // File state — public so static helper SendData can access them directly.
    std::shared_ptr<std::ifstream> inFile_;
    bool isFirstFrame_ = true;
private:
    OHNativeWindow *window = nullptr;
    OH_AVCodecAsyncCallback encCb_;
    OH_AVCodecAsyncCallback decCb_;
};
} // namespace Media
} // namespace OHOS

#endif
