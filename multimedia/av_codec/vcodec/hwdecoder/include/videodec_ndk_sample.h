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

#ifndef VIDEODEC_NDK_SAMPLE_H
#define VIDEODEC_NDK_SAMPLE_H

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
#include "surface/window.h"
#include "iconsumer_surface.h"

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
    std::queue<OH_AVMemory *> inBufferQueue_;
    std::queue<OH_AVMemory *> outBufferQueue_;
};

class VDecNdkSample : public NoCopyable {
public:
    VDecNdkSample() = default;
    ~VDecNdkSample();
    int32_t RunVideoDec_Surface(std::string codeName = "");
    int32_t RunVideoDec(std::string codeName = "");
    const char *INP_DIR = "/data/test/media/1920_1080_10_30Mb.h264";
    const char *OUT_DIR = "/data/test/media/VDecTest.yuv";
    const char *OUT_DIR2 = "/data/test/media/VDecTest2.yuv";
    bool SF_OUTPUT = false;
    uint32_t DEFAULT_WIDTH = 1920;
    uint32_t DEFAULT_HEIGHT = 1080;
    uint32_t REPEAT_CALL_TIME = 10;
    uint32_t MAX_SURF_NUM = 2;
    double DEFAULT_FRAME_RATE = 30.0;
    bool BEFORE_EOS_INPUT = false;              // 0800 测试用例
    bool BEFORE_EOS_INPUT_INPUT = false;        // 0900 测试用例
    bool AFTER_EOS_DESTORY_CODEC = true;        // 1000 测试用例 结束不销毁codec
    uint32_t REPEAT_START_STOP_BEFORE_EOS = 0;  // 1200 测试用例
    uint32_t REPEAT_START_FLUSH_BEFORE_EOS = 0; // 1300 测试用例
    uint32_t frameCount_ = 0;
    uint32_t repeat_time = 0;
    // 解码输出数据预期
    bool needCheckOutputDesc = false;
    bool isResChangeStream = false;
    uint32_t expectCropTop = 0;
    uint32_t expectCropBottom = 0;
    uint32_t expectCropLeft = 0;
    uint32_t expectCropRight = 0;
    const char *fileSourcesha256[64] = {"27", "6D", "A2", "D4", "18", "21", "A5", "CD", "50", "F6", "DD", "CA", "46",
                                        "32", "C3", "FE", "58", "FC", "BC", "51", "FD", "70", "C7", "D4", "E7", "4D",
                                        "5C", "76", "E7", "71", "8A", "B3", "C0", "51", "84", "0A", "FA", "AF", "FA",
                                        "DC", "7B", "C5", "26", "D1", "9A", "CA", "00", "DE", "FC", "C8", "4E", "34",
                                        "C5", "9A", "43", "59", "85", "DC", "AC", "97", "A3", "FB", "23", "51"};

    int32_t Start();
    int32_t Stop();
    int32_t Flush();
    int32_t Reset();
    int32_t state_EOS();
    void SetEOS(uint32_t index);
    void WaitForEOS();
    int32_t ConfigureVideoDecoder();
    int32_t StartVideoDecoder();
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
    int32_t PushData(uint32_t index, OH_AVMemory *buffer);
    uint32_t SendData(uint32_t bufferSize, uint32_t index, OH_AVMemory *buffer);
    void ProcessOutputData(OH_AVMemory *buffer, uint32_t index);
    void OutputFunc();
    void InputFuncTest();
    void OutputFuncTest();
    void ReleaseSignal();
    void CreateSurface();
    void ReleaseInFile();
    void StopInloop();
    void Flush_buffer();
    void StopOutloop();
    bool IsRender();
    bool MdCompare(unsigned char *buffer, int len, const char *source[]);
    VDecSignal *signal_;
    uint32_t errCount = 0;
    uint32_t outCount = 0;
    int64_t outTimeArray[2000] = {};
    bool sleepOnFPS = false;
    bool repeatRun = false;
    int64_t decode_count = 0;
    int64_t start_time = 0;
    int64_t end_time = 0;
    bool autoSwitchSurface = false;
    int32_t switchSurfaceFlag = 0;
    std::atomic<bool> isRunning_ { false };
    bool inputCallbackFlush = false;
    bool inputCallbackStop = false;
    bool outputCallbackFlush = false;
    bool outputCallbackStop = false;
private:
    std::unique_ptr<std::ifstream> inFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    std::unordered_map<uint32_t, OH_AVMemory *> inBufferMap_;
    std::unordered_map<uint32_t, OH_AVMemory *> outBufferMap_;
    OH_AVCodec *vdec_;
    OH_AVCodecAsyncCallback cb_;
    int64_t timeStamp_ { 0};
    int64_t lastRenderedTimeUs_ { 0 };
    bool isFirstFrame_ = true;
    OHNativeWindow *nativeWindow[2] = {};
    sptr<Surface> cs[2] = {};
    sptr<Surface> ps[2] = {};
};
} // namespace Media
} // namespace OHOS

void VdecError(OH_AVCodec *codec, int32_t errorCode, void *userData);
void VdecFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData);
void VdecInputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData);
void VdecOutputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, OH_AVCodecBufferAttr *attr,
                         void *userData);
#endif // VIDEODEC_NDK_SAMPLE_H
