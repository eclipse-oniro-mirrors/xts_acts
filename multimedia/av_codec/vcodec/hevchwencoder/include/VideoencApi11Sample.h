/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include <unordered_map>
#include "securec.h"
#include "native_avcodec_videoencoder.h"
#include "nocopyable.h"
#include "native_avbuffer.h"
#include "native_avformat.h"
#include "native_averrors.h"
#include "surface/window.h"
#include "media_description.h"
#include "av_common.h"
#include "external_window.h"
#include "native_buffer.h"
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
    const char *INP_DIR = "/data/test/media/1280_720_nv.yuv";
    const char *OUT_DIR = "/data/test/media/VEncTest.h265";
    const char *roiInfo = "0,0-128,64=-4;100,200-300,400=3";
    uint32_t DEFAULT_WIDTH = 1280;
    uint32_t DEFAULT_HEIGHT = 720;
    uint64_t DEFAULT_BITRATE = 5000000;
    uint64_t DEFAULT_MAX_BITRATE = 8000000;
    uint32_t DEFAULT_QUALITY = 30;
    uint32_t DEFAULT_SQR_FACTOR = 28;
    double DEFAULT_FRAME_RATE = 30.0;
    uint32_t DEFAULT_QUALITY_RUN = 28;
    uint64_t DEFAULT_BITRATE_RUN = 6000000;
    uint64_t DEFAULT_SQR_FACTOR_RUN = 30;
    uint32_t DEFAULT_FRAME_RATE_RUN = 30;
    uint64_t DEFAULT_MAX_BITRATE_RUN =  50000000;
    uint32_t DEFAULT_INTERVAL_RUN = 1000;
    uint32_t DEFAULT_BITRATE_MODE_RUN = CBR;
    uint32_t DEFAULT_BFRAME = 1;
    uint32_t DEFAULT_MAX_B_FRAMES = 3;
    bool SETBIRATE = false;
    bool MODE_ENABLE = false;
    bool QUALITY_ENABLE = false;
    bool FACTOR_ENABLE = false;
    bool MAXBITE_ENABLE = false;
    bool B_ENABLE = false;
    bool QUALITY_ENABLE_RUN = false;
    bool SETBIRATE_RUN = false;
    bool FACTOR_ENABLE_RUN = false;
    bool MAXBITE_ENABLE_RUN = false;
    bool IFRAME_ENABLE_RUN = false;
    bool FRAMERATE_ENABLE_RUN = false;
    bool MODE_ENABLE_RUN = false;
    bool enablePTSBasedRateControl = false;
    bool MAXBFRAMES_ENABLE = false;
    uint32_t DEFAULT_BITRATE_MODE = CBR;
    OH_AVPixelFormat DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    uint32_t DEFAULT_KEY_FRAME_INTERVAL = 1000;
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
    void Flush_buffer();
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
    void readMultiFilesFunc();
    int32_t GetBframes(OH_AVFormat *format);
    int32_t InitBuffer(OHNativeWindowBuffer *&ohNativeWindowBuffer, OH_NativeBuffer *&nativeBuffer, uint8_t *&dst);
    int32_t LoadTimeStampData(std::string filePath, std::string &inputDir,
                            std::string &outputDir, uint32_t &w, uint32_t &h,
                            uint32_t &bitrateMode, uint32_t &bitRate, bool &surfaceMode);
    VEncAPI11Signal *signal_;
    uint32_t errCount = 0;
    uint32_t outCount = 0;
    uint32_t frameCount = 0;
    bool sleepOnFPS = false;
    bool SURF_INPUT = false;
    bool repeatRun = false;
    bool enableParameter = false;
    int64_t encode_count = 0;
    bool enable_random_eos = false;
    uint32_t REPEAT_START_STOP_BEFORE_EOS = 0;
    uint32_t REPEAT_START_FLUSH_BEFORE_EOS = 0;
    int64_t frameIndex = 0;
    bool readMultiFiles = false;
    bool configMain10 = false;
    bool isParamSet = false;
    uint32_t frameCount_1 = 0;
private:
    std::atomic<bool> isRunning_ { false };
    std::unique_ptr<std::ifstream> inFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    OH_AVCodecCallback cb_;
    OH_AVCodec *venc_;
    OHNativeWindow *nativeWindow;
    int stride_;
    static constexpr uint32_t SAMPLE_RATIO = 2;
};
} // namespace Media
} // namespace OHOS

#endif // VIDEOENC_API11_SAMPLE_H
