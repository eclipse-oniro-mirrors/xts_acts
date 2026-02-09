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

#include "include/DrawingNativeCanvasCommonTest.h"
#include "include/OhosCommonTest.h"

#define DRAW_COLORBLUE 0xFF0000FF

namespace OHOS {
namespace Rosen {
namespace Drawing {

constexpr int PATH_OFFSET = 100;
constexpr int IMAGE_SIZE = 100;
constexpr int PIXELMAP_SIZE = 200;
constexpr int SRC_RECT_CONSTRAINT_VALUE = 3;
constexpr int PATH_RECT_RIGHT = 200;
constexpr int PATH_RECT_BOTTOM = 300;

// Common SetUp and TearDown functions implementation
void DrawingNativeCanvasPart5TestSetUp()
{
    std::cout << "DrawingNativeCanvasPart5Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart5Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeCanvasPart5TestTearDown()
{
    std::cout << "DrawingNativeCanvasPart5Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart5Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testCanvasQuickRejectPathNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15700
 * @tc.desc   test for testCanvasQuickRejectPathNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasQuickRejectPathNull()
{
    DrawingNativeCanvasPart5TestSetUp();
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

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasQuickRejectPathNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15800
 * @tc.desc   test for testCanvasQuickRejectPathNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestCanvasQuickRejectPathNormal()
{
    DrawingNativeCanvasPart5TestSetUp();
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    bool quickReject = false;

    // 正常传参，path部分在画布内
    OH_Drawing_PathAddRect(path, -PATH_OFFSET, PATH_OFFSET, PATH_RECT_RIGHT, PATH_RECT_BOTTOM,
        OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    auto result1 = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
    // add assert
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，path在画布外
    OH_Drawing_PathAddRect(path, -PATH_OFFSET, PATH_OFFSET, -PATH_RECT_RIGHT, PATH_RECT_BOTTOM,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    auto result2 = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
    // add assert
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 正常传参，path只有一个顶点与画布相接
    OH_Drawing_PathAddRect(path, -PATH_OFFSET, -PATH_OFFSET, 0, 0, OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    auto result3 = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
    // add assert
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasQuickRejectPathCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15900
 * @tc.desc   test for testCanvasQuickRejectPathCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestCanvasQuickRejectPathCalls()
{
    DrawingNativeCanvasPart5TestSetUp();
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    bool quickReject = false;

    // 正常传参，path在画布内，调用1000次
    for (int i = 0; i < TEST_LOOP_COUNT_1000; ++i) {
        OH_Drawing_PathAddRect(path, PATH_OFFSET, PATH_OFFSET, PATH_RECT_RIGHT, PATH_RECT_RIGHT,
                               OH_Drawing_PathDirection::PATH_DIRECTION_CW);
        auto result = OH_Drawing_CanvasQuickRejectPath(canvas, path, &quickReject);
        // add assert
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasQuickRejectRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16000
 * @tc.desc   test for testCanvasQuickRejectRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasQuickRejectRectNull()
{
    DrawingNativeCanvasPart5TestSetUp();
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // OH_Drawing_RectCreate
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
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

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasQuickRejectRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16100
 * @tc.desc   test for testCanvasQuickRejectRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestCanvasQuickRejectRectNormal()
{
    DrawingNativeCanvasPart5TestSetUp();
    // OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    bool quickReject = false;

    // 正常传参，rect部分在画布内
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(-TEST_CANVAS_COORD_100, TEST_MATRIX_VALUE_0,
                              TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_200);
    EXPECT_NE(rect1, nullptr);
    auto result1 = OH_Drawing_CanvasQuickRejectRect(canvas, rect1, &quickReject);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，rect在画布外
    OH_Drawing_Rect* rect2 =
        OH_Drawing_RectCreate(-TEST_CANVAS_COORD_100, -TEST_CANVAS_COORD_100,
                              -TEST_CANVAS_COORD_200, -TEST_CANVAS_COORD_200);
    EXPECT_NE(rect2, nullptr);
    auto result2 = OH_Drawing_CanvasQuickRejectRect(canvas, rect2, &quickReject);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 正常传参，rect比画布大包含画布
    OH_Drawing_Rect* rect3 = OH_Drawing_RectCreate(TEST_NEGATIVE_OFFSET_20, TEST_NEGATIVE_OFFSET_20,
        TEST_RECT_SIZE_VERY_LARGE, TEST_RECT_SIZE_VERY_LARGE);
    EXPECT_NE(rect3, nullptr);
    auto result3 = OH_Drawing_CanvasQuickRejectRect(canvas, rect3, &quickReject);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasQuickRejectRectCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16200
 * @tc.desc   test for testCanvasQuickRejectRectCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestCanvasQuickRejectRectCalls()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    bool quickReject = false;

    // 正常传参，rect在画布内，调用1000次
    for (int i = 0; i < TEST_LOOP_COUNT_1000; ++i) {
        auto result = OH_Drawing_CanvasQuickRejectRect(canvas, rect, &quickReject);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawArcWithCenterNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16300
 * @tc.desc   test for testCanvasDrawArcWithCenterNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawArcWithCenterNull()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect, nullptr);

    // canvas参数传nullptr
    auto result = OH_Drawing_CanvasDrawArcWithCenter(nullptr, rect, TEST_ARC_START_ANGLE,
        TEST_ARC_SWEEP_ANGLE_180, false);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // rect参数传nullptr
    result = OH_Drawing_CanvasDrawArcWithCenter(canvas, nullptr, TEST_ARC_START_ANGLE,
        TEST_ARC_SWEEP_ANGLE_180, false);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawArcWithCenterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16400
 * @tc.desc   test for testCanvasDrawArcWithCenterNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestCanvasDrawArcWithCenterNormal()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 正常传参，useCenter参数传true
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(TEST_ARC_START_ANGLE, TEST_ARC_START_ANGLE,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect1, nullptr);
    auto result1 = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect1, TEST_ARC_START_ANGLE,
        TEST_ARC_SWEEP_ANGLE_180, true);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，useCenter参数传true，起始角度小于0，扫描角度大于360
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(TEST_ARC_START_ANGLE, TEST_ARC_START_ANGLE,
        TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect2, nullptr);
    auto result2 = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect2, TEST_ARC_START_ANGLE_NEGATIVE,
        TEST_ARC_SWEEP_ANGLE_LARGE, true);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 正常传参，useCenter参数传false，起始角度大于0，扫描角度小于0
    OH_Drawing_Rect* rect3 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(rect3, nullptr);
    auto result3 = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect3, TEST_ARC_START_ANGLE_66,
                                                      TEST_ARC_SWEEP_ANGLE_NEGATIVE_120, false);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RectDestroy(rect2);
    OH_Drawing_RectDestroy(rect3);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawArcWithCenterCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16500
 * @tc.desc   test for testCanvasDrawArcWithCenterCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestCanvasDrawArcWithCenterCalls()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100,
                              TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_300);

    // 正常传参，rect在画布内，调用1000次
    for (int i = 0; i < TEST_LOOP_COUNT_1000; ++i) {
        auto result = OH_Drawing_CanvasDrawArcWithCenter(canvas, rect, TEST_ARC_START_ANGLE,
            TEST_ARC_SWEEP_ANGLE_180, true);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawNestedRoundRectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16600
 * @tc.desc   test for testCanvasDrawNestedRoundRectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawNestedRoundRectNull()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    OH_Drawing_RoundRect* outer = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    OH_Drawing_RoundRect* inner = OH_Drawing_RoundRectCreate(rect1, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);

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

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawNestedRoundRectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16700
 * @tc.desc   test for testCanvasDrawNestedRoundRectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestCanvasDrawNestedRoundRectNormal()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    OH_Drawing_RoundRect* outer = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    OH_Drawing_RoundRect* inner = OH_Drawing_RoundRectCreate(rect1, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);

    // 正常传参，outer>inner
    auto result1 = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, inner);
    EXPECT_EQ(result1, OH_DRAWING_SUCCESS);

    // 正常传参，outer<inner
    rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    outer = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    rect1 =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    inner = OH_Drawing_RoundRectCreate(rect1, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    auto result2 = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, inner);
    EXPECT_EQ(result2, OH_DRAWING_SUCCESS);

    // 调用销毁函数销毁指针
    OH_Drawing_RoundRectDestroy(inner);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RoundRectDestroy(outer);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawNestedRoundRectCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16800
 * @tc.desc   test for testCanvasDrawNestedRoundRectCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestCanvasDrawNestedRoundRectCalls()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    OH_Drawing_RoundRect* outer = OH_Drawing_RoundRectCreate(rect, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    OH_Drawing_Rect* rect1 =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    OH_Drawing_RoundRect* inner = OH_Drawing_RoundRectCreate(rect1, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);

    // 正常传参，rect在画布内，调用1000次
    for (int i = 0; i < TEST_LOOP_COUNT_1000; ++i) {
        auto result = OH_Drawing_CanvasDrawNestedRoundRect(canvas, outer, inner);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }

    // 调用销毁函数销毁指针
    OH_Drawing_RoundRectDestroy(inner);
    OH_Drawing_RectDestroy(rect1);
    OH_Drawing_RoundRectDestroy(outer);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static OH_Drawing_PixelMap* CreateTestPixelMap(OH_Pixelmap_InitializationOptions** createOps,
    OH_PixelmapNative** pixelMapNative, void** bitmapAddr)
{
    OH_PixelmapInitializationOptions_Create(createOps);
    int32_t imageWidth = IMAGE_SIZE;
    int32_t imageHeight = IMAGE_SIZE;
    OH_PixelmapInitializationOptions_SetWidth(*createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(*createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(*createOps, TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(*createOps, TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetAlphaType(*createOps, TEST_PIXELMAP_ALPHA_PREMUL);
    size_t bufferSize = imageWidth * imageHeight * BYTES_PER_PIXEL;
    *bitmapAddr = malloc(bufferSize);
    if (*bitmapAddr == nullptr) {
        return nullptr;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)(*bitmapAddr))[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative_CreatePixelmap((uint8_t*)(*bitmapAddr), bufferSize, *createOps, pixelMapNative);
    return OH_Drawing_PixelMapGetFromOhPixelMapNative(*pixelMapNative);
}

static void CleanupPixelMapData(OH_Drawing_SamplingOptions* samplingOptions,
    OH_PixelmapNative* pixelMapNative, void* bitmapAddr, OH_Pixelmap_InitializationOptions* createOps)
{
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_PixelmapNative_Release(pixelMapNative);
    free(bitmapAddr);
    OH_PixelmapInitializationOptions_Release(createOps);
}

static void CleanupCanvasAndRects(OH_Drawing_Canvas* canvas, OH_Drawing_Rect* dstRect,
    OH_Drawing_Rect* center)
{
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_RectDestroy(dstRect);
    OH_Drawing_RectDestroy(center);
    OH_Drawing_CanvasDestroy(canvas);
}

/**
 * @tc.name   testCanvasDrawPixelMapNineNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16900
 * @tc.desc   test for testCanvasDrawPixelMapNineNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapNineNull()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasClear(canvas, TEST_COLOR_WHITE_OPAQUE);
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* bitmapAddr = nullptr;
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &bitmapAddr);
    if (pixelMap == nullptr) {
        DrawingNativeCanvasPart5TestTearDown();
        return OH_DRAWING_SUCCESS;
    }
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_Rect* center =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    OH_Drawing_Rect* dstRect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);

    auto result1 = OH_Drawing_CanvasDrawPixelMapNine(
        nullptr, pixelMap, center, dstRect, OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    auto result2 =
        OH_Drawing_CanvasDrawPixelMapNine(canvas, nullptr, center, dstRect, OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    auto result3 = OH_Drawing_CanvasDrawPixelMapNine(
        canvas, pixelMap, nullptr, dstRect, OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result3, OH_DRAWING_SUCCESS);
    auto result4 = OH_Drawing_CanvasDrawPixelMapNine(
        canvas, pixelMap, center, nullptr, OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
    EXPECT_EQ(result4, OH_DRAWING_ERROR_INVALID_PARAMETER);
    
    CleanupPixelMapData(samplingOptions, pixelMapNative, bitmapAddr, createOps);
    CleanupCanvasAndRects(canvas, dstRect, center);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapNineNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17000
 * @tc.desc   test for testCanvasDrawPixelMapNineNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestCanvasDrawPixelMapNineNormal()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasClear(canvas, TEST_COLOR_WHITE_OPAQUE);
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    int32_t imageWidth = IMAGE_SIZE;
    int32_t imageHeight = IMAGE_SIZE;
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps,
                                                  TEST_PIXELMAP_ALPHA_PREMUL);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * BYTES_PER_PIXEL;                 // 4 for test
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        DrawingNativeCanvasPart5TestTearDown();
        return OH_DRAWING_SUCCESS;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Rect* center =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(center, nullptr);
    OH_Drawing_Rect* dstRect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(dstRect, nullptr);
    // 正常传参
    auto result = OH_Drawing_CanvasDrawPixelMapNine(
        canvas, pixelMap, center, dstRect, OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
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

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapNineCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17100
 * @tc.desc   test for testCanvasDrawPixelMapNineCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestCanvasDrawPixelMapNineCalls()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasClear(canvas, TEST_COLOR_WHITE_OPAQUE);
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* bitmapAddr = nullptr;
    OH_Drawing_PixelMap* pixelMap = CreateTestPixelMap(&createOps, &pixelMapNative, &bitmapAddr);
    if (pixelMap == nullptr) {
        DrawingNativeCanvasPart5TestTearDown();
        return OH_DRAWING_SUCCESS;
    }
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_Rect* center =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    EXPECT_NE(center, nullptr);
    OH_Drawing_Rect* dstRect =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(dstRect, nullptr);
    
    for (int i = 0; i < TEST_LOOP_COUNT_1000; ++i) {
        auto result = OH_Drawing_CanvasDrawPixelMapNine(
            canvas, pixelMap, center, dstRect, OH_Drawing_FilterMode::FILTER_MODE_NEAREST);
        EXPECT_EQ(result, OH_DRAWING_SUCCESS);
    }
    
    CleanupPixelMapData(samplingOptions, pixelMapNative, bitmapAddr, createOps);
    CleanupCanvasAndRects(canvas, dstRect, center);
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasCreateWithPixelMapNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17200
 * @tc.desc   test for testCanvasCreateWithPixelMapNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestCanvasCreateWithPixelMapNormal()
{
    DrawingNativeCanvasPart5TestSetUp();
    uint32_t imageWidth = 500;
    uint32_t imageHeight = 500;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps,
                                                  TEST_PIXELMAP_ALPHA_PREMUL);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * BYTES_PER_PIXEL;                 // 4 for test
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        DrawingNativeCanvasPart5TestTearDown();
        return OH_DRAWING_SUCCESS;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
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

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasCreateWithPixelMapNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17300
 * @tc.desc   test for testCanvasCreateWithPixelMapNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasCreateWithPixelMapNull()
{
    DrawingNativeCanvasPart5TestSetUp();
    uint32_t imageWidth = 500;
    uint32_t imageHeight = 500;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps,
                                                  TEST_PIXELMAP_ALPHA_PREMUL);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * BYTES_PER_PIXEL;                 // 4 for test
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        DrawingNativeCanvasPart5TestTearDown();
        return OH_DRAWING_SUCCESS;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
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

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasCreateWithPixelMapMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17400
 * @tc.desc   test for testCanvasCreateWithPixelMapMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasCreateWithPixelMapMultipleCalls()
{
    DrawingNativeCanvasPart5TestSetUp();
    uint32_t imageWidth = 500;
    uint32_t imageHeight = 500;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps,
                                                  TEST_PIXELMAP_ALPHA_PREMUL);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * BYTES_PER_PIXEL;                 // 4 for test
    void* bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
        DrawingNativeCanvasPart5TestTearDown();
        return OH_DRAWING_SUCCESS;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_PixelmapNative_CreatePixelmap((uint8_t*)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_Canvas* offScreenCanvas = OH_Drawing_CanvasCreateWithPixelMap(pixelMap);
        EXPECT_NE(offScreenCanvas, nullptr);
        OH_Drawing_CanvasDestroy(offScreenCanvas);
    }
    OH_Drawing_SamplingOptionsDestroy(samplingOptions);
    OH_Drawing_PixelMapDissolve(pixelMap);
    OH_PixelmapNative_Release(pixelMapNative);
    OH_PixelmapInitializationOptions_Release(createOps);
    free(bitmapAddr);

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17500
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestCanvasDrawPixelMapRectConstraintNormal()
{
    DrawingNativeCanvasPart5TestSetUp();
    uint32_t imageWidth = PIXELMAP_SIZE;
    uint32_t imageHeight = PIXELMAP_SIZE;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps,
                                                  TEST_PIXELMAP_ALPHA_PREMUL);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * BYTES_PER_PIXEL;                 // 4 for test
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return RESULT_ERROR;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    // 1. The interface of OH_Drawing_CanvasDrawPixelMapRectConstraint is called normally.
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* src =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
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

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static OH_Drawing_PixelMap* CreatePixelMapForConstraintTest(OH_Pixelmap_InitializationOptions** createOps,
    OH_PixelmapNative** pixelMapNative, void** buffer)
{
    uint32_t imageWidth = PIXELMAP_SIZE;
    uint32_t imageHeight = PIXELMAP_SIZE;
    OH_PixelmapInitializationOptions_Create(createOps);
    OH_PixelmapInitializationOptions_SetWidth(*createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(*createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(*createOps, TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(*createOps, TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetAlphaType(*createOps, TEST_PIXELMAP_ALPHA_PREMUL);
    size_t bufferSize = imageWidth * imageHeight * BYTES_PER_PIXEL;
    *buffer = malloc(bufferSize);
    if (*buffer == nullptr) {
        return nullptr;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)(*buffer))[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative_CreatePixelmap((uint8_t*)(*buffer), bufferSize, *createOps, pixelMapNative);
    return OH_Drawing_PixelMapGetFromOhPixelMapNative(*pixelMapNative);
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17600
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRectConstraintNull()
{
    DrawingNativeCanvasPart5TestSetUp();
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapNative* pixelMapNative = nullptr;
    void* buffer = nullptr;
    OH_Drawing_PixelMap* pixelMap = CreatePixelMapForConstraintTest(&createOps, &pixelMapNative, &buffer);
    if (pixelMap == nullptr) {
        return RESULT_ERROR;
    }
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* src =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
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
    DrawingNativeCanvasPart5TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17700
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRectConstraintAbnormal()
{
    DrawingNativeCanvasPart5TestSetUp();
    uint32_t imageWidth = PIXELMAP_SIZE;
    uint32_t imageHeight = PIXELMAP_SIZE;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, TEST_PIXELMAP_ALPHA_PREMUL);
    size_t bufferSize = imageWidth * imageHeight * BYTES_PER_PIXEL;
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return RESULT_ERROR;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                                  TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0,
                                                  TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_CanvasDrawPixelMapRectConstraint(
        canvas, pixelMap, src, dst, samplingOptions,
        static_cast<OH_Drawing_SrcRectConstraint>(SRC_RECT_CONSTRAINT_VALUE));
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

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPixelMapRectConstraintMultiCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17800
 * @tc.desc   test for testCanvasDrawPixelMapRectConstraintMultiCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPixelMapRectConstraintMultiCalls()
{
    DrawingNativeCanvasPart5TestSetUp();
    uint32_t imageWidth = PIXELMAP_SIZE;
    uint32_t imageHeight = PIXELMAP_SIZE;
    OH_Pixelmap_InitializationOptions* createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA);    // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, TEST_PIXELMAP_FORMAT_RGBA); // 3 is RGBA fromat
    OH_PixelmapInitializationOptions_SetAlphaType(createOps,
                                                  TEST_PIXELMAP_ALPHA_PREMUL);      // 2 is ALPHA_FORMAT_PREMUL
    size_t bufferSize = imageWidth * imageHeight * BYTES_PER_PIXEL;                 // 4 for test
    void* buffer = malloc(bufferSize);
    if (buffer == nullptr) {
        return RESULT_ERROR;
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t*)buffer)[i] = 0xFFFF00FF;
    }
    OH_PixelmapNative* pixelMapNative = nullptr;
    OH_PixelmapNative_CreatePixelmap((uint8_t*)buffer, bufferSize, createOps, &pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_PixelMap* pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    // 1. The interface of OH_Drawing_ShaderEffectCreatePixelMapShader is called 10 times.
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* src =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst =
        OH_Drawing_RectCreate(TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_200, TEST_CANVAS_COORD_200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_ErrorCode errorCode;
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
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

    DrawingNativeCanvasPart5TestTearDown();

    return OH_DRAWING_SUCCESS;
}


} // namespace Drawing
} // namespace Rosen
} // namespace OHOS