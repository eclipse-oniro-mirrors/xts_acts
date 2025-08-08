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

#ifndef VIDEODEC_API11_SAMPLE_H
#define VIDEODEC_API11_SAMPLE_H

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
#include "native_avcodec_videodecoder.h"
#include "nocopyable.h"
#include "native_avmemory.h"
#include "native_avformat.h"
#include "native_averrors.h"
#include "window.h"
#include "iconsumer_surface.h"

namespace OHOS {
namespace Media {
class VDecAPI11Signal {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::queue<uint32_t> inIdxQueue_;
    std::queue<uint32_t> outIdxQueue_;
    std::queue<OH_AVCodecBufferAttr> attrQueue_;
    std::queue<OH_AVBuffer *> inBufferQueue_;
    std::queue<OH_AVBuffer *> outBufferQueue_;
};

class VDecAPI11Sample : public NoCopyable {
public:
    VDecAPI11Sample() = default;
    ~VDecAPI11Sample();
    int32_t RunVideoDec_Surface(std::string codeName = "");
    int32_t RunVideoDec(std::string codeName = "");
    const char *INP_DIR = "/data/test/media/mpeg4_main@level4_1920x1080_30.m4v";
    const char *OUT_DIR = "/data/test/media/VDecTest.yuv";
    const char *OUT_DIR2 = "/data/test/media/VDecTest2.yuv";
    bool SF_OUTPUT = false;
    uint32_t DEFAULT_WIDTH = 1920;
    uint32_t DEFAULT_HEIGHT = 1080;
    uint32_t originalWidth = 0;
    uint32_t originalHeight = 0;
    bool SURFACE_OUTPUT = false;
    uint32_t defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
    uint32_t REPEAT_CALL_TIME = 10;
    uint32_t MAX_SURF_NUM = 2;
    double DEFAULT_FRAME_RATE = 30.0;
    uint32_t DEFAULT_RANGE_FLAG = 0;
    bool BEFORE_EOS_INPUT = false;              // 0800 测试用例
    bool BEFORE_EOS_INPUT_INPUT = false;        // 0900 测试用例
    bool AFTER_EOS_DESTORY_CODEC = true;        // 1000 测试用例 结束不销毁codec
    uint32_t REPEAT_START_STOP_BEFORE_EOS = 0;  // 1200 测试用例
    uint32_t REPEAT_START_FLUSH_BEFORE_EOS = 0; // 1300 测试用例
    uint32_t frameCount_ = 0;
    bool outputYuvFlag = false;
    uint32_t repeat_time = 0;
    uint32_t outFrameCount = 0;
    // 解码输出数据预期
    bool needCheckOutputDesc = false;
    bool isResChangeStream = false;
    uint32_t expectCropTop = 0;
    uint32_t expectCropBottom = 0;
    uint32_t expectCropLeft = 0;
    uint32_t expectCropRight = 0;
    int32_t enbleSyncMode = 0;
    int64_t syncInputWaitTime = -1;
    int64_t syncOutputWaitTime = -1;
    bool queryOutputBufferEOS = false;
    bool queryInputBufferEOS = false;
    const char *fileSourcesha256[64] = {"27", "6D", "A2", "D4", "18", "21", "A5", "CD", "50", "F6", "DD", "CA", "46",
                                        "32", "C3", "FE", "58", "FC", "BC", "51", "FD", "70", "C7", "D4", "E7", "4D",
                                        "5C", "76", "E7", "71", "8A", "B3", "C0", "51", "84", "0A", "FA", "AF", "FA",
                                        "DC", "7B", "C5", "26", "D1", "9A", "CA", "00", "DE", "FC", "C8", "4E", "34",
                                        "C5", "9A", "43", "59", "85", "DC", "AC", "97", "A3", "FB", "23", "51"};

    int32_t Start();
    int32_t Stop();
    int32_t Flush();
    int32_t DecodeSetSurface();
    int32_t Reset();
    int32_t state_EOS();
    void SetEOS(uint32_t index, OH_AVBuffer *buffer);
    void WaitForEOS();
    int32_t ConfigureVideoDecoder();
    int32_t StartVideoDecoder();
    int32_t StartSyncVideoDecoder();
    int64_t GetSystemTimeUs();
    int32_t CreateVideoDecoder(std::string codeName);
    int32_t SetVideoDecoderCallback();
    void testAPI();
    int32_t SwitchSurface();
    int32_t RepeatCallSetSurface();
    int32_t Release();
    int32_t SetParameter(OH_AVFormat *format);
    void CheckOutputDescription();
    void AutoSwitchSurface();
    void InputFunc();
    int32_t PushData(uint32_t index, OH_AVBuffer *buffer);
    int32_t CheckAndReturnBufferSize(OH_AVBuffer *buffer);
    uint32_t SendData(uint32_t bufferSize, uint32_t index, OH_AVBuffer *buffer);
    void ProcessOutputData(OH_AVBuffer *buffer, uint32_t index, int32_t size);
    int32_t CheckAttrFlag(OH_AVCodecBufferAttr attr);
    void OutputFunc();
    void InputFuncTest();
    void SyncInputFunc();
    void GetBufferSize();
    void SetAttr(OH_AVCodecBufferAttr &attr, int64_t startPts, uint32_t bufferSize);
    void SetRepeat();
    void PtrStep(uint32_t &bufferSize, unsigned char **pBuffer, uint32_t size);
    void PtrStepExtraRead(uint32_t &bufferSize, unsigned char **pBuffer);
    void OutputFuncTest();
    void SyncOutputFunc();
int32_t SyncOutputFuncEos(OH_AVCodecBufferAttr attr, uint32_t index);
    void ReleaseSignal();
    void CreateSurface();
    void ReleaseInFile();
    void StopInloop();
    void Flush_buffer();
    void StopOutloop();
    bool IsRender();
    bool MdCompare(unsigned char *buffer, int len, const char *source[]);
    VDecAPI11Signal *signal_;
    uint32_t errCount = 0;
    uint32_t outCount = 0;
    int64_t renderTimestampNs = 0;
    bool rsAtTime = false;
    int64_t outTimeArray[2000] = {};
    bool sleepOnFPS = false;
    bool repeatRun = false;
    int64_t decode_count = 0;
    int64_t start_time = 0;
    int32_t maxInputSize = 0;
    int64_t end_time = 0;
    bool autoSwitchSurface = false;
    int32_t switchSurfaceFlag = 0;
    std::atomic<bool> isRunning_ { false };
    bool inputCallbackFlush = false;
    bool inputCallbackStop = false;
    bool outputCallbackFlush = false;
    bool outputCallbackStop = false;
    bool useHDRSource = false;
    int32_t DEFAULT_PROFILE = MPEG4_PROFILE_SIMPLE;
    int enbleBlankFrame = 0;
private:
    std::unique_ptr<std::ifstream> inFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    std::unique_ptr<uint8_t []> prereadBuffer_ = nullptr;
    std::unique_ptr<std::vector<uint8_t>> mpegUnit_ = nullptr;
    std::unordered_map<uint32_t, OH_AVBuffer *> inBufferMap_;
    std::unordered_map<uint32_t, OH_AVBuffer *> outBufferMap_;
    OH_AVCodec *vdec_;
    OH_AVCodecCallback cb_;
    int64_t timeStamp_ { 0};
    int64_t lastRenderedTimeUs_ { 0 };
    bool isFirstFrame_ = true;
    bool finishLastPush = false;
    uint32_t pPrereadBuffer_ = 0;
    uint32_t prereadBufferSize_ = 0;
    OHNativeWindow *nativeWindow[2] = {};
    sptr<Surface> cs[2] = {};
    sptr<Surface> ps[2] = {};
};
} // namespace Media
} // namespace OHOS

void VdecAPI11Error(OH_AVCodec *codec, int32_t errorCode, void *userData);
void VdecAPI11FormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData);
void VdecAPI11InputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData);
void VdecAPI11OutputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData);
#endif // VIDEODEC_SAMPLE_H
