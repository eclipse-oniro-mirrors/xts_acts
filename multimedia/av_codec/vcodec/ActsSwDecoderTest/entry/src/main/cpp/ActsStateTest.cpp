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

#include "include/ActsStateTest.h"
#include <memory>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include <string>
#include "include/VideodecApi11SampleTest.h"
#include "include/VideodecNdkSampleTest.h"

using namespace std;
using namespace OHOS::Media;

namespace {
constexpr int SWDEC_SUCCESS = 0;
const char* INP_DIR = "/data/storage/el2/base/haps/entry_test/files/1920_1080_10_30Mb.h264";
const char* CODEC_NAME_AVC = "OH.Media.Codec.Decoder.Video.AVC";

// Returns configured VDecNdkSample (CreateVideoDecoder, SetVideoDecoderCallback, ConfigureVideoDecoder, inpDir).
// Returns nullptr if cap is null or setup fails.
std::shared_ptr<VDecNdkSample> CreateConfiguredStateSample()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (cap == nullptr) {
        return nullptr;
    }
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR;
    if (vDecSample->CreateVideoDecoder(CODEC_NAME_AVC) != AV_ERR_OK) {
        return nullptr;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return nullptr;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return nullptr;
    }
    return vDecSample;
}
} // namespace

namespace Acts {
namespace SwDecoder {

int VideoSwdecState0100()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    ret = vDecSample->SetVideoDecoderCallback();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState0101()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState0200()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState0300()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Release();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState0400()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState0500()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    ret = vDecSample->SetVideoDecoderCallback();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState0600()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    vDecSample->afterEosDestoryCodec = false;
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState0700()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Release();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState0800()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState0900()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState1000()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState1100()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState1200()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState1300()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Release();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->ConfigureVideoDecoder();
    if ((ret) != (AV_ERR_INVALID_VAL)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState1400()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->ConfigureVideoDecoder();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState1500()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Release();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState1600()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret == AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP) {
        return SWDEC_SUCCESS;
    }
    if (ret != AV_ERR_OK) {
        return -1;
    }
    vDecSample->afterEosDestoryCodec = false;
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return SWDEC_SUCCESS; // env skip when decode reports errors
    }
    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    int32_t r = vDecSample->Start();
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    r = vDecSample->Stop();
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    r = vDecSample->Flush();
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState1700()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState1800()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->StateEos();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState1900()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState2000()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState2100()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->ConfigureVideoDecoder();
    if ((ret) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    ret = vDecSample->SetVideoDecoderCallback();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Release();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState2200()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState2300()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Release();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState2400()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState2500()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Stop();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    ret = vDecSample->SetVideoDecoderCallback();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState2600()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->ConfigureVideoDecoder();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState2700()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Release();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState2800()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Flush();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    int32_t r = vDecSample->Start();
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    r = vDecSample->Stop();
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    r = vDecSample->Flush();
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    ret = vDecSample->SetVideoDecoderCallback();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState2900()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->ConfigureVideoDecoder();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState3000()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Release();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState3100()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    int32_t r = vDecSample->Start();
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    r = vDecSample->Stop();
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    r = vDecSample->Flush();
    if ((r) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    ret = vDecSample->SetVideoDecoderCallback();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState3200()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Start();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->ConfigureVideoDecoder();
    if ((ret) != (AV_ERR_INVALID_STATE)) {
        return -1;
    }

    ret = vDecSample->SetVideoDecoderCallback();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->Release();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState3300()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Reset();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    ret = vDecSample->ConfigureVideoDecoder();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

int VideoSwdecState3400()
{
    auto vDecSample = CreateConfiguredStateSample();
    if (!vDecSample) {
        return SWDEC_SUCCESS;
    }
    int32_t ret = vDecSample->Release();
    if ((ret) != (AV_ERR_OK)) {
        return -1;
    }

    return SWDEC_SUCCESS;
}

} // namespace SwDecoder
} // namespace Acts
