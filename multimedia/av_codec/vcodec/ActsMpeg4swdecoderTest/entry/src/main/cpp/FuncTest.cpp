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
#include <iostream>
#include <string>
#include  <multimedia/player_framework/native_avcodec_videodecoder.h>
#include  <multimedia/player_framework/native_averrors.h>
#include "VideodecApi11SampleTest.h"
#include  <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avformat.h>
#include "include/VideodecApi11SampleTest.h"
#include <include/FuncTest.h>
#include <unistd.h>

#ifdef SUPPORT_DRM
#include <native_mediakeysession.h>
#include <native_mediakeysystem.h>
#endif

#define MAX_THREAD 16

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace OHOS {
namespace Media {
constexpr uint32_t THIRTY = 30;
constexpr uint32_t DEFAULT_WIDTHVALUE = 1920;
constexpr uint32_t DEFAULT_HEIGHTVALUE = 1080;
class Mpeg4SwdecFuncNdkTest {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();
};

namespace {
static OH_AVCapability *cap_mpeg4 = nullptr;
static string g_codecNameMpeg4 = "";
} // namespace

static const char *INP_DIR_1080_30 = "/data/storage/el2/base/haps/entry_test/files/mpeg4_main@level4_1920x1080_30.m4v";

void SetUpTestCase()
{
    if (cap_mpeg4 == nullptr) {
        cap_mpeg4 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4_PART2, false, SOFTWARE);
        if (cap_mpeg4 != nullptr) {
            g_codecNameMpeg4 = OH_AVCapability_GetName(cap_mpeg4);
            cout << "g_codecNameMpeg4: " << g_codecNameMpeg4 << endl;
        }
    }
}

void Mpeg4SwdecFuncNdkTest::TearDownTestCase() {}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0010
 * @tc.number VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0010()
{
    SetUpTestCase();
    if (cap_mpeg4 == nullptr) {
        return 0;
    }
    if (cap_mpeg4 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTHVALUE;
        vDecSample->defaultHeight = DEFAULT_HEIGHTVALUE;
        vDecSample->defaultFrameRate = THIRTY;
        vDecSample->enbleSyncMode = 1;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        if (AV_ERR_OK != vDecSample -> CreateVideoDecoder(g_codecNameMpeg4)) {
            return -1;
        }
        if (AV_ERR_OK != vDecSample -> ConfigureVideoDecoder()) {
            return -1;
        }
        if (AV_ERR_OK != vDecSample -> StartSyncVideoDecoder()) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample -> errCount != 0) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0020
 * @tc.number VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0020()
{
    SetUpTestCase();
    if (cap_mpeg4 == nullptr) {
        return 0;
    }
    if (cap_mpeg4 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTHVALUE;
        vDecSample->defaultHeight = DEFAULT_HEIGHTVALUE;
        vDecSample->defaultFrameRate = THIRTY;
        vDecSample->enbleSyncMode = 1;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV21;
        if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecNameMpeg4)) {
            return -1;
        }
        if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) {
            return -1;
        }
        if (AV_ERR_OK != vDecSample->StartSyncVideoDecoder()) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample -> errCount!=0) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0040
 * @tc.number VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_DECODE_SYNC_SWMPEG4_FUNC_0040()
{
    SetUpTestCase();
    if (cap_mpeg4 == nullptr) {
        return 0;
    }
    if (cap_mpeg4 != nullptr) {
        auto vDecSample = make_shared<VDecAPI11Sample>();
        vDecSample->inpDir = INP_DIR_1080_30;
        vDecSample->defaultWidth = DEFAULT_WIDTHVALUE;
        vDecSample->defaultHeight = DEFAULT_HEIGHTVALUE;
        vDecSample->defaultFrameRate = THIRTY;
        vDecSample->enbleSyncMode = 1;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_RGBA;
        if (AV_ERR_OK != vDecSample -> CreateVideoDecoder(g_codecNameMpeg4)) {
            return -1;
        }
        if (AV_ERR_OK != vDecSample -> ConfigureVideoDecoder()) {
            return -1;
        }
        if (AV_ERR_OK != vDecSample -> StartSyncVideoDecoder()) {
            return -1;
        }
        vDecSample->WaitForEOS();
        if (vDecSample->errCount!=0) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_MPEG4SWDEC_BLANK_FRAME_0010
 * @tc.number VIDEO_MPEG4SWDEC_BLANK_FRAME_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_MPEG4SWDEC_BLANK_FRAME_0010()
{
    SetUpTestCase();
    if (cap_mpeg4 == nullptr) {
        return 0;
    }
    if (cap_mpeg4 != nullptr) {
        if (!access("/system/lib64/media/", 0)) {
            auto vDecSample = make_shared<VDecAPI11Sample>();
            vDecSample->inpDir = INP_DIR_1080_30;
            vDecSample->defaultWidth = DEFAULT_WIDTHVALUE;
            vDecSample->defaultHeight = DEFAULT_HEIGHTVALUE;
            vDecSample->defaultFrameRate = THIRTY;
            vDecSample->enbleBlankFrame = 1;
            vDecSample->sfOutput = false;
            if (AV_ERR_OK != vDecSample -> RunVideoDec(g_codecNameMpeg4)) {
                return -1;
            }
            vDecSample->WaitForEOS();
            if (vDecSample -> errCount!=0) {
                return -1;
            }
        }
    }
    return 0;
}
}   // namespace Media
}   // namespace OHOS