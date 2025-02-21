/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include <native_window.h>
#include <securec.h>
#include <ctime>
#include "buffer_log.h"
#include "external_window.h"
#include "surface_utils.h"
#include "sync_fence.h"
#include "ipc_cparcel.h"
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

static OHExtDataHandle *AllocOHExtDataHandle(uint32_t reserveInts)
{
    size_t handleSize = sizeof(OHExtDataHandle) + (sizeof(int32_t) * reserveInts);
    OHExtDataHandle *handle = static_cast<OHExtDataHandle *>(malloc(handleSize));
    if (handle == nullptr) {
        BLOGE("AllocOHExtDataHandle malloc %zu failed", handleSize);
        return nullptr;
    }
    auto ret = memset_s(handle, handleSize, 0, handleSize);
    if (ret != EOK) {
        BLOGE("AllocOHExtDataHandle memset_s failed");
        return nullptr;
    }
    handle->fd = -1;
    handle->reserveInts = reserveInts;
    for (uint32_t i = 0; i < reserveInts; i++) {
        handle->reserve[i] = -1;
    }
    return handle;
}

static void FreeOHExtDataHandle(OHExtDataHandle *handle)
{
    if (handle == nullptr) {
        BLOGW("FreeOHExtDataHandle with nullptr handle");
        return ;
    }
    if (handle->fd >= 0) {
        close(handle->fd);
        handle->fd = -1;
    }
    free(handle);
}

class NativeWindowTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();

    static inline BufferRequestConfig requestConfig = {};
    static inline BufferFlushConfig flushConfig = {};
    static inline sptr<OHOS::IConsumerSurface> cSurface = nullptr;
    static inline sptr<OHOS::IBufferProducer> producer = nullptr;
    static inline sptr<OHOS::Surface> pSurface = nullptr;
    static inline sptr<OHOS::SurfaceBuffer> sBuffer = nullptr;
    static inline NativeWindow* nativeWindow = nullptr;
    static inline NativeWindowBuffer* nativeWindowBuffer = nullptr;
};

void NativeWindowTest::SetUpTestCase()
{
    requestConfig = {
        .width = 0x100,  // small
        .height = 0x100, // small
        .strideAlignment = 0x8,
        .format = GRAPHIC_PIXEL_FMT_RGBA_8888,
        .usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA,
        .timeout = 0,
    };

    cSurface = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    cSurface->RegisterConsumerListener(listener);
    producer = cSurface->GetProducer();
    pSurface = Surface::CreateSurfaceAsProducer(producer);
    int32_t fence;
    pSurface->RequestBuffer(sBuffer, fence, requestConfig);
}

void NativeWindowTest::TearDownTestCase()
{
    flushConfig = { .damage = {
        .w = 0x100,
        .h = 0x100,
    } };
    pSurface->FlushBuffer(sBuffer, -1, flushConfig);
    sBuffer = nullptr;
    cSurface = nullptr;
    producer = nullptr;
    pSurface = nullptr;
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    nativeWindow = nullptr;
    nativeWindowBuffer = nullptr;
}

