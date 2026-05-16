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

#ifndef VIDEODEC_API11_SAMPLE_H
#define VIDEODEC_API11_SAMPLE_H

#include <atomic>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <multimedia/player_framework/native_avbuffer.h>
#include <multimedia/player_framework/native_avbuffer_info.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <mutex>
#include <native_buffer/buffer_common.h>
#include <native_image/native_image.h>
#include <queue>
#include <string>
#include <thread>
#include <unistd.h>
#include <unordered_map>
#include "NoCopyable.h"

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
    std::queue<OH_AVBuffer*> inBufferQueue_;
    std::queue<OH_AVBuffer*> outBufferQueue_;
};

class VDecAPI11Sample : public NoCopyable {
public:
    VDecAPI11Sample();
    ~VDecAPI11Sample() override;
    int32_t RunVideoDecSurface(std::string codeName = "");
    int32_t RunVideoDec(std::string codeName = "");
    const char* inpDir = "/data/storage/el2/base/files/1920_1080_10_30Mb.h264";
    const char* outDir = "/data/storage/el2/base/files/VDecTest.yuv";
    const char* outDir2 = "/data/storage/el2/base/files/VDecTest2.yuv";
    bool sfOutput = false;
    bool transferFlag = false;
    bool nv21Flag = false;
    bool prepareFlag = true;
    bool isFirstFrame = true;
    uint32_t defaultWidth = 1920;
    uint32_t defaultHeight = 1080;
    uint32_t originalWidth = 0;
    uint32_t originalHeight = 0;
    uint32_t defaultPixelFormat = AV_PIXEL_FORMAT_NV12;
    double defaultFrameRate = 30.0;
    uint32_t defaultRangeFlag = 0;
    bool beforeEosInput = false;            // 0800 测试用例
    bool beforeEosInputInput = false;       // 0900 测试用例
    bool afterEosDestroyCodec = true;       // 1000 测试用例 结束不销毁codec
    uint32_t repeatStartStopBeforeEos = 0;  // 1200 测试用例
    uint32_t repeatStartFlushBeforeEos = 0; // 1300 测试用例
    uint32_t frameCount_ = 0;
    uint32_t repeatTime = 0;
    uint32_t outFrameCount = 0;
    bool outputYuvFlag = false;
    bool noCaleHash = false;
    // 解码输出数据预期
    bool needCheckOutputDesc = false;
    bool isResChangeStream = false;
    uint32_t expectCropTop = 0;
    uint32_t expectCropBottom = 0;
    uint32_t expectCropLeft = 0;
    uint32_t expectCropRight = 0;
    int32_t stride_ = 0;
    int32_t sliceHeight_ = 0;
    int32_t picWidth_ = 0;
    int32_t picHeight_ = 0;
    bool enableVRR = false;
    bool enableLowLatency = false;
    int lowLatency = 1;
    bool getInputBufferIndexRepeat = false;
    int32_t enableSyncMode = 0;
    int64_t syncInputWaitTime = -1;
    int64_t syncOutputWaitTime = -1;
    bool queryOutputBufferEOS = false;
    bool queryInputBufferEOS = false;
    bool getOutputBufferIndexRepeated = false;
    bool getOutputBufferIndexNoExisted = false;
    bool abnormalIndexValue = false;
    bool setTransform = false;
    int32_t defaultTransform = 0;
    bool needAutoSwitch = true;
    int32_t beforeSwitchTransform = -1;
    int32_t afterSwitchTransform = -2;
    int32_t Start();
    int32_t Stop();
    int32_t Flush();
    int32_t Reset();
    int32_t Prepare();
    int32_t StateEos();
    void SetEOS(uint32_t index, OH_AVBuffer* buffer);
    void WaitForEOS();
    int32_t ConfigureVideoDecoder();
    int32_t StartDecoder();
    int32_t StartSyncDecoder();
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
    int32_t PushData(uint32_t index, OH_AVBuffer* buffer);
    int32_t CheckAndReturnBufferSize(OH_AVBuffer* buffer);
    uint32_t SendData(uint32_t bufferSize, uint32_t index, OH_AVBuffer* buffer);
    void ProcessOutputData(OH_AVBuffer* buffer, uint32_t index);
    void CopyFrom10BitYuv(OH_AVBuffer* buffer, uint32_t index);
    void CopyFrom8BitYuv(OH_AVBuffer* buffer, uint32_t index);
    int32_t CheckAttrFlag(OH_AVCodecBufferAttr attr);
    void GetStride();
    void InputFuncTest();
    void SyncInputFunc();
    void InFuncTest();
    void OutputFuncTest();
    void SyncOutputFunc();
    int32_t SetConfigTransform();
    int32_t SetSurface();
    int32_t SetParameterTransform();
    int32_t SetParameter();
    int32_t GetSurfaceTransform(int32_t surfaceFlag);
    int32_t SyncOutputFuncEos(uint32_t& lastIndex,
                              uint32_t& outFrames,
                              uint32_t& index,
                              OH_AVBuffer* buffer,
                              OH_AVCodecBufferAttr& attr);
    int32_t QueryInputBuffer(uint32_t index, int64_t timeoutUs);
    int32_t QueryOutputBuffer(uint32_t index, int64_t timeoutUs);
    OH_AVBuffer* GetInputBuffer(uint32_t index);
    OH_AVBuffer* GetOutputBuffer(uint32_t index);
    int32_t PushInputBuffer(uint32_t index);
    void ReleaseSignal();
    void CreateSurface();
    void ReleaseInFile();
    void StopInloop();
    void FlushBuffer();
    void StopOutloop();
    bool IsRender();
    void RenderOutAtTime(uint32_t index);
    bool MdCompare(uint8_t source[]);
    void GetVideoSupportedPixelFormats();
    void GetFormatKey();
    bool isGetVideoSupportedPixelFormats = false;
    bool isGetFormatKey = false;
    int isGetVideoSupportedPixelFormatsNum = 0;
    int isGetFormatKeyNum = 0;
    const char* avcodecMimeType = nullptr;
    bool isEncoder = true;
    const OH_NativeBuffer_Format* pixlFormats = nullptr;
    uint32_t pixlFormatNum = 0;
    int firstCallBackKey = 0;
    int onStreamChangedKey = 0;
    std::vector<uint8_t> LoadHashFile();
    VDecAPI11Signal* signal_;
    uint32_t errCount = 0;
    uint32_t changeCount = 0;
    uint32_t outCount = 0;
    int64_t renderTimestampNs = 0;
    bool rsAtTime = false;
    bool isChecklowLatency = false;
    int64_t outTimeArray[2000] = {};
    bool sleepOnFPS = false;
    bool repeatRun = false;
    int64_t decodeCount = 0;
    int64_t startTime = 0;
    int32_t maxInputSize = 0;
    int64_t endTime = 0;
    bool autoSwitchSurface = false;
    bool is8bitYuv = true;
    std::atomic<bool> isFlushing_{ false };
    int32_t switchSurfaceFlag = 0;
    std::atomic<bool> isRunning_{ false };
    bool inputCallbackFlush = false;
    bool inputCallbackStop = false;
    bool outputCallbackFlush = false;
    bool outputCallbackStop = false;
    bool useHDRSource = false;
    bool isAPI = false;
    bool outputYuvSurface = false;
    int32_t defaultProfile = HEVC_PROFILE_MAIN_10;
    int32_t DecodeSetSurface();
    int32_t OpenFile();
    int enbleBlankFrame = 0;

private:
    class Impl;
    Impl* pImpl;
    std::unique_ptr<std::ifstream> inFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    std::unordered_map<uint32_t, OH_AVBuffer*> inBufferMap_;
    std::unordered_map<uint32_t, OH_AVBuffer*> outBufferMap_;
    OH_AVCodec* vdec_;
    OH_AVCodecCallback cb_;
    int64_t timeStamp_{ 0 };
    int64_t lastRenderedTimeUs_{ 0 };
    bool isFirstFrame_ = true;
    OH_NativeImage* cNativeImage[2] = {};
    OHNativeWindow* pNativeWindow[2] = {};
};
} // namespace Media
} // namespace OHOS

void VdecAPI11Error(OH_AVCodec* codec, int32_t errorCode, void* userData);
void VdecAPI11FormatChanged(OH_AVCodec* codec, OH_AVFormat* format, void* userData);
void VdecAPI11InputDataReady(OH_AVCodec* codec, uint32_t index, OH_AVBuffer* data, void* userData);
void VdecAPI11OutputDataReady(OH_AVCodec* codec, uint32_t index, OH_AVBuffer* data, void* userData);
#endif // VIDEODEC_SAMPLE_H
