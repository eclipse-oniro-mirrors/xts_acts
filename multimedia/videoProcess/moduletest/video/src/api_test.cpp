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
#include <iostream>
#include <atomic>
#include <fstream>
#include <thread>
#include <queue>
#include <string>
#include "gtest/gtest.h"
#include "video_processing.h"
#include "surface/native_buffer.h"
#include "iconsumer_surface.h"
#include "surface/window.h"
#include "nocopyable.h"
#include "native_avformat.h"
using namespace std;
using namespace OHOS;
using namespace testing::ext;
namespace {
class VpeVideoApiTest : public testing::Test {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);
};

class TestConsumerListener : public IBufferConsumerListener {
public:
    TestConsumerListener(sptr<Surface> cs, std::string_view name);
    ~TestConsumerListener();
    void OnBufferAvailable() override;
};

void VpeVideoApiTest::SetUpTestCase() {}
void VpeVideoApiTest::TearDownTestCase() {}
void VpeVideoApiTest::SetUp() {}
void VpeVideoApiTest::TearDown()
{
    OH_VideoProcessing_DeinitializeEnvironment();
}

TestConsumerListener::TestConsumerListener(sptr<Surface> cs, std::string_view name) {}

TestConsumerListener::~TestConsumerListener() {}

void TestConsumerListener::OnBufferAvailable() {}

const VideoProcessing_ColorSpaceInfo SRC_INFO = {OH_VIDEO_HDR_VIVID,
                                                 OH_COLORSPACE_BT2020_HLG_LIMIT,
                                                 NATIVEBUFFER_PIXEL_FMT_YCBCR_P010};
const VideoProcessing_ColorSpaceInfo DST_INFO = {OH_VIDEO_HDR_VIVID,
                                                 OH_COLORSPACE_BT2020_PQ_LIMIT,
                                                 NATIVEBUFFER_PIXEL_FMT_YCBCR_P010};

}

