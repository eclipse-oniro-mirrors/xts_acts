/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <iostream>
#include <atomic>
#include <fstream>
#include <mutex>
#include <queue>
#include <string>
#include <thread>

#include "videoenc_sample.h"
#include "avcodec_codec_name.h"
#include <multimedia/player_framework/native_avcapability.h>
#include "include/OhosCommonTest.h"
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

VEncNdkSample *vEncSample = NULL;
OH_AVCapability *cap = nullptr;
bool g_createCodecSuccess = false;

static void InitCapAndEncoder(void)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr) {
        vEncSample = new VEncNdkSample();
        const char *codeName = OH_AVCapability_GetName(cap);
        cout << "codecname: " << codeName << endl;
        int32_t ret = vEncSample->CreateVideoEncoder(codeName);
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->SetVideoEncoderCallback();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->ConfigureVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        g_createCodecSuccess = true;
    } else {
        cout << "can not get Capability" << endl;
    }
}

static void TestSetUp(void)
{
    InitCapAndEncoder();
}

void TestTearDownState(void)
{
    if (cap != nullptr) {
        vEncSample->Release();
        delete vEncSample;
        vEncSample = nullptr;
    }
}

static void TestSetUpTestCase(void) {}

static void TestTearDownTestCase(void) {}

int VideoEncodeState0100Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->SetVideoEncoderCallback();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState0101Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState0200Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState0300Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Release();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState0400Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState0500Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->SetVideoEncoderCallback();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState0600Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState0700Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Release();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState0800Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState0900Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState1000Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState1100Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState1200Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState1300Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Release();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->ConfigureVideoEncoder();
        ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState1400Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->ConfigureVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState1500Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Release();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState1600Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(0, vEncSample->errCount);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState1700Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState1800Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "flush ok" << endl;
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "start ok" << endl;
        ret = vEncSample->state_EOS();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState1900Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState2000Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState2100Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->ConfigureVideoEncoder();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->SetVideoEncoderCallback();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Release();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState2200Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "set callback" << endl;
        ret = vEncSample->SetVideoEncoderCallback();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState2300Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Release();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState2400Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState2500Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->SetVideoEncoderCallback();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState2600Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->ConfigureVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState2700Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Release();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState2800Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->SetVideoEncoderCallback();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState2900Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->ConfigureVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState3000Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Release();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState3100Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->Stop();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->Flush();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->SetVideoEncoderCallback();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState3200Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->ConfigureVideoEncoder();
        ASSERT_EQ(AV_ERR_INVALID_STATE, ret);
        ret = vEncSample->SetVideoEncoderCallback();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->Release();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState3300Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Reset();
        ASSERT_EQ(AV_ERR_OK, ret);
        ret = vEncSample->ConfigureVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState3400Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        int32_t ret = vEncSample->Release();
        ASSERT_EQ(AV_ERR_OK, ret);
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState3500Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        vEncSample->outputCallbackFlush = true;
        vEncSample->SURF_INPUT = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->WaitForEOS();
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState3600Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        vEncSample->outputCallbackStop = true;
        vEncSample->SURF_INPUT = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->WaitForEOS();
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState3700Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        vEncSample->inputCallbackFlush = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->WaitForEOS();
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState3800Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        vEncSample->inputCallbackStop = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->WaitForEOS();
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState3900Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        vEncSample->outputCallbackFlush = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->WaitForEOS();
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState4000Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        vEncSample->outputCallbackStop = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->WaitForEOS();
        return 0;
    } else {
        return 0;
    }
}

int VideoEncodeState4100Test()
{
    InitCapAndEncoder();
    if (cap != nullptr) {
        vEncSample->outputCallbackStop = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        ASSERT_EQ(AV_ERR_OK, ret);
        vEncSample->WaitForEOS();
        return 0;
    } else {
        return 0;
    }
}

void InitStateTest()
{
    TestSetUpTestCase();
}