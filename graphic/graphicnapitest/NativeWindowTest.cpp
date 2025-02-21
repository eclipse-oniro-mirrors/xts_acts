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
#include <iservice_registry.h>
#include <native_window.h>
#include <securec.h>
#include "surface_type.h"
#include "buffer_log.h"
#include "external_window.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS::Rosen {
class NativeWindowTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();

    static inline OHNativeWindow* nativeWindow = nullptr;
    static inline OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    static inline uint32_t sequence = 0;
};

void NativeWindowTest::SetUpTestCase()
{
}

void NativeWindowTest::TearDownTestCase()
{
}

/*
 * @tc.name  CreateNativeWindow001
 * @tc.desc  test for call OH_NativeWindow_CreateNativeWindow by abnormal input and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, CreateNativeWindow001, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_CreateNativeWindow(nullptr), nullptr);
}

/*
 * @tc.name  OH_NativeWindow_GetNativeObjectMagic
 * @tc.desc  test for call OH_NativeWindow_GetNativeObjectMagic and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, GetNativeObjectMagic001, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeWindow_GetNativeObjectMagic(nativeWindow);
    ASSERT_NE(ret, 0);
}

/*
 * @tc.name  HandleOpt001
 * @tc.desc  test for call OH_NativeWindow_NativeWindowHandleOpt by different param and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, HandleOpt001, Function | MediumTest | Level2)
{
    int code = SET_BUFFER_GEOMETRY;
    int32_t heightSet = 0x100;
    int32_t widthSet = 0x100;
    ASSERT_NE(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, heightSet, widthSet), 0);

    code = GET_BUFFER_GEOMETRY;
    int32_t heightGet = 0;
    int32_t widthGet = 0;
    ASSERT_NE(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &heightGet, &widthGet), 0);
    ASSERT_NE(heightSet, heightGet);
    ASSERT_NE(widthSet, widthGet);
}


/*
 * @tc.name  HandleOpt005
 * @tc.desc  test for call OH_NativeWindow_NativeWindowHandleOpt by different param and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, HandleOpt005, Function | MediumTest | Level2)
{
    int code = SET_STRIDE;
    int32_t strideSet = 0x8;
    ASSERT_NE(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, strideSet), 0);

    code = GET_STRIDE;
    int32_t strideGet = 0;
    ASSERT_NE(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &strideGet), 0);
    ASSERT_NE(strideSet, strideGet);
}

/*
 * @tc.name  HandleOpt007
 * @tc.desc  test for call OH_NativeWindow_NativeWindowHandleOpt by different param and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, HandleOpt007, Function | MediumTest | Level2)
{
    int code = SET_TIMEOUT;
    int32_t timeoutSet = 10;  // 10: for test
    ASSERT_NE(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, timeoutSet), 0);

    code = GET_TIMEOUT;
    int32_t timeoutGet = 0;
    ASSERT_NE(OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, &timeoutGet), 0);
    ASSERT_NE(timeoutSet, timeoutGet);
}

/*
 * @tc.name  CreateNativeWindowBuffer001
 * @tc.desc  test for call OH_NativeWindow_CreateNativeWindowBufferFromSurfaceBuffer by abnormal input and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, CreateNativeWindowBuffer001, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_CreateNativeWindowBufferFromSurfaceBuffer(nullptr), nullptr);
}

/*
 * @tc.name  RequestBuffer001
 * @tc.desc  test for call OH_NativeWindow_NativeWindowRequestBuffer by abnormal input and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, RequestBuffer001, Function | MediumTest | Level2)
{
    ASSERT_NE(OH_NativeWindow_NativeWindowRequestBuffer(nullptr, &nativeWindowBuffer, nullptr), 0);
}

/*
 * @tc.name  RequestBuffer002
 * @tc.desc  test for call OH_NativeWindow_NativeWindowRequestBuffer by abnormal input and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, RequestBuffer002, Function | MediumTest | Level2)
{
    ASSERT_NE(OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, nullptr, nullptr), 0);
}

/*
 * @tc.name  GetBufferHandle001
 * @tc.desc  test for call OH_NativeWindow_GetBufferHandleFromNative by abnormal input and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, GetBufferHandle001, Function | MediumTest | Level2)
{
    ASSERT_EQ(OH_NativeWindow_GetBufferHandleFromNative(nullptr), nullptr);
}

/*
 * @tc.name  FlushBuffer001
 * @tc.desc  test for call OH_NativeWindow_NativeWindowFlushBuffer by abnormal input and check ret
 * @tc.type  FUNC
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

    ASSERT_NE(OH_NativeWindow_NativeWindowFlushBuffer(nullptr, nullptr, fenceFd, *region), 0);
    delete region;
}

/*
 * @tc.name  FlushBuffer002
 * @tc.desc  test for call OH_NativeWindow_NativeWindowFlushBuffer by abnormal input and check ret
 * @tc.type  FUNC
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

    ASSERT_NE(OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nullptr, fenceFd, *region), 0);
    delete region;
}

/*
 * @tc.name  CancelBuffer001
 * @tc.desc  test for call OH_NativeWindow_NativeWindowAbortBuffer by abnormal input and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, CancelBuffer001, Function | MediumTest | Level2)
{
    ASSERT_NE(OH_NativeWindow_NativeWindowAbortBuffer(nullptr, nullptr), 0);
}

/*
 * @tc.name  Reference001
 * @tc.desc  test for call OH_NativeWindow_NativeObjectReference and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, Reference001, Function | MediumTest | Level2)
{
    ASSERT_NE(OH_NativeWindow_NativeObjectReference(nullptr), 0);
}

/*
 * @tc.name  Unreference001
 * @tc.desc  test for call OH_NativeWindow_NativeObjectUnreference and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, Unreference001, Function | MediumTest | Level2)
{
    ASSERT_NE(OH_NativeWindow_NativeObjectUnreference(nullptr), 0);
}

/*
 * @tc.name  DestroyNativeWindow001
 * @tc.desc  test for call OH_NativeWindow_DestroyNativeWindow by abnormal input and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, DestroyNativeWindow001, Function | MediumTest | Level2)
{
    OH_NativeWindow_DestroyNativeWindow(nullptr);
}

/*
 * @tc.name  OH_NativeWindow_DestroyNativeWindowBuffer001
 * @tc.desc  test for call OH_NativeWindow_DestroyNativeWindowBuffer by abnormal input and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, OH_NativeWindow_DestroyNativeWindowBuffer001, Function | MediumTest | Level2)
{
    OH_NativeWindow_DestroyNativeWindowBuffer(nullptr);
}

/*
 * @tc.name  SetScalingMode001
 * @tc.desc  test for call OH_NativeWindow_NativeWindowSetScalingMode with abnormal parameters and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, SetScalingMode001, Function | MediumTest | Level2)
{
    OHScalingMode scalingMode = OHScalingMode::OH_SCALING_MODE_SCALE_TO_WINDOW;
    ASSERT_NE(OH_NativeWindow_NativeWindowSetScalingMode(nullptr, -1, scalingMode), 0);
}

/*
 * @tc.name  SetScalingMode002
 * @tc.desc  test for call OH_NativeWindow_NativeWindowSetScalingMode with abnormal parameters and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, SetScalingMode002, Function | MediumTest | Level2)
{
    OHScalingMode scalingMode = OHScalingMode::OH_SCALING_MODE_SCALE_TO_WINDOW;
    ASSERT_NE(OH_NativeWindow_NativeWindowSetScalingMode(nativeWindow, -1, scalingMode), 0);
}


/*
 * @tc.name  SetMetaData001
 * @tc.desc  test for call OH_NativeWindow_NativeWindowSetMetaData with abnormal parameters and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, SetMetaData001, Function | MediumTest | Level2)
{
    ASSERT_NE(OH_NativeWindow_NativeWindowSetMetaData(nullptr, -1, 0, nullptr), 0);
}

/*
 * @tc.name  SetMetaData002
 * @tc.desc  test for call OH_NativeWindow_NativeWindowSetMetaData with abnormal parameters and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, SetMetaData002, Function | MediumTest | Level2)
{
    ASSERT_NE(OH_NativeWindow_NativeWindowSetMetaData(nativeWindow, -1, 0, nullptr), 0);
}

/*
 * @tc.name  SetMetaDataSet001
 * @tc.desc  test for call OH_NativeWindow_NativeWindowSetMetaDataSet with abnormal parameters and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, SetMetaDataSet001, Function | MediumTest | Level2)
{
    OHHDRMetadataKey key = OHHDRMetadataKey::OH_METAKEY_HDR10_PLUS;
    ASSERT_NE(OH_NativeWindow_NativeWindowSetMetaDataSet(nullptr, -1, key, 0, nullptr), 0);
}

/*
 * @tc.name  SetMetaDataSet002
 * @tc.desc  test for call OH_NativeWindow_NativeWindowSetMetaDataSet with abnormal parameters and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, SetMetaDataSet002, Function | MediumTest | Level2)
{
    OHHDRMetadataKey key = OHHDRMetadataKey::OH_METAKEY_HDR10_PLUS;
    ASSERT_NE(OH_NativeWindow_NativeWindowSetMetaDataSet(nativeWindow, -1, key, 0, nullptr), 0);
}

/*
 * @tc.name  SetTunnelHandle001
 * @tc.desc  test for call OH_NativeWindow_NativeWindowSetTunnelHandle with abnormal parameters and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, SetTunnelHandle001, Function | MediumTest | Level2)
{
    ASSERT_NE(OH_NativeWindow_NativeWindowSetTunnelHandle(nullptr, nullptr), 0);
}

/*
 * @tc.name  SetTunnelHandle002
 * @tc.desc  test for call OH_NativeWindow_NativeWindowSetTunnelHandle with abnormal parameters and check ret
 * @tc.type  FUNC
 */
HWTEST_F(NativeWindowTest, SetTunnelHandle002, Function | MediumTest | Level2)
{
    ASSERT_NE(OH_NativeWindow_NativeWindowSetTunnelHandle(nativeWindow, nullptr), 0);
}
}