/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#ifndef VIDEODECENC_NDK_SAMPLE_H
#define VIDEODECENC_NDK_SAMPLE_H

#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <atomic>
#include <fstream>
#include <thread>
#include <mutex>
#include <queue>
#include <string>
#include "securec.h"
#include "nocopyable.h"
#include "ndktest_log.h"
#include "native_avmagic.h"
#include "surface.h"
#include "native_avcodec_base.h"
#include "native_avcodec_videodecoder.h"
#include "native_avcodec_videoencoder.h"

namespace OHOS {
namespace Media {
class VDecEncSignal {
public:
    std::mutex inMutexDec_;
    std::mutex outMutexDec_;
    std::condition_variable inCondDec_;
    std::condition_variable outCondDec_;
    std::queue<uint32_t> inQueueDec_;
    std::queue<uint32_t> outQueueDec_;
    std::queue<uint32_t> flagQueueDec_;
    std::queue<OH_AVMemory *> inBufferQueueDec_;
    std::queue<OH_AVMemory *> outBufferQueueDec_;

    std::mutex outMutexEnc_;
    std::condition_variable outCondEnc_;
    std::queue<uint32_t> inQueueEnc_;
    std::queue<uint32_t> outQueueEnc_;
    std::queue<uint32_t> sizeQueueEnc_;
    std::queue<uint32_t> flagQueueEnc_;
    std::queue<OH_AVMemory *> inBufferQueueEnc_;
    std::queue<OH_AVMemory *> outBufferQueueEnc_;
    int32_t errorNum_ = 0;
    std::atomic<bool> isVdecFlushing_ = false;
    std::atomic<bool> isVencFlushing_ = false;
};

class VDecEncNdkSample : public NoCopyable {
public:
    VDecEncNdkSample() = default;
    ~VDecEncNdkSample();

    void SetEosState(bool needSetEos);
    struct OH_AVCodec* CreateVideoDecoderByMime(std::string mimetype);
    struct OH_AVCodec* CreateVideoDecoderByName(std::string name);
    int32_t ConfigureDec(struct OH_AVFormat *format);
    int32_t SetParameterDec(struct OH_AVFormat *format);
    int32_t SetOutputSurface();
    int32_t PrepareDec();
    int32_t StartDec();
    int32_t StopDec();
    int32_t FlushDec();
    int32_t ResetDec();
    int32_t ReleaseDec();

    struct OH_AVCodec* CreateVideoEncoderByMime(std::string mimetype);
    struct OH_AVCodec* CreateVideoEncoderByName(std::string name);
    int32_t ConfigureEnc(struct OH_AVFormat *format);
    int32_t SetParameterEnc(struct OH_AVFormat *format);
    int32_t GetSurface();
    int32_t PrepareEnc();
    int32_t StartEnc();
    int32_t StopEnc();
    int32_t FlushEnc();
    int32_t ResetEnc();
    int32_t ReleaseEnc();
    
    int32_t CalcuError();
    void SetReadPath(std::string filepath);
    void SetSavePath(std::string filepath);
    void ReRead();
    void ResetDecParam();
    void ResetEncParam();
    int32_t GetFrameCount();
    bool GetEncEosState();
    bool GetDecEosState();
    void PopInqueueDec();
    void PopOutqueueDec();
    void PopOutqueueEnc();
    void SendEncEos();
    int32_t PushInbufferDec(uint32_t index, uint32_t bufferSize);
    VDecEncSignal* vcodecSignal_ = nullptr;
    bool isDecInputEOS = false;
    bool isEncInputEOS = false;
    bool isDecOutputEOS = false;
    bool isEncOutputEOS = false;
    bool setEos = true;
    bool needRender = true;

private:
    OHNativeWindow *nativeWindow_;
    struct OH_AVCodec* vdec_;
    void InputFuncDec();
    void OutputFuncDec();
    int32_t WriteToFile();
    std::atomic<bool> isDecRunning_ = false;
    std::unique_ptr<std::ifstream> testFile_;
    std::unique_ptr<std::thread> inputLoopDec_;
    std::unique_ptr<std::thread> outputLoopDec_;
    struct OH_AVCodecAsyncCallback cbDec_;
    int64_t timeStampDec_ = 0;
    uint32_t decInCnt_ = 0;
    uint32_t decOutCnt_ = 0;

    struct OH_AVCodec* venc_;
    void OutputFuncEnc();
    std::atomic<bool> isEncRunning_ = false;
    std::unique_ptr<std::thread> outputLoopEnc_;
    struct OH_AVCodecAsyncCallback cbEnc_;
    bool isFirstDecFrame_ = true;
    uint32_t encOutCnt_ = 0;
    std::string inFile_ = "/data/media/out_320_240_10s.h264";
    std::string outFile_ = "/data/media/video_out.es";
};
}
}
#endif // VIDEODECENC_NDK_SAMPLE_H
