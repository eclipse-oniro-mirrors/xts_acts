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

#ifndef AVCODEC_AUDIO_AVBUFFER_AAC_ENCODER_DEMO_H
#define AVCODEC_AUDIO_AVBUFFER_AAC_ENCODER_DEMO_H

#include <atomic>
#include <condition_variable>
#include <fstream>
#include <queue>
#include <string>
#include <thread>
#include "nocopyable.h"
#include "common/native_mfmagic.h"
#include "native_avcodec_audiocodec.h"

namespace OHOS {
namespace MediaAVCodec {
namespace AudioAacEncDemo {

enum class AudioBufferFormatType : int32_t {
    TYPE_AAC = 0,
    TYPE_FLAC = 1,
    TYPE_MP3 = 2,
    TYPE_VORBIS = 3,
    TYPE_AMRNB = 4,
    TYPE_AMRWB = 5,
    TYPE_vivid = 6,
    TYPE_OPUS = 7,
    TYPE_G711MU = 8,
    TYPE_MAX = 9,
};

class AEncSignal {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::mutex startMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::condition_variable startCond_;
    std::queue<uint32_t> inQueue_;
    std::queue<uint32_t> outQueue_;
    std::queue<OH_AVBuffer *> inBufferQueue_;
    std::queue<OH_AVBuffer *> outBufferQueue_;
};

/**
  * @test
  * @Status {Create, Configure, Start, Running, EOS, Flush, Stop, Reset, Release}
  * @StatusErrCode AV_ERR_INVALID_STATE
  * @Allow Create -> Configure
  * @Allow Configure -> Start
  * @Allow Start -> {Running, Flush, EOS, Stop}
  * @Allow Flush -> {Start, Stop}
  * @Allow Running -> {Running, EOS, Flush, Stop}
  * @Allow EOS -> {Flush, Stop}
  * @Allow Stop -> Start
  * @Allow Reset -> Configure
  * @Allow {Create, Configure, Start, Running, EOS, Flush, Stop, Reset} -> Reset
  * @Allow {Create, Configure, Start, Running, EOS, Flush, Stop, Reset} -> Release
**/
class AudioBufferAacEncDemo : public NoCopyable {
public:
    AudioBufferAacEncDemo();
    virtual ~AudioBufferAacEncDemo();
    /**
      * @functionTest
      * @input inputFile
      * @output outputFile
    **/
    bool RunCase(std::string inputFile, std::string outputFile);
    /**
      * @interfaceTest
      * @param mime; scope: {OH_AVCODEC_MIMETYPE_AUDIO_OPUS, OH_AVCODEC_MIMETYPE_AUDIO_G711MU};
      *              default: OH_AVCODEC_MIMETYPE_AUDIO_OPUS;
      * @Status Create
    **/
    OH_AVCodec* CreateByMime(const char* mime);

    /**
      * @interfaceTest
      * @param mime; scope: {"OH.Media.Codec.Encoder.Audio.OPUS", "OH.Media.Codec.Encoder.Audio.G711MU"};
      *              default: "OH.Media.Codec.Encoder.Audio.OPUS";
      * @Status Create
    **/
    OH_AVCodec* CreateByName(const char* mime);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @free CreateByMime, CreateByName
      * @Status Release
      * @return AV_ERR_OK
    **/
    OH_AVErrCode Destroy(OH_AVCodec* codec);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @return AV_ERR_OK
    **/
    OH_AVErrCode SetCallback(OH_AVCodec* codec);

