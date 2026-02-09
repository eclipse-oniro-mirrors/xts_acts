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

#ifndef ACTSAUDIOHAPTEST_AUDIO_ENCODER_CAPI_TEST_H
#define ACTSAUDIOHAPTEST_AUDIO_ENCODER_CAPI_TEST_H

#include <atomic>
#include <fstream>
#include <iostream>
#include <map>
#include <memory>
#include <multimedia/native_audio_channel_layout.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <queue>
#include <set>
#include <string>
#include <string_view>
#include <thread>

using namespace std;

namespace OHOS {

constexpr uint32_t CHANNEL_COUNT = 2;
constexpr uint32_t SAMPLE_RATE = 44100;
constexpr int64_t BITS_RATE = 261000;
constexpr uint32_t FRAME_DURATION_US = 33000;
constexpr uint32_t AAC_DEFAULT_FRAME_BYTES = 2 * 1024 * 4;

constexpr const char* AAC_INPUT_FILE_PATH =
    "/data/storage/el2/base/haps/entry_test/files/aac_2c_44100hz_199k.pcm";

constexpr const char* AAC_OUTPUT_FILE_PATH =
    "/data/storage/el2/base/haps/entry_test/files/aac_2c_44100hz_encode.aac";

class AEncSignalAv {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::mutex startMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::condition_variable startCond_;
    std::queue<uint32_t> inQueue_;
    std::queue<uint32_t> outQueue_;
    std::queue<OH_AVBuffer*> inBufferQueue_;
    std::queue<OH_AVBuffer*> outBufferQueue_;
};

class AudioCodeCApiEncoderNdkTestContext {
public:
    AudioCodeCApiEncoderNdkTestContext() {}
    ~AudioCodeCApiEncoderNdkTestContext()
    {
        if (signalAv_ != nullptr) {
            delete signalAv_;
            signalAv_ = nullptr;
        }
        cout << "[AudioCodeCApiEncoderNdkTestContext ~()]: over!!!" << endl;
    }

    AudioCodeCApiEncoderNdkTestContext(AudioCodeCApiEncoderNdkTestContext&&) = delete;
    AudioCodeCApiEncoderNdkTestContext& operator=(AudioCodeCApiEncoderNdkTestContext&&) = delete;

    AudioCodeCApiEncoderNdkTestContext(const AudioCodeCApiEncoderNdkTestContext&) = delete;
    AudioCodeCApiEncoderNdkTestContext& operator=(const AudioCodeCApiEncoderNdkTestContext&) = delete;

    int32_t ProceByMimeFunc(const std::string mime, bool isEncoder);
    int32_t ProceByCapabilityFunc(const std::string mime, bool isEncoder);
    void InputFuncAv();
    void OutputFuncAv();
    void HeAACSampleRateTest(int32_t profile);
    void ChannelLayoutTest(std::map<OH_AudioChannelLayout, int32_t>& supportedLayoutMap, int32_t profile);
    void ChannelCountTest(std::set<int32_t>& supportedChannelCntSet, int32_t profile);
    bool IsSupportHeAac();

    bool isRunning_ = false;
    std::unique_ptr<std::ifstream> inputFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    int32_t index_;
    uint32_t frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    std::string inputFilePath_ = AAC_INPUT_FILE_PATH;
    std::string outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    struct OH_AVCodecCallback avcb_;
    AEncSignalAv* signalAv_ = nullptr;
    OH_AVCodec* audioEnc_;
    OH_AVFormat* format;
    bool isFirstFrame_ = true;
    int64_t timeStamp_ = 0;
};

int EncoderConfigureLCAAC();
int EncoderConfigureHEAAC();
int EncoderConfigureHEAACv2();
int EncoderConfigureByCap();
int SampleRate();
int ChannelCountV1();
int ChannelCountV2();
int ChannelLayoutV1();
int ChannelLayoutV2();
int AacProfile();

} // namespace OHOS

#endif // ACTSAUDIOHAPTEST_AUDIO_ENCODER_CAPI_TEST_H
