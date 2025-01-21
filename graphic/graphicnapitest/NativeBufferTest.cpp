/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include <gtest/gtest.h>
#include "iconsumer_surface.h"
#include <iservice_registry.h>
#include <ctime>
#include "native_buffer.h"
#include "native_window.h"
#include "surface_type.h"
#include "graphic_common_c.h"
#include "graphic_error_code.h"

using namespace std;
using namespace testing;
using namespace testing::ext;

namespace OHOS::Rosen {
class BufferConsumerListener : public IBufferConsumerListener {
public:
    void OnBufferAvailable() override
    {
    }
};

class NativeBufferTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();

    static inline OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = GRAPHIC_PIXEL_FMT_RGBA_8888,
        .usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA,
    };
    static inline OH_NativeBuffer_Config checkConfig = {};
    static inline OH_NativeBuffer* buffer = nullptr;
};

void NativeBufferTest::SetUpTestCase()
{
    buffer = nullptr;
}

void NativeBufferTest::TearDownTestCase()
{
    buffer = nullptr;
}

/*
 * @tc.name  OHNativeBufferAlloc001
 * @tc.desc  call OH_NativeBuffer_Alloc by abnormal input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferAlloc001, Function | MediumTest | Level2)
{
    buffer = OH_NativeBuffer_Alloc(nullptr);
    ASSERT_EQ(buffer, nullptr);
}

/*
 * @tc.name  OHNativeBufferAlloc002
 * @tc.desc  call OH_NativeBuffer_Alloc
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferAlloc002, Function | MediumTest | Level2)
{
    buffer = OH_NativeBuffer_Alloc(&config);
    ASSERT_NE(buffer, nullptr);
}

/*
 * @tc.name  OHNativeBufferGetSeqNum001
 * @tc.desc  call OH_NativeBuffer_GetSeqNum by abnormal input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferGetSeqNum001, Function | MediumTest | Level2)
{
    uint32_t id = OH_NativeBuffer_GetSeqNum(nullptr);
    ASSERT_EQ(id, UINT_MAX);
}

/*
 * @tc.name  OHNativeBufferGetSeqNum002
 * @tc.desc  all OH_NativeBuffer_GetSeqNum
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferGetSeqNum002, Function | MediumTest | Level2)
{
    uint32_t id = OH_NativeBuffer_GetSeqNum(buffer);
    ASSERT_NE(id, NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  OHNativeBufferGetConfig001
 * @tc.desc  call OH_NativeBuffer_GetConfig
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeBufferTest, OHNativeBufferGetConfig001, Function | MediumTest | Level2)
{
    OH_NativeBuffer_GetConfig(buffer, &checkConfig);
    ASSERT_NE(&checkConfig, nullptr);
}

/*
 * @tc.name  OHNativeBufferGetConfig002
 * @tc.desc  call OH_NativeBuffer_GetConfig
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferGetConfig002, Function | MediumTest | Level2)
{
    checkConfig.width = 0x0;
    checkConfig.height = 0x0;
    checkConfig.format = 0x0;
    checkConfig.usage = 0x0;
    OH_NativeBuffer_GetConfig(nullptr, &checkConfig);
    ASSERT_EQ(checkConfig.width, 0x0);
    ASSERT_EQ(checkConfig.height, 0x0);
    ASSERT_EQ(checkConfig.format, 0x0);
    ASSERT_EQ(checkConfig.usage, 0x0);
}

/*
 * @tc.name  OHNativeBufferReference001
 * @tc.desc  call OH_NativeBuffer_Reference
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferReference001, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeBuffer_Reference(nullptr);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name  OHNativeBufferReference002
 * @tc.desc  call OH_NativeBuffer_Reference
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferReference002, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeBuffer_Reference(buffer);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name  OHNativeBufferUnreference001
 * @tc.desc  call OH_NativeBuffer_Unreference by abnormal input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferUnreference001, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeBuffer_Unreference(nullptr);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name  OHNativeBufferUnreference002
 * @tc.desc  call OH_NativeBuffer_Unreference
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferUnreference002, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeBuffer_Unreference(buffer);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name  OHNativeBufferGetSeqNum003
 * @tc.desc  call OH_NativeBuffer_GetSeqNum
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferGetSeqNum003, Function | MediumTest | Level2)
{
    uint32_t oldSeq = OH_NativeBuffer_GetSeqNum(buffer);
    int32_t ret = OH_NativeBuffer_Unreference(buffer);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    buffer = OH_NativeBuffer_Alloc(&config);
    ASSERT_EQ(oldSeq + 1, OH_NativeBuffer_GetSeqNum(buffer));
}

/*
 * @tc.name  OHNativeBufferSetColorSpace001
 * @tc.desc  call OH_NativeBuffer_SetColorSpace by abnormal input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferSetColorSpace001, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeBuffer_SetColorSpace(nullptr, OH_COLORSPACE_DISPLAY_BT2020_PQ);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name  OHNativeBufferSetColorSpace002
 * @tc.desc  call OH_NativeBuffer_SetColorSpace
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferSetColorSpace002, Function | MediumTest | Level2)
{
    if (buffer == nullptr) {
        buffer = OH_NativeBuffer_Alloc(&config);
        ASSERT_NE(buffer, nullptr);
    }

    int32_t ret = OH_NativeBuffer_SetColorSpace(buffer, OH_COLORSPACE_BT709_LIMIT);
    if (ret != NATIVE_ERROR_UNSUPPORTED) {
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
}
/*
 * @tc.name  OHNativeBufferGetColorSpace001
 * @tc.desc  call OH_NativeBuffer_GetColorSpace by abnormal input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferGetColorSpace001, Function | MediumTest | Level2)
{
    OH_NativeBuffer_ColorSpace *colorSpace = nullptr;
    int32_t ret = OH_NativeBuffer_GetColorSpace(nullptr, colorSpace);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}
/*
 * @tc.name  OHNativeBufferGetColorSpace002
 * @tc.desc  call OH_NativeBuffer_GetColorSpace
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferGetColorSpace002, Function | MediumTest | Level2)
{
    if (buffer == nullptr) {
        buffer = OH_NativeBuffer_Alloc(&config);
        ASSERT_NE(buffer, nullptr);
    }
    OH_NativeBuffer_ColorSpace colorSpace = OH_COLORSPACE_NONE;
    int32_t ret = OH_NativeBuffer_SetColorSpace(buffer, OH_COLORSPACE_BT709_LIMIT);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
    ret = OH_NativeBuffer_GetColorSpace(buffer, &colorSpace);
    if (ret != NATIVE_ERROR_UNSUPPORTED) {
        ASSERT_EQ(colorSpace, OH_COLORSPACE_BT709_LIMIT);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
}
/*
 * @tc.name  OHNativeBufferGetColorSpace003
 * @tc.desc  call OH_NativeBuffer_GetColorSpace
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferGetColorSpace003, Function | MediumTest | Level2)
{
    if (buffer == nullptr) {
        buffer = OH_NativeBuffer_Alloc(&config);
        ASSERT_NE(buffer, nullptr);
    }
    OH_NativeBuffer_ColorSpace colorSpace = OH_COLORSPACE_NONE;
    int32_t ret = OH_NativeBuffer_GetColorSpace(buffer, &colorSpace);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
    ret = OH_NativeBuffer_SetColorSpace(buffer, OH_COLORSPACE_BT709_LIMIT);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(colorSpace, OH_COLORSPACE_BT709_LIMIT);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
}
/*
 * @tc.name  OH_NativeBuffer_SetMetadataValue001
 * @tc.desc  call OH_NativeBuffer_SetMetadataValue by abnormal input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OH_NativeBuffer_SetMetadataValue001, Function | MediumTest | Level2)
{
    int32_t size = 1024;
    uint8_t buff[size];
    int32_t ret = OH_NativeBuffer_SetMetadataValue(nullptr, OH_HDR_STATIC_METADATA, size, buff);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}
/*
 * @tc.name  OH_NativeBuffer_SetMetadataValue002
 * @tc.desc  call OH_NativeBuffer_SetMetadataValue
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OH_NativeBuffer_SetMetadataValue002, Function | MediumTest | Level2)
{
    if (buffer == nullptr) {
        buffer = OH_NativeBuffer_Alloc(&config);
        ASSERT_NE(buffer, nullptr);
    }
    int32_t len = 60;
    uint8_t outbuff[len];
    for (int i = 0; i < 60; ++i) {
        outbuff[i] = static_cast<uint8_t>(i);
    }
    int32_t ret = OH_NativeBuffer_SetMetadataValue(buffer, OH_HDR_STATIC_METADATA, len, outbuff);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
}
/*
 * @tc.name  OH_NativeBuffer_SetMetadataValue003
 * @tc.desc  call OH_NativeBuffer_SetMetadataValue by abnormal input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OH_NativeBuffer_SetMetadataValue003, Function | MediumTest | Level2)
{
    int32_t maxSize = -1;
    int32_t size = 60;
    uint8_t buff[size];
    int32_t ret = OH_NativeBuffer_SetMetadataValue(nullptr, OH_HDR_STATIC_METADATA, maxSize, buff);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_NE(ret, NATIVE_ERROR_OK);
    }
}
/*
 * @tc.name  OH_NativeBuffer_GetMetadataValue001
 * @tc.desc  call OH_NativeBuffer_GetMetadataValue by abnormal input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OH_NativeBuffer_GetMetadataValue001, Function | MediumTest | Level2)
{
    int32_t size = 1024;
    uint8_t *buff;
    int32_t ret = OH_NativeBuffer_GetMetadataValue(nullptr, OH_HDR_STATIC_METADATA, &size, &buff);
    if (buff != nullptr) {
        delete[] buff;
    }
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_NE(ret, NATIVE_ERROR_OK);
    }
}
/*
 * @tc.name  OH_NativeBuffer_GetMetadataValue002
 * @tc.desc  call OH_NativeBuffer_GetMetadataValue
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OH_NativeBuffer_GetMetadataValue002, Function | MediumTest | Level2)
{
    if (buffer == nullptr) {
        buffer = OH_NativeBuffer_Alloc(&config);
        ASSERT_NE(buffer, nullptr);
    }
    int32_t len = 60;
    uint8_t outbuff[len];
    for (int i = 0; i < 60; ++i) {
        outbuff[i] = static_cast<uint8_t>(i);
    }
    int32_t ret = OH_NativeBuffer_SetMetadataValue(buffer, OH_HDR_STATIC_METADATA, len, outbuff);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
    int32_t buffSize = 0;
    uint8_t *buff;
    ret = OH_NativeBuffer_GetMetadataValue(buffer, OH_HDR_STATIC_METADATA, &buffSize, &buff);
    if (buff != nullptr) {
        ASSERT_EQ(memcmp(outbuff, buff, 60), 0);
        delete[] buff;
    }
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
}
/*
 * @tc.name  OH_NativeBuffer_GetMetadataValue003
 * @tc.desc  call OH_NativeBuffer_GetMetadataValue
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OH_NativeBuffer_GetMetadataValue003, Function | MediumTest | Level2)
{
    if (buffer == nullptr) {
        buffer = OH_NativeBuffer_Alloc(&config);
        ASSERT_NE(buffer, nullptr);
    }
    uint8_t *buff;
    int32_t ret = OH_NativeBuffer_GetMetadataValue(buffer, OH_HDR_STATIC_METADATA, nullptr, &buff);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_NE(ret, NATIVE_ERROR_OK);
    }
}

/*
 * @tc.name  OHNativeBufferMap001
 * @tc.desc  call OH_NativeBuffer_Map by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferMap001, Function | MediumTest | Level2)
{
    void *virAddr = nullptr;
    int32_t ret = OH_NativeBuffer_Map(nullptr, &virAddr);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name  OHNativeBufferMap002
 * @tc.desc  call OH_NativeBuffer_Map
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferMap002, Function | MediumTest | Level2)
{
    void *virAddr = nullptr;
    int32_t ret = OH_NativeBuffer_Map(buffer, &virAddr);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ASSERT_NE(virAddr, nullptr);
}

/*
 * @tc.name  OHNativeBufferUnmap001
 * @tc.desc  call OH_NativeBuffer_Unmap by abnormal input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferUnmap001, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeBuffer_Unmap(nullptr);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name  OHNativeBufferUnmap002
 * @tc.desc  call OH_NativeBuffer_Unmap
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferUnmap002, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeBuffer_Unmap(buffer);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ret = OH_NativeBuffer_Unreference(buffer);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name  NativeBufferFromNativeWindowBuffer002
 * @tc.desc  call OH_NativeBufferFromNativeWindowBuffer
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, NativeBufferFromNativeWindowBuffer002, Function | MediumTest | Level2)
{
    sptr<OHOS::IConsumerSurface> cSurface = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    cSurface->RegisterConsumerListener(listener);
    sptr<OHOS::IBufferProducer> producer = cSurface->GetProducer();
    sptr<OHOS::Surface> pSurface = Surface::CreateSurfaceAsProducer(producer);
    int32_t fence;
    sptr<OHOS::SurfaceBuffer> sBuffer = nullptr;
    BufferRequestConfig requestConfig = {
        .width = 0x100,  // small
        .height = 0x100, // small
        .strideAlignment = 0x8,
        .format = GRAPHIC_PIXEL_FMT_RGBA_8888,
        .usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA,
        .timeout = 0,
    };
    pSurface->RequestBuffer(sBuffer, fence, requestConfig);
    NativeWindow* nativeWindow = OH_NativeWindow_CreateNativeWindow(&pSurface);
    ASSERT_NE(nativeWindow, nullptr);
    NativeWindowBuffer* nativeWindowBuffer = OH_NativeWindow_CreateNativeWindowBufferFromSurfaceBuffer(&sBuffer);
    ASSERT_NE(nativeWindowBuffer, nullptr);

    int32_t ret = OH_NativeBuffer_FromNativeWindowBuffer(nativeWindowBuffer, nullptr);
    ASSERT_EQ(ret, NATIVE_ERROR_INVALID_ARGUMENTS);
    OH_NativeBuffer* nativeBufferTmp = nullptr;
    ret = OH_NativeBuffer_FromNativeWindowBuffer(nativeWindowBuffer, &nativeBufferTmp);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    sBuffer = nullptr;
    cSurface = nullptr;
    producer = nullptr;
    pSurface = nullptr;
    nativeWindow = nullptr;
    nativeWindowBuffer = nullptr;
}

/*
 * @tc.name  NativeBufferFromNativeWindowBuffer003
 * @tc.desc  call OH_NativeBuffer_FromNativeWindowBuffer by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, NativeBufferFromNativeWindowBuffer003, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeBuffer_FromNativeWindowBuffer(nullptr, nullptr);
    ASSERT_EQ(ret, NATIVE_ERROR_INVALID_ARGUMENTS);

    NativeWindowBuffer nativeWindowBuffer;
    ret = OH_NativeBuffer_FromNativeWindowBuffer(&nativeWindowBuffer, nullptr);
    ASSERT_EQ(ret, NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  OHNativeBufferMapPlanes001
 * @tc.desc  call OH_NativeBuffer_MapPlanes by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferMapPlanes001, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeBuffer_MapPlanes(nullptr, nullptr, nullptr);
    ASSERT_EQ(ret, NATIVE_ERROR_INVALID_ARGUMENTS);

    OH_NativeBuffer *buffer = (OH_NativeBuffer *)0xFFFFFFFF;
    ret = OH_NativeBuffer_MapPlanes(buffer, nullptr, nullptr);
    ASSERT_EQ(ret, NATIVE_ERROR_INVALID_ARGUMENTS);

    void *virAddr = nullptr;
    ret = OH_NativeBuffer_MapPlanes(buffer, &virAddr, nullptr);
    ASSERT_EQ(ret, NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  OHNativeBufferMapPlanes002
 * @tc.desc  call OH_NativeBuffer_MapPlanes
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferMapPlanes002, Function | MediumTest | Level2)
{
    sptr<OHOS::IConsumerSurface> cSurface = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    cSurface->RegisterConsumerListener(listener);
    sptr<OHOS::IBufferProducer> producer = cSurface->GetProducer();
    sptr<OHOS::Surface> pSurface = Surface::CreateSurfaceAsProducer(producer);
    int32_t fence;
    sptr<OHOS::SurfaceBuffer> sBuffer = nullptr;
    BufferRequestConfig requestConfig = {.width = 0x100, .height = 0x100, .strideAlignment = 0x8,
        .format = GRAPHIC_PIXEL_FMT_YCBCR_420_SP,
        .usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA, .timeout = 0};
    pSurface->SetQueueSize(4);
    int32_t formatType[] = {GRAPHIC_PIXEL_FMT_YCBCR_420_SP, GRAPHIC_PIXEL_FMT_YCRCB_420_SP,
        GRAPHIC_PIXEL_FMT_YCBCR_420_P, GRAPHIC_PIXEL_FMT_YCRCB_420_P};
    NativeWindow* nativeWindow;
    NativeWindowBuffer* nativeWindowBuffer;
    for (int32_t i = 0; i < sizeof(formatType) / sizeof(int32_t); i++) {
        requestConfig.format = formatType[i];
        pSurface->RequestBuffer(sBuffer, fence, requestConfig);
        nativeWindow = OH_NativeWindow_CreateNativeWindow(&pSurface);
        ASSERT_NE(nativeWindow, nullptr);
        nativeWindowBuffer = OH_NativeWindow_CreateNativeWindowBufferFromSurfaceBuffer(&sBuffer);
        ASSERT_NE(nativeWindowBuffer, nullptr);
    }

    sBuffer = nullptr;
    cSurface = nullptr;
    producer = nullptr;
    pSurface = nullptr;
    nativeWindow = nullptr;
    nativeWindowBuffer = nullptr;
}

/*
 * @tc.name  OHNativeBufferMapPlanes003
 * @tc.desc  call OH_NativeBuffer_MapPlanes
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeBufferTest, OHNativeBufferMapPlanes003, Function | MediumTest | Level2)
{
    sptr<OHOS::IConsumerSurface> cSurface = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    cSurface->RegisterConsumerListener(listener);
    sptr<OHOS::IBufferProducer> producer = cSurface->GetProducer();
    sptr<OHOS::Surface> pSurface = Surface::CreateSurfaceAsProducer(producer);
    int32_t fence;
    sptr<OHOS::SurfaceBuffer> sBuffer = nullptr;
    BufferRequestConfig requestConfig = {.width = 0x100, .height = 0x100, .strideAlignment = 0x8,
        .format = GRAPHIC_PIXEL_FMT_YCBCR_420_SP,
        .usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA, .timeout = 0};
    pSurface->SetQueueSize(4);
    int32_t formatType = GRAPHIC_PIXEL_FMT_YCBCR_420_SP;
    NativeWindow* nativeWindow;
    NativeWindowBuffer* nativeWindowBuffer;
    requestConfig.format = formatType;
    pSurface->RequestBuffer(sBuffer, fence, requestConfig);
    nativeWindow = OH_NativeWindow_CreateNativeWindow(&pSurface);
    ASSERT_NE(nativeWindow, nullptr);
    nativeWindowBuffer = OH_NativeWindow_CreateNativeWindowBufferFromSurfaceBuffer(&sBuffer);
    ASSERT_NE(nativeWindowBuffer, nullptr);

    OH_NativeBuffer* nativeBufferTmp = nullptr;
    for (int32_t i = 0; i < 1000; i++) {
        int32_t ret = OH_NativeBuffer_FromNativeWindowBuffer(nativeWindowBuffer, &nativeBufferTmp);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }

    sBuffer = nullptr;
    cSurface = nullptr;
    producer = nullptr;
    pSurface = nullptr;
    nativeWindow = nullptr;
    nativeWindowBuffer = nullptr;
}
}