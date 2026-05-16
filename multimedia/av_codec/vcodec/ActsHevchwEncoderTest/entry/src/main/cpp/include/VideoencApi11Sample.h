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

#ifndef VIDEOENC_API11_SAMPLE_H
#define VIDEOENC_API11_SAMPLE_H

#include <iostream>
#include <cstdio>
#include <unistd.h>
#include <atomic>
#include <fstream>
#include <thread>
#include <mutex>
#include <queue>
#include <string>
#include "include/NoCopyable.h"
#include <unordered_map>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <native_window/external_window.h>
namespace OHOS {
namespace Media {

class VEncAPI11Signal {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::queue<uint32_t> inIdxQueue_;
    std::queue<uint32_t> outIdxQueue_;
    std::queue<OH_AVBuffer *> inBufferQueue_;
    std::queue<OH_AVBuffer *> outBufferQueue_;
};

class VEncAPI11Sample : public NoCopyable {
public:
    VEncAPI11Sample() = default;
    ~VEncAPI11Sample();
    const char *inpDir = "/data/storage/el2/base/files/1280_720_nv.yuv";
    const char *outDir = "/data/storage/el2/base/files/VEncTest.h265";
    const char *roiInfo = "0,0-128,64=-4;100,200-300,400=3";
    uint32_t defaultWidth = 1280;
    uint32_t defaultHeight = 720;
    uint64_t defaultBitrate = 5000000;
    uint64_t defaultMaxBitrate = 8000000;
    uint32_t defaultQuality = 30;
    uint32_t defaultSqrFactor = 28;
    double defaultFrameRate = 30.0;
    uint32_t defaultQualityRun = 28;
    uint64_t defaultBitrateRun = 6000000;
    uint64_t defaultSqrFactorRun = 30;
    uint32_t defaultFrameRateRun = 30;
    uint64_t defaultMaxBitrateRun =  50000000;
    uint32_t defaultIntervalRun = 1000;
    uint32_t defaultBitrateModeRun = CBR;
    uint32_t defaultBframe = 1;
    uint32_t defaultMaxBFrames = 3;
    bool setbirate = false;
    bool modeEnable = false;
    bool qualityEnable = false;
    bool factorEnable = false;
    bool maxbiteEnable = false;
    bool bEnable = false;
    bool qualityEnableRun = false;
    bool setbirateRun = false;
    bool factorEnableRun = false;
    bool maxbiteEnableRun = false;
    bool iframeEnableRun = false;
    bool framerateEnableRun = false;
    bool modeEnableRun = false;
    bool enablePTSBasedRateControl = false;
    bool maxbframesEnable = false;
    bool enableRepeat = false;
    bool enableSeekEos = false;
    bool setMaxCount = false;
    uint32_t inCount = 0;
    uint32_t defaultBitrateMode = CBR;
    OH_AVPixelFormat DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    uint32_t defaultKeyFrameInterval = 1000;
    std::vector<time_t> timeList;
    int32_t CreateVideoEncoder(const char *codecName);
    int32_t ConfigureVideoEncoder();
    int32_t ConfigureVideoEncoderSqr();
    int32_t SetVideoEncoderCallback();
    int32_t CreateSurface();
    int32_t StartVideoEncoder();
    int32_t SetParameter();
    void GetStride();
    void WaitForEOS();
    int32_t OpenFile();
    uint32_t ReturnZeroIfEOS(uint32_t expectedSize);
    int64_t GetSystemTimeUs();
    int32_t Start();
    int32_t Flush();
    int32_t Reset();
    int32_t Stop();
    int32_t Release();
    void FlushBuffer();
    void RepeatStartBeforeEOS();
    bool RandomEOS(uint32_t index);
    void SetEOS(uint32_t index, OH_AVBuffer *buffer);
    int32_t PushData(OH_AVBuffer *buffer, uint32_t index, int32_t &result);
    int32_t CheckResult(bool isRandomEosSuccess, int32_t pushResult);
    void InputFunc();
    void InputFuncSurface();
    uint32_t ReadOneFrameYUV420SP(uint8_t *dst);
    uint32_t ReadOneFrameRGBA8888(uint8_t *dst);
    int32_t OpenFileFail();
    int32_t CheckAttrFlag(OH_AVCodecBufferAttr attr);
    void OutputFuncFail();
    void OutputFunc();
    uint32_t FlushSurf(OHNativeWindowBuffer *ohNativeWindowBuffer, OH_NativeBuffer *nativeBuffer);
    void ReleaseSignal();
    void ReleaseInFile();
    void StopInloop();
    void StopOutloop();
    int32_t ReadMultiFilesFunc();
    int32_t GetBframes(OH_AVFormat *format);
    int32_t InitBuffer(OHNativeWindowBuffer *&ohNativeWindowBuffer, OH_NativeBuffer *&nativeBuffer, uint8_t *&dst);
    void InputEnableRepeatSleep();
    struct EncoderConfig {
        uint32_t width = 0;             // 视频宽度（默认值）
        uint32_t height = 0;            // 视频高度（默认值）
        uint32_t bitrateMode = 0;       // 码率模式（默认值）
        uint32_t bitRate = 0;           // 码率值（默认值）
        bool surfaceMode = false;       // 表面模式（默认值）
    };
    int32_t LoadTimeStampData(std::string filePath, EncoderConfig &config);
    VEncAPI11Signal *signal_;
    uint32_t errCount = 0;
    uint32_t outCount = 0;
    uint32_t frameCount = 0;
    bool sleepOnFPS = false;
    bool surfInput = false;
    bool repeatRun = false;
    bool enableParameter = false;
    int64_t encodeCount = 0;
    bool enableRandomEos = false;
    uint32_t repeatStartStopBeforeEos = 0;
    uint32_t repeatStartFlushBeforeEos = 0;
    int64_t frameIndex = 0;
    bool readMultiFiles = false;
    bool configMain10 = false;
    bool isParamSet = false;
    bool enableRoi = false;
    uint32_t frameCount1 = 0;
private:
    std::atomic<bool> isRunning_ { false };
    std::unique_ptr<std::ifstream> inFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    OH_AVCodecCallback cb_;
    OH_AVCodec *venc_;
    OHNativeWindow *nativeWindow;
    int stride_;
    static constexpr uint32_t sampleRatio = 2;
};
} // namespace Media
} // namespace OHOS
extern bool g_flagValue;
#endif // VIDEOENC_API11_SAMPLE_H