/*
 * @tc.name  CreateNativeWindow001
 * @tc.desc  call call OH_NativeWindow_CreateNativeWindow by abnormal input
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CreateNativeWindow001, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_CreateNativeWindow(nullptr), nullptr);
}

/*
 * @tc.name  CreateNativeWindow002
 * @tc.desc  call OH_NativeWindow_CreateNativeWindow 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CreateNativeWindow002, Function | MediumTest | Level2)
{
    nativeWindow = OH_NativeWindow_CreateNativeWindow(&pSurface);
    ASSERT_NE(nativeWindow, nullptr);
}

/*
 * @tc.name  CreateNativeWindow003
 * @tc.desc  call OH_NativeWindow_CreateNativeWindow
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CreateNativeWindow003, Function | MediumTest | Level2)
{
    uint64_t surfaceId = 0;
    int32_t ret = OH_NativeWindow_GetSurfaceId(nativeWindow, &surfaceId);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ASSERT_EQ(surfaceId, pSurface->GetUniqueId());
}

/*
 * @tc.name  CreateNativeWindowFromSurfaceId001
 * @tc.desc  call OH_NativeWindow_CreateNativeWindowFromSurfaceId
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CreateNativeWindowFromSurfaceId001, Function | MediumTest | Level2)
{
    uint64_t surfaceId = static_cast<uint64_t>(pSurface->GetUniqueId());
    OHNativeWindow *window = nullptr;
    int32_t ret = OH_NativeWindow_CreateNativeWindowFromSurfaceId(surfaceId, &window);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    surfaceId = 0;
    ret = OH_NativeWindow_GetSurfaceId(window, &surfaceId);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ASSERT_EQ(surfaceId, pSurface->GetUniqueId());
    OH_NativeWindow_DestroyNativeWindow(window);
}

/*
 * @tc.name  CreateNativeWindowFromSurfaceId002
 * @tc.desc  call OH_NativeWindow_CreateNativeWindowFromSurfaceId
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CreateNativeWindowFromSurfaceId002, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeWindow_CreateNativeWindowFromSurfaceId(0, nullptr);
    ASSERT_EQ(ret, NATIVE_ERROR_INVALID_ARGUMENTS);
    ret = OH_NativeWindow_GetSurfaceId(nullptr, nullptr);
    ASSERT_EQ(ret, NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  CreateNativeWindowFromSurfaceId003
 * @tc.desc  call OH_NativeWindow_CreateNativeWindowFromSurfaceId
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CreateNativeWindowFromSurfaceId003, Function | MediumTest | Level2)
{
    sptr<OHOS::IConsumerSurface> cSurfaceTmp = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    cSurfaceTmp->RegisterConsumerListener(listener);
    sptr<OHOS::IBufferProducer> producerTmp = cSurfaceTmp->GetProducer();
    sptr<OHOS::Surface> pSurfaceTmp = Surface::CreateSurfaceAsProducer(producerTmp);

    uint64_t surfaceId = static_cast<uint64_t>(pSurfaceTmp->GetUniqueId());
    auto utils = SurfaceUtils::GetInstance();
    utils->Add(surfaceId, pSurfaceTmp);
    OHNativeWindow *nativeWindowTmp = nullptr;
    int32_t ret = OH_NativeWindow_CreateNativeWindowFromSurfaceId(0xFFFFFFFF, &nativeWindowTmp);
    ASSERT_EQ(ret, NATIVE_ERROR_INVALID_ARGUMENTS);
    ret = OH_NativeWindow_CreateNativeWindowFromSurfaceId(surfaceId, &nativeWindowTmp);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    surfaceId = 0;
    ret = OH_NativeWindow_GetSurfaceId(nativeWindowTmp, &surfaceId);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ASSERT_EQ(surfaceId, pSurfaceTmp->GetUniqueId());

    cSurfaceTmp = nullptr;
    producerTmp = nullptr;
    pSurfaceTmp = nullptr;
    OH_NativeWindow_DestroyNativeWindow(nativeWindowTmp);
}

/*
 * @tc.name  HandleOpt001
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, HandleOpt001, Function | MediumTest | Level2)
{
    int code = SET_USAGE;
    uint64_t usage = BUFFER_USAGE_CPU_READ;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nullptr, code, usage), NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  HandleOpt002
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, HandleOpt002, Function | MediumTest | Level2)
{
    int code = SET_USAGE;
    uint64_t usageSet = BUFFER_USAGE_CPU_READ;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, usageSet), NATIVE_ERROR_OK);

    code = GET_USAGE;
    uint64_t usageGet = BUFFER_USAGE_CPU_WRITE;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &usageGet), NATIVE_ERROR_OK);
    ASSERT_EQ(usageSet, usageGet);
}

/*
 * @tc.name  HandleOpt003
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, HandleOpt003, Function | MediumTest | Level2)
{
    int code = SET_BUFFER_GEOMETRY;
    int32_t heightSet = 0x100;
    int32_t widthSet = 0x100;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, heightSet, widthSet), NATIVE_ERROR_OK);

    code = GET_BUFFER_GEOMETRY;
    int32_t heightGet = 0;
    int32_t widthGet = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &heightGet, &widthGet), NATIVE_ERROR_OK);
    ASSERT_EQ(heightSet, heightGet);
    ASSERT_EQ(widthSet, widthGet);
}

/*
 * @tc.name  HandleOpt004
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, HandleOpt004, Function | MediumTest | Level2)
{
    int code = SET_FORMAT;
    int32_t formatSet = GRAPHIC_PIXEL_FMT_RGBA_8888;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, formatSet), NATIVE_ERROR_OK);

    code = GET_FORMAT;
    int32_t formatGet = GRAPHIC_PIXEL_FMT_CLUT8;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &formatGet), NATIVE_ERROR_OK);
    ASSERT_EQ(formatSet, formatGet);
}

/*
 * @tc.name  HandleOpt005
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, HandleOpt005, Function | MediumTest | Level2)
{
    int code = SET_STRIDE;
    int32_t strideSet = 0x8;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, strideSet), NATIVE_ERROR_OK);

    code = GET_STRIDE;
    int32_t strideGet = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &strideGet), NATIVE_ERROR_OK);
    ASSERT_EQ(strideSet, strideGet);
}

/*
 * @tc.name  HandleOpt006
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, HandleOpt006, Function | MediumTest | Level2)
{
    int code = SET_COLOR_GAMUT;
    int32_t colorGamutSet = static_cast<int32_t>(GraphicColorGamut::GRAPHIC_COLOR_GAMUT_DCI_P3);
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, colorGamutSet), NATIVE_ERROR_OK);

    code = GET_COLOR_GAMUT;
    int32_t colorGamutGet = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &colorGamutGet), NATIVE_ERROR_OK);
    ASSERT_EQ(colorGamutSet, colorGamutGet);
}

/*
 * @tc.name  HandleOpt007
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, HandleOpt007, Function | MediumTest | Level2)
{
    int code = SET_TIMEOUT;
    int32_t timeoutSet = 10;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, timeoutSet), NATIVE_ERROR_OK);

    code = GET_TIMEOUT;
    int32_t timeoutGet = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &timeoutGet), NATIVE_ERROR_OK);
    ASSERT_EQ(timeoutSet, timeoutGet);
}

/*
 * @tc.name  HandleOpt008
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, HandleOpt008, Function | MediumTest | Level1)
{
    int code = GET_TRANSFORM;
    int32_t transform = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &transform), NATIVE_ERROR_OK);
    transform = GraphicTransformType::GRAPHIC_ROTATE_90;
    code = SET_TRANSFORM;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, transform), NATIVE_ERROR_OK);
    int32_t transformTmp = 0;
    code = GET_TRANSFORM;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &transformTmp), NATIVE_ERROR_OK);
    ASSERT_EQ(transformTmp, GraphicTransformType::GRAPHIC_ROTATE_90);
    nativeWindow->surface->SetTransform(GraphicTransformType::GRAPHIC_ROTATE_180);
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &transformTmp), NATIVE_ERROR_OK);
    ASSERT_EQ(transformTmp, GraphicTransformType::GRAPHIC_ROTATE_180);
}

/*
 * @tc.name  HandleOpt009
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, HandleOpt009, Function | MediumTest | Level1)
{
    int code = GET_BUFFERQUEUE_SIZE;
    int32_t queueSize = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &queueSize), NATIVE_ERROR_OK);
    ASSERT_EQ(queueSize, 3);
    nativeWindow->surface->SetQueueSize(5);
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &queueSize), NATIVE_ERROR_OK);
    ASSERT_EQ(queueSize, 5);
}
/*
 * @tc.name  HandleOpt010
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, HandleOpt010, Function | MediumTest | Level2)
{
    int code = SET_USAGE;
    uint64_t usageSet = NATIVEBUFFER_USAGE_HW_RENDER | NATIVEBUFFER_USAGE_HW_TEXTURE |
    NATIVEBUFFER_USAGE_CPU_READ_OFTEN | NATIVEBUFFER_USAGE_ALIGNMENT_512;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, usageSet), NATIVE_ERROR_OK);

    code = GET_USAGE;
    uint64_t usageGet = usageSet;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &usageGet), NATIVE_ERROR_OK);
    ASSERT_EQ(usageSet, usageGet);

    code = SET_FORMAT;
    int32_t formatSet = NATIVEBUFFER_PIXEL_FMT_YCBCR_P010;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, formatSet), NATIVE_ERROR_OK);

    code = GET_FORMAT;
    int32_t formatGet = NATIVEBUFFER_PIXEL_FMT_YCBCR_P010;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &formatGet), NATIVE_ERROR_OK);
    ASSERT_EQ(formatSet, formatGet);
}
/*
 * @tc.name  HandleOpt011
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeWindowTest, HandleOpt011, Function | MediumTest | Level1)
{
    int code = SET_SOURCE_TYPE;
    OHSurfaceSource typeSet = OHSurfaceSource::OH_SURFACE_SOURCE_GAME;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, typeSet), NATIVE_ERROR_OK);

    code = GET_SOURCE_TYPE;
    OHSurfaceSource typeGet = OHSurfaceSource::OH_SURFACE_SOURCE_DEFAULT;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &typeGet), NATIVE_ERROR_OK);
    ASSERT_EQ(typeSet, typeGet);
}
/*
 * @tc.name  HandleOpt012
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeWindowTest, HandleOpt012, Function | MediumTest | Level1)
{
    int code = SET_APP_FRAMEWORK_TYPE;
    const char* typeSet = "test";
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, typeSet), NATIVE_ERROR_OK);

    code = GET_APP_FRAMEWORK_TYPE;
    const char* typeGet;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &typeGet), NATIVE_ERROR_OK);
    ASSERT_EQ(0, strcmp(typeSet, typeGet));
}
/*
 * @tc.name  HandleOpt013
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt by different param
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeWindowTest, HandleOpt013, Function | MediumTest | Level1)
{
    int code = SET_HDR_WHITE_POINT_BRIGHTNESS;
    float brightness = 0.8;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, brightness), NATIVE_ERROR_OK);

    code = SET_SDR_WHITE_POINT_BRIGHTNESS;
    brightness = 0.5;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, brightness), NATIVE_ERROR_OK);

    code = SET_HDR_WHITE_POINT_BRIGHTNESS;
    brightness = 1.8;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, brightness), NATIVE_ERROR_OK);
    brightness = -0.5;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, brightness), NATIVE_ERROR_OK);
    brightness = 0.5;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, brightness), NATIVE_ERROR_OK);

    code = SET_SDR_WHITE_POINT_BRIGHTNESS;
    brightness = 1.5;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, brightness), NATIVE_ERROR_OK);
    brightness = -0.1;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, brightness), NATIVE_ERROR_OK);
    brightness = 0.8;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, brightness), NATIVE_ERROR_OK);
}
/*
 * @tc.name  NativeWindowAttachBuffer001
 * @tc.desc  call OH_NativeWindow_NativeWindowAttachBuffer by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, NativeWindowAttachBuffer001, Function | MediumTest | Level1)
{
    ASSERT_EQ(OH_NativeWindow_NativeWindowAttachBuffer(nullptr, nullptr), NATIVE_ERROR_INVALID_ARGUMENTS);
    ASSERT_EQ(OH_NativeWindow_NativeWindowDetachBuffer(nullptr, nullptr), NATIVE_ERROR_INVALID_ARGUMENTS);
}

void SetNativeWindowConfig(NativeWindow *nativeWindow)
{
    int code = SET_USAGE;
    uint64_t usageSet = BUFFER_USAGE_CPU_READ;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, usageSet), NATIVE_ERROR_OK);

    code = SET_BUFFER_GEOMETRY;
    int32_t heightSet = 0x100;
    int32_t widthSet = 0x100;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, heightSet, widthSet), NATIVE_ERROR_OK);

    code = SET_FORMAT;
    int32_t formatSet = GRAPHIC_PIXEL_FMT_RGBA_8888;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, formatSet), NATIVE_ERROR_OK);

    code = SET_STRIDE;
    int32_t strideSet = 0x8;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, strideSet), NATIVE_ERROR_OK);

    code = SET_COLOR_GAMUT;
    int32_t colorGamutSet = static_cast<int32_t>(GraphicColorGamut::GRAPHIC_COLOR_GAMUT_DCI_P3);
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, colorGamutSet), NATIVE_ERROR_OK);

    code = SET_TIMEOUT;
    int32_t timeoutSet = 10;  // 10: for test
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, timeoutSet), NATIVE_ERROR_OK);
}

/*
 * @tc.name  NativeWindowAttachBuffer002
 * @tc.desc  call OH_NativeWindow_NativeWindowAttachBuffer by normal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, NativeWindowAttachBuffer002, Function | MediumTest | Level1)
{
    sptr<OHOS::IConsumerSurface> cSurfaceTmp = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    cSurfaceTmp->RegisterConsumerListener(listener);
    sptr<OHOS::IBufferProducer> producerTmp = cSurfaceTmp->GetProducer();
    sptr<OHOS::Surface> pSurfaceTmp = Surface::CreateSurfaceAsProducer(producerTmp);

    NativeWindow *nativeWindowTmp = OH_NativeWindow_CreateNativeWindow(&pSurfaceTmp);
    ASSERT_NE(nativeWindowTmp, nullptr);
    SetNativeWindowConfig(nativeWindowTmp);

    NativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp, &nativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    int code = GET_BUFFERQUEUE_SIZE;
    int32_t queueSize = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindowTmp, code, &queueSize), NATIVE_ERROR_OK);
    ASSERT_EQ(queueSize, 3);

    ASSERT_EQ(OH_NativeWindow_NativeWindowDetachBuffer(nativeWindowTmp, nativeWindowBuffer), NATIVE_ERROR_OK);

    ASSERT_EQ(OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, nativeWindowBuffer), NATIVE_ERROR_OK);

    ASSERT_EQ(OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, nativeWindowBuffer), NATIVE_ERROR_OK);

    ASSERT_EQ(OH_NativeWindow_NativeWindowAttachBuffer(nativeWindowTmp, nativeWindowBuffer), NATIVE_ERROR_OK);
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindowTmp, code, &queueSize), NATIVE_ERROR_OK);
    ASSERT_EQ(queueSize, 3);
    ASSERT_EQ(OH_NativeWindow_NativeWindowAttachBuffer(nativeWindowTmp, nativeWindowBuffer), NATIVE_ERROR_BUFFER_IN_CACHE);

    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindowTmp, nativeWindowBuffer, fenceFd, *region);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    OH_NativeWindow_DestroyNativeWindow(nativeWindowTmp);
}

void NativeWindowAttachBuffer003Test(NativeWindow *nativeWindowTmp, NativeWindow *nativeWindowTmp1)
{
    NativeWindowBuffer *nativeWindowBuffer1 = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp, &nativeWindowBuffer1, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    NativeWindowBuffer *nativeWindowBuffer2 = nullptr;
    fenceFd = -1;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp, &nativeWindowBuffer2, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    NativeWindowBuffer *nativeWindowBuffer3 = nullptr;
    fenceFd = -1;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp, &nativeWindowBuffer3, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    int code = GET_BUFFERQUEUE_SIZE;
    int32_t queueSize = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindowTmp, code, &queueSize), NATIVE_ERROR_OK);
    ASSERT_EQ(queueSize, 3);    // 3 : check num

    ASSERT_EQ(OH_NativeWindow_NativeWindowDetachBuffer(nativeWindowTmp, nativeWindowBuffer1), NATIVE_ERROR_OK);
    ASSERT_EQ(OH_NativeWindow_NativeWindowDetachBuffer(nativeWindowTmp, nativeWindowBuffer2), NATIVE_ERROR_OK);
    ASSERT_EQ(OH_NativeWindow_NativeWindowDetachBuffer(nativeWindowTmp, nativeWindowBuffer3), NATIVE_ERROR_OK);

    NativeWindowBuffer *nativeWindowBuffer4 = nullptr;
    fenceFd = -1;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp, &nativeWindowBuffer4, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    NativeWindowBuffer *nativeWindowBuffer10 = nullptr;
    fenceFd = -1;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp1, &nativeWindowBuffer10, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    NativeWindowBuffer *nativeWindowBuffer11 = nullptr;
    fenceFd = -1;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp1, &nativeWindowBuffer11, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    NativeWindowBuffer *nativeWindowBuffer12 = nullptr;
    fenceFd = -1;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp1, &nativeWindowBuffer12, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    ASSERT_EQ(OH_NativeWindow_NativeWindowAttachBuffer(nativeWindowTmp1, nativeWindowBuffer1),
        NATIVE_ERROR_BUFFER_QUEUE_FULL);
}

/*
* Function: OH_NativeWindow_NativeWindowAttachBuffer
* Type: Function
* Rank: Important(2)
* EnvConditions: N/A
* CaseDescription: 1. call OH_NativeWindow_NativeWindowAttachBuffer by normal input
*                  2. check ret
 */
HWTEST_F(NativeWindowTest, NativeWindowAttachBuffer003, Function | MediumTest | Level1)
{
    sptr<OHOS::IConsumerSurface> cSurfaceTmp = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    cSurfaceTmp->RegisterConsumerListener(listener);
    sptr<OHOS::IBufferProducer> producerTmp = cSurfaceTmp->GetProducer();
    sptr<OHOS::Surface> pSurfaceTmp = Surface::CreateSurfaceAsProducer(producerTmp);

    NativeWindow *nativeWindowTmp = OH_NativeWindow_CreateNativeWindow(&pSurfaceTmp);
    ASSERT_NE(nativeWindowTmp, nullptr);
    SetNativeWindowConfig(nativeWindowTmp);

    sptr<OHOS::IConsumerSurface> cSurfaceTmp1 = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener1 = new BufferConsumerListener();
    cSurfaceTmp1->RegisterConsumerListener(listener1);
    sptr<OHOS::IBufferProducer> producerTmp1 = cSurfaceTmp1->GetProducer();
    sptr<OHOS::Surface> pSurfaceTmp1 = Surface::CreateSurfaceAsProducer(producerTmp1);

    NativeWindow *nativeWindowTmp1 = OH_NativeWindow_CreateNativeWindow(&pSurfaceTmp1);
    ASSERT_NE(nativeWindowTmp1, nullptr);
    SetNativeWindowConfig(nativeWindowTmp1);

    NativeWindowAttachBuffer003Test(nativeWindowTmp, nativeWindowTmp1);

    OH_NativeWindow_DestroyNativeWindow(nativeWindowTmp);
    OH_NativeWindow_DestroyNativeWindow(nativeWindowTmp1);
}

/*
 * @tc.name  NativeWindowAttachBuffer004
 * @tc.desc  call OH_NativeWindow_NativeWindowAttachBuffer by normal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, NativeWindowAttachBuffer004, Function | MediumTest | Level1)
{
    sptr<OHOS::IConsumerSurface> cSurfaceTmp = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    cSurfaceTmp->RegisterConsumerListener(listener);
    sptr<OHOS::IBufferProducer> producerTmp = cSurfaceTmp->GetProducer();
    sptr<OHOS::Surface> pSurfaceTmp = Surface::CreateSurfaceAsProducer(producerTmp);

    NativeWindow *nativeWindowTmp = OH_NativeWindow_CreateNativeWindow(&pSurfaceTmp);
    ASSERT_NE(nativeWindowTmp, nullptr);
    SetNativeWindowConfig(nativeWindowTmp);

    NativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp, &nativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindowTmp, nativeWindowBuffer, fenceFd, *region);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    ASSERT_EQ(OH_NativeWindow_NativeWindowDetachBuffer(nativeWindowTmp, nativeWindowBuffer),
        NATIVE_ERROR_BUFFER_STATE_INVALID);

    ASSERT_EQ(OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, nativeWindowBuffer),
        NATIVE_ERROR_BUFFER_NOT_IN_CACHE);

    OH_NativeWindow_DestroyNativeWindow(nativeWindowTmp);
}

/*
 * @tc.name  NativeWindowAttachBuffer005
 * @tc.desc  call OH_NativeWindow_NativeWindowAttachBuffer by normal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, NativeWindowAttachBuffer005, Function | MediumTest | Level1)
{
    sptr<OHOS::IConsumerSurface> cSurfaceTmp = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    cSurfaceTmp->RegisterConsumerListener(listener);
    sptr<OHOS::IBufferProducer> producerTmp = cSurfaceTmp->GetProducer();
    sptr<OHOS::Surface> pSurfaceTmp = Surface::CreateSurfaceAsProducer(producerTmp);

    NativeWindow *nativeWindowTmp = OH_NativeWindow_CreateNativeWindow(&pSurfaceTmp);
    ASSERT_NE(nativeWindowTmp, nullptr);
    SetNativeWindowConfig(nativeWindowTmp);

    NativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp, &nativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    ASSERT_EQ(cSurface->AttachBufferToQueue(nativeWindowBuffer->sfbuffer), GSERROR_OK);

    ASSERT_EQ(cSurface->DetachBufferFromQueue(nativeWindowBuffer->sfbuffer), GSERROR_OK);

    ASSERT_EQ(cSurface->AttachBufferToQueue(nativeWindowBuffer->sfbuffer), GSERROR_OK);

    sptr<SyncFence> fence = SyncFence::INVALID_FENCE;
    ASSERT_EQ(cSurface->ReleaseBuffer(nativeWindowBuffer->sfbuffer, fence), GSERROR_OK);

    OH_NativeWindow_DestroyNativeWindow(nativeWindowTmp);
}
/*
 * @tc.name  NativeWindowAttachBuffer006
 * @tc.desc  call OH_NativeWindow_NativeWindowAttachBuffer by normal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, NativeWindowAttachBuffer006, Function | MediumTest | Level1)
{
    sptr<OHOS::IConsumerSurface> cSurfaceTmp = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    cSurfaceTmp->RegisterConsumerListener(listener);
    sptr<OHOS::IBufferProducer> producerTmp = cSurfaceTmp->GetProducer();
    sptr<OHOS::Surface> pSurfaceTmp = Surface::CreateSurfaceAsProducer(producerTmp);

    NativeWindow *nativeWindowTmp = OH_NativeWindow_CreateNativeWindow(&pSurfaceTmp);
    ASSERT_NE(nativeWindowTmp, nullptr);
    SetNativeWindowConfig(nativeWindowTmp);

    NativeWindowBuffer *nativeWindowBuffer1 = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindowTmp, &nativeWindowBuffer1, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    int code = GET_BUFFERQUEUE_SIZE;
    int32_t queueSize = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindowTmp, code, &queueSize), NATIVE_ERROR_OK);
    ASSERT_EQ(queueSize, 3);
    clock_t startTime, endTime;
    startTime = clock();
    for (int32_t i = 0; i < 1000; i++) {
        ASSERT_EQ(OH_NativeWindow_NativeWindowDetachBuffer(nativeWindowTmp, nativeWindowBuffer1), NATIVE_ERROR_OK);
        ASSERT_EQ(OH_NativeWindow_NativeWindowAttachBuffer(nativeWindowTmp, nativeWindowBuffer1), NATIVE_ERROR_OK);
    }
    endTime = clock();
    cout << "DetachBuffer and AttachBuffer 1000 times cost time: " << (endTime - startTime) << "ms" << endl;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindowTmp, code, &queueSize), NATIVE_ERROR_OK);
    ASSERT_EQ(queueSize, 3);
    OH_NativeWindow_DestroyNativeWindow(nativeWindowTmp);
}

/*
 * @tc.name  CreateNativeWindowBuffer001
 * @tc.desc  call OH_NativeWindow_CreateNativeWindowBufferFromSurfaceBuffer by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CreateNativeWindowBuffer001, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_CreateNativeWindowBufferFromSurfaceBuffer(nullptr), nullptr);
}

/*
 * @tc.name  CreateNativeWindowBuffer002
 * @tc.desc  call OH_NativeWindow_CreateNativeWindowBufferFromSurfaceBuffer 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CreateNativeWindowBuffer002, Function | MediumTest | Level2)
{
    nativeWindowBuffer = OH_NativeWindow_CreateNativeWindowBufferFromSurfaceBuffer(&sBuffer);
    ASSERT_NE(nativeWindowBuffer, nullptr);
}

/*
 * @tc.name  CreateNativeWindowBuffer003
 * @tc.desc  call OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
*/
HWTEST_F(NativeWindowTest, CreateNativeWindowBuffer003, Function | MediumTest | Level2)
{
    OH_NativeBuffer* nativeBuffer = sBuffer->SurfaceBufferToNativeBuffer();
    ASSERT_NE(nativeBuffer, nullptr);
    NativeWindowBuffer* nwBuffer = OH_NativeWindow_CreateNativeWindowBufferFromNativeBuffer(nativeBuffer);
    ASSERT_NE(nwBuffer, nullptr);
    OH_NativeWindow_DestroyNativeWindowBuffer(nwBuffer);
}

/*
 * @tc.name  RequestBuffer001
 * @tc.desc  call OH_NativeWindow_NativeWindowRequestBuffer by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, RequestBuffer001, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_NativeWindowRequestBuffer(nullptr, &nativeWindowBuffer, nullptr),
              NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  RequestBuffer002
 * @tc.desc  call OH_NativeWindow_NativeWindowRequestBuffer by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, RequestBuffer002, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, nullptr, nullptr),
              NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  GetBufferHandle001
 * @tc.desc  call OH_NativeWindow_GetBufferHandleFromNative by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, GetBufferHandle001, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_GetBufferHandleFromNative(nullptr), nullptr);
}

/*
 * @tc.name  GetBufferHandle002
 * @tc.desc  call OH_NativeWindow_GetBufferHandleFromNative
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, GetBufferHandle002, Function | MediumTest | Level2)
{
    struct NativeWindowBuffer *buffer = new NativeWindowBuffer();
    buffer->sfbuffer = sBuffer;
    ASSERT_NE(OH_NativeWindow_GetBufferHandleFromNative(nativeWindowBuffer), nullptr);
    delete buffer;
}

/*
 * @tc.name  FlushBuffer001
 * @tc.desc  call OH_NativeWindow_NativeWindowFlushBuffer by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, FlushBuffer001, Function | MediumTest | Level2)
{
    int fenceFd = -1;
    struct Region *region = new Region();
    struct Region::Rect * rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;

    ASSERT_EQ(OH_NativeWindow_NativeWindowFlushBuffer(nullptr, nullptr, fenceFd, *region),
              NATIVE_ERROR_INVALID_ARGUMENTS);
    delete region;
}

/*
 * @tc.name  FlushBuffer002
 * @tc.desc  call OH_NativeWindow_NativeWindowFlushBuffer by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, FlushBuffer002, Function | MediumTest | Level2)
{
    int fenceFd = -1;
    struct Region *region = new Region();
    struct Region::Rect * rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;

    ASSERT_EQ(OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nullptr, fenceFd, *region),
              NATIVE_ERROR_INVALID_ARGUMENTS);
    delete region;
}

/*
 * @tc.name  FlushBuffer003
 * @tc.desc  call OH_NativeWindow_NativeWindowFlushBuffer
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, FlushBuffer003, Function | MediumTest | Level2)
{
    int fenceFd = -1;
    struct Region *region = new Region();
    region->rectNumber = 0;
    region->rects = nullptr;
    ASSERT_EQ(OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region),
              NATIVE_ERROR_OK);

    region->rectNumber = 1;
    struct Region::Rect * rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    ASSERT_EQ(OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region),
              NATIVE_ERROR_BUFFER_STATE_INVALID);
    delete rect;
    delete region;
}

/*
 * @tc.name  GetLastFlushedBuffer001
 * @tc.desc  call OH_NativeWindow_NativeWindowRequestBuffer
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, GetLastFlushedBuffer001, Function | MediumTest | Level2)
{
    int code = SET_TRANSFORM;
    int32_t transform = GraphicTransformType::GRAPHIC_ROTATE_90;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, transform), NATIVE_ERROR_OK);

    code = SET_FORMAT;
    int32_t format = GRAPHIC_PIXEL_FMT_RGBA_8888;
    ASSERT_EQ(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, format), NATIVE_ERROR_OK);

    NativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    BufferHandle *bufferHanlde = OH_NativeWindow_GetBufferHandleFromNative(nativeWindowBuffer);
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    NativeWindowBuffer *lastFlushedBuffer;
    int lastFlushedFenceFd;
    float matrix[16];
    ASSERT_EQ(OH_NativeWindow_GetLastFlushedBuffer(nativeWindow, &lastFlushedBuffer, &lastFlushedFenceFd, matrix),
        NATIVE_ERROR_OK);
    BufferHandle *lastFlushedHanlde = OH_NativeWindow_GetBufferHandleFromNative(lastFlushedBuffer);
    ASSERT_EQ(bufferHanlde->virAddr, lastFlushedHanlde->virAddr);

    ASSERT_EQ(OH_NativeWindow_GetLastFlushedBufferV2(nativeWindow, &lastFlushedBuffer, &lastFlushedFenceFd, matrix),
        NATIVE_ERROR_OK);
}

/*
 * @tc.name  GetLastFlushedBuffer002
 * @tc.desc  call NativeWindowHandleOpt set BUFFER_USAGE_PROTECTED 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, GetLastFlushedBuffer002, Function | MediumTest | Level2)
{
    int code = SET_USAGE;
    uint64_t usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_MEM_DMA | BUFFER_USAGE_PROTECTED;
    ASSERT_EQ(NativeWindowHandleOpt(nativeWindow, code, usage), NATIVE_ERROR_OK);

    NativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    NativeWindowBuffer* lastFlushedBuffer;
    int lastFlushedFenceFd;
    float matrix[16];
    ASSERT_EQ(OH_NativeWindow_GetLastFlushedBuffer(nativeWindow, &lastFlushedBuffer, &lastFlushedFenceFd, matrix),
        NATIVE_ERROR_UNSUPPORTED);
}
/*
 * @tc.name  OH_NativeWindow_SetColorSpace001
 * @tc.desc  call OH_NativeWindow_SetColorSpace
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, OH_NativeWindow_SetColorSpace001, Function | MediumTest | Level2)
{
    OH_NativeBuffer_ColorSpace colorSpace = OH_COLORSPACE_NONE;
    auto ret = OH_NativeWindow_GetColorSpace(nativeWindow, &colorSpace);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(ret, NATIVE_ERROR_UNKNOWN);
    }
    ret = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_BT709_LIMIT);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
    ret = OH_NativeWindow_GetColorSpace(nativeWindow, &colorSpace);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
        ASSERT_EQ(colorSpace, OH_COLORSPACE_BT709_LIMIT);
    }
}

/*
 * @tc.name  OH_NativeWindow_SetColorSpace001
 * @tc.desc  call OH_NativeWindow_SetMetadataValue
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, OH_NativeWindow_SetMetadataValue001, Function | MediumTest | Level2)
{
    int len = 60;
    uint8_t buff[len];
    for (int i = 0; i < 60; ++i) {
        buff[i] = static_cast<uint8_t>(i);
    }
    int32_t buffSize;
    uint8_t *checkMetaData;
    auto ret = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, &buffSize, &checkMetaData);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_NE(ret, NATIVE_ERROR_OK);
    }
    int32_t maxSize = -1;
    ret = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, (int32_t)maxSize, buff);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_NE(ret, NATIVE_ERROR_OK);
    }
    ret = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, (int32_t)len, buff);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
    ret = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, &buffSize, &checkMetaData);
    if (ret != NATIVE_ERROR_UNSUPPORTED) { // some device not support set colorspace
        ASSERT_EQ(memcmp(checkMetaData, buff, 60), 0);
        delete[] checkMetaData;
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
}
/*
 * @tc.name  CancelBuffer001
 * @tc.desc  call OH_NativeWindow_NativeWindowAbortBuffer by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CancelBuffer001, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_NativeWindowAbortBuffer(nullptr, nullptr), NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  CancelBuffer002
 * @tc.desc  call OH_NativeWindow_NativeWindowAbortBuffer by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CancelBuffer002, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_NativeWindowAbortBuffer(nativeWindow, nullptr), NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name CancelBuffer003 
 * @tc.desc  call OH_NativeWindow_NativeWindowAbortBuffer
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, CancelBuffer003, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_NativeWindowAbortBuffer(nativeWindow, nativeWindowBuffer), NATIVE_ERROR_OK);
}

/*
 * @tc.name  Reference001
 * @tc.desc  call OH_NativeWindow_NativeObjectReference
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, Reference001, Function | MediumTest | Level2)
{
    struct NativeWindowBuffer *buffer = new NativeWindowBuffer();
    buffer->sfbuffer = sBuffer;
    ASSERT_EQ(OH_NativeWindow_NativeObjectReference(reinterpret_cast<void *>(buffer)), NATIVE_ERROR_OK);
    delete buffer;
}

/*
 * @tc.name  Unreference001
 * @tc.desc  call OH_NativeWindow_NativeObjectUnreference
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, Unreference001, Function | MediumTest | Level2)
{
    struct NativeWindowBuffer *buffer = new NativeWindowBuffer();
    buffer->sfbuffer = sBuffer;
    ASSERT_EQ(OH_NativeWindow_NativeObjectUnreference(reinterpret_cast<void *>(buffer)), NATIVE_ERROR_OK);
    delete buffer;
}

/*
 * @tc.name  DestroyNativeWindow001
 * @tc.desc  call OH_NativeWindow_DestroyNativeWindow by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, DestroyNativeWindow001, Function | MediumTest | Level2)
{
    OH_NativeWindow_DestroyNativeWindow(nullptr);
}

/*
 * @tc.name  OH_NativeWindow_DestroyNativeWindowBuffer001
 * @tc.desc  call OH_NativeWindow_DestroyNativeWindowBuffer by abnormal input 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, OH_NativeWindow_DestroyNativeWindowBuffer001, Function | MediumTest | Level2)
{
    OH_NativeWindow_DestroyNativeWindowBuffer(nullptr);
}

/*
 * @tc.name  OH_NativeWindow_DestroyNativeWindowBuffer002
 * @tc.desc  call OH_NativeWindow_DestroyNativeWindowBuffer again 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, OH_NativeWindow_DestroyNativeWindowBuffer002, Function | MediumTest | Level2)
{
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
}

/*
 * @tc.name  SetScalingMode001
 * @tc.desc  call OH_NativeWindow_NativeWindowSetScalingMode with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetScalingMode001, Function | MediumTest | Level2)
{
    OHScalingMode scalingMode = OHScalingMode::OH_SCALING_MODE_SCALE_TO_WINDOW;
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetScalingMode(nullptr, -1, scalingMode), NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  SetScalingMode002
 * @tc.desc  call OH_NativeWindow_NativeWindowSetScalingMode with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetScalingMode002, Function | MediumTest | Level2)
{
    OHScalingMode scalingMode = OHScalingMode::OH_SCALING_MODE_SCALE_TO_WINDOW;
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetScalingMode(nativeWindow, -1, scalingMode), OHOS::GSERROR_NO_ENTRY);
}

/*
 * @tc.name  SetScalingMode003
 * @tc.desc  call OH_NativeWindow_NativeWindowSetScalingMode with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetScalingMode003, Function | MediumTest | Level2)
{
    int32_t sequence = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetScalingMode(nativeWindow, sequence,
                                         static_cast<OHScalingMode>(OHScalingMode::OH_SCALING_MODE_NO_SCALE_CROP + 1)),
                                         NATIVE_ERROR_INVALID_ARGUMENTS);
}
/*
 * @tc.name  : SetScalingMode005
 * @tc.desc  : call OH_NativeWindow_NativeWindowSetScalingModeV2 with abnormal parameters and check ret
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeWindowTest, SetScalingMode005, Function | MediumTest | Level1)
{
    OHScalingModeV2 scalingMode = OHScalingModeV2::OH_SCALING_MODE_SCALE_TO_WINDOW_V2;
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetScalingModeV2(nativeWindow, scalingMode), NATIVE_ERROR_OK);
}
/*
 * @tc.name  SetMetaData001
 * @tc.desc  call OH_NativeWindow_NativeWindowSetMetaData with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetMetaData001, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetMetaData(nullptr, -1, 0, nullptr), NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  SetMetaData002
 * @tc.desc  call OH_NativeWindow_NativeWindowSetMetaData with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetMetaData002, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetMetaData(nativeWindow, -1, 0, nullptr), NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  SetMetaData003
 * @tc.desc  call OH_NativeWindow_NativeWindowSetMetaData with abnormal parameters and check ret
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetMetaData003, Function | MediumTest | Level2)
{
    int32_t sequence = 0;
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetMetaData(nativeWindow, sequence, 0, nullptr),
              NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  SetMetaData004
 * @tc.desc  call OH_NativeWindow_NativeWindowSetMetaData with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetMetaData004, Function | MediumTest | Level2)
{
    int32_t sequence = 0;
    int32_t size = 1;
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetMetaData(nativeWindow, sequence, size, nullptr),
              NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  SetMetaData005
 * @tc.desc  call OH_NativeWindow_NativeWindowSetMetaData with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetMetaData005, Function | MediumTest | Level2)
{
    int32_t size = 1;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_RED_PRIMARY_X, 0}};
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetMetaData(nativeWindow, -1, size, metaData), OHOS::GSERROR_NO_ENTRY);
}


/*
 * @tc.name  SetMetaDataSet001
 * @tc.desc  call OH_NativeWindow_NativeWindowSetMetaDataSet with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetMetaDataSet001, Function | MediumTest | Level2)
{
    OHHDRMetadataKey key = OHHDRMetadataKey::OH_METAKEY_HDR10_PLUS;
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetMetaDataSet(nullptr, -1, key, 0, nullptr),
              NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  SetMetaDataSet002
 * @tc.desc  call OH_NativeWindow_NativeWindowSetMetaDataSet with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetMetaDataSet002, Function | MediumTest | Level2)
{
    OHHDRMetadataKey key = OHHDRMetadataKey::OH_METAKEY_HDR10_PLUS;
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetMetaDataSet(nativeWindow, -1, key, 0, nullptr),
              NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  SetMetaDataSet003
 * @tc.desc  call OH_NativeWindow_NativeWindowSetMetaDataSet with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetMetaDataSet003, Function | MediumTest | Level2)
{
    int32_t sequence = 0;
    OHHDRMetadataKey key = OHHDRMetadataKey::OH_METAKEY_HDR10_PLUS;
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetMetaDataSet(nativeWindow, sequence, key, 0, nullptr),
              NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name SetMetaDataSet004 
 * @tc.desc  call OH_NativeWindow_NativeWindowSetMetaDataSet with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetMetaDataSet004, Function | MediumTest | Level2)
{
    int32_t sequence = 0;
    int32_t size = 1;
    OHHDRMetadataKey key = OHHDRMetadataKey::OH_METAKEY_HDR10_PLUS;
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetMetaDataSet(nativeWindow, sequence, key, size, nullptr),
              NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  SetMetaDataSet005
 * @tc.desc  call OH_NativeWindow_NativeWindowSetMetaDataSet with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetMetaDataSet005, Function | MediumTest | Level2)
{
    int32_t size = 1;
    OHHDRMetadataKey key = OHHDRMetadataKey::OH_METAKEY_HDR10_PLUS;
    const uint8_t metaData[] = {0};
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetMetaDataSet(nativeWindow, -1, key, size, metaData),
              OHOS::GSERROR_NO_ENTRY);
}


/*
 * @tc.name  SetTunnelHandle001
 * @tc.desc  call OH_NativeWindow_NativeWindowSetTunnelHandle with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetTunnelHandle001, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetTunnelHandle(nullptr, nullptr), NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  SetTunnelHandle002
 * @tc.desc  call OH_NativeWindow_NativeWindowSetTunnelHandle with abnormal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetTunnelHandle002, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetTunnelHandle(nativeWindow, nullptr), NATIVE_ERROR_INVALID_ARGUMENTS);
}

/*
 * @tc.name  SetTunnelHandle003
 * @tc.desc  call OH_NativeWindow_NativeWindowSetTunnelHandle with normal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, SetTunnelHandle003, Function | MediumTest | Level2)
{
    uint32_t reserveInts = 1;
    OHExtDataHandle *handle = AllocOHExtDataHandle(reserveInts);
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetTunnelHandle(nativeWindow, handle), NATIVE_ERROR_OK);
    FreeOHExtDataHandle(handle);
}

/*
 * @tc.name  SetTunnelHandle004
 * @tc.desc  call OH_NativeWindow_NativeWindowSetTunnelHandle with normal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeWindowTest, SetTunnelHandle004, Function | MediumTest | Level1)
{
    uint32_t reserveInts = 2;
    OHExtDataHandle *handle = AllocOHExtDataHandle(reserveInts);
    nativeWindow = OH_NativeWindow_CreateNativeWindow(&pSurface);
    ASSERT_NE(nativeWindow, nullptr);
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetTunnelHandle(nativeWindow, handle), NATIVE_ERROR_OK);
    ASSERT_EQ(OH_NativeWindow_NativeWindowSetTunnelHandle(nativeWindow, handle), OHOS::GSERROR_NO_ENTRY);
    FreeOHExtDataHandle(handle);
}

/*
 * @tc.name  NativeWindowGetDefaultWidthAndHeight001
 * @tc.desc  call NativeWindowGetDefaultWidthAndHeight with normal parameters and check ret 
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeWindowTest, NativeWindowGetDefaultWidthAndHeight001, Function | MediumTest | Level1)
{
    ASSERT_EQ(NativeWindowGetDefaultWidthAndHeight(nullptr, nullptr, nullptr), NATIVE_ERROR_INVALID_ARGUMENTS);
    cSurface->SetDefaultWidthAndHeight(300, 400);
    int32_t width;
    int32_t height;
    ASSERT_EQ(NativeWindowGetDefaultWidthAndHeight(nativeWindow, &width, &height), NATIVE_ERROR_OK);
    ASSERT_EQ(width, 300);
    ASSERT_EQ(height, 400);
}
/*
 * @tc.name  : NativeWindowSetBufferHold001
 * @tc.desc  : call NativeWindowSetBufferHold and no ret
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeWindowTest, NativeWindowSetBufferHold001, Function | MediumTest | Level1)
{
    OH_NativeWindow_SetBufferHold(nativeWindow); // buffer one frame in advance
    int fenceFd = -1;
    struct Region *region = new Region();
    region->rectNumber = 0;
    region->rects = nullptr;
    ASSERT_EQ(OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region),
              NATIVE_ERROR_INVALID_ARGUMENTS);
    region->rectNumber = 1;
    struct Region::Rect * rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    ASSERT_EQ(OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region),
              NATIVE_ERROR_INVALID_ARGUMENTS);
    delete rect;
    delete region;
    cSurface->SetBufferHold(false);
}

/*
 * @tc.name  : NativeWindowReadWriteWindow002
 * @tc.desc  : call OH_NativeWindow_WriteToParcel and OH_NativeWindow_ReadFromParcel
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeWindowTest, NativeWindowReadWriteWindow002, Function | MediumTest | Level1)
{
    using namespace OHOS;
    // test for no surface->GetUniqueId
    OHNativeWindow* nativeWindow1 = new OHNativeWindow();
    ASSERT_NE(nativeWindow1, nullptr);
    OHIPCParcel *parcel1 = OH_IPCParcel_Create();
    ASSERT_NE(parcel1, nullptr);
    ASSERT_EQ(OH_NativeWindow_WriteToParcel(nativeWindow1, parcel1), NATIVE_ERROR_INVALID_ARGUMENTS);
    OHNativeWindow *readWindow = nullptr;
    ASSERT_EQ(OH_NativeWindow_ReadFromParcel(parcel1, nullptr), NATIVE_ERROR_INVALID_ARGUMENTS);
    ASSERT_EQ(OH_NativeWindow_ReadFromParcel(parcel1, &readWindow), NATIVE_ERROR_INVALID_ARGUMENTS);
    OH_IPCParcel_Destroy(parcel1);
    delete nativeWindow1;
}
/*
 * @tc.name  GetNativeObjectMagic001
 * @tc.desc  call OH_NativeWindow_GetNativeObjectMagic
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeWindowTest, GetNativeObjectMagic001, Function | MediumTest | Level2)
{
    struct NativeWindowBuffer *buffer = new NativeWindowBuffer();
    buffer->sfbuffer = sBuffer;
    OH_NativeWindow_GetNativeObjectMagic(reinterpret_cast<void *>(buffer));
    delete buffer;
}
/*
 * @tc.name  testOptSetDesiredPresentTimeStampNormal
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeWindowTest, testOptSetDesiredPresentTimeStampNormal, Function | MediumTest | Level1)
{
    uint64_t surfaceId = static_cast<uint64_t>(pSurface->GetUniqueId());
    OHNativeWindow *_nativeWindow = nullptr;
    int32_t ret = OH_NativeWindow_CreateNativeWindowFromSurfaceId(surfaceId, &_nativeWindow);
    ASSERT_NE(_nativeWindow, nullptr);
    int32_t flag;
    int64_t nanoTimeStamp =
        std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::steady_clock::now().time_since_epoch())
            .count();
    uint64_t arr[] = {1, 1000, 1000000000, 1ULL << 63, nanoTimeStamp, 999999999999999999, 9223372036854775807};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, SET_DESIRED_PRESENT_TIMESTAMP, arr[i]);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
    OH_NativeWindow_DestroyNativeWindow(_nativeWindow);
}
/*
 * @tc.name  testOptSetDesiredPresentTimeStampAbNormal
 * @tc.desc  call OH_NativeWindow_NativeWindowHandleOpt
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeWindowTest, testOptSetDesiredPresentTimeStampAbNormal, Function | MediumTest | Level3)
{
    uint64_t surfaceId = static_cast<uint64_t>(pSurface->GetUniqueId());
    OHNativeWindow *_nativeWindow = nullptr;
    int32_t ret = OH_NativeWindow_CreateNativeWindowFromSurfaceId(surfaceId, &_nativeWindow);
    ASSERT_NE(_nativeWindow, nullptr);
    int32_t flag;
    uint64_t arr[] = {0, -1, -1000, -99999999999999, -9223372036854775807};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, SET_DESIRED_PRESENT_TIMESTAMP, arr[i]);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_DESIRED_PRESENT_TIMESTAMP, "sdasda213!");
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_DESIRED_PRESENT_TIMESTAMP, NULL);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_DESIRED_PRESENT_TIMESTAMP);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    OH_NativeWindow_DestroyNativeWindow(_nativeWindow);
}
}
