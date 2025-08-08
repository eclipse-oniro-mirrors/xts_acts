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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4800
 * @tc.name: testCanvasQuickRejectPathNull
 * @tc.desc: test for testCanvasQuickRejectPathNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectPathNull, TestSize.Level3)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4801
 * @tc.name: testCanvasQuickRejectPathNormal
 * @tc.desc: test for testCanvasQuickRejectPathNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectPathNormal, TestSize.Level1)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4802
 * @tc.name: testCanvasQuickRejectPathCalls
 * @tc.desc: test for testCanvasQuickRejectPathCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectPathCalls, TestSize.Level2)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4900
 * @tc.name: testCanvasQuickRejectRectNull
 * @tc.desc: test for testCanvasQuickRejectRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectRectNull, TestSize.Level3)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4901
 * @tc.name: testCanvasQuickRejectRectNormal
 * @tc.desc: test for testCanvasQuickRejectRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectRectNormal, TestSize.Level1)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4902
 * @tc.name: testCanvasQuickRejectRectCalls
 * @tc.desc: test for testCanvasQuickRejectRectCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasQuickRejectRectCalls, TestSize.Level2)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5000
 * @tc.name: testCanvasDrawArcWithCenterNull
 * @tc.desc: test for testCanvasDrawArcWithCenterNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawArcWithCenterNull, TestSize.Level3)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5001
 * @tc.name: testCanvasDrawArcWithCenterNormal
 * @tc.desc: test for testCanvasDrawArcWithCenterNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawArcWithCenterNormal, TestSize.Level1)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5002
 * @tc.name: testCanvasDrawArcWithCenterCalls
 * @tc.desc: test for testCanvasDrawArcWithCenterCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawArcWithCenterCalls, TestSize.Level2)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5100
 * @tc.name: testCanvasDrawNestedRoundRectNull
 * @tc.desc: test for testCanvasDrawNestedRoundRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawNestedRoundRectNull, TestSize.Level3)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5101
 * @tc.name: testCanvasDrawNestedRoundRectNormal
 * @tc.desc: test for testCanvasDrawNestedRoundRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawNestedRoundRectNormal, TestSize.Level1)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5102
 * @tc.name: testCanvasDrawNestedRoundRectCalls
 * @tc.desc: test for testCanvasDrawNestedRoundRectCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawNestedRoundRectCalls, TestSize.Level2)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5200
 * @tc.name: testCanvasDrawPixelMapNineNull
 * @tc.desc: test for testCanvasDrawPixelMapNineNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapNineNull, TestSize.Level3)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5201
 * @tc.name: testCanvasDrawPixelMapNineNormal
 * @tc.desc: test for testCanvasDrawPixelMapNineNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapNineNormal, TestSize.Level1)
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

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_5202
 * @tc.name: testCanvasDrawPixelMapNineCalls
 * @tc.desc: test for testCanvasDrawPixelMapNineCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(DrawingNativeCanvasPart5Test, testCanvasDrawPixelMapNineCalls, TestSize.Level2)
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

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS