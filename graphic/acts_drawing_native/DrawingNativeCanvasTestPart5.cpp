/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "gtest/gtest.h"

#include "DrawingNativeCanvasCommon.h"
#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"
#include "drawing_pixel_map.h"
#include "image/pixelmap_native.h"

#define DRAW_COLORBLUE 0xFF0000FF

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeCanvasPart5Test : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeCanvasPart5Test Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasPart5Test errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeCanvasPart5Test Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeCanvasPart5Test errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testCanvasQuickRejectPathNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4800
 * @tc.desc   test for testCanvasQuickRejectPathNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectPathNull, Function | SmallTest | Level3)
{
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    bool quickReject = false;

    // canvas参数传nullptr
    auto result1 = OH_Drawing_CanvasQuickRejectPath(nullptr, path, &quickReject);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // path参数传nullptr
    auto result2 = OH_Drawing_CanvasQuickRejectPath(canvas, nullptr, &quickReject);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // quickReject参数传nullptr
    auto result3 = OH_Drawing_CanvasQuickRejectPath(canvas, path, nullptr);
    EXPECT_EQ(result3, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 调用销毁函数销毁指针
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasQuickRejectPathNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4801
 * @tc.desc   test for testCanvasQuickRejectPathNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectPathNormal, Function | SmallTest | Level1)
{
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    bool quickReject = false;

    // 正常传参，path部分在画布内
    OH_Drawing_PathAddRect(path, -100, 100, 200, 300, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    auto result1 = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
    // add assert
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，path在画布外
    OH_Drawing_PathAddRect(path, -100, 100, -200, 300, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    auto result2 = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
    // add assert
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 正常传参，path只有一个顶点与画布相接
    OH_Drawing_PathAddRect(path, -100, -100, 0, 0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    auto result3 = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
    // add assert
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasQuickRejectPathCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4802
 * @tc.desc   test for testCanvasQuickRejectPathCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectPathCalls, Function | SmallTest | Level2)
{
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    bool quickReject = false;

    // 正常传参，path在画布内，调用1000次
    for (int i = 0; i < 1000; ++i) {
        OH_Drawing_PathAddRect(path, 100, 100, 200, 200, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
        auto result = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
        // add assert
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasQuickRejectRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4900
 * @tc.desc   test for testCanvasQuickRejectRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectRectNull, Function | SmallTest | Level3)
{
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_RectCreate
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    bool quickReject = false;

    // canvas参数传nullptr
    auto result1 = OH_Drawing_CanvasQuickRejectRect(nullptr, rect, &quickReject);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // rect参数传nullptr
    auto result2 = OH_Drawing_CanvasQuickRejectRect(canvas, nullptr, &quickReject);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // quickReject参数传nullptr
    auto result3 = OH_Drawing_CanvasQuickRejectRect(canvas, rect, nullptr);
    EXPECT_EQ(result3, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasQuickRejectRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4901
 * @tc.desc   test for testCanvasQuickRejectRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectRectNormal, Function | SmallTest | Level1)
{
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    bool quickReject = false;

    // 正常传参，rect部分在画布内
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(-100, 0, 300, 200);
    EXPECT_NE(rect1, nullptr);
    auto result1 = OH_Drawing_CanvasQuickRejectRect(canvas, rect1, &quickReject);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，rect在画布外
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(-100, -100, -200, -200);
    EXPECT_NE(rect2, nullptr);
    auto result2 = OH_Drawing_CanvasQuickRejectRect(canvas, rect2, &quickReject);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 正常传参，rect比画布大包含画布
    OH_Drawing_Rect* rect3 = OH_Drawing_RectCreate(-20, -20, 999999, 999999);
    EXPECT_NE(rect3, nullptr);
    auto result3 = OH_Drawing_CanvasQuickRejectRect(canvas, rect3, &quickReject);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasQuickRejectRectCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4902
 * @tc.desc   test for testCanvasQuickRejectRectCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectRectCalls, Function | SmallTest | Level2)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(100, 100, 200, 200);
    bool quickReject = false;

    // 正常传参，rect在画布内，调用1000次
    for (int i = 0; i < 1000; ++i) {
        auto result = OH_Drawing_CanvasQuickRejectRect(canvas, rect, &quickReject);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawArcWithCenterNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5000
 * @tc.desc   test for testCanvasDrawArcWithCenterNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawArcWithCenterNull, Function | SmallTest | Level3)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);

    // canvas参数传nullptr
    auto result = OH_Drawing_CanvasDrawArcWithCenter(nullptr, rect, 0, 180, false);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // rect参数传nullptr
    result = OH_Drawing_CanvasDrawArcWithCenter(canvas, nullptr, 0, 180, false);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawArcWithCenterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5001
 * @tc.desc   test for testCanvasDrawArcWithCenterNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawArcWithCenterNormal, Function | SmallTest | Level1)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 正常传参，useCenter参数传true
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect1, nullptr);
    auto result1 = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect1, 0, 180, true);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，useCenter参数传true，起始角度小于0，扫描角度大于360
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect2, nullptr);
    auto result2 = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect2, -10.0, 650, true);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 正常传参，useCenter参数传false，起始角度大于0，扫描角度小于0
    OH_Drawing_Rect* rect3 = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect3, nullptr);
    auto result3 = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect3, 66, -120, false);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawArcWithCenterCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5002
 * @tc.desc   test for testCanvasDrawArcWithCenterCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawArcWithCenterCalls, Function | SmallTest | Level2)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(100, 100, 300, 300);

    // 正常传参，rect在画布内，调用1000次
    for (int i = 0; i < 1000; ++i) {
        auto result = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect, 0, 180, true);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawNestedRoundRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5100
 * @tc.desc   test for testCanvasDrawNestedRoundRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawNestedRoundRectNull, Function | SmallTest | Level3)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    OH_Drawing_RoundRect* outer = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(50, 50, 100, 100);
    OH_Drawing_RoundRect* inner = OH_Drawing_RoundRectCreate(rect1, 10, 10);

    // canvas参数传nullptr
    auto result = OH_Drawing_CanvasDrawNestedRoundRect(nullptr, outer, inner);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // outer参数传nullptr
    result = OH_Drawing_CanvasDrawNestedRoundRect(canvas, nullptr, inner);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // inner参数传nullptr
    result = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, nullptr);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 调用销毁函数销毁指针
    OH_Drawing_RoundRectDestroy(inner);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RoundRectDestroy(outer);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawNestedRoundRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5101
 * @tc.desc   test for testCanvasDrawNestedRoundRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawNestedRoundRectNormal, Function | SmallTest | Level1)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    OH_Drawing_RoundRect* outer = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(50, 50, 100, 100);
    OH_Drawing_RoundRect* inner = OH_Drawing_RoundRectCreate(rect1, 10, 10);

    // 正常传参，outer>inner
    auto result1 = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, inner);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，outer<inner
    rect = OH_Drawing_RectCreate(50, 50, 100, 100);
    outer = OH_Drawing_RoundRectCreate(rect, 10, 10);
    rect1 = OH_Drawing_RectCreate(0, 0, 200, 200);
    inner = OH_Drawing_RoundRectCreate(rect1, 10, 10);
    auto result2 = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, inner);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_RoundRectDestroy(inner);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RoundRectDestroy(outer);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawNestedRoundRectCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5102
 * @tc.desc   test for testCanvasDrawNestedRoundRectCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawNestedRoundRectCalls, Function | SmallTest | Level2)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    OH_Drawing_RoundRect* outer = OH_Drawing_RoundRectCreate(rect, 10, 10);
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(50, 50, 100, 100);
    OH_Drawing_RoundRect* inner = OH_Drawing_RoundRectCreate(rect1, 10, 10);

    // 正常传参，rect在画布内，调用1000次
    for (int i = 0; i < 1000; ++i) {
        auto result = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, inner);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_RoundRectDestroy(inner);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RoundRectDestroy(outer);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawPixelMapNineNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5200
 * @tc.desc   test for testCanvasDrawPixelMapNineNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapNineNull, Function | SmallTest | Level3)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    int32_t imageWidth = 100;
    int32_t imageHeight = 100;
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Rect* center = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_Rect* dstRect = OH_Drawing_RectCreate(0, 0, 200, 200);

    auto result1 = OH_Drawing_CanvasDrawPixelMapNine(nullptr, pixelMap, center, dstRect,
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    auto result2 = OH_Drawing_CanvasDrawPixelMapNine(canvas, nullptr, center, dstRect,
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    auto result3 = OH_Drawing_CanvasDrawPixelMapNine(canvas, pixelMap, nullptr, dstRect,
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);
    auto result4 = OH_Drawing_CanvasDrawPixelMapNine(canvas, pixelMap, center, nullptr,
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result4, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 调用销毁函数销毁指针
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_PixelmapNative_Release(pixelMapNative);
    free(bitmapAddr);
    OH_PixelmapInitializationOptions_Release(createOps);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_RectDestroy(dstRect);
    OH_Drawing_RectDestroy(center);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawPixelMapNineNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5201
 * @tc.desc   test for testCanvasDrawPixelMapNineNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapNineNormal, Function | SmallTest | Level1)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    int32_t imageWidth = 100;
    int32_t imageHeight = 100;
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Rect* center = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(center, nullptr);
    OH_Drawing_Rect* dstRect = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(dstRect, nullptr);
    // 正常传参
    auto result = OH_Drawing_CanvasDrawPixelMapNine(canvas, pixelMap, center, dstRect,
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    // 调用销毁函数销毁指针
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_PixelmapNative_Release(pixelMapNative);
    free(bitmapAddr);
    OH_PixelmapInitializationOptions_Release(createOps);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_RectDestroy(dstRect);
    OH_Drawing_RectDestroy(center);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawPixelMapNineCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5202
 * @tc.desc   test for testCanvasDrawPixelMapNineCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapNineCalls, Function | SmallTest | Level2)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasClear(canvas, 0xFFFFFFFF);
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    int32_t imageWidth = 100;
    int32_t imageHeight = 100;
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Rect* center = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(center, nullptr);
    OH_Drawing_Rect* dstRect = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(dstRect, nullptr);
    // 正常传参，调用1000次
    for (int i = 0; i < 1000; ++i) {
        auto result = OH_Drawing_CanvasDrawPixelMapNine(canvas, pixelMap, center,
            dstRect, OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }
    // 调用销毁函数销毁指针
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_PixelmapNative_Release(pixelMapNative);
    free(bitmapAddr);
    OH_PixelmapInitializationOptions_Release(createOps);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_RectDestroy(dstRect);
    OH_Drawing_RectDestroy(center);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasCreateWithPixelMapNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5300
 * @tc.desc   test for testCanvasCreateWithPixelMapNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasCreateWithPixelMapNormal, Function | SmallTest | Level2)
{
    uint32_t imageWidth = 500;
    uint32_t imageHeight = 500;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Canvas* offScreenCanvas = OH_Drawing_CanvasCreateWithPixelMap(pixelMap);
    EXPECT_NE(offScreenCanvas, nullptr);
    OH_Drawing_CanvasDestroy(offScreenCanvas);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(bitmapAddr);
}

/**
 * @tc.name   testCanvasCreateWithPixelMapNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5301
 * @tc.desc   test for testCanvasCreateWithPixelMapNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasCreateWithPixelMapNull, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 500;
    uint32_t imageHeight = 500;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Canvas* offScreenCanvas = OH_Drawing_CanvasCreateWithPixelMap(nullptr);
    EXPECT_EQ(offScreenCanvas, nullptr);
    OH_Drawing_CanvasDestroy(offScreenCanvas);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(bitmapAddr);
}

/**
 * @tc.name   testCanvasCreateWithPixelMapMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5302
 * @tc.desc   test for testCanvasCreateWithPixelMapMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasCreateWithPixelMapMultipleCalls, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 500;
    uint32_t imageHeight = 500;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        return;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    for (int i = 0; i < 10; i++) {
        OH_Drawing_Canvas* offScreenCanvas = OH_Drawing_CanvasCreateWithPixelMap(pixelMap);
        EXPECT_NE(offScreenCanvas, nullptr);
        OH_Drawing_CanvasDestroy(offScreenCanvas);
    }
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(bitmapAddr);
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5400
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapRectConstraintNormal, Function | SmallTest | Level2)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    // 1. The interface of OH_Drawing_CanvasDrawPixelMapRectConstraint is called normally.
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode;
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, src, dst, samplingOptions, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 2. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5401
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapRectConstraintNull, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) { return; }
    for (int i = 0; i < imageWidth * imageHeight; i++) { ((uint32_t*)buffer)[i] = 0xFFFF00FF; }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode;
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        nullptr, pixelMap, src, dst, samplingOptions, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, nullptr, src, dst, samplingOptions, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, nullptr, dst, samplingOptions, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, src, nullptr, samplingOptions, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, src, dst, nullptr, OH_Drawing_SrcRectConstraint::STRICT_SRC_RECT_CONSTRAINT);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5402
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapRectConstraintAbnormal, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    // 1. The last parameter of the verification interface passes an enumeration value that is out of range.
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode;
    errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, src, dst, samplingOptions, static_cast<OH_Drawing_SrcRectConstraint>(3));
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 2. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5403
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapRectConstraintMultiCalls, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    // 1. The interface of OH_Drawing_ShaderEffectCreatePixelMapShader is called 10 times.
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
            canvas, pixelMap, src, dst, samplingOptions, OH_Drawing_SrcRectConstraint::FAST_SRC_RECT_CONSTRAINT);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    // 2. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5500
 * @tc.desc   test for testCanvasDrawPixelMapMeshNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshNormal, Function | SmallTest | Level0)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 2;
    uint32_t meshHeight = 2;
    uint32_t vertOffest = 2;
    uint32_t colorOffest = 2;
    std::vector<float> vertices = {
        10, 50, 180, 180, 0, 0, 20, 0, 410, 0, 0, 180, 180, 150, 410, 180, 0, 360, 190, 340, 410, 360
    };
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000,
        0xFF000000, 0xFF000000, 0xFF000000, 0xFF000000, 0xFF000000, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits parameters normally.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull01
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5501
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull01
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshNull01, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 2;
    uint32_t meshHeight = 2;
    uint32_t vertOffest = 1;
    uint32_t colorOffest = 1;
    std::vector<float> vertices = {0, 0, 50, 0, 410, 0, 0, 180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(nullptr, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, nullptr,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        0, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull02
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5502
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull02
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshNull02, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 2;
    uint32_t meshHeight = 2;
    uint32_t vertOffest = 1;
    uint32_t colorOffest = 1;
    std::vector<float> vertices = {0, 0, 50, 0, 410, 0, 0, 180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, 0, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, nullptr, vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), 0, vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull03
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5503
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull03
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshNull03, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 1;
    uint32_t meshHeight = 1;
    uint32_t vertOffest = 1;
    uint32_t colorOffest = 1;
    std::vector<float> vertices = {0, 0, 50, 0, 410, 0, 0, 180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), 0, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, nullptr, colors.size(), colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), 0, colorOffest);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshNull04
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5504
 * @tc.desc   test for testCanvasDrawPixelMapMeshNull04
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshNull04, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 1;
    uint32_t meshHeight = 1;
    uint32_t vertOffest = 1;
    std::vector<float> vertices = {0, 0, 50, 0, 410, 0, 0, 180, 50, 180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), 0);
    OH_Drawing_CanvasDetachBrush(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshBindAndUnbind
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5505
 * @tc.desc   test for testCanvasDrawPixelMapMeshBindAndUnbind
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshBindAndUnbind, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 1;
    uint32_t meshHeight = 1;
    uint32_t vertOffest = 1;
    uint32_t colorOffest = 1;
    std::vector<float> vertices = {0, 0, 50, 0, 410, 0, 0, 180, 50, 180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    OH_Drawing_CanvasAttachPen(canvas, pen);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits null.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    OH_Drawing_CanvasDetachPen(canvas);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal01
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5506
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal01
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshAbnormal01, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 1;
    uint32_t meshHeight = 1;
    uint32_t vertOffest = 1;
    uint32_t colorOffest = 1;
    std::vector<float> vertices = {0, 0, 50, 0, 410, 0, 0, 180, 50, 180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits negative number.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        -1, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, -1, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal02
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5507
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal02
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshAbnormal02, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 1;
    uint32_t meshHeight = 1;
    uint32_t vertOffest = 1;
    uint32_t colorOffest = 1;
    std::vector<float> vertices = {0, 0, 50, 0, 410, 0, 0, 180, 50, 180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits negative number.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), -1, vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), -1, colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal03
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5508
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal03
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshAbnormal03, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 1;
    uint32_t meshHeight = 1;
    uint32_t vertOffest = 1;
    uint32_t colorOffest = 1;
    std::vector<float> vertices = {0, 0, 50, 0, 410, 0, 0, 180, 50, 180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits negative number.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), -1, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), -1);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshAbnormal04
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5509
 * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal04
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshAbnormal04, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 1;
    uint32_t meshHeight = 1;
    uint32_t vertOffest = 1;
    uint32_t colorOffest = 1;
    std::vector<float> vertices = {0, 0, 50, 0, 410, 0, 0, 180, 50, 180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh transmits a number greater than the actual quantity.
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), 11, vertOffest, colors.data(), colors.size(), colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        meshWidth, meshHeight, vertices.data(), vertices.size(), vertOffest, colors.data(), 6, colorOffest);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}

/**
 * @tc.name   testCanvasDrawPixelMapMeshMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5510
 * @tc.desc   test for testCanvasDrawPixelMapMeshMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapMeshMultipleCalls, Function | SmallTest | Level3)
{
    uint32_t imageWidth = 200;
    uint32_t imageHeight = 200;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    auto ret = OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, 3);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, 3); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, 2);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * 4;                 // 4 for test
    void* buffer = malloc(bufferSize);
    EXPECT_NE(buffer, nullptr);
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    ret = OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    // 1. Creating pixelMap by OH_Drawing_PixelMapGetFromOhPixelMapNative.
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    uint32_t meshWidth = 1;
    uint32_t meshHeight = 1;
    uint32_t vertOffest = 1;
    uint32_t colorOffest = 1;
    std::vector<float> vertices = {0, 0, 50, 0, 410, 0, 0, 180, 50, 180};
    std::vector<uint32_t> colors = {
        0xFFFF0000, 0xFF00FF00, 0xFF0000FF, 0xFFFFFFFF, 0xFF000000
    };
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_ErrorCode errorCode;
    // 2. The interface OH_Drawing_CanvasDrawPixelMapMesh is called 10 times.
    for (int i = 0; i < 10; i++) {
        errorCode = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap, meshWidth, meshHeight,
            vertices.data(), vertices.size(), vertOffest, colors.data(), colors.size(), colorOffest);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_CanvasDetachBrush(canvas);
    // 3. Destroy objects.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(buffer);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS