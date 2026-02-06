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
#include <condition_variable>

#include "native_avcodec_base.h"
#include "native_avdemuxer.h"
#include "native_avsource.h"
#include "native_avmuxer.h"
#include "securec.h"
#include "native_avcodec_videodecoder.h"
#include "native_avcodec_videoencoder.h"
#include "nocopyable.h"
#include "native_avmemory.h"
#include "native_avformat.h"
#include "native_averrors.h"
#include "surface/window.h"
#include "iconsumer_surface.h"
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
    int32_t CreateVideocoder(std::string codeName, std::string enCodeName);
    int32_t SendData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data);
    void PtrStep(uint32_t &bufferSize, unsigned char **pBuffer, uint32_t size);
    void PtrStepExtraRead(uint32_t &bufferSize, unsigned char **pBuffer);
    int32_t SendDataHdr(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data);
    int32_t SendDataH263(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data);
    int32_t SendDataAvc(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data);
    int32_t SendDataMpeg2(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data);
    int32_t SendDataMpeg4(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data);
    void ProcessAdditionalRead(uint32_t &buffersize, void *&pBuffer);
    void ProcessInitialSearch(uint32_t &bufferSize, void *&pBuffer);
    int32_t StartDemuxer();
    void GetBufferSize();
    void GetMpeg4BufferSize();
    void WriteAudioTrack();
    int32_t CreateDemuxerVideocoder(const char *file, std::string codeName, std::string enCodeName);
    OH_AVDemuxer *demuxer = nullptr;
    OH_AVMuxer *muxer = nullptr;
    uint32_t videoTrackID = -1;
    uint32_t audioTrackID = -1;
    std::unique_ptr<std::thread> audioThread;
    const char *INP_DIR = "/data/test/media/1920_1080_10_30Mb.h264";
    bool needEncode = false;
    bool needTransCode = false;
    int32_t DEFAULT_WIDTH = 3840;
    int32_t DEFAULT_HEIGHT = 2160;
    int32_t DEFAULT_ROTATION = 0;
    int32_t DEFAULT_PIXEL_FORMAT = AV_PIXEL_FORMAT_NV12;
    double DEFAULT_FRAME_RATE = 30.0;
    const char *MIME_TYPE = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    uint32_t REPEAT_START_STOP_BEFORE_EOS = 0;  // 1200 测试用例
    uint32_t REPEAT_START_FLUSH_BEFORE_EOS = 0; // 1300 测试用例
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
    int32_t typeDec = 0;
    int32_t inputNum = 0;
    bool finishLastPush = false;
    bool bframe = false;
    bool DEMUXER_FLAG = false;

private:
    OHNativeWindow *window = nullptr;
    OH_AVCodecAsyncCallback encCb_;
    OH_AVCodecAsyncCallback decCb_;
    std::unique_ptr<uint8_t[]> prereadBuffer_;
    std::unique_ptr<std::vector<uint8_t>> mpegUnit_;
    uint32_t pPrereadBuffer_;
    uint32_t prereadBufferSize_;
    OH_AVSource *source = nullptr;
    int32_t trackCount = 0;
    int32_t fd;
    int32_t outFd;
};
} // namespace Media
} // namespace OHOS

#endif
