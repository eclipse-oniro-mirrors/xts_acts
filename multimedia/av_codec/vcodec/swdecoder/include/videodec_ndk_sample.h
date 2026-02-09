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

#include <atomic>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <mutex>
#include <queue>
#include <string>
#include <thread>
#include <unistd.h>
#include <unordered_map>
#include "native_avcodec_videodecoder.h"
#include "native_averrors.h"
#include "native_avformat.h"
#include "native_avmemory.h"
#include "nocopyable.h"
#include "securec.h"
#include "surface/window.h"

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
    bool SURFACE_OUTPUT = false;
    uint32_t DEFAULT_WIDTH = 1920;
    uint32_t DEFAULT_HEIGHT = 1080;
    uint32_t DEFAULT_FRAME_RATE = 30;
    uint32_t DEFAULT_ROTATION = 0;
    uint32_t DEFAULT_PIXEL_FORMAT = 1;
    bool BEFORE_EOS_INPUT = false;              // 0800 测试用例
    bool BEFORE_EOS_INPUT_INPUT = false;        // 0900 测试用例
    bool AFTER_EOS_DESTORY_CODEC = true;        // 1000 测试用例 结束不销毁codec
    uint32_t REPEAT_START_STOP_BEFORE_EOS = 0;  // 1200 测试用例
    uint32_t REPEAT_START_FLUSH_BEFORE_EOS = 0; // 1300 测试用例
    uint32_t frameCount_ = 0;
    const char *fileSourcesha256[64] = {"27", "6D", "A2", "D4", "18", "21", "A5", "CD", "50", "F6", "DD", "CA", "46",
                                        "32", "C3", "FE", "58", "FC", "BC", "51", "FD", "70", "C7", "D4", "E7", "4D",
                                        "5C", "76", "E7", "71", "8A", "B3", "C0", "51", "84", "0A", "FA", "AF", "FA",
                                        "DC", "7B", "C5", "26", "D1", "9A", "CA", "00", "DE", "FC", "C8", "4E", "34",
                                        "C5", "9A", "43", "59", "85", "DC", "AC", "97", "A3", "FB", "23", "51"};

    int32_t Start();
    int32_t Stop();
    int32_t Flush();
    void Flush_buffer();
    int32_t Reset();
    void SetEOS(uint32_t index);
    uint32_t SendData(uint32_t bufferSize, uint32_t index, OH_AVMemory *buffer);
    void CopyStartCode(uint8_t *frameBuffer, uint32_t bufferSize, OH_AVCodecBufferAttr &attr);
    int32_t ReadData(uint32_t index, OH_AVMemory *buffer);
    int32_t state_EOS();
    void WaitForEOS();
    int32_t ConfigureVideoDecoder();
    int32_t StartVideoDecoder();
    int64_t GetSystemTimeUs();
    int32_t CreateVideoDecoder(std::string codeName);
    int32_t SetVideoDecoderCallback();
    int32_t SetSurface(OHNativeWindow *window);
    int32_t Release();
    int32_t SetParameter(OH_AVFormat *format);
    void OutputFunc();
    void WriteOutputFrame(uint32_t index, OH_AVMemory *buffer, OH_AVCodecBufferAttr attr, FILE *outFile);
    void InputFunc_AVCC();
    void ReleaseSignal();
    void ReleaseInFile();
    void StopInloop();
    void StopOutloop();
    bool IsRender();
    bool MdCompare(unsigned char *buffer, int len, const char *source[]);
    VDecSignal *signal_;
    uint32_t errCount = 0;
    uint32_t outCount = 0;
    int64_t outTimeArray[2000] = {};
    bool sleepOnFPS = false;
    bool repeatRun = false;
    int64_t start_time = 0;
    int64_t end_time = 0;
    bool setParameters = false;
    OH_AVCodec *vdec_;

private:
    std::atomic<bool> isRunning_ { false };
    std::unique_ptr<std::ifstream> inFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    std::unordered_map<uint32_t, OH_AVMemory *> inBufferMap_;
    std::unordered_map<uint32_t, OH_AVMemory *> outBufferMap_;
    OH_AVCodecAsyncCallback cb_;
    int64_t timeStamp_ { 0 };
    int64_t lastRenderedTimeUs_ { 0 };
    bool isFirstFrame_ = true;
};
} // namespace Media
} // namespace OHOS

void VdecError(OH_AVCodec *codec, int32_t errorCode, void *userData);
void VdecFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData);
void VdecInputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData);
void VdecOutputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, OH_AVCodecBufferAttr *attr,
                         void *userData);
#endif // VIDEODEC_NDK_SAMPLE_H
