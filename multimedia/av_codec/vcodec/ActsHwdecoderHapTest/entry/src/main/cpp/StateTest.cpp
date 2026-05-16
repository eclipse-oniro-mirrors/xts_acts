/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <atomic>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <multimedia/player_framework/native_avcapability.h>
#include <mutex>
#include <queue>
#include <string>
#include <thread>
#include "include/CommonTool.h"

#include "VideoDecNdkSample.h"
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
namespace OHOS {
namespace Media {

namespace {
OH_AVCapability* cap = nullptr;
VDecNdkSample* vDecSample = nullptr;
} // namespace

namespace StateTest {
void SetUp(void)
{
    vDecSample = new VDecNdkSample();
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    string codeName = OH_AVCapability_GetName(cap);
    cout << "codeName: " << codeName << endl;
    int32_t ret = vDecSample->CreateVideoDecoder(codeName);
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->inpDir = "/data/storage/el2/base/files/1920_1080_10_30Mb.h264";
}
void TearDown(void)
{
    vDecSample->Release();
    delete vDecSample;
    vDecSample = nullptr;
}
} // namespace StateTest

/**
 * @tc.name   VIDEO_HWDEC_STATE_0100
 * @tc.number VIDEO_HWDEC_STATE_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_0100()
{
    int32_t ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0101
 * @tc.number VIDEO_HWDEC_STATE_0101
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_0101()
{
    int32_t ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0200
 * @tc.number VIDEO_HWDEC_STATE_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_0200()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0300
 * @tc.number VIDEO_HWDEC_STATE_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_0300()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0400
 * @tc.number VIDEO_HWDEC_STATE_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_0400()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0500
 * @tc.number VIDEO_HWDEC_STATE_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_0500()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0600
 * @tc.number VIDEO_HWDEC_STATE_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_0600()
{
    vDecSample->afterEosDestroyCodec = false;
    int32_t ret = vDecSample->StartVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0700
 * @tc.number VIDEO_HWDEC_STATE_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_0700()
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0800
 * @tc.number VIDEO_HWDEC_STATE_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_0800()
{
    int32_t ret = vDecSample->StartVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0900
 * @tc.number VIDEO_HWDEC_STATE_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_0900()
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1000
 * @tc.number VIDEO_HWDEC_STATE_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_1000()
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1100
 * @tc.number VIDEO_HWDEC_STATE_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_1100()
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1200
 * @tc.number VIDEO_HWDEC_STATE_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_1200()
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1300
 * @tc.number VIDEO_HWDEC_STATE_1300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_1300()
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1400
 * @tc.number VIDEO_HWDEC_STATE_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_1400()
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1500
 * @tc.number VIDEO_HWDEC_STATE_1500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_1500()
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1600
 * @tc.number VIDEO_HWDEC_STATE_1600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_1600()
{
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    ASSERT_EQ(0, vDecSample->errCount);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1700
 * @tc.number VIDEO_HWDEC_STATE_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_1700()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1800
 * @tc.number VIDEO_HWDEC_STATE_1800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_1800()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->StateEos();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1900
 * @tc.number VIDEO_HWDEC_STATE_1900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_1900()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2000
 * @tc.number VIDEO_HWDEC_STATE_2000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_2000()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2100
 * @tc.number VIDEO_HWDEC_STATE_2100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_2100()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2200
 * @tc.number VIDEO_HWDEC_STATE_2200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_2200()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    cout << "set callback" << endl;
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2300
 * @tc.number VIDEO_HWDEC_STATE_2300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_2300()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2400
 * @tc.number VIDEO_HWDEC_STATE_2400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_2400()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2500
 * @tc.number VIDEO_HWDEC_STATE_2500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_2500()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2600
 * @tc.number VIDEO_HWDEC_STATE_2600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_2600()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2700
 * @tc.number VIDEO_HWDEC_STATE_2700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_2700()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2800
 * @tc.number VIDEO_HWDEC_STATE_2800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_2800()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2900
 * @tc.number VIDEO_HWDEC_STATE_2900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_2900()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3000
 * @tc.number VIDEO_HWDEC_STATE_3000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_3000()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3100
 * @tc.number VIDEO_HWDEC_STATE_3100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_3100()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Stop();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->Flush();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3200
 * @tc.number VIDEO_HWDEC_STATE_3200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_3200()
{
    int32_t ret = vDecSample->Start();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
    ret = vDecSample->SetVideoDecoderCallback();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3300
 * @tc.number VIDEO_HWDEC_STATE_3300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_3300()
{
    int32_t ret = vDecSample->Reset();
    ASSERT_EQ(AV_ERR_OK, ret);
    ret = vDecSample->ConfigureVideoDecoder();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3400
 * @tc.number VIDEO_HWDEC_STATE_3400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_STATE_3400()
{
    int32_t ret = vDecSample->Release();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3500
 * @tc.number VIDEO_HWDEC_STATE_3500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HWDEC_STATE_3500()
{
    vDecSample->inputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3600
 * @tc.number VIDEO_HWDEC_STATE_3600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HWDEC_STATE_3600()
{
    vDecSample->inputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3700
 * @tc.number VIDEO_HWDEC_STATE_3700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HWDEC_STATE_3700()
{
    vDecSample->outputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3800
 * @tc.number VIDEO_HWDEC_STATE_3800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HWDEC_STATE_3800()
{
    vDecSample->outputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3900
 * @tc.number VIDEO_HWDEC_STATE_3900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HWDEC_STATE_3900()
{
    vDecSample->sfOutput = true;
    vDecSample->inputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    ASSERT_EQ(AV_ERR_OK, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_4000
 * @tc.number VIDEO_HWDEC_STATE_4000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HWDEC_STATE_4000()
{
    vDecSample->sfOutput = true;
    vDecSample->inputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_4100
 * @tc.number VIDEO_HWDEC_STATE_4100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HWDEC_STATE_4100()
{
    vDecSample->sfOutput = true;
    vDecSample->outputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_4200
 * @tc.number VIDEO_HWDEC_STATE_4200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HWDEC_STATE_4200()
{
    vDecSample->sfOutput = true;
    vDecSample->outputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    ASSERT_EQ(AV_ERR_OK, ret);
    vDecSample->WaitForEOS();
    return SUCCESS_CODE;
}
} // namespace Media
} // namespace OHOS