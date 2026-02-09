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

#ifndef VIDEOENC_SAMPLE_H
#define VIDEOENC_SAMPLE_H

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
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include "nocopyable.h"
#include <multimedia/player_framework/native_avmemory.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_averrors.h>
#include <native_window/external_window.h>
namespace OHOS {
namespace Media {
class VEncSignal {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::mutex flushMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::queue<uint32_t> inIdxQueue_;
    std::queue<uint32_t> outIdxQueue_;
    std::queue<OH_AVCodecBufferAttr> attrQueue_;
    std::queue<OH_AVMemory *> inBufferQueue_;
    std::queue<OH_AVMemory *> outBufferQueue_;
};

class VEncNdkSample : public NoCopyable {
public:
    VEncNdkSample() = default;
    ~VEncNdkSample();
    const char *INP_DIR = "/data/test/media/1280_720_nv.yuv";
    const char *OUT_DIR = "/data/test/media/VEncTest.h264";
    uint32_t DEFAULT_WIDTH = 1280;
    uint32_t DEFAULT_HEIGHT = 720;
    uint32_t DEFAULT_BITRATE = 5000000;
    uint32_t DEFAULT_QUALITY = 30;
    double DEFAULT_FRAME_RATE = 30.0;
    uint32_t DEFAULT_FUZZ_TIME = 30;
    uint32_t DEFAULT_BITRATE_MODE = CBR;
    uint32_t DEFAULT_RANGE_FLAG = 0;
    OH_AVPixelFormat DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    uint32_t DEFAULT_KEY_FRAME_INTERVAL = 1000;
    uint32_t repeat_time = 0;
    int32_t CreateVideoEncoder(const char *codecName);
    int32_t ConfigureVideoEncoder();
    int32_t ConfigureVideoEncoder_Temporal(int32_t temporal_gop_size);
    int32_t ConfigureVideoEncoder_fuzz(int32_t data);
    int32_t SetVideoEncoderCallback();
    int32_t CreateSurface();
    int32_t StartVideoEncoder();
    int32_t SetParameter(OH_AVFormat *format);
    void SetForceIDR();
    void GetStride();
    void testApi();
    void WaitForEOS();
    int32_t OpenFile();
    uint32_t ReturnZeroIfEOS(uint32_t expectedSize);
    int64_t GetSystemTimeUs();
    int32_t Start();
    int32_t Flush();
    int32_t Reset();
    int32_t Stop();
    int32_t Release();
    void Flush_buffer();
    void AutoSwitchParam();
    void RepeatStartBeforeEOS();
    bool RandomEOS(uint32_t index);
    void SetEOS(uint32_t index);
    int32_t PushData(OH_AVMemory *buffer, uint32_t index, int32_t &result);
    void InputDataNormal(bool &runningFlag, uint32_t index, OH_AVMemory *buffer);
    void InputDataFuzz(bool &runningFlag, uint32_t index);
    int32_t CheckResult(bool isRandomEosSuccess, int32_t pushResult);
    void InputFunc();
    int32_t state_EOS();
    void InputFuncSurface();
    uint32_t ReadOneFrameYUV420SP(uint8_t *dst);
    void ReadOneFrameRGBA8888(uint8_t *dst);
    int32_t CheckAttrFlag(OH_AVCodecBufferAttr attr);
    void OutputFuncFail();
    void OutputFunc();
    uint32_t FlushSurf(OHNativeWindowBuffer *ohNativeWindowBuffer, OH_NativeBuffer *nativeBuffer);
    void ReleaseSignal();
    void ReleaseInFile();
    void StopInloop();
    void StopOutloop();

    VEncSignal *signal_;
    uint32_t errCount = 0;
    bool enableForceIDR = false;
    uint32_t outCount = 0;
    uint32_t frameCount = 0;
    uint32_t switchParamsTimeSec = 3;
    bool sleepOnFPS = false;
    bool SURF_INPUT = false;
    bool enableAutoSwitchParam = false;
    bool needResetBitrate = false;
    bool needResetFrameRate = false;
    bool needResetQP = false;
    bool repeatRun = false;
    bool showLog = false;
    bool fuzzMode = false;
    bool inputCallbackFlush = false;
    bool inputCallbackStop = false;
    bool outputCallbackFlush = false;
    bool outputCallbackStop = false;
    int64_t encode_count = 0;
    bool enable_random_eos = false;
    uint32_t REPEAT_START_STOP_BEFORE_EOS = 0;  // 1200 测试用例
    uint32_t REPEAT_START_FLUSH_BEFORE_EOS = 0; // 1300 测试用例
    int64_t start_time = 0;
    int64_t end_time = 0;
    uint32_t randomEos = 0;
    bool TEMPORAL_CONFIG = false;
    bool TEMPORAL_ENABLE = false;
    bool TEMPORAL_JUMP_MODE = false;
    bool TEMPORAL_DEFAULT = false;

    std::atomic<bool> isRunning_ { false };
    std::atomic<bool> isFlushing_ { false };
private:
    std::unique_ptr<std::ifstream> inFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    std::unordered_map<uint32_t, OH_AVMemory *> inBufferMap_;
    std::unordered_map<uint32_t, OH_AVMemory *> outBufferMap_;
    OH_AVCodec *venc_;
    OH_AVCodecAsyncCallback cb_;
    int64_t timeStamp_ { 0 };
    int64_t lastRenderedTimeUs_ { 0 };
    bool isFirstFrame_ = true;
    OHNativeWindow *nativeWindow;
    int stride_;
    static constexpr uint32_t SAMPLE_RATIO = 2;
};
} // namespace Media
} // namespace OHOS

#endif // VIDEODEC_SAMPLE_H