    /**
      * @interfaceTest
      * @Status Configure
      * @after SetCallback
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @param format; default: OH_AVFormat_Create(); code: AV_ERR_INVALID_VAL;
      * @if mime is OH_AVCODEC_MIMETYPE_AUDIO_OPUS
      * @param channel; scope: [1, 2]; default: 2; code: AV_ERR_INVALID_VAL;
      * @param sampleRate; scope: {8000, 12000, 16000, 24000, 48000}; default: 48000;
      *                    code: AV_ERR_INVALID_VAL;
      * @param bitRate; scope: [6000, 510000]; default: 15000; code: AV_ERR_INVALID_VAL;
      * @param sampleFormat; scope: {SAMPLE_S16LE}; default: SAMPLE_S16LE; code: AV_ERR_INVALID_VAL;
      * @param sampleBit; scope: [16]; default: 16; code: AV_ERR_INVALID_VAL;
      * @param complexity; scope: [1, 10]; default: 10; code: AV_ERR_INVALID_VAL;
      * @if mime is OH_AVCODEC_MIMETYPE_AUDIO_G711MU
      * @param channel; scope: {1}; default: 1; code: AV_ERR_INVALID_VAL;
      * @param sampleRate; scope: {8000}; default: 8000; code: AV_ERR_INVALID_VAL;
      * @param sampleFormat; scope: {SAMPLE_S16LE}; default: SAMPLE_S16LE; code: AV_ERR_INVALID_VAL;
      * @return AV_ERR_OK
    **/
    OH_AVErrCode Configure(OH_AVCodec* codec, OH_AVFormat* format, int32_t channel, int32_t sampleRate,
    int64_t bitRate, int32_t sampleFormat, int32_t sampleBit, int32_t complexity);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @return AV_ERR_OK
    **/
    OH_AVErrCode Prepare(OH_AVCodec* codec);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @Status Start
      * @return AV_ERR_OK
    **/
    OH_AVErrCode Start(OH_AVCodec* codec);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @Status Stop
      * @return AV_ERR_OK
    **/
    OH_AVErrCode Stop(OH_AVCodec* codec);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @Status Flush
      * @return AV_ERR_OK
    **/
    OH_AVErrCode Flush(OH_AVCodec* codec);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @Status Reset
      * @return AV_ERR_OK
    **/
    OH_AVErrCode Reset(OH_AVCodec* codec);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: nullptr;
      * @after Start
    **/
    OH_AVFormat* GetOutputDescription(OH_AVCodec* codec);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @param index; depend: GetInputIndex.return; scope: [0, 7]; code: AV_ERR_NO_MEMORY;
      * @param size; scope: [0, 65535]; default: 100; code: AV_ERR_INVALID_VAL;
      * @param offset; scope: [0, 65535]; default: 0; code: AV_ERR_INVALID_VAL;
      * @Status Running
      * @return AV_ERR_OK
    **/
    OH_AVErrCode PushInputData(OH_AVCodec* codec, uint32_t index);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @param index; depend: GetInputIndex.return; scope: [0, 7]; code: AV_ERR_NO_MEMORY;
      * @Status EOS
      * @return AV_ERR_OK
    **/
    OH_AVErrCode PushInputDataEOS(OH_AVCodec* codec, uint32_t index);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @param index; depend: GetOutputIndex.return; scope: [0, 7]; code: AV_ERR_NO_MEMORY;
      * @return AV_ERR_OK
    **/
    OH_AVErrCode FreeOutputData(OH_AVCodec* codec, uint32_t index);

    /**
      * @interfaceTest
      * @param codec; depend: CreateByMime.return; code: AV_ERR_INVALID_VAL;
      * @param isValid; code: AV_ERR_INVALID_VAL;
      * @return AV_ERR_OK
    **/
    OH_AVErrCode IsValid(OH_AVCodec* codec, bool* isValid);

    /**
      * @after Start
    **/
    uint32_t GetInputIndex();

    /**
      * @after PushInputDataEOS
    **/
    uint32_t GetOutputIndex();

    OH_AVErrCode SetParameter(OH_AVCodec* codec, OH_AVFormat* format, int32_t channel, int32_t sampleRate,
    int64_t bitRate, int32_t sampleFormat, int32_t sampleBit, int32_t complexity);
private:
    void ClearQueue();
    int32_t CreateEnc();
    int32_t Configure(OH_AVFormat *format);
    int32_t Start();
    int32_t Stop();
    int32_t Flush();
    int32_t Reset();
    int32_t Release();
    void InputFunc();
    void OutputFunc();
    void HandleEOS(const uint32_t &index);
    int32_t GetFileSize(const std::string &filePath);
    bool InitFile(std::string inputFile, std::string outputFile);
    std::atomic<bool> isRunning_;
    std::ifstream inputFile_;
    std::ofstream outputFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    OH_AVCodec *audioEnc_;
    AEncSignal *signal_;
    struct OH_AVCodecCallback cb_;
    bool isFirstFrame_ = true;
    int64_t timeStamp_ = 0;
    int32_t fileSize_ = 0;
    uint32_t frameCount_ = 0;
    int32_t sampleRate_;
    int32_t channels_;
    std::string inputFile_str;
    std::string outputFile_str;
    AudioBufferFormatType audioType_;
};
} // namespace AudioAacEncDemo
} // namespace MediaAVCodec
} // namespace OHOS
#endif // AVCODEC_AUDIO_AVBUFFER_AAC_ENCODER_DEMO_H