namespace {
static int32_t g_userValue = 1;
static int32_t g_index = 1;

static void onErrorEmptyCallback(OH_VideoProcessing* videoProcessor, VideoProcessing_ErrorCode error,
    void* userData)
{
    //do nothing
}

static void onErrorCallback(OH_VideoProcessing* videoProcessor, VideoProcessing_ErrorCode error,
    void* userData)
{
    cout << "onErrorCallback" << endl;
}

static void onStateEmptyCallback(OH_VideoProcessing* videoProcessor, VideoProcessing_State state,
    void* userData)
{
    //do nothing
}

static void onStateCallback(OH_VideoProcessing* videoProcessor, VideoProcessing_State state,
    void* userData)
{
    cout << "onStateCallback" << endl;
}


static void OnNewOutputBufferEmptyCallback(OH_VideoProcessing* videoProcessor, uint32_t index,
    void* userData)
{
    //do nothing
}

static void OnNewOutputBufferCallback(OH_VideoProcessing* videoProcessor, uint32_t index,
    void* userData)
{
    cout << "OnNewOutputBufferCallback" << endl;
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0010
 * @tc.number VPE_VIDEO_API_TEST_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0010, TestSize.Level0)
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessing_DeinitializeEnvironment();
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0020
 * @tc.number VPE_VIDEO_API_TEST_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0020, TestSize.Level0)
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_DeinitializeEnvironment();
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0030
 * @tc.number VPE_VIDEO_API_TEST_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0030, TestSize.Level0)
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_InitializeEnvironment();
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_DeinitializeEnvironment();
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0040
 * @tc.number VPE_VIDEO_API_TEST_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0040, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsColorSpaceConversionSupported(nullptr, nullptr);
    ASSERT_FALSE(ret);
    OH_VideoProcessing_DeinitializeEnvironment();
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0050
 * @tc.number VPE_VIDEO_API_TEST_0050
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0050, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, nullptr);
    ASSERT_FALSE(ret);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0060
 * @tc.number VPE_VIDEO_API_TEST_0060
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0060, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsColorSpaceConversionSupported(nullptr, &DST_INFO);
    ASSERT_FALSE(ret);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0070
 * @tc.number VPE_VIDEO_API_TEST_0070
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0070, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, &DST_INFO);
    if (!access("/system/lib64/libvideoprocessingengine_ext.z.so", 0)) {
        ASSERT_TRUE(ret);
    } else {
        ASSERT_FALSE(ret);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0080
 * @tc.number VPE_VIDEO_API_TEST_0080
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0080, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(nullptr);
    ASSERT_FALSE(ret);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0090
 * @tc.number VPE_VIDEO_API_TEST_0090
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0090, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    bool ret = OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO);
    if (!access("/system/lib64/libvideoprocessingengine_ext.z.so", 0)) {
        ASSERT_TRUE(ret);
    } else {
        ASSERT_FALSE(ret);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0100
 * @tc.number VPE_VIDEO_API_TEST_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0100, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing** videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(videoProcessor, INT_MAX);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0110
 * @tc.number VPE_VIDEO_API_TEST_0110
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0110, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing** videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0120
 * @tc.number VPE_VIDEO_API_TEST_0120
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0120, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor, INT_MAX);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
    OH_VideoProcessing_Destroy(videoProcessor);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0130
 * @tc.number VPE_VIDEO_API_TEST_0130
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0130, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0140
 * @tc.number VPE_VIDEO_API_TEST_0140
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0140, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Destroy(nullptr);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0150
 * @tc.number VPE_VIDEO_API_TEST_0150
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0150, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_Destroy(videoProcessor);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0160
 * @tc.number VPE_VIDEO_API_TEST_0160
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0160, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_RegisterCallback(nullptr, nullptr, nullptr);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0170
 * @tc.number VPE_VIDEO_API_TEST_0170
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0170, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessing_RegisterCallback(nullptr, callback, nullptr);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
    OH_VideoProcessingCallback_Destroy(callback);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0180
 * @tc.number VPE_VIDEO_API_TEST_0180
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0180, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, nullptr, nullptr);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0190
 * @tc.number VPE_VIDEO_API_TEST_0190
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0190, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        VideoProcessing_Callback* callback = nullptr;
        ret = OH_VideoProcessingCallback_Create(&callback);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessingCallback_BindOnError(callback, onErrorEmptyCallback);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, nullptr);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_VideoProcessingCallback_Destroy(callback);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0200
 * @tc.number VPE_VIDEO_API_TEST_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0200, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        VideoProcessing_Callback* callback = nullptr;
        ret = OH_VideoProcessingCallback_Create(&callback);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, nullptr);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_VALUE);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_VideoProcessingCallback_Destroy(callback);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0201
 * @tc.number VPE_VIDEO_API_TEST_0201
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0201, TestSize.Level0)
{
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        OH_VideoProcessing* videoProcessor = nullptr;
        VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        sptr<Surface> cs = Surface::CreateSurfaceAsConsumer();
        sptr<IBufferConsumerListener> listener = new TestConsumerListener(
            cs, "/data/test/media/out_320_240_10s.rgba");
        cs->RegisterConsumerListener(listener);
        auto p = cs->GetProducer();
        sptr<Surface> ps = Surface::CreateSurfaceAsProducer(p);
        OHNativeWindow *window = CreateNativeWindowFromSurface(&ps);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, window);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        OHNativeWindow *inwindow = nullptr;
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &inwindow);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        VideoProcessing_Callback *callback = nullptr;
        ret = OH_VideoProcessingCallback_Create(&callback);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessingCallback_BindOnError(callback, onErrorEmptyCallback);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, nullptr);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_Start(videoProcessor);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, nullptr);
        EXPECT_EQ(ret, VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
        OH_VideoProcessingCallback_Destroy(callback);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(window);
    }
}
/**
 * @tc.name   VPE_VIDEO_API_TEST_0210
 * @tc.number VPE_VIDEO_API_TEST_0210
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0210, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        VideoProcessing_Callback* callback = nullptr;
        ret = OH_VideoProcessingCallback_Create(&callback);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        void* userData = &g_userValue;
        if (!userData) {
            ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, userData);
            ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        }
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_VideoProcessingCallback_Destroy(callback);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0220
 * @tc.number VPE_VIDEO_API_TEST_0220
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0220, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetSurface(nullptr, nullptr);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0230
 * @tc.number VPE_VIDEO_API_TEST_0230
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0230, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    sptr<Surface> cs = Surface::CreateSurfaceAsConsumer();
    sptr<IBufferConsumerListener> listener = new TestConsumerListener(
        cs, "/data/test/media/out_320_240_10s.rgba");
    cs->RegisterConsumerListener(listener);
    auto p = cs->GetProducer();
    sptr<Surface> ps = Surface::CreateSurfaceAsProducer(p);
    OHNativeWindow *window = nullptr;
    window = CreateNativeWindowFromSurface(&ps);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetSurface(nullptr, window);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
    OH_NativeWindow_DestroyNativeWindow(window);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0240
 * @tc.number VPE_VIDEO_API_TEST_0240
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0240, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, nullptr);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0250
 * @tc.number VPE_VIDEO_API_TEST_0250
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0250, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        sptr<Surface> cs = Surface::CreateSurfaceAsConsumer();
        sptr<IBufferConsumerListener> listener = new TestConsumerListener(
            cs, "/data/test/media/out_320_240_10s.rgba");
        cs->RegisterConsumerListener(listener);
        auto p = cs->GetProducer();
        sptr<Surface> ps = Surface::CreateSurfaceAsProducer(p);
        OHNativeWindow *window = nullptr;
        window = CreateNativeWindowFromSurface(&ps);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, window);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(window);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0260
 * @tc.number VPE_VIDEO_API_TEST_0260
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0260, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetSurface(nullptr, nullptr);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0270
 * @tc.number VPE_VIDEO_API_TEST_0270
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0270, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    sptr<Surface> cs = Surface::CreateSurfaceAsConsumer();
    sptr<IBufferConsumerListener> listener = new TestConsumerListener(
        cs, "/data/test/media/out_320_240_10s.rgba");
    cs->RegisterConsumerListener(listener);
    auto p = cs->GetProducer();
    sptr<Surface> ps = Surface::CreateSurfaceAsProducer(p);
    OHNativeWindow *window = nullptr;
    window = CreateNativeWindowFromSurface(&ps);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_GetSurface(nullptr, &window);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
    OH_NativeWindow_DestroyNativeWindow(window);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0280
 * @tc.number VPE_VIDEO_API_TEST_0280
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0280, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_GetSurface(videoProcessor, nullptr);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0290
 * @tc.number VPE_VIDEO_API_TEST_0290
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0290, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        sptr<Surface> cs = Surface::CreateSurfaceAsConsumer();
        sptr<IBufferConsumerListener> listener = new TestConsumerListener(
            cs, "/data/test/media/out_320_240_10s.rgba");
        cs->RegisterConsumerListener(listener);
        auto p = cs->GetProducer();
        sptr<Surface> ps = Surface::CreateSurfaceAsProducer(p);
        OHNativeWindow *window = nullptr;
        window = CreateNativeWindowFromSurface(&ps);
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &window);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(window);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0291
 * @tc.number VPE_VIDEO_API_TEST_0291
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0291, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        OHNativeWindow *window = nullptr;
        OHNativeWindow *window2 = nullptr;
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &window);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &window2);
        EXPECT_EQ(ret, VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(window);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0300
 * @tc.number VPE_VIDEO_API_TEST_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0300, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Start(nullptr);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0310
 * @tc.number VPE_VIDEO_API_TEST_0310
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0310, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_Start(videoProcessor);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0320
 * @tc.number VPE_VIDEO_API_TEST_0320
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0320, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        sptr<Surface> cs = Surface::CreateSurfaceAsConsumer();
        sptr<IBufferConsumerListener> listener = new TestConsumerListener(
            cs, "/data/test/media/out_320_240_10s.rgba");
        cs->RegisterConsumerListener(listener);
        auto p = cs->GetProducer();
        sptr<Surface> ps = Surface::CreateSurfaceAsProducer(p);
        OHNativeWindow *window = nullptr;
        window = CreateNativeWindowFromSurface(&ps);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, window);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_Start(videoProcessor);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(window);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0330
 * @tc.number VPE_VIDEO_API_TEST_0330
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0330, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Stop(nullptr);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0340
 * @tc.number VPE_VIDEO_API_TEST_0340
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0340, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_Stop(videoProcessor);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0350
 * @tc.number VPE_VIDEO_API_TEST_0350
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0350, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        sptr<Surface> cs = Surface::CreateSurfaceAsConsumer();
        sptr<IBufferConsumerListener> listener = new TestConsumerListener(
            cs, "/data/test/media/out_320_240_10s.rgba");
        cs->RegisterConsumerListener(listener);
        auto p = cs->GetProducer();
        sptr<Surface> ps = Surface::CreateSurfaceAsProducer(p);
        OHNativeWindow *window = nullptr;
        window = CreateNativeWindowFromSurface(&ps);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, window);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        OHNativeWindow *outwindow = nullptr;
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &outwindow);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_Start(videoProcessor);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
        ret = OH_VideoProcessing_Stop(videoProcessor);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(window);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0360
 * @tc.number VPE_VIDEO_API_TEST_0360
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0360, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_RenderOutputBuffer(nullptr, g_index);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0370
 * @tc.number VPE_VIDEO_API_TEST_0370
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0370, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_RenderOutputBuffer(videoProcessor, INT_MAX);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED);
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0380
 * @tc.number VPE_VIDEO_API_TEST_0380
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0380, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(nullptr);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0390
 * @tc.number VPE_VIDEO_API_TEST_0390
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0390, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0400
 * @tc.number VPE_VIDEO_API_TEST_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0400, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Destroy(nullptr);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0410
 * @tc.number VPE_VIDEO_API_TEST_0410
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0410, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_Destroy(callback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0420
 * @tc.number VPE_VIDEO_API_TEST_0420
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0420, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnError(
        nullptr, onErrorEmptyCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0430
 * @tc.number VPE_VIDEO_API_TEST_0430
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0430, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnError(
        callback, onErrorEmptyCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0440
 * @tc.number VPE_VIDEO_API_TEST_0440
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0440, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnError(
        nullptr, onErrorCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0450
 * @tc.number VPE_VIDEO_API_TEST_0450
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0450, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnError(callback, onErrorCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0460
 * @tc.number VPE_VIDEO_API_TEST_0460
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0460, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnState(
        nullptr, onStateEmptyCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0470
 * @tc.number VPE_VIDEO_API_TEST_0470
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0470, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnState(callback, onStateEmptyCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0480
 * @tc.number VPE_VIDEO_API_TEST_0480
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0480, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnState(nullptr, onStateCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0490
 * @tc.number VPE_VIDEO_API_TEST_0490
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0490, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnState(callback, onStateCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0500
 * @tc.number VPE_VIDEO_API_TEST_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0500, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(
        nullptr, OnNewOutputBufferEmptyCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0510
 * @tc.number VPE_VIDEO_API_TEST_0510
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0510, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBufferEmptyCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0520
 * @tc.number VPE_VIDEO_API_TEST_0520
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0520, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(
        nullptr, OnNewOutputBufferCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0530
 * @tc.number VPE_VIDEO_API_TEST_0530
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0530, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    VideoProcessing_Callback* callback = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessingCallback_Create(&callback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBufferCallback);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
    OH_VideoProcessingCallback_Destroy(callback);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0540
 * @tc.number VPE_VIDEO_API_TEST_0540
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0540, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_COLOR_SPACE_CONVERSION);
    if (OH_VideoProcessing_IsColorSpaceConversionSupported(&SRC_INFO, &DST_INFO)) {
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        OH_VideoProcessing_Destroy(videoProcessor);
    } else {
        ASSERT_NE(ret, VIDEO_PROCESSING_SUCCESS);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0550
 * @tc.number VPE_VIDEO_API_TEST_0550
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0550, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        return;
    }
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t metadataMode = VIDEO_METADATA_GENERATOR_CONTRAST_MODE;
    OH_AVFormat_SetIntValue(format, VIDEO_METADATA_GENERATOR_STYLE_CONTROL, metadataMode);
    ret = OH_VideoProcessing_SetParameter(videoProcessor, format);
    OH_VideoProcessing_Destroy(videoProcessor);
    OH_AVFormat_Destroy(format);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0560
 * @tc.number VPE_VIDEO_API_TEST_0560
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0560, TestSize.Level0)
{
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing* videoProcessor = nullptr;
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
        VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        return;
    }
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t metadataMode = VIDEO_METADATA_GENERATOR_BRIGHT_MODE;
    OH_AVFormat_SetIntValue(format, VIDEO_METADATA_GENERATOR_STYLE_CONTROL, metadataMode);
    ret = OH_VideoProcessing_SetParameter(videoProcessor, format);
    OH_AVFormat_Destroy(format);
    OH_VideoProcessing_Destroy(videoProcessor);
    ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0570
 * @tc.number VPE_VIDEO_API_TEST_0570
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0570, TestSize.Level0)
{
    OH_VideoProcessing *videoProcessor = nullptr;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t metadataMode = VIDEO_METADATA_GENERATOR_BRIGHT_MODE;
    OH_AVFormat_SetIntValue(format, VIDEO_METADATA_GENERATOR_STYLE_CONTROL, metadataMode);
    int32_t ret = OH_VideoProcessing_SetParameter(videoProcessor, format);
    OH_AVFormat_Destroy(format);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0580
 * @tc.number VPE_VIDEO_API_TEST_0580
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0580, TestSize.Level0)
{
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        OH_VideoProcessing *videoProcessor = nullptr;
        VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
            VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
        ret = OH_VideoProcessing_SetParameter(videoProcessor, nullptr);
        OH_VideoProcessing_Destroy(videoProcessor);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0590
 * @tc.number VPE_VIDEO_API_TEST_0590
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0590, TestSize.Level0)
{
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        OH_VideoProcessing *videoProcessor = nullptr;
        VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
            VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
        ASSERT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_GetParameter(videoProcessor, nullptr);
        OH_VideoProcessing_Destroy(videoProcessor);
        ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
    }
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0591
 * @tc.number VPE_VIDEO_API_TEST_0591
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0591, TestSize.Level0)
{
    OH_VideoProcessing *videoProcessor = nullptr;
    int32_t ret = OH_VideoProcessing_GetParameter(videoProcessor, nullptr);
    ASSERT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_INSTANCE);
}

/**
 * @tc.name   VPE_VIDEO_API_TEST_0600
 * @tc.number VPE_VIDEO_API_TEST_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(VpeVideoApiTest, VPE_VIDEO_API_TEST_0600, TestSize.Level0)
{
    if (OH_VideoProcessing_IsMetadataGenerationSupported(&SRC_INFO)) {
        OH_VideoProcessing *videoProcessor = nullptr;
        VideoProcessing_ErrorCode ret = OH_VideoProcessing_Create(&videoProcessor,
            VIDEO_PROCESSING_TYPE_METADATA_GENERATION);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        sptr<Surface> cs = Surface::CreateSurfaceAsConsumer();
        sptr<IBufferConsumerListener> listener = new TestConsumerListener(
            cs, "/data/test/media/out_320_240_10s.rgba");
        cs->RegisterConsumerListener(listener);
        auto p = cs->GetProducer();
        sptr<Surface> ps = Surface::CreateSurfaceAsProducer(p);
        OHNativeWindow *window = CreateNativeWindowFromSurface(&ps);
        ret = OH_VideoProcessing_SetSurface(videoProcessor, window);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        OHNativeWindow *inWindow = nullptr;
        ret = OH_VideoProcessing_GetSurface(videoProcessor, &inWindow);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        VideoProcessing_Callback *callback = nullptr;
        ret = OH_VideoProcessingCallback_Create(&callback);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessingCallback_BindOnError(callback, onErrorEmptyCallback);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBufferEmptyCallback);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_RegisterCallback(videoProcessor, callback, nullptr);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_Start(videoProcessor);
        EXPECT_EQ(ret, VIDEO_PROCESSING_SUCCESS);
        ret = OH_VideoProcessing_RenderOutputBuffer(videoProcessor, INT_MAX);
        EXPECT_EQ(ret, VIDEO_PROCESSING_ERROR_INVALID_PARAMETER);
        OH_VideoProcessingCallback_Destroy(callback);
        OH_VideoProcessing_Destroy(videoProcessor);
        OH_NativeWindow_DestroyNativeWindow(window);
    }
}
}