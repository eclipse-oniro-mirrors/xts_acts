/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include <iostream>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include "include/videodec_api11_sample.h"

#ifdef SUPPORT_DRM
#include "native_mediakeysession.h"
#include "native_mediakeysystem.h"
#endif

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static OH_AVCapability* g_capMpeg2 = nullptr;
static string g_codecNameMpeg2 = "";

static const int MPEG2_DEFAULT_WIDTH = 1920;
static const int MPEG2_DEFAULT_HEIGHT = 1080;
static const int MPEG2_DEFAULT_FRAME_RATE = 30;

void InitMpeg2Capability()
{
    if (g_capMpeg2 == nullptr) {
        g_capMpeg2 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
        if (g_capMpeg2 != nullptr) {
            g_codecNameMpeg2 = OH_AVCapability_GetName(g_capMpeg2);
            cout << "g_codecNameMpeg2: " << g_codecNameMpeg2 << endl;
        }
    }
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoDecodeSyncSwMpeg2Func0010()
{
    InitMpeg2Capability();
    if (g_capMpeg2 == nullptr) {
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = MPEG2_INPUT_FILE_PATH;
    vDecSample->defaultWidth = MPEG2_DEFAULT_WIDTH;
    vDecSample->defaultHeight = MPEG2_DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = MPEG2_DEFAULT_FRAME_RATE;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;

    if (vDecSample->CreateVideoDecoder(g_codecNameMpeg2) != AV_ERR_OK) {
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
    return AV_ERR_OK;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VideoDecodeSyncSwMpeg2Func0020()
{
    InitMpeg2Capability();
    if (g_capMpeg2 == nullptr) {
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = MPEG2_INPUT_FILE_PATH;
    vDecSample->defaultWidth = MPEG2_DEFAULT_WIDTH;
    vDecSample->defaultHeight = MPEG2_DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = MPEG2_DEFAULT_FRAME_RATE;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV21;

    if (vDecSample->CreateVideoDecoder(g_codecNameMpeg2) != AV_ERR_OK) {
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
    return AV_ERR_OK;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0040
 * @tc.number VIDEO_DECODE_SYNC_SWMPEG2_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoDecodeSyncSwMpeg2Func0040()
{
    InitMpeg2Capability();
    if (g_capMpeg2 == nullptr) {
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = MPEG2_INPUT_FILE_PATH;
    vDecSample->defaultWidth = MPEG2_DEFAULT_WIDTH;
    vDecSample->defaultHeight = MPEG2_DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = MPEG2_DEFAULT_FRAME_RATE;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_RGBA;

    if (vDecSample->CreateVideoDecoder(g_codecNameMpeg2) != AV_ERR_OK) {
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
    return AV_ERR_OK;
}

/**
 * @tc.name   VIDEO_DECODE_BLANK_FRAME_0010
 * @tc.number VIDEO_DECODE_BLANK_FRAME_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoDecodeBlankFrame0010()
{
    InitMpeg2Capability();
    if (g_capMpeg2 == nullptr) {
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = MPEG2_INPUT_FILE_PATH;
    vDecSample->defaultWidth = MPEG2_DEFAULT_WIDTH;
    vDecSample->defaultHeight = MPEG2_DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = MPEG2_DEFAULT_FRAME_RATE;
    vDecSample->enbleBlankFrame = 1;

    if (vDecSample->CreateVideoDecoder(g_codecNameMpeg2) != AV_ERR_OK) {
        return -1;
    }
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) {
        return -1;
    }
    return AV_ERR_OK;
}

/**
 * @tc.name   VIDEO_DECODE_BLANK_ADD_0010
 * @tc.number VIDEO_DECODE_BLANK_ADD_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoDecodeBlankAdd0010()
{
    InitMpeg2Capability();
    if (g_capMpeg2 == nullptr) {
        return 0;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    if (capability == nullptr) {
        return -1;
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_SIMPLE, MPEG2_LEVEL_LOW)) {
        return -1;
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_MAIN, MPEG2_LEVEL_MAIN)) {
        return -1;
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_SNR_SCALABLE, MPEG2_LEVEL_HIGH_1440)) {
        return -1;
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_SPATIALLY_SCALABLE, MPEG2_LEVEL_HIGH)) {
        return -1;
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_HIGH, MPEG2_LEVEL_HIGH)) {
        return -1;
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_422, MPEG2_LEVEL_HIGH)) {
        return -1;
    }
    return AV_ERR_OK;
}
