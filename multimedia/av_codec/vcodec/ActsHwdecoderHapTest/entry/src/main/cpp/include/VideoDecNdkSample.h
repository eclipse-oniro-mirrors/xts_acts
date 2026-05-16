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

#ifndef VIDEODEC_SAMPLE_H
#define VIDEODEC_SAMPLE_H

#include <atomic>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <multimedia/player_framework/native_avbuffer_info.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avmemory.h>
#include <multimedia/video_processing_engine/video_processing_types.h>
#include <mutex>
#include <native_image/native_image.h>
#include <queue>
#include <string>
#include <thread>
#include <unistd.h>
#include <unordered_map>
#include "NoCopyable.h"

namespace OHOS {
namespace Media {
class VDecSignal {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::queue<uint32_t> inIdxQueue_;
    std::queue<uint32_t> outIdxQueue_;
    std::queue<OH_AVCodecBufferAttr> attrQueue_;
    std::queue<OH_AVMemory*> inBufferQueue_;
    std::queue<OH_AVMemory*> outBufferQueue_;
};

class VDecNdkSample : public NoCopyable {
public:
    VDecNdkSample();
    ~VDecNdkSample() override;
    int32_t RunVideoDecSurface(std::string codeName = "");
    int32_t RunVideoDec(std::string codeName = "");
    const char* inpDir = "/data/storage/el2/base/files/1920_1080_10_30Mb.h264";
    const char* outDir = "/data/storage/el2/base/files/VDecTest.yuv";
    const char* outDir2 = "/data/storage/el2/base/files/VDecTest2.yuv";
    bool sfOutput = false;
    uint32_t defaultWidth = 1920;
    uint32_t defaultHeight = 1080;
    double defaultFrameRate = 30.0;
    bool beforeEosInput = false;            // 0800 测试用例
    bool beforeEosInputInput = false;       // 0900 测试用例
    bool afterEosDestroyCodec = true;       // 1000 测试用例 结束不销毁codec
    uint32_t repeatStartStopBeforeEos = 0;  // 1200 测试用例
    uint32_t repeatStartFlushBeforeEos = 0; // 1300 测试用例
    uint32_t frameCount_ = 0;
    uint32_t repeatTime = 0;
    // 解码输出数据预期
    bool needCheckOutputDesc = false;
    bool isResChangeStream = false;
    uint32_t expectCropTop = 0;
    uint32_t expectCropBottom = 0;
    uint32_t expectCropLeft = 0;
    uint32_t expectCropRight = 0;
    const char* fileSourceSha256[64] = { "27", "6D", "A2", "D4", "18", "21", "A5", "CD", "50", "F6", "DD", "CA", "46",
                                         "32", "C3", "FE", "58", "FC", "BC", "51", "FD", "70", "C7", "D4", "E7", "4D",
                                         "5C", "76", "E7", "71", "8A", "B3", "C0", "51", "84", "0A", "FA", "AF", "FA",
                                         "DC", "7B", "C5", "26", "D1", "9A", "CA", "00", "DE", "FC", "C8", "4E", "34",
                                         "C5", "9A", "43", "59", "85", "DC", "AC", "97", "A3", "FB", "23", "51" };

    int32_t Start();
    int32_t Stop();
    int32_t Flush();
    int32_t Reset();
    int32_t StateEos();
    void SetEOS(uint32_t index);
    void WaitForEOS();
    int32_t ConfigureVideoDecoder();
    int32_t StartVideoDecoder();
    int64_t GetSystemTimeUs();
    int32_t CreateVideoDecoder(std::string codeName);
    int32_t SetVideoDecoderCallback();
    void TestApi();
    int32_t SwitchSurface();
    int32_t RepeatCallSetSurface();
    int32_t Release();
    int32_t SetParameter(OH_AVFormat* format);
    void CheckOutputDescription();
    void AutoSwitchSurface();
    void InputFunc();
    int32_t PushData(uint32_t index, OH_AVMemory* buffer);
    uint32_t SendData(uint32_t bufferSize, uint32_t index, OH_AVMemory* buffer);
    void ProcessOutputData(OH_AVMemory* buffer, uint32_t index);
    void OutputFunc();
    void InputFuncTest();
    void OutputFuncTest();
    void ReleaseSignal();
    void CreateSurface();
    void ReleaseInFile();
    void StopInloop();
    void FlushBuffer();
    void StopOutloop();
    bool IsRender();
    bool MdCompare(unsigned char* buffer, int len, const char* source[]);
    VDecSignal* signal_;
    uint32_t errCount = 0;
    uint32_t outCount = 0;
    int64_t outTimeArray[2000] = {};
    bool sleepOnFPS = false;
    bool repeatRun = false;
    int64_t decodeCount = 0;
    int64_t startTime = 0;
    int64_t endTime = 0;
    bool autoSwitchSurface = false;
    int32_t switchSurfaceFlag = 0;
    std::atomic<bool> isRunning_{ false };
    bool inputCallbackFlush = false;
    bool inputCallbackStop = false;
    bool outputCallbackFlush = false;
    bool outputCallbackStop = false;

private:
    class Impl;
    Impl* pImpl;
    std::unique_ptr<std::ifstream> inFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    std::unordered_map<uint32_t, OH_AVMemory*> inBufferMap_;
    std::unordered_map<uint32_t, OH_AVMemory*> outBufferMap_;
    OH_AVCodec* vdec_;
    OH_AVCodecAsyncCallback cb_;
    int64_t timeStamp_{ 0 };
    int64_t lastRenderedTimeUs_{ 0 };
    bool isFirstFrame_ = true;
    OH_NativeImage* cNativeImage[2] = {};
    OHNativeWindow* pNativeWindow[2] = {};
};
} // namespace Media
} // namespace OHOS

void VdecError(OH_AVCodec* codec, int32_t errorCode, void* userData);
void VdecFormatChanged(OH_AVCodec* codec, OH_AVFormat* format, void* userData);
void VdecInputDataReady(OH_AVCodec* codec, uint32_t index, OH_AVMemory* data, void* userData);
void VdecOutputDataReady(OH_AVCodec* codec,
                         uint32_t index,
                         OH_AVMemory* data,
                         OH_AVCodecBufferAttr* attr,
                         void* userData);
#endif // VIDEODEC_SAMPLE_H
