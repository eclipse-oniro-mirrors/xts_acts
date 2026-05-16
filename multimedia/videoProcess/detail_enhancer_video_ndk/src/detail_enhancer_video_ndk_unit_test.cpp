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
#include <unistd.h>
#include <fstream>
#include <gtest/gtest.h>

#include "native_avformat.h"
#include "surface/window.h"
#include "external_window.h"

#include "video_processing.h"
#include "video_processing_impl.h"
#include "video_processing_capi_capability.h"
#include "video_processing_types.h"
#include "video_processing_callback_impl.h"
#include "video_processing_callback_native.h"
#include "video_sample.h"
#ifdef SKIA_ENABLE
#include "skia_impl.h"
#endif
#include "detail_enhancer_video_native.h"

constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;
constexpr uint32_t DEFAULT_WIDTH = 1920;
constexpr uint32_t DEFAULT_HEIGHT = 1080;
constexpr uint64_t NV12_FMT_INDEX = 24;
constexpr int CREATE_TYPE = 0x4;

using namespace std;
using namespace testing::ext;

namespace OHOS {
namespace Media {
namespace VideoProcessingEngine {

const VideoProcessing_ColorSpaceInfo SRC_INFO {
    .metadataType = OH_VIDEO_HDR_HDR10,
    .colorSpace = OH_COLORSPACE_BT2020_PQ_LIMIT,
    .pixelFormat = NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP,
};

const VideoProcessing_ColorSpaceInfo DST_INFO {
    .metadataType = OH_VIDEO_HDR_HLG,
    .colorSpace = OH_COLORSPACE_BT2020_PQ_LIMIT,
    .pixelFormat = NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP,
};

BufferRequestConfig bufferConfig1 = {
    .width = 0,
    .height = 0,
    .strideAlignment = 0x8,
    .format = GraphicPixelFormat::GRAPHIC_PIXEL_FMT_RGBA_8888,
    .usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA,
    .timeout = 0,
};

BufferRequestConfig bufferConfig2 = {
    .width = 400,
    .height = 0,
    .strideAlignment = 0x8,
    .format = GraphicPixelFormat::GRAPHIC_PIXEL_FMT_RGBA_8888,
    .usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA,
    .timeout = 0,
};

BufferRequestConfig bufferConfig4 = {
    .width = 0,
    .height = 400,
    .strideAlignment = 0x8,
    .format = GraphicPixelFormat::GRAPHIC_PIXEL_FMT_RGBA_8888,
    .usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA,
    .timeout = 0,
};

BufferRequestConfig bufferConfig3 = {
    .width = 400,
    .height = 400,
    .strideAlignment = 0x8,
    .format = GraphicPixelFormat::GRAPHIC_PIXEL_FMT_RGBA_8888,
    .usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA,
    .timeout = 0,
};

static std::condition_variable g_Cond;

class TestConsumerListener : public IBufferConsumerListener {
public:
    TestConsumerListener(sptr<Surface> cs, std::string_view name);
    ~TestConsumerListener();
    void OnBufferAvailable() override;
};

TestConsumerListener::TestConsumerListener(sptr<Surface> cs, std::string_view name) {}

TestConsumerListener::~TestConsumerListener() {}

void TestConsumerListener::OnBufferAvailable() {}

void OnErrorEmptyCallback(OH_VideoProcessing* handle, VideoProcessing_ErrorCode errorCode, void* userData)
{
}

void OnError(OH_VideoProcessing* handle, VideoProcessing_ErrorCode errorCode, void* userData)
{
}

void OnState(OH_VideoProcessing* instance, VideoProcessing_State state, void* userData)
{
}

void OnNewOutputBuffer(OH_VideoProcessing* instance, uint32_t index, void* userData)
{
}

class DetailEnhancerVideoNdkUnitTest : public testing::Test {
public:
    static void SetUpTestCase(void);
    static void TearDownTestCase(void);
    void SetUp();
    void TearDown();
    uint32_t FlushSurf(OHNativeWindowBuffer* ohNativeWindowBuffer, OHNativeWindow* window);
};

void DetailEnhancerVideoNdkUnitTest::SetUpTestCase(void)
{
}

void DetailEnhancerVideoNdkUnitTest::TearDownTestCase(void)
{
}

void DetailEnhancerVideoNdkUnitTest::SetUp(void)
{
}

void DetailEnhancerVideoNdkUnitTest::TearDown(void)
{
}

int64_t GetSystemTime()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = reinterpret_cast<int64_t>(now.tv_sec) * NANOS_IN_SECOND + now.tv_nsec;
    return nanoTime / NANOS_IN_MICRO;
}

uint32_t DetailEnhancerVideoNdkUnitTest::FlushSurf(OHNativeWindowBuffer* ohNativeWindowBuffer, OHNativeWindow* window)
{
    struct Region region;
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0;
    rect->y = 0;
    rect->w = DEFAULT_WIDTH;
    rect->h = DEFAULT_HEIGHT;
    region.rects = rect;
    NativeWindowHandleOpt(window, SET_UI_TIMESTAMP, GetSystemTime());
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
 * @tc.name   vpeVideoNdk_01
 * @tc.number vpeVideoNdk_01
 * @tc.desc   vpeVideoNdk_01
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_01, TestSize.Level1)
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    ret = OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
}

// initialize context with nullptr impl
/**
 * @tc.name   vpeVideoNdk_01_1
 * @tc.number vpeVideoNdk_01_1
 * @tc.desc   vpeVideoNdk_01_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_01_1, TestSize.Level1)
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    ret = OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing::Destroy(instance);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
}

// create context without initialization
/**
 * @tc.name   vpeVideoNdk_02
 * @tc.number vpeVideoNdk_02
 * @tc.desc   vpeVideoNdk_02
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_02, TestSize.Level1)
{
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_Destroy(instance);
}

// create context impl
/**
 * @tc.name   vpeVideoNdk_02_1
 * @tc.number vpeVideoNdk_02_1
 * @tc.desc   vpeVideoNdk_02_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_02_1, TestSize.Level1)
{
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing::Create(&instance, CREATE_TYPE,
        VideoProcessingCapiCapability::GetOpenGLContext());
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing::Destroy(instance);
}

// initialize context with wrong type impl
/**
 * @tc.name   vpeVideoNdk_03_1
 * @tc.number vpeVideoNdk_03_1
 * @tc.desc   vpeVideoNdk_03_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_03_1, TestSize.Level1)
{
    int badCreateType = 0x3; // 3 is not support
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    ret = OH_VideoProcessing::Create(&instance, badCreateType, VideoProcessingCapiCapability::GetOpenGLContext());
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing::Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_DeinitializeEnvironment();
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
}

// destroy context without create
/**
 * @tc.name   vpeVideoNdk_05
 * @tc.number vpeVideoNdk_05
 * @tc.desc   vpeVideoNdk_05
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_05, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// destroy context without create impl
/**
 * @tc.name   vpeVideoNdk_05_1
 * @tc.number vpeVideoNdk_05_1
 * @tc.desc   vpeVideoNdk_05_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_05_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing::Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// destroy context without create or initialize
/**
 * @tc.name   vpeVideoNdk_06
 * @tc.number vpeVideoNdk_06
 * @tc.desc   vpeVideoNdk_06
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_06, TestSize.Level1)
{
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
}

// destroy context without create or initialize impl
/**
 * @tc.name   vpeVideoNdk_06_1
 * @tc.number vpeVideoNdk_06_1
 * @tc.desc   vpeVideoNdk_06_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_06_1, TestSize.Level1)
{
    OH_VideoProcessing* instance = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing::Destroy(instance);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
}

// support check with null
/**
 * @tc.name   vpeVideoNdk_07
 * @tc.number vpeVideoNdk_07
 * @tc.desc   vpeVideoNdk_07
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_07, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(nullptr, nullptr);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// support check
/**
 * @tc.name   vpeVideoNdk_08
 * @tc.number vpeVideoNdk_08
 * @tc.desc   vpeVideoNdk_08
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_08, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, &DST_INFO);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// support check 2
/**
 * @tc.name   vpeVideoNdk_09
 * @tc.number vpeVideoNdk_09
 * @tc.desc   vpeVideoNdk_09
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_09, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, nullptr);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// support check 3
/**
 * @tc.name   vpeVideoNdk_10
 * @tc.number vpeVideoNdk_10
 * @tc.desc   vpeVideoNdk_10
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_10, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool res = OH_VideoProcessing_IsColorSpaceConversionSupported(nullptr, &DST_INFO);
    ASSERT_FALSE(res);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// metagen check
/**
 * @tc.name   vpeVideoNdk_11
 * @tc.number vpeVideoNdk_11
 * @tc.desc   vpeVideoNdk_11
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_11, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(nullptr);
    ASSERT_FALSE(ret);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// metagen check 2
/**
 * @tc.name   vpeVideoNdk_12
 * @tc.number vpeVideoNdk_12
 * @tc.desc   vpeVideoNdk_12
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_12, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO);
    ASSERT_FALSE(ret);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// metagen check 3
/**
 * @tc.name   vpeVideoNdk_13
 * @tc.number vpeVideoNdk_13
 * @tc.desc   vpeVideoNdk_13
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_13, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(&DST_INFO);
    ASSERT_FALSE(ret);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set parameter to nullptr
/**
 * @tc.name   vpeVideoNdk_14
 * @tc.number vpeVideoNdk_14
 * @tc.desc   vpeVideoNdk_14
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_14, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set parameter to nullptr impl
/**
 * @tc.name   vpeVideoNdk_14_1
 * @tc.number vpeVideoNdk_14_1
 * @tc.desc   vpeVideoNdk_14_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_14_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_AVFormat* parameter = nullptr;
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->SetParameter(parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set parameter quality level to high
/**
 * @tc.name   vpeVideoNdk_15
 * @tc.number vpeVideoNdk_15
 * @tc.desc   vpeVideoNdk_15
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_15, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set parameter quality level to high impl
/**
 * @tc.name   vpeVideoNdk_15_1
 * @tc.number vpeVideoNdk_15_1
 * @tc.desc   vpeVideoNdk_15_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_15_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->SetParameter(parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set parameter quality level to medium
/**
 * @tc.name   vpeVideoNdk_16
 * @tc.number vpeVideoNdk_16
 * @tc.desc   vpeVideoNdk_16
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_16, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_MEDIUM);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set parameter quality level to medium impl
/**
 * @tc.name   vpeVideoNdk_16_1
 * @tc.number vpeVideoNdk_16_1
 * @tc.desc   vpeVideoNdk_16_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_16_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_MEDIUM);
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->SetParameter(parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set parameter quality level to low
/**
 * @tc.name   vpeVideoNdk_17
 * @tc.number vpeVideoNdk_17
 * @tc.desc   vpeVideoNdk_17
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_17, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_LOW);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set parameter quality level to low impl
/**
 * @tc.name   vpeVideoNdk_17_1
 * @tc.number vpeVideoNdk_17_1
 * @tc.desc   vpeVideoNdk_17_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_17_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_LOW);
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->SetParameter(parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set parameter quality level to none
/**
 * @tc.name   vpeVideoNdk_18
 * @tc.number vpeVideoNdk_18
 * @tc.desc   vpeVideoNdk_18
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_18, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_NONE);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetParameter(instance, parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set parameter quality level to none impl
/**
 * @tc.name   vpeVideoNdk_18_1
 * @tc.number vpeVideoNdk_18_1
 * @tc.desc   vpeVideoNdk_18_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_18_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_NONE);
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->SetParameter(parameter);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// get parameter to non-nullptr impl
/**
 * @tc.name   vpeVideoNdk_19_1
 * @tc.number vpeVideoNdk_19_1
 * @tc.desc   vpeVideoNdk_19_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_19_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_AVFormat* parameter = OH_AVFormat_Create();
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->GetParameter(parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// get parameter to nullptr
/**
 * @tc.name   vpeVideoNdk_20
 * @tc.number vpeVideoNdk_20
 * @tc.desc   vpeVideoNdk_20
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_20, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameter = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetParameter(instance, parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// get parameter to nullptr impl
/**
 * @tc.name   vpeVideoNdk_20_1
 * @tc.number vpeVideoNdk_20_1
 * @tc.desc   vpeVideoNdk_20_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_20_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_AVFormat* parameter = nullptr;
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->GetParameter(parameter);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// get parameter after setting to high
/**
 * @tc.name   vpeVideoNdk_21
 * @tc.number vpeVideoNdk_21
 * @tc.desc   vpeVideoNdk_21
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_21, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OH_AVFormat* parameterGot = OH_AVFormat_Create();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetParameter(instance, parameterGot);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// get parameter after setting to high impl
/**
 * @tc.name   vpeVideoNdk_21_1
 * @tc.number vpeVideoNdk_21_1
 * @tc.desc   vpeVideoNdk_21_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_21_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    instance->GetVideoProcessing()->SetParameter(parameterSetted);
    OH_AVFormat* parameterGot = OH_AVFormat_Create();
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->GetParameter(parameterGot);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set surface with surface from another instance
/**
 * @tc.name   vpeVideoNdk_22
 * @tc.number vpeVideoNdk_22
 * @tc.desc   vpeVideoNdk_22
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_22, TestSize.Level1)
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
}

// set surface with surface from another instance impl
/**
 * @tc.name   vpeVideoNdk_22_1
 * @tc.number vpeVideoNdk_22_1
 * @tc.desc   vpeVideoNdk_22_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_22_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_VideoProcessing::Create(&instance2, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    instance->GetVideoProcessing()->GetSurface(&window);
    instance->GetVideoProcessing()->GetSurface(&window2);
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->SetSurface(window2);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing::Destroy(instance2);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set surface with nullptr
/**
 * @tc.name   vpeVideoNdk_23
 * @tc.number vpeVideoNdk_23
 * @tc.desc   vpeVideoNdk_23
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_23, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OHNativeWindow* window = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetSurface(instance, window);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// set surface with nullptr impl
/**
 * @tc.name   vpeVideoNdk_23_1
 * @tc.number vpeVideoNdk_23_1
 * @tc.desc   vpeVideoNdk_23_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_23_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OHNativeWindow* window = nullptr;
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->SetSurface(window);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// get surface to nullptr
/**
 * @tc.name   vpeVideoNdk_24
 * @tc.number vpeVideoNdk_24
 * @tc.desc   vpeVideoNdk_24
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_24, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OHNativeWindow* window = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetSurface(instance, &window);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// get surface to nullptr impl
/**
 * @tc.name   vpeVideoNdk_24_1
 * @tc.number vpeVideoNdk_24_1
 * @tc.desc   vpeVideoNdk_24_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_24_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OHNativeWindow* window = nullptr;
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->GetSurface(&window);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// create callback function
/**
 * @tc.name   vpeVideoNdk_25
 * @tc.number vpeVideoNdk_25
 * @tc.desc   vpeVideoNdk_25
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_25, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// create callback function impl
/**
 * @tc.name   vpeVideoNdk_25_1
 * @tc.number vpeVideoNdk_25_1
 * @tc.desc   vpeVideoNdk_25_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_25_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = VideoProcessing_Callback::Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// create and destroy callback function
/**
 * @tc.name   vpeVideoNdk_26
 * @tc.number vpeVideoNdk_26
 * @tc.desc   vpeVideoNdk_26
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_26, TestSize.Level1)
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
}

// create and destroy callback function impl
/**
 * @tc.name   vpeVideoNdk_26_1
 * @tc.number vpeVideoNdk_26_1
 * @tc.desc   vpeVideoNdk_26_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_26_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_Callback::Create(&callback);
    VideoProcessing_ErrorCode ret = VideoProcessing_Callback::Destroy(callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// destroy callback without create
/**
 * @tc.name   vpeVideoNdk_27
 * @tc.number vpeVideoNdk_27
 * @tc.desc   vpeVideoNdk_27
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_27, TestSize.Level1)
{
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Destroy(callback);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
}

// destroy callback without create impl
/**
 * @tc.name   vpeVideoNdk_27_1
 * @tc.number vpeVideoNdk_27_1
 * @tc.desc   vpeVideoNdk_27_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_27_1, TestSize.Level1)
{
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = VideoProcessing_Callback::Destroy(callback);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
}

// create callback function then register
/**
 * @tc.name   vpeVideoNdk_28
 * @tc.number vpeVideoNdk_28
 * @tc.desc   vpeVideoNdk_28
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_28, TestSize.Level1)
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
}

// create callback function then register impl
/**
 * @tc.name   vpeVideoNdk_28_1
 * @tc.number vpeVideoNdk_28_1
 * @tc.desc   vpeVideoNdk_28_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_28_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = VideoProcessing_Callback::Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = callback->GetInnerCallback()->BindOnError(OnError);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = callback->GetInnerCallback()->BindOnState(OnState);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = callback->GetInnerCallback()->BindOnNewOutputBuffer(OnNewOutputBuffer);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    ret = instance->GetVideoProcessing()->RegisterCallback(callback, &userData);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    VideoProcessing_Callback::Destroy(callback);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// create callback but register null function
/**
 * @tc.name   vpeVideoNdk_29
 * @tc.number vpeVideoNdk_29
 * @tc.desc   vpeVideoNdk_29
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_29, TestSize.Level1)
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
}

// create callback but register null function impl
/**
 * @tc.name   vpeVideoNdk_29_1
 * @tc.number vpeVideoNdk_29_1
 * @tc.desc   vpeVideoNdk_29_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_29_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = VideoProcessing_Callback::Create(&callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = callback->GetInnerCallback()->BindOnError(nullptr);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = callback->GetInnerCallback()->BindOnState(nullptr);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    ret = callback->GetInnerCallback()->BindOnNewOutputBuffer(nullptr);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    ret = instance->GetVideoProcessing()->RegisterCallback(callback, &userData);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    VideoProcessing_Callback::Destroy(callback);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// createa and destroy callback function with register
/**
 * @tc.name   vpeVideoNdk_30
 * @tc.number vpeVideoNdk_30
 * @tc.desc   vpeVideoNdk_30
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_30, TestSize.Level1)
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
}

// createa and destroy callback function with register impl
/**
 * @tc.name   vpeVideoNdk_30_1
 * @tc.number vpeVideoNdk_30_1
 * @tc.desc   vpeVideoNdk_30_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_30_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_Callback::Create(&callback);
    callback->GetInnerCallback()->BindOnError(OnError);
    callback->GetInnerCallback()->BindOnState(OnState);
    callback->GetInnerCallback()->BindOnNewOutputBuffer(OnNewOutputBuffer);
    auto userData = nullptr;
    VideoProcessing_ErrorCode ret = instance->GetVideoProcessing()->RegisterCallback(callback, &userData);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = VideoProcessing_Callback::Destroy(callback);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// create callback and register but instance is nullptr
/**
 * @tc.name   vpeVideoNdk_31
 * @tc.number vpeVideoNdk_31
 * @tc.desc   vpeVideoNdk_31
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_31, TestSize.Level1)
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
}

// create callback and register but callback is nullptr
/**
 * @tc.name   vpeVideoNdk_32
 * @tc.number vpeVideoNdk_32
 * @tc.desc   vpeVideoNdk_32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_32, TestSize.Level1)
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
}

// start processing with flush surface then stop
/**
 * @tc.name   vpeVideoNdk_33
 * @tc.number vpeVideoNdk_33
 * @tc.desc   vpeVideoNdk_33
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_33, TestSize.Level1)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
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
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret =  OH_VideoProcessing_Start(instance);
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
}

// start processing with flush surface then stop impl
/**
 * @tc.name   vpeVideoNdk_33_1
 * @tc.number vpeVideoNdk_33_1
 * @tc.desc   vpeVideoNdk_33_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_33_1, TestSize.Level1)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_VideoProcessing::Create(&instance2, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_Callback::Create(&callback);
    callback->GetInnerCallback()->BindOnError(OnError);
    callback->GetInnerCallback()->BindOnState(OnState);
    callback->GetInnerCallback()->BindOnNewOutputBuffer(OnNewOutputBuffer);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    instance->GetVideoProcessing()->RegisterCallback(callback, &userData);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    instance->GetVideoProcessing()->SetParameter(parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    instance->GetVideoProcessing()->GetSurface(&window);
    instance->GetVideoProcessing()->GetSurface(&window2);
    instance->GetVideoProcessing()->SetSurface(window2);
    VideoProcessing_ErrorCode ret =  instance->GetVideoProcessing()->Start();
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NV12_FMT_INDEX);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(window, &ohNativeWindowBuffer, &fenceFd);
    FlushSurf(ohNativeWindowBuffer, window);
    ret = instance->GetVideoProcessing()->Stop();
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    VideoProcessing_Callback::Destroy(callback);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing::Destroy(instance2);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// bind on null callback
/**
 * @tc.name   vpeVideoNdk_34
 * @tc.number vpeVideoNdk_34
 * @tc.desc   vpeVideoNdk_34
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_34, TestSize.Level1)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
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
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret =  OH_VideoProcessing_Start(instance);
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
}

// bind on null callback impl
/**
 * @tc.name   vpeVideoNdk_34_1
 * @tc.number vpeVideoNdk_34_1
 * @tc.desc   vpeVideoNdk_34_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_34_1, TestSize.Level1)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_VideoProcessing::Create(&instance2, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_Callback::Create(&callback);
    callback->GetInnerCallback()->BindOnError(nullptr);
    callback->GetInnerCallback()->BindOnState(nullptr);
    callback->GetInnerCallback()->BindOnNewOutputBuffer(nullptr);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    instance->GetVideoProcessing()->RegisterCallback(callback, &userData);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    instance->GetVideoProcessing()->SetParameter(parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    instance->GetVideoProcessing()->GetSurface(&window);
    instance->GetVideoProcessing()->GetSurface(&window2);
    instance->GetVideoProcessing()->SetSurface(window2);
    VideoProcessing_ErrorCode ret =  instance->GetVideoProcessing()->Start();
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NV12_FMT_INDEX);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(window, &ohNativeWindowBuffer, &fenceFd);
    FlushSurf(ohNativeWindowBuffer, window);
    ret = instance->GetVideoProcessing()->Stop();
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    VideoProcessing_Callback::Destroy(callback);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing::Destroy(instance2);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// register null callback
/**
 * @tc.name   vpeVideoNdk_34_2
 * @tc.number vpeVideoNdk_34_2
 * @tc.desc   vpeVideoNdk_34_2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_34_2, TestSize.Level1)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback* callback = nullptr;
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    OH_VideoProcessing_RegisterCallback(instance, nullptr, &userData);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret =  OH_VideoProcessing_Start(instance);
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
}

// register null callback impl
/**
 * @tc.name   vpeVideoNdk_34_3
 * @tc.number vpeVideoNdk_34_3
 * @tc.desc   vpeVideoNdk_34_3
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_34_3, TestSize.Level1)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing* instance2 = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    OH_VideoProcessing::Create(&instance2, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    instance->GetVideoProcessing()->RegisterCallback(nullptr, &userData);
    OH_AVFormat* parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
        VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    instance->GetVideoProcessing()->SetParameter(parameterSetted);
    OHNativeWindow* window = nullptr;
    OHNativeWindow* window2 = nullptr;
    instance->GetVideoProcessing()->GetSurface(&window);
    instance->GetVideoProcessing()->GetSurface(&window2);
    instance->GetVideoProcessing()->SetSurface(window2);
    VideoProcessing_ErrorCode ret =  instance->GetVideoProcessing()->Start();
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NV12_FMT_INDEX);
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    int fenceFd = -1;
    OH_NativeWindow_NativeWindowRequestBuffer(window, &ohNativeWindowBuffer, &fenceFd);
    FlushSurf(ohNativeWindowBuffer, window);
    ret = instance->GetVideoProcessing()->Stop();
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing::Destroy(instance2);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// call output buffer
/**
 * @tc.name   vpeVideoNdk_35
 * @tc.number vpeVideoNdk_35
 * @tc.desc   vpeVideoNdk_35
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_35, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_RenderOutputBuffer(instance, 0);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// call output buffer impl
/**
 * @tc.name   vpeVideoNdk_35_1
 * @tc.number vpeVideoNdk_35_1
 * @tc.desc   vpeVideoNdk_35_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_35_1, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing::Create(&instance, CREATE_TYPE, VideoProcessingCapiCapability::GetOpenGLContext());
    instance->GetVideoProcessing()->RenderOutputBuffer(0);
    OH_VideoProcessing::Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// callback native
/**
 * @tc.name   vpeVideoNdk_36
 * @tc.number vpeVideoNdk_36
 * @tc.desc   vpeVideoNdk_36
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_36, TestSize.Level1)
{
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    auto callback = std::make_shared<VideoProcessingEngine::VideoProcessingCallbackNative>();
    callback->OnError(instance, VIDEO_PROCESSING_SUCCESS, nullptr);
    callback->OnState(instance, VIDEO_PROCESSING_STATE_RUNNING, nullptr);
    callback->OnNewOutputBuffer(instance, 0, nullptr);
}

sptr<SurfaceBuffer> CreateSurfaceBuffer(uint32_t pixelFormat, int32_t width, int32_t height)
{
    auto buffer = SurfaceBuffer::Create();
    if (buffer == nullptr) {
        return nullptr;
    }
    if (width <= 0 || height <= 0) {
        return nullptr;
    }
    BufferRequestConfig inputCfg;
    inputCfg.width = width;
    inputCfg.height = height;
    inputCfg.strideAlignment = width;
    inputCfg.usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA;
    inputCfg.format = pixelFormat;
    inputCfg.timeout = 0;
    GSError err = buffer->Alloc(inputCfg);
    if (err != GSERROR_OK) {
        return nullptr;
    }
    return buffer;
}

// bind callback after start
/**
 * @tc.name   vpeVideoNdk_37
 * @tc.number vpeVideoNdk_37
 * @tc.desc   vpeVideoNdk_37
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_37, TestSize.Level1)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* instance = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Start(instance);
    VideoProcessing_ErrorCode ret =  OH_VideoProcessingCallback_BindOnError(nullptr, OnErrorEmptyCallback);
    EXPECT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_Destroy(instance);
    OH_VideoProcessing_DeinitializeEnvironment();
}

// sample multi thread start
/**
 * @tc.name   vpeVideoNdk_38
 * @tc.number vpeVideoNdk_38
 * @tc.desc   vpeVideoNdk_38
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_38, TestSize.Level1)
{
    std::unique_ptr<VideoSample> sample = std::make_unique<VideoSample>();
    sample->SetQualityLevel(VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessParam Param = {NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P, 480, 360,
                                NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P, 1280, 720};
    int32_t ret = sample->InitVideoSample(Param);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    sample->StartProcess();
    EXPECT_EQ(sample->WaitAndStopSample(), VIDEO_PROCESSING_SUCCESS);
}

// sample multi thread start Impl
/**
 * @tc.name   vpeVideoNdk_39
 * @tc.number vpeVideoNdk_39
 * @tc.desc   vpeVideoNdk_39
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_39, TestSize.Level1)
{
    std::unique_ptr<VideoSample> sample = std::make_unique<VideoSample>();
    sample->SetImplLoader(true);
    sample->SetQualityLevel(VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessParam Param = {NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P, 480, 360,
                                NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P, 1280, 720};
    int32_t ret = sample->InitVideoSampleImpl(Param);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    sample->StartProcessImpl();
    EXPECT_EQ(sample->WaitAndStopSampleImpl(), VIDEO_PROCESSING_SUCCESS);
}

// set surface on running Impl
/**
 * @tc.name   vpeVideoNdk_40
 * @tc.number vpeVideoNdk_40
 * @tc.desc   vpeVideoNdk_40
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_40, TestSize.Level1)
{
    std::unique_ptr<VideoSample> sample = std::make_unique<VideoSample>();
    sample->SetImplLoader(true);
    sample->SetQualityLevel(VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessParam Param = {NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P, 480, 360,
                                NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P, 1280, 720};
    int32_t ret = sample->InitVideoSampleImpl(Param);
    EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    sample->StartProcessImpl();
    EXPECT_EQ(sample->SetSurfaceOnRunningImpl(), VIDEO_PROCESSING_SUCCESS);
    EXPECT_EQ(sample->WaitAndStopSampleImpl(), VIDEO_PROCESSING_SUCCESS);
}

#ifdef SKIA_ENABLE
/**
 * @tc.name   vpeVideoNdk_42
 * @tc.number vpeVideoNdk_42
 * @tc.desc   vpeVideoNdk_42
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DetailEnhancerVideoNdkUnitTest, vpeVideoNdk_42, TestSize.Level1)
{
    Media::VideoProcessingEngine::Skia skiaImpl;
    sptr<SurfaceBuffer> input = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YUV_422_I, 1024, 1024);
    sptr<SurfaceBuffer> output = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YUV_422_I, 1024, 1024);
    AlgoErrorCode ret = skiaImpl.Process(input, output);
    input = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_RGBA_8888, 1024, 1024);
    output = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YUV_422_I, 1024, 1024);
    ret = skiaImpl.Process(input, output);
    EXPECT_NE(ret, ALGO_SUCCESS);
    input = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_RGBA_8888, 1024, 1024);
    output = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_RGBA_8888, 1024, 1024);
    ret = skiaImpl.Process(input, output);
    EXPECT_EQ(ret, ALGO_SUCCESS);
    input = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_BGRA_8888, 1024, 1024);
    output = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_BGRA_8888, 1024, 1024);
    ret = skiaImpl.Process(input, output);
    EXPECT_EQ(ret, ALGO_SUCCESS);
    input = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YCBCR_420_SP, 1024, 1024);
    output = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YCBCR_420_SP, 1024, 1024);
    ret = skiaImpl.Process(input, output);
    EXPECT_EQ(ret, ALGO_SUCCESS);
    input = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YCRCB_420_SP, 1024, 1024);
    output = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YCRCB_420_SP, 1024, 1024);
    ret = skiaImpl.Process(input, output);
    EXPECT_EQ(ret, ALGO_SUCCESS);
    input = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YCBCR_420_P, 1024, 1024);
    output = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YCBCR_420_P, 1024, 1024);
    ret = skiaImpl.Process(input, output);
    EXPECT_EQ(ret, ALGO_SUCCESS);
    input = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YCRCB_420_P, 1024, 1024);
    output = CreateSurfaceBuffer(OHOS::GRAPHIC_PIXEL_FMT_YCRCB_420_P, 1024, 1024);
    ret = skiaImpl.Process(input, output);
    EXPECT_EQ(ret, ALGO_SUCCESS);
}
#endif
}
} // namespace Media
} // namespace OHOS
