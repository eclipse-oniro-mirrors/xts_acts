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

#ifndef VIDEOENC_NDK_INNER_SAMPLE_H
#define VIDEOENC_NDK_INNER_SAMPLE_H

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
#include "securec.h"
#include "avcodec_video_encoder.h"
#include "nocopyable.h"
#include "buffer/avsharedmemory.h"
#include "meta/format.h"
#include "avcodec_errors.h"
#include "surface/window.h"
#include "media_description.h"
#include "av_common.h"
#include "avcodec_common.h"
#include "external_window.h"

namespace OHOS {
namespace MediaAVCodec {
class VEncInnerSignal {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::queue<uint32_t> inIdxQueue_;
    std::queue<uint32_t> outIdxQueue_;
    std::queue<AVCodecBufferInfo> infoQueue_;
    std::queue<AVCodecBufferFlag> flagQueue_;
    std::queue<std::shared_ptr<AVSharedMemory>> inBufferQueue_;
    std::queue<std::shared_ptr<AVSharedMemory>> outBufferQueue_;
};

class VEncInnerCallback : public AVCodecCallback, public NoCopyable {
public:
    explicit VEncInnerCallback(std::shared_ptr<VEncInnerSignal> signal);
    ~VEncInnerCallback() = default;

    void OnError(AVCodecErrorType errorType, int32_t errorCode) override;
    void OnOutputFormatChanged(const Format& format) override;
    void OnInputBufferAvailable(uint32_t index, std::shared_ptr<AVSharedMemory> buffer) override;
    void OnOutputBufferAvailable(uint32_t index, AVCodecBufferInfo info, AVCodecBufferFlag flag,
        std::shared_ptr<AVSharedMemory> buffer) override;

private:
    std::shared_ptr<VEncInnerSignal> innersignal_;
};

class VEncNdkInnerSample : public NoCopyable {
public:
    VEncNdkInnerSample() = default;
    ~VEncNdkInnerSample();
    
    int64_t GetSystemTimeUs();
    int32_t CreateByMime(const std::string &mime);
    int32_t CreateByName(const std::string &name);
    int32_t Configure();
    int32_t ConfigureFuzz(int32_t data);
    int32_t Prepare();
    int32_t Start();
    int32_t Stop();
    int32_t Flush();
    int32_t NotifyEos();
    int32_t Reset();
    int32_t Release();
    int32_t CreateInputSurface();
    int32_t QueueInputBuffer(uint32_t index, AVCodecBufferInfo info, AVCodecBufferFlag flag);
    int32_t GetOutputFormat(Format &format);
    int32_t ReleaseOutputBuffer(uint32_t index);
    int32_t SetParameter(const Format &format);
    int32_t SetCallback();
    int32_t GetInputFormat(Format &format);

    int32_t StartVideoEncoder();
    int32_t testApi();
    int32_t PushData(std::shared_ptr<AVSharedMemory> buffer, uint32_t index, int32_t &result);
    int32_t OpenFileFail();
    int32_t CheckResult(bool isRandomEosSuccess, int32_t pushResult);
    int32_t CheckFlag(AVCodecBufferFlag flag);
    int32_t InputProcess(OH_NativeBuffer *nativeBuffer, OHNativeWindowBuffer *ohNativeWindowBuffer);
    int32_t StateEOS();
    uint32_t ReturnZeroIfEOS(uint32_t expectedSize);
    uint32_t ReadOneFrameYUV420SP(uint8_t *dst);
    bool RandomEOS(uint32_t index);
    void RepeatStartBeforeEOS();
    void SetEOS(uint32_t index);
    void WaitForEOS();
    void InputFuncSurface();
    void InputFunc();
    void OutputFunc();
    void OutputFuncFail();
    void FlushBuffer();
    void StopInloop();
    void StopOutloop();
    void ReleaseInFile();

    const char *INP_DIR = "/data/test/media/1280_720_nv.yuv";
    const char *OUT_DIR = "/data/test/media/VEncTest.h264";
    uint32_t DEFAULT_WIDTH = 1280;
    uint32_t DEFAULT_HEIGHT = 720;
    uint32_t DEFAULT_BITRATE = 10000000;
    double DEFAULT_FRAME_RATE = 30.0;
    uint32_t DEFAULT_KEY_FRAME_INTERVAL = 1000;
    uint32_t REPEAT_START_STOP_BEFORE_EOS = 0;  // 1200 测试用例
    uint32_t REPEAT_START_FLUSH_BEFORE_EOS = 0; // 1300 测试用例
    
    uint32_t errCount = 0;
    uint32_t outCount = 0;
    uint32_t frameCount = 0;
    bool enableForceIDR = false;
    bool sleepOnFPS = false;
    bool surfaceInput = false;
    bool repeatRun = false;
    bool enableRandomEos = false;
    int64_t encodeCount = 0;
    
private:
    std::atomic<bool> isRunning_ { false };
    std::unique_ptr<std::ifstream> inFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    std::shared_ptr<AVCodecVideoEncoder> venc_;
    std::shared_ptr<VEncInnerSignal> signal_;
    std::shared_ptr<VEncInnerCallback> cb_;
    int stride_;
    OHNativeWindow *nativeWindow;
    static constexpr uint32_t SAMPLE_RATIO = 2;
};
} // namespace MediaAVCodec
} // namespace OHOS

#endif // VIDEODEC_NDK_INNER_SAMPLE_H
