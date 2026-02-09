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

#include "include/FuncTest.h"
#include <string>
#include <iostream>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include "include/videodec_api11_sample.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avformat.h>

#ifdef SUPPORT_DRM
#include "native_mediakeysession.h"
#include "native_mediakeysystem.h"
#endif

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static OH_AVCapability *g_cap263 = nullptr;
static string g_codecName263 = "";
static OH_AVCapability *g_cap264 = nullptr;
static string g_codecName264 = "";

constexpr uint32_t FRAMESIZE90 = 90;
constexpr uint32_t FRAMESIZE75 = 75;
constexpr uint32_t VIDEO_WIDTH_128 = 128;
constexpr uint32_t VIDEO_HEIGHT_96 = 96;
constexpr uint32_t VIDEO_WIDTH_20 = 20;
constexpr uint32_t VIDEO_HEIGHT_20 = 20;
constexpr uint32_t VIDEO_FRAME_RATE_30 = 30;

void InitH263Capability()
{
    if (g_cap263 == nullptr) {
        g_cap263 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_H263, false, SOFTWARE);
        if (g_cap263 != nullptr) {
            g_codecName263 = OH_AVCapability_GetName(g_cap263);
            cout << "g_codecName263: " << g_codecName263 << endl;
        }
    }
    if (g_cap264 == nullptr) {
        g_cap264 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
        if (g_cap264 != nullptr) {
            g_codecName264 = OH_AVCapability_GetName(g_cap264);
            cout << "g_codecName264: " << g_codecName264 << endl;
        }
    }
}

int VideoDecodeSyncSw263Func0010Test()
{
    InitH263Capability();
    if (g_cap263 == nullptr) {
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = "/data/storage/el2/base/files/media/profile0_level10_I_128x96.h263";
    vDecSample->defaultWidth = VIDEO_WIDTH_128;
    vDecSample->defaultHeight = VIDEO_HEIGHT_96;
    vDecSample->defaultFrameRate = VIDEO_FRAME_RATE_30;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
    
    if (vDecSample->CreateVideoDecoder(g_codecName263) != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->StartSyncVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    
    vDecSample->WaitForEOS();
    
    if (vDecSample->errCount != 0) {
        return -1;
    }
    if (vDecSample->outFrameCount != FRAMESIZE90) {
        return -1;
    }
    return 0;
}

int VideoDecodeSyncSw263Func0020Test()
{
    InitH263Capability();
    if (g_cap263 == nullptr) {
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = "/data/storage/el2/base/files/media/profile0_level10_I_128x96.h263";
    vDecSample->defaultWidth = VIDEO_WIDTH_128;
    vDecSample->defaultHeight = VIDEO_HEIGHT_96;
    vDecSample->defaultFrameRate = VIDEO_FRAME_RATE_30;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV21;
    
    if (vDecSample->CreateVideoDecoder(g_codecName263) != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->StartSyncVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    
    vDecSample->WaitForEOS();
    
    if (vDecSample->errCount != 0) {
        return -1;
    }
    if (vDecSample->outFrameCount != FRAMESIZE90) {
        return -1;
    }
    return 0;
}

int VideoDecodeSyncSw263Func0040Test()
{
    InitH263Capability();
    if (g_cap263 == nullptr) {
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = "/data/storage/el2/base/files/media/profile0_level10_I_128x96.h263";
    vDecSample->defaultWidth = VIDEO_WIDTH_128;
    vDecSample->defaultHeight = VIDEO_HEIGHT_96;
    vDecSample->defaultFrameRate = VIDEO_FRAME_RATE_30;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_RGBA;
    
    if (vDecSample->CreateVideoDecoder(g_codecName263) != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->StartSyncVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    
    vDecSample->WaitForEOS();
    
    if (vDecSample->errCount != 0) {
        return -1;
    }
    if (vDecSample->outFrameCount != FRAMESIZE90) {
        return -1;
    }
    return 0;
}

int VideoDecodeSw263BlankFrame0010Test()
{
    InitH263Capability();
    if (g_cap263 == nullptr) {
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = "/data/storage/el2/base/files/media/20x20.h263";
    vDecSample->defaultWidth = VIDEO_WIDTH_20;
    vDecSample->defaultHeight = VIDEO_HEIGHT_20;
    vDecSample->defaultFrameRate = VIDEO_FRAME_RATE_30;
    vDecSample->enbleBlankFrame = 1;
    
    if (vDecSample->CreateVideoDecoder("OH.Media.Codec.Decoder.Video.H263") != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        return -1;
    }
    
    if (vDecSample->StartVideoDecoder() != AV_ERR_OK) {
        return -1;
    }
    
    vDecSample->WaitForEOS();
    
    if (vDecSample->errCount != 0) {
        return -1;
    }
    if (vDecSample->outFrameCount != FRAMESIZE75) {
        return -1;
    }
    return 0;
}