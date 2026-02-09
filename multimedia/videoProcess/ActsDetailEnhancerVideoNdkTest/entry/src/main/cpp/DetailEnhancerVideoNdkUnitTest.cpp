/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include <fstream>
#include <unistd.h>

#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/video_processing_engine/video_processing.h>
#include <multimedia/video_processing_engine/video_processing_types.h>
#include <native_buffer/buffer_common.h>
#include <native_buffer/native_buffer.h>
#include <native_drawing/drawing_region.h>
#include <native_window/external_window.h>
#include "include/OhosCommonTest.h"
#include "include/VideoSampleTest.h"

constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;
constexpr uint32_t DEFAULT_WIDTH = 1920;
constexpr uint32_t DEFAULT_HEIGHT = 1080;
constexpr uint64_t NV12_FMT_INDEX = 24;
constexpr int CREATE_TYPE = 0x4;

using namespace std;

namespace OHOS {
namespace Media {
namespace VideoProcessingEngine {

const VideoProcessing_ColorSpaceInfo SRC_INFO{
    .metadataType = OH_VIDEO_HDR_HDR10,
    .colorSpace = OH_COLORSPACE_BT2020_PQ_LIMIT,
    .pixelFormat = NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP,
};

const VideoProcessing_ColorSpaceInfo DST_INFO{
    .metadataType = OH_VIDEO_HDR_HLG,
    .colorSpace = OH_COLORSPACE_BT2020_PQ_LIMIT,
    .pixelFormat = NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP,
};

void OnErrorEmptyCallback(OH_VideoProcessing* handle, VideoProcessing_ErrorCode errorCode, void* userData) {}

void OnError(OH_VideoProcessing* handle, VideoProcessing_ErrorCode errorCode, void* userData) {}

void OnState(OH_VideoProcessing* instance, VideoProcessing_State state, void* userData) {}

void OnNewOutputBuffer(OH_VideoProcessing* instance, uint32_t index, void* userData) {}

int64_t GetSystemTime()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = reinterpret_cast<int64_t>(now.tv_sec) * NANOS_IN_SECOND + now.tv_nsec;
    return nanoTime / NANOS_IN_MICRO;
}

uint32_t FlushSurf(OHNativeWindowBuffer* ohNativeWindowBuffer, OHNativeWindow* window)
{
    struct Region region;
    struct Region::Rect* rect = new Region::Rect();
    rect->x = 0;
    rect->y = 0;
    rect->w = DEFAULT_WIDTH;
    rect->h = DEFAULT_HEIGHT;
    region.rects = rect;
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_UI_TIMESTAMP, GetSystemTime());
    int32_t err = OH_NativeWindow_NativeWindowFlushBuffer(window, ohNativeWindowBuffer, -1, region);
    delete rect;
    if (err != 0) {
        cout << "FlushBuffer failed" << endl;
        return 1;
    }
    return 0;
}

// initialize context with nullptr
/**
 * @tc.name   VpeVideoNdk01
 * @tc.number VpeVideoNdk01
 * @tc.desc   VpeVideoNdk01
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk01()
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    ret = OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    return VIDEO_PROCESSING_SUCCESS;
}

// create context without initialization
/**
 * @tc.name   VpeVideoNdk02
 * @tc.number VpeVideoNdk02
 * @tc.desc   VpeVideoNdk02
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk02()
{
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_Destroy(instance);
    return VIDEO_PROCESSING_SUCCESS;
}

// initialize context with wrong type
/**
 * @tc.name   VpeVideoNdk03
 * @tc.number VpeVideoNdk03
 * @tc.desc   VpeVideoNdk03
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk03()
{
    int badCreateType = 0x3; // 3 is not support
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    ret = OH_VideoProcessing_Create(&instance, badCreateType);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    return VIDEO_PROCESSING_SUCCESS;
}

// destroy context without create
/**
 * @tc.name   VpeVideoNdk05
 * @tc.number VpeVideoNdk05
 * @tc.desc   VpeVideoNdk05
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk05()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}


// destroy context without create or initialize
/**
 * @tc.name   VpeVideoNdk06
 * @tc.number VpeVideoNdk06
 * @tc.desc   VpeVideoNdk06
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk06()
{
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    return VIDEO_PROCESSING_SUCCESS;
}

// support check with null
/**
 * @tc.name   VpeVideoNdk07
 * @tc.number VpeVideoNdk07
 * @tc.desc   VpeVideoNdk07
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk07()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(nullptr, nullptr);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// support check
/**
 * @tc.name   VpeVideoNdk08
 * @tc.number VpeVideoNdk08
 * @tc.desc   VpeVideoNdk08
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk08()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, &DST_INFO);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// support check 2
/**
 * @tc.name   VpeVideoNdk09
 * @tc.number VpeVideoNdk09
 * @tc.desc   VpeVideoNdk09
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk09()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, nullptr);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// support check 3
/**
 * @tc.name   VpeVideoNdk10
 * @tc.number VpeVideoNdk10
 * @tc.desc   VpeVideoNdk10
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk10()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(nullptr, &DST_INFO);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// metagen check
/**
 * @tc.name   VpeVideoNdk11
 * @tc.number VpeVideoNdk11
 * @tc.desc   VpeVideoNdk11
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk11()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(nullptr);
    ASSERT_FALSE(ret);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// metagen check 2
/**
 * @tc.name   VpeVideoNdk12
 * @tc.number VpeVideoNdk12
 * @tc.desc   VpeVideoNdk12
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk12()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO);
    ASSERT_FALSE(ret);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// metagen check 3
/**
 * @tc.name   VpeVideoNdk13
 * @tc.number VpeVideoNdk13
 * @tc.desc   VpeVideoNdk13
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk13()
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(&DST_INFO);
    ASSERT_FALSE(ret);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set parameter to nullptr
/**
 * @tc.name   VpeVideoNdk14
 * @tc.number VpeVideoNdk14
 * @tc.desc   VpeVideoNdk14
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk14()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set parameter quality level to high
/**
 * @tc.name   VpeVideoNdk15
 * @tc.number VpeVideoNdk15
 * @tc.desc   VpeVideoNdk15
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk15()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set parameter quality level to medium
/**
 * @tc.name   VpeVideoNdk16
 * @tc.number VpeVideoNdk16
 * @tc.desc   VpeVideoNdk16
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk16()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_MEDIUM);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set parameter quality level to low
/**
 * @tc.name   VpeVideoNdk17
 * @tc.number VpeVideoNdk17
 * @tc.desc   VpeVideoNdk17
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk17()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_LOW);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set parameter quality level to none
/**
 * @tc.name   VpeVideoNdk18
 * @tc.number VpeVideoNdk18
 * @tc.desc   VpeVideoNdk18
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk18()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_NONE);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}


// get parameter to non-nullptr
/**
 * @tc.name   VpeVideoNdk19
 * @tc.number VpeVideoNdk19
 * @tc.desc   VpeVideoNdk19
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk19()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// get parameter to nullptr
/**
 * @tc.name   VpeVideoNdk20
 * @tc.number VpeVideoNdk20
 * @tc.desc   VpeVideoNdk20
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk20()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// get parameter after setting to high
/**
 * @tc.name   VpeVideoNdk21
 * @tc.number VpeVideoNdk21
 * @tc.desc   VpeVideoNdk21
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk21()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OH_AVFormat* parameterGot = OH_AVFormat_Create();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetParameter(instance, parameterGot);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set surface with surface from another instance
/**
 * @tc.name   VpeVideoNdk22
 * @tc.number VpeVideoNdk22
 * @tc.desc   VpeVideoNdk22
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk22()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetSurface(instance, window2);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// set surface with nullptr
/**
 * @tc.name   VpeVideoNdk23
 * @tc.number VpeVideoNdk23
 * @tc.desc   VpeVideoNdk23
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk23()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OHNativeWindow* window = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetSurface(instance, window);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// get surface to nullptr
/**
 * @tc.name   VpeVideoNdk24
 * @tc.number VpeVideoNdk24
 * @tc.desc   VpeVideoNdk24
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk24()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OHNativeWindow* window = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetSurface(instance, &window);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// create callback function
/**
 * @tc.name   VpeVideoNdk25
 * @tc.number VpeVideoNdk25
 * @tc.desc   VpeVideoNdk25
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk25()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// create and destroy callback function
/**
 * @tc.name   VpeVideoNdk26
 * @tc.number VpeVideoNdk26
 * @tc.desc   VpeVideoNdk26
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk26()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Destroy(callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// destroy callback without create
/**
 * @tc.name   VpeVideoNdk27
 * @tc.number VpeVideoNdk27
 * @tc.desc   VpeVideoNdk27
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk27()
{
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Destroy(callback);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    return VIDEO_PROCESSING_SUCCESS;
}

// create callback function then register
/**
 * @tc.name   VpeVideoNdk28
 * @tc.number VpeVideoNdk28
 * @tc.desc   VpeVideoNdk28
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk28()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnError(callback, OnError);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnState(callback, OnState);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    ret = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// create callback but register null function
/**
 * @tc.name   VpeVideoNdk29
 * @tc.number VpeVideoNdk29
 * @tc.desc   VpeVideoNdk29
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk29()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnError(callback, nullptr);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnState(callback, nullptr);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, nullptr);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    ret = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessingCallback_Destroy(callback);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// createa and destroy callback function with register
/**
 * @tc.name   VpeVideoNdk30
 * @tc.number VpeVideoNdk30
 * @tc.desc   VpeVideoNdk30
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk30()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_Destroy(callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// create callback and register but instance is nullptr
/**
 * @tc.name   VpeVideoNdk31
 * @tc.number VpeVideoNdk31
 * @tc.desc   VpeVideoNdk31
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk31()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnError(callback, OnError);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnState(callback, OnState);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// create callback and register but callback is nullptr
/**
 * @tc.name   VpeVideoNdk32
 * @tc.number VpeVideoNdk32
 * @tc.desc   VpeVideoNdk32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk32()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnError(callback, OnError);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnState(callback, OnState);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    ret = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// start processing with flush surface then stop
/**
 * @tc.name   VpeVideoNdk33
 * @tc.number VpeVideoNdk33
 * @tc.desc   VpeVideoNdk33
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk33()
{
    OHNativeWindowBuffer* ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Start(instance);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NV12_FMT_INDEX);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(window, &ohNativeWindowBuffer, &fenceFd);
    FlushSurf(ohNativeWindowBuffer, window);
    ret = OH_VideoProcessing_Stop(instance);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// bind on null callback
/**
 * @tc.name   VpeVideoNdk34
 * @tc.number VpeVideoNdk34
 * @tc.desc   VpeVideoNdk34
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk34()
{
    OHNativeWindowBuffer* ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, nullptr);
    OH_VideoProcessingCallback_BindOnState(callback, nullptr);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, nullptr);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Start(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NV12_FMT_INDEX);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(window, &ohNativeWindowBuffer, &fenceFd);
    FlushSurf(ohNativeWindowBuffer, window);
    ret = OH_VideoProcessing_Stop(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_Destroy(instance2);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// register null callback
/**
 * @tc.name   VpeVideoNdk342
 * @tc.number VpeVideoNdk342
 * @tc.desc   VpeVideoNdk342
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk342()
{
    OHNativeWindowBuffer* ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    OH_VideoProcessing_RegisterCallback(instance, nullptr, &userData);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(
        parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Start(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NV12_FMT_INDEX);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(window, &ohNativeWindowBuffer, &fenceFd);
    FlushSurf(ohNativeWindowBuffer, window);
    ret = OH_VideoProcessing_Stop(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_Destroy(instance2);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// call output buffer
/**
 * @tc.name   VpeVideoNdk35
 * @tc.number VpeVideoNdk35
 * @tc.desc   VpeVideoNdk35
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk35()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_RenderOutputBuffer(instance, 0);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// bind callback after start
/**
 * @tc.name   VpeVideoNdk37
 * @tc.number VpeVideoNdk37
 * @tc.desc   VpeVideoNdk37
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk37()
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Start(instance);
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnError(nullptr, OnErrorEmptyCallback);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
    return VIDEO_PROCESSING_SUCCESS;
}

// sample multi thread start
/**
 * @tc.name   VpeVideoNdk38
 * @tc.number VpeVideoNdk38
 * @tc.desc   VpeVideoNdk38
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VpeVideoNdk38()
{
    std::unique_ptr<VideoSample> sample = std::make_unique<VideoSample>();
    sample->SetQualityLevel(VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessParam param = { NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P, 480,  360,
                                NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P, 1280, 720 };
    int32_t ret = sample->InitVideoSample(param);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    sample->StartProcess();
    EXPECT_EQ(sample->WaitAndStopSample(), VIDEO_PROCESSING_SUCCESS);
    return VIDEO_PROCESSING_SUCCESS;
}


} // namespace VideoProcessingEngine
} // namespace Media
} // namespace OHOS
