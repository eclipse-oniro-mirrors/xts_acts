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

#include "include/OhosCommonTest.h"
#include "include/DrawingNativeCanvasCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

constexpr int LOOP_COUNT = 10;
constexpr int BOOL_ARRAY_SIZE = 2;

// Common SetUp and TearDown functions implementation
void DrawingNativeCanvasPart8TestSetUp()
{
    std::cout << "DrawingNativeCanvasPart8Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart8Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeCanvasPart8TestTearDown()
{
    std::cout << "DrawingNativeCanvasPart8Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart8Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testCanvasDrawVerticesNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21400
 * @tc.desc   test for testCanvasDrawVerticesNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawVerticesNormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    OH_Drawing_Point2D point_one = { TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0 };
    OH_Drawing_Point2D point_two = { TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100 };
    OH_Drawing_Point2D point_three = { TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_100 };
    OH_Drawing_Point2D points_vertices[TEST_VERTEX_COUNT_3] = { point_one, point_two, point_three };

    OH_Drawing_Point2D texs_one = { TEST_TEX_COORD_0, TEST_TEX_COORD_0 };
    OH_Drawing_Point2D texs_two = { TEST_TEX_COORD_1, TEST_TEX_COORD_1 };
    OH_Drawing_Point2D texs_three = { TEST_TEX_COORD_2, TEST_TEX_COORD_0 };
    OH_Drawing_Point2D texs_vertices[TEST_VERTEX_COUNT_3] = { texs_one, texs_two, texs_three };
    uint32_t colors[TEST_VERTEX_COUNT_3] = { TEST_COLOR_RED_VERTEX, TEST_COLOR_RED_VERTEX, TEST_COLOR_RED_VERTEX };
    uint16_t indices[TEST_VERTEX_COUNT_3] = {
        static_cast<uint16_t>(TEST_MATRIX_VALUE_0), static_cast<uint16_t>(TEST_SKEW_VALUE_1),
        static_cast<uint16_t>(TEST_TEX_COORD_2)
    };
    // 1. Call OH_Drawing_CanvasCreate to create a canvas object
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasDrawVertices with the second parameter iterating through the enum
    OH_Drawing_VertexMode mode[] = { VERTEX_MODE_TRIANGLES, VERTEX_MODE_TRIANGLES_STRIP, VERTEX_MODE_TRIANGLE_FAN };
    for (int i = 0; i < TEST_VERTEX_COUNT_3; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawVertices(canvas, mode[i], TEST_VERTEX_COUNT_3, points_vertices,
            texs_vertices, colors, TEST_VERTEX_COUNT_3, indices, BLEND_MODE_COLOR);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 3. Call OH_Drawing_CanvasDrawVertices with the ninth parameter iterating through the enum
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    for (int i = 0; i < TEST_BLEND_MODE_COUNT_29; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, TEST_VERTEX_COUNT_3, points_vertices,
            texs_vertices, colors, TEST_VERTEX_COUNT_3, indices, blendMode[i]);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

static void TestDrawVerticesWithNullParameters(OH_Drawing_Canvas* canvas, OH_Drawing_Point2D* points_vertices,
    OH_Drawing_Point2D* texs_vertices, uint32_t* colors, uint16_t* indices)
{
    OH_Drawing_CanvasDrawVertices(nullptr, VERTEX_MODE_TRIANGLES, TEST_VERTEX_COUNT_3, points_vertices,
        texs_vertices, colors, TEST_VERTEX_COUNT_3, indices, BLEND_MODE_COLOR);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, static_cast<int>(TEST_MATRIX_VALUE_0),
        points_vertices, texs_vertices, colors, TEST_VERTEX_COUNT_3, indices, BLEND_MODE_COLOR);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, TEST_VERTEX_COUNT_3, nullptr, texs_vertices,
        colors, TEST_VERTEX_COUNT_3, indices, BLEND_MODE_COLOR);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, TEST_VERTEX_COUNT_3, points_vertices, nullptr,
        colors, TEST_VERTEX_COUNT_3, indices, BLEND_MODE_COLOR);
    
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, TEST_VERTEX_COUNT_3, points_vertices,
        texs_vertices, nullptr, TEST_VERTEX_COUNT_3, indices, BLEND_MODE_COLOR);
    
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, TEST_VERTEX_COUNT_3, points_vertices,
        texs_vertices, colors, static_cast<int>(TEST_MATRIX_VALUE_0), indices, BLEND_MODE_COLOR);
    
    OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, TEST_VERTEX_COUNT_3, points_vertices,
        texs_vertices, colors, TEST_VERTEX_COUNT_3, nullptr, BLEND_MODE_COLOR);
}

/**
 * @tc.name   testCanvasDrawVerticesNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21500
 * @tc.desc   test for testCanvasDrawVerticesNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawVerticesNull()
{
    DrawingNativeCanvasPart8TestSetUp();
    OH_Drawing_Point2D point_one = { TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0 };
    OH_Drawing_Point2D point_two = { TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100 };
    OH_Drawing_Point2D point_three = { TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_100 };
    OH_Drawing_Point2D points_vertices[TEST_VERTEX_COUNT_3] = { point_one, point_two, point_three };

    OH_Drawing_Point2D texs_one = { TEST_TEX_COORD_0, TEST_TEX_COORD_0 };
    OH_Drawing_Point2D texs_two = { TEST_TEX_COORD_1, TEST_TEX_COORD_1 };
    OH_Drawing_Point2D texs_three = { TEST_TEX_COORD_2, TEST_TEX_COORD_0 };
    OH_Drawing_Point2D texs_vertices[TEST_VERTEX_COUNT_3] = { texs_one, texs_two, texs_three };
    uint32_t colors[TEST_VERTEX_COUNT_3] = { TEST_COLOR_RED_VERTEX, TEST_COLOR_RED_VERTEX, TEST_COLOR_RED_VERTEX };
    uint16_t indices[TEST_VERTEX_COUNT_3] = {
        static_cast<uint16_t>(TEST_MATRIX_VALUE_0), static_cast<uint16_t>(TEST_SKEW_VALUE_1),
        static_cast<uint16_t>(TEST_TEX_COORD_2)
    };

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    TestDrawVerticesWithNullParameters(canvas, points_vertices, texs_vertices, colors, indices);
    
    OH_Drawing_CanvasDestroy(canvas);
    DrawingNativeCanvasPart8TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawVerticesAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21600
 * @tc.desc   test for testCanvasDrawVerticesAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawVerticesAbnormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasDrawVertices with a floating-point number as the third parameter
    // Compilation error, cannot pass a floating-point number

    // 3. Call OH_Drawing_CanvasDrawVertices with a floating-point number as the seventh parameter
    // Compilation error, cannot pass a floating-point number

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawVerticesMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21700
 * @tc.desc   test for testCanvasDrawVerticesMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawVerticesMaximum()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Point2D point_one = { TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0 };
    OH_Drawing_Point2D point_two = { TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100 };
    OH_Drawing_Point2D point_three = { TEST_CANVAS_COORD_300, TEST_CANVAS_COORD_100 };
    OH_Drawing_Point2D points_vertices[TEST_VERTEX_COUNT_3] = { point_one, point_two, point_three };

    OH_Drawing_Point2D texs_one = { TEST_TEX_COORD_0, TEST_TEX_COORD_0 };
    OH_Drawing_Point2D texs_two = { TEST_TEX_COORD_1, TEST_TEX_COORD_1 };
    OH_Drawing_Point2D texs_three = { TEST_TEX_COORD_2, TEST_TEX_COORD_0 };
    OH_Drawing_Point2D texs_vertices[TEST_VERTEX_COUNT_3] = { texs_one, texs_two, texs_three };
    uint32_t colors[TEST_VERTEX_COUNT_3] = { TEST_COLOR_RED_VERTEX, TEST_COLOR_RED_VERTEX, TEST_COLOR_RED_VERTEX };
    uint16_t indices[TEST_VERTEX_COUNT_3] = {
        static_cast<uint16_t>(TEST_MATRIX_VALUE_0), static_cast<uint16_t>(TEST_SKEW_VALUE_1),
        static_cast<uint16_t>(TEST_TEX_COORD_2)
    };

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    if (0) {
        // todo cpp crash
        // 2. Call OH_Drawing_CanvasDrawVertices with the third parameter as the maximum value INT32_MAX_VALUE
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, INT32_MAX_VALUE, points_vertices,
            texs_vertices, colors, TEST_VERTEX_COUNT_3, indices, BLEND_MODE_COLOR);
        // 3. Call OH_Drawing_CanvasDrawVertices with the seventh parameter as the maximum value INT32_MAX_VALUE
        OH_Drawing_CanvasDrawVertices(canvas, VERTEX_MODE_TRIANGLES, TEST_VERTEX_COUNT_3, points_vertices,
            texs_vertices, colors, INT32_MAX_VALUE, indices, BLEND_MODE_COLOR);
    }

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasReadPixelsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21800
 * @tc.desc   test for testCanvasReadPixelsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasReadPixelsNormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_COORD_200;
    constexpr uint32_t height = TEST_CANVAS_COORD_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    bool ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels,
        static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_MATRIX_VALUE_0),
        static_cast<int>(TEST_MATRIX_VALUE_0));
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasReadPixelsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21900
 * @tc.desc   test for testCanvasReadPixelsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasReadPixelsNull()
{
    DrawingNativeCanvasPart8TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 1. Call OH_Drawing_CanvasReadPixels with the first parameter as nullptr
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_COORD_200;
    constexpr uint32_t height = TEST_CANVAS_COORD_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    bool ret = OH_Drawing_CanvasReadPixels(nullptr, &imageInfo, pixels,
        static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_MATRIX_VALUE_0),
        static_cast<int>(TEST_MATRIX_VALUE_0));
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_CanvasReadPixels with the second parameter as nullptr
    ret = OH_Drawing_CanvasReadPixels(canvas, nullptr, pixels,
        static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_MATRIX_VALUE_0),
        static_cast<int>(TEST_MATRIX_VALUE_0));
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 3. Call OH_Drawing_CanvasReadPixels with the third parameter as nullptr
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, nullptr,
        static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_MATRIX_VALUE_0),
        static_cast<int>(TEST_MATRIX_VALUE_0));
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 4. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasReadPixelsMismatch
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22000
 * @tc.desc   test for testCanvasReadPixelsMismatch.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasReadPixelsMismatch()
{
    DrawingNativeCanvasPart8TestSetUp();
    // Deprecated

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasReadPixelsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22100
 * @tc.desc   test for testCanvasReadPixelsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasReadPixelsAbnormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels with the fourth parameter as a negative number or a floating-point number
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_COORD_200;
    constexpr uint32_t height = TEST_CANVAS_COORD_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    bool ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, TEST_PIXELMAP_NEGATIVE_1,
        static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_MATRIX_VALUE_0));
    EXPECT_EQ(ret, false);
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels,
        static_cast<int>(TEST_SKEW_VALUE_1), static_cast<int>(TEST_MATRIX_VALUE_0),
        static_cast<int>(TEST_MATRIX_VALUE_0));
    EXPECT_EQ(ret, false);
    // 3. Call OH_Drawing_CanvasReadPixels with the fifth parameter as a floating-point number
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels,
        static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_SKEW_VALUE_1),
        static_cast<int>(TEST_MATRIX_VALUE_0));
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixels with the sixth parameter as a floating-point number
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels,
        static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_MATRIX_VALUE_0),
        static_cast<int>(TEST_SKEW_VALUE_1));
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasReadPixelsMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22200
 * @tc.desc   test for testCanvasReadPixelsMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasReadPixelsMaximum()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels with the fourth parameter as the maximum value TEST_PIXELMAP_NEGATIVE_1
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_COORD_200;
    constexpr uint32_t height = TEST_CANVAS_COORD_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    bool ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, TEST_PIXELMAP_NEGATIVE_1,
        static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_MATRIX_VALUE_0));
    EXPECT_EQ(ret, false);
    // 3. Call OH_Drawing_CanvasReadPixels with the fifth parameter as the maximum value INT32_MAX_VALUE
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels,
        static_cast<int>(TEST_MATRIX_VALUE_0), INT32_MAX_VALUE, static_cast<int>(TEST_MATRIX_VALUE_0));
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixels with the sixth parameter as the maximum value INT32_MAX_VALUE
    ret = OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels,
        static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_MATRIX_VALUE_0), INT32_MAX_VALUE);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasReadPixelsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22300
 * @tc.desc   test for testCanvasReadPixelsBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasReadPixelsBoundary()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasReadPixels
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_4K_WIDTH;
    constexpr uint32_t height = TEST_CANVAS_4K_HEIGHT;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_CanvasReadPixels(canvas, &imageInfo, pixels, static_cast<int>(TEST_MATRIX_VALUE_0),
                                static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_MATRIX_VALUE_0));
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasReadPixelsToBitmapNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22400
 * @tc.desc   test for testCanvasReadPixelsToBitmapNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasReadPixelsToBitmapNormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    uint32_t width = 200;
    uint32_t height = 200;
    OH_Drawing_BitmapFormat format{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_BitmapBuild(bitmap, width, height, &format);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap,
        static_cast<int>(TEST_CANVAS_COORD_100), static_cast<int>(TEST_CANVAS_COORD_100));
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(ret, false);
    // 4. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasReadPixelsToBitmapNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22500
 * @tc.desc   test for testCanvasReadPixelsToBitmapNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasReadPixelsToBitmapNull()
{
    DrawingNativeCanvasPart8TestSetUp();
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 1. Call OH_Drawing_CanvasReadPixelsToBitmap with the first parameter as null
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(nullptr, bitmap,
        static_cast<int>(TEST_SKEW_VALUE_1), static_cast<int>(TEST_SKEW_VALUE_1));
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 2. Call OH_Drawing_CanvasReadPixelsToBitmap with the second parameter as null
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, nullptr,
        static_cast<int>(TEST_SKEW_VALUE_1), static_cast<int>(TEST_SKEW_VALUE_1));
    EXPECT_EQ(ret, false);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter as 0
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap,
        static_cast<int>(TEST_MATRIX_VALUE_0), static_cast<int>(TEST_SKEW_VALUE_1));
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter as 0
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap,
        static_cast<int>(TEST_SKEW_VALUE_1), static_cast<int>(TEST_MATRIX_VALUE_0));
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasReadPixelsToBitmapAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22600
 * @tc.desc   test for testCanvasReadPixelsToBitmapAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasReadPixelsToBitmapAbnormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter as a floating-point number
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap,
        static_cast<int>(TEST_SKEW_VALUE_1), static_cast<int>(TEST_MATRIX_VALUE_0));
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter as a floating-point number
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap,
        static_cast<int>(TEST_SKEW_VALUE_1), static_cast<int>(TEST_SKEW_VALUE_1));
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasReadPixelsToBitmapMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22700
 * @tc.desc   test for testCanvasReadPixelsToBitmapMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasReadPixelsToBitmapMaximum()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Create a bitmap object by calling OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 3. Call OH_Drawing_CanvasReadPixelsToBitmap with the third parameter set to the maximum value INT32_MAX_VALUE
    bool ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap, INT32_MAX_VALUE,
        static_cast<int>(TEST_MATRIX_VALUE_0));
    EXPECT_EQ(ret, false);
    // 4. Call OH_Drawing_CanvasReadPixelsToBitmap with the fourth parameter set to the maximum value INT32_MAX_VALUE
    ret = OH_Drawing_CanvasReadPixelsToBitmap(canvas, bitmap,
        static_cast<int>(TEST_SKEW_VALUE_1), INT32_MAX_VALUE);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}
/**
 * @tc.name   testCanvasDrawSingleCharacter
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22800
 * @tc.desc   test for testCanvasDrawSingleCharacter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL1
 */
int TestCanvasDrawSingleCharacter()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. Create a canvas object by calling OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    const char* strOne = "a";
    const char* strTwo = "你好";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    EXPECT_NE(font, nullptr);
    float x = 0.f;
    float y = 0.f;
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, strOne, font, x, y), OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, strTwo, font, x, y), OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(nullptr, strOne, font, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, nullptr, font, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, strOne, nullptr, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    const char* strThree = "";
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, strThree, font, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_CanvasDestroy(canvas);
    
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawSingleCharacterNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22900
 * @tc.desc   test for testCanvasDrawSingleCharacterNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawSingleCharacterNormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 3. OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, TEST_COLOR_WHITE_OPAQUE);
    // 4. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 5. OH_Drawing_FontSetTextSize
    const float textSize = 10.f;
    OH_Drawing_FontSetTextSize(font, textSize);
    // 6. OH_Drawing_CanvasDrawSingleCharacter parameter is normal, where str is a single character,UTF-8 encoded, and
    //  Chinese/English characters are passed
    float x = 0.f;
    float y = 0.f;
    const char* str = "a";
    const char* str1 = "我";
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str, font, x, y);
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str1, font, x, y);
    // 7. OH_Drawing_CanvasDrawSingleCharacter parameters are entered normally, where str is a multi-character, UTF-8
    //  encoded, and English/Chinese characters are in
    str = "abc";
    str1 = "你是谁";
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str, font, x, y);
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str1, font, x, y);
    // 8. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FontDestroy(font);
        
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawSingleCharacterNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23000
 * @tc.desc   test for testCanvasDrawSingleCharacterNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawSingleCharacterNull()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BrushCreate
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    // add assert
    EXPECT_NE(brush, nullptr);
    // 3. OH_Drawing_BrushSetColor
    OH_Drawing_BrushSetColor(brush, TEST_COLOR_WHITE_OPAQUE);
    // 4. OH_Drawing_FontCreate
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    // add assert
    EXPECT_NE(font, nullptr);
    // 5. OH_Drawing_FontSetTextSize
    const float textSize = 10.f;
    OH_Drawing_FontSetTextSize(font, textSize);
    // 6. OH_Drawing_CanvasDrawSingleCharacter parameter canvas is empty
    float x = 0.f;
    float y = 0.f;
    const char* str = "a";
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(nullptr, str, font, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. OH_Drawing_CanvasDrawSingleCharacter parameter str is empty
    str = "";
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str, font, x, y);
    // 8. OH_Drawing_CanvasDrawSingleCharacter parameter font is empty
    str = "a";
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacter(canvas, str, nullptr, x, y), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 9. OH_Drawing_CanvasDrawSingleCharacter parameter str to 0 characters
    OH_Drawing_CanvasDrawSingleCharacter(canvas, str, font, x, y);
    // 10.free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FontDestroy(font);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPointNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23100
 * @tc.desc   test for testCanvasDrawPointNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawPointNormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_Point2D create an array of points
    OH_Drawing_Point2D texs_one = { 0.0f, 0.0f };
    OH_Drawing_Point2D texs_two = { 1.0f, 1.0f };
    OH_Drawing_Point2D texs_three = { 2.0f, 2.0f };
    OH_Drawing_Point2D point_vertices[1] = { texs_one };
    for (int i = 0; i < 1; i++) {
        OH_Drawing_CanvasDrawPoint(canvas, &point_vertices[i]);
    }
    // 3. OH_Drawing_Point2D create an array of multiple points
    OH_Drawing_Point2D texs_vertices[TEST_VERTEX_COUNT_3] = { texs_one, texs_two, texs_three };
    for (int i = 0; i < TEST_VERTEX_COUNT_3; i++) {
        OH_Drawing_CanvasDrawPoint(canvas, &texs_vertices[i]);
    }
    // 4. free memory
    OH_Drawing_CanvasDestroy(canvas);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPointNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23200
 * @tc.desc   test for testCanvasDrawPointNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPointNull()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawPoint the first parameter is empty
    const OH_Drawing_Point2D point = { 0.0f, 0.0f };
    // add assert
    EXPECT_EQ(OH_Drawing_CanvasDrawPoint(nullptr, &point), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasDrawPoint the second parameter is empty
    //  add assert
    EXPECT_EQ(OH_Drawing_CanvasDrawPoint(canvas, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4.free memory
    OH_Drawing_CanvasDestroy(canvas);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPointMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23300
 * @tc.desc   test for testCanvasDrawPointMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPointMultipleCalls()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvases[LOOP_COUNT];
    for (int i = 0; i < LOOP_COUNT; i++) {
        canvases[i] = OH_Drawing_CanvasCreate();
        // add assert
        EXPECT_NE(canvases[i], nullptr);
    }
    // 2. Call OH_Drawing_CanvasDrawPoint 10 times
    OH_Drawing_Point2D point1 = { 0.0f, 0.0f };
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_CanvasDrawPoint(canvases[i], &point1);
    }
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawColorNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23400
 * @tc.desc   test for testCanvasDrawColorNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawColorNormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawColor enumeration traversal
    uint32_t color[TEST_VERTEX_COUNT_3] = { TEST_COLOR_RED_VERTEX, TEST_COLOR_RED_VERTEX, TEST_COLOR_RED_VERTEX };
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    for (int i = 0; i < TEST_BLEND_MODE_COUNT_29; i++) {
        for (int j = 0; j < TEST_VERTEX_COUNT_3; j++) {
            OH_Drawing_CanvasDrawColor(canvas, color[j], blendMode[i]);
        }
    }
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawColorNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23500
 * @tc.desc   test for testCanvasDrawColorNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawColorNull()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawColor with the first parameter as nullptr
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    uint32_t color = TEST_COLOR_RED_VERTEX;
    for (int i = 0; i < TEST_BLEND_MODE_COUNT_29; i++) {
        // add assert
        EXPECT_EQ(OH_Drawing_CanvasDrawColor(nullptr, color, blendMode[i]), OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    // 3. OH_Drawing_CanvasDrawColor with the first parameter as 0
    for (int i = 0; i < TEST_BLEND_MODE_COUNT_29; i++) {
        OH_Drawing_CanvasDrawColor(canvas, 0, blendMode[i]);
    }
    // 4. free memory
    OH_Drawing_CanvasDestroy(canvas);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawColorMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23600
 * @tc.desc   test for testCanvasDrawColorMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawColorMaximum()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasDrawColor with the second parameter set to the maximum value
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,      BLEND_MODE_SRC,        BLEND_MODE_DST,         BLEND_MODE_SRC_OVER,
        BLEND_MODE_DST_OVER,   BLEND_MODE_SRC_IN,     BLEND_MODE_DST_IN,      BLEND_MODE_SRC_OUT,
        BLEND_MODE_DST_OUT,    BLEND_MODE_SRC_ATOP,   BLEND_MODE_DST_ATOP,    BLEND_MODE_XOR,
        BLEND_MODE_PLUS,       BLEND_MODE_MODULATE,   BLEND_MODE_SCREEN,      BLEND_MODE_OVERLAY,
        BLEND_MODE_DARKEN,     BLEND_MODE_LIGHTEN,    BLEND_MODE_COLOR_DODGE, BLEND_MODE_COLOR_BURN,
        BLEND_MODE_HARD_LIGHT, BLEND_MODE_SOFT_LIGHT, BLEND_MODE_DIFFERENCE,  BLEND_MODE_EXCLUSION,
        BLEND_MODE_MULTIPLY,   BLEND_MODE_HUE,        BLEND_MODE_SATURATION,  BLEND_MODE_COLOR,
        BLEND_MODE_LUMINOSITY,
    };
    uint32_t color = TEST_COLOR_BLACK;
    for (int i = 0; i < TEST_BLEND_MODE_COUNT_29; i++) {
        // add assert
        EXPECT_EQ(OH_Drawing_CanvasDrawColor(nullptr, color, blendMode[i]), OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    // 3. free memory
    OH_Drawing_CanvasDestroy(canvas);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawColorMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23700
 * @tc.desc   test for testCanvasDrawColorMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawColorMultipleCalls()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasDrawColor 10 times
    uint32_t color = TEST_COLOR_RED_VERTEX;
    OH_Drawing_BlendMode blendMode[] = {
        BLEND_MODE_CLEAR,  BLEND_MODE_SRC,    BLEND_MODE_DST,     BLEND_MODE_SRC_OVER, BLEND_MODE_DST_OVER,
        BLEND_MODE_SRC_IN, BLEND_MODE_DST_IN, BLEND_MODE_SRC_OUT, BLEND_MODE_DST_OUT,  BLEND_MODE_SRC_ATOP,
    };
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_CanvasDrawColor(canvas, color, blendMode[i]);
    }
    // 3. free memory
    OH_Drawing_CanvasDestroy(canvas);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasIsClipEmptyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23800
 * @tc.desc   test for testCanvasIsClipEmptyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasIsClipEmptyNormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_RectCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 3. OH_Drawing_CanvasClipRoundRect with the parameter clipOp set DIFFERENCE
    OH_Drawing_CanvasClipOp clipOp = { OH_Drawing_CanvasClipOp::DIFFERENCE };
    bool doAntiAlias[] = { true, false };
    for (int i = 0; i < BOOL_ARRAY_SIZE; i++) {
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp, doAntiAlias[i]);
    }
    // 4. OH_Drawing_CanvasIsClipEmpty
    bool isClipEmpty[] = { true, false };
    for (int i = 0; i < BOOL_ARRAY_SIZE; i++) {
        OH_Drawing_CanvasIsClipEmpty(canvas, &isClipEmpty[i]);
    }
    // 5. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasIsClipEmptyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23900
 * @tc.desc   test for testCanvasIsClipEmptyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasIsClipEmptyNull()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_RectCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 3. OH_Drawing_CanvasClipRoundRect with the parameter clipOp set DIFFERENCE
    OH_Drawing_CanvasClipOp clipOp = { OH_Drawing_CanvasClipOp::DIFFERENCE };
    bool doAntiAlias[] = { true, false };
    for (int i = 0; i < BOOL_ARRAY_SIZE; i++) {
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp, doAntiAlias[i]);
    }
    // 4. OH_Drawing_CanvasIsClipEmpty with the first parameter as null
    bool isClipEmpty[] = { true, false };
    for (int i = 0; i < BOOL_ARRAY_SIZE; i++) {
        // add assert
        EXPECT_EQ(OH_Drawing_CanvasIsClipEmpty(nullptr, &isClipEmpty[i]), OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    // 5. OH_Drawing_CanvasIsClipEmpty with the second parameter as null
    //  add assert
    EXPECT_EQ(OH_Drawing_CanvasIsClipEmpty(canvas, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasIsClipEmptyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24000
 * @tc.desc   test for testCanvasIsClipEmptyMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasIsClipEmptyMultipleCalls()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_RectCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    // 2. OH_Drawing_RoundRectCreate
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, 1.0f, 1.0f);
    // add assert
    EXPECT_NE(roundRect, nullptr);
    // 3. OH_Drawing_CanvasClipRoundRect with the parameter clipOp set DIFFERENCE
    OH_Drawing_CanvasClipOp clipOp = { OH_Drawing_CanvasClipOp::DIFFERENCE };
    bool doAntiAlias[] = { true, false };
    for (int i = 0; i < BOOL_ARRAY_SIZE; i++) {
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, clipOp, doAntiAlias[i]);
    }
    // 4. Call OH_Drawing_CanvasIsClipEmpty 10 times
    bool isClipEmpty = true;
    OH_Drawing_Canvas* canvases[LOOP_COUNT];
    for (int i = 0; i < LOOP_COUNT; i++) {
        canvases[i] = OH_Drawing_CanvasCreate();
    }
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_CanvasIsClipEmpty(canvases[i], &isClipEmpty);
    }
    // 5. free memory
    OH_Drawing_CanvasDestroy(canvas);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_CanvasDestroy(canvases[i]);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(roundRect);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetImageInfoNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24100
 * @tc.desc   test for testCanvasGetImageInfoNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasGetImageInfoNormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_BitmapGetPixels
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
    // 3. OH_Drawing_BitmapBuild
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_COORD_200;
    constexpr uint32_t height = TEST_CANVAS_COORD_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    // 4. OH_Drawing_BitmapCreateFromPixels
    const uint32_t bytesPerPixel = 3;
    const uint32_t padding = 32;
    const uint32_t rowBytes = width * bytesPerPixel + padding;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_Bitmap* frompixels = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // add assert
    EXPECT_EQ(frompixels, (nullptr));
    // 5. OH_Drawing_CanvasBind
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasBind(canvas, bitmap);
    // 6. OH_Drawing_CanvasGetImageInfo
    OH_Drawing_CanvasGetImageInfo(canvas, &imageInfo);
    // 7. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_BitmapDestroy(frompixels);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetImageInfoNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24200
 * @tc.desc   test for testCanvasGetImageInfoNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetImageInfoNull()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_BitmapGetPixels
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
    // 3. OH_Drawing_BitmapBuild
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_COORD_200;
    constexpr uint32_t height = TEST_CANVAS_COORD_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    // 4. OH_Drawing_BitmapCreateFromPixels
    const uint32_t bytesPerPixel = 3;
    const uint32_t padding = 32;
    const uint32_t rowBytes = width * bytesPerPixel + padding;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_Bitmap* frompixels = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // add assert
    EXPECT_EQ(frompixels, nullptr);
    // 5. OH_Drawing_CanvasBind
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasBind(canvas, bitmap);
    // 6. OH_Drawing_CanvasGetImageInfo with the first parameter as null
    //  add assert
    EXPECT_EQ(OH_Drawing_CanvasGetImageInfo(nullptr, &imageInfo), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 7. OH_Drawing_CanvasGetImageInfo with the second parameter as null
    //  add assert
    EXPECT_EQ(OH_Drawing_CanvasGetImageInfo(canvas, nullptr), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 8. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_BitmapDestroy(frompixels);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasGetImageInfoMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24300
 * @tc.desc   test for testCanvasGetImageInfoMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasGetImageInfoMultipleCalls()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_BitmapGetPixels
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
    // 3. OH_Drawing_BitmapBuild
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    constexpr uint32_t width = TEST_CANVAS_COORD_200;
    constexpr uint32_t height = TEST_CANVAS_COORD_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    // 4. OH_Drawing_BitmapCreateFromPixels
    const uint32_t bytesPerPixel = 3;
    const uint32_t padding = 32;
    const uint32_t rowBytes = width * bytesPerPixel + padding;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_Bitmap* frompixels = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // add assert
    EXPECT_EQ(frompixels, nullptr);
    // 5. OH_Drawing_CanvasBind
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasBind(canvas, bitmap);
    // 6. Call OH_Drawing_CanvasGetImageInfo 10 times
    OH_Drawing_Canvas* canvases[LOOP_COUNT];
    for (int i = 0; i < LOOP_COUNT; i++) {
        canvases[i] = OH_Drawing_CanvasCreate();
    }
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_CanvasGetImageInfo(canvases[i], &imageInfo);
    }
    // 7. free memory
    OH_Drawing_CanvasDestroy(canvas);
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_CanvasDestroy(canvases[i]);
    }
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_BitmapDestroy(frompixels);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRegionNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24400
 * @tc.desc   test for testCanvasClipRegionNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasClipRegionNormal()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_RectCreate
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_CanvasClipOp clipOp = { OH_Drawing_CanvasClipOp::DIFFERENCE };
    // 2. OH_Drawing_RegionCreate
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    // 3. OH_Drawing_RegionSetRect
    OH_Drawing_RegionSetRect(region, rect);
    // 4. OH_Drawing_CanvasClipRegion
    OH_Drawing_CanvasClipRegion(canvas, region, clipOp);
    // 5. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRegionNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24500
 * @tc.desc   test for testCanvasClipRegionNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipRegionNull()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_RectCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipOp clipOp = { OH_Drawing_CanvasClipOp::DIFFERENCE };
    // 2. OH_Drawing_RegionCreate
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    // 3. OH_Drawing_RegionSetRect
    OH_Drawing_RegionSetRect(region, rect);
    // 4. OH_Drawing_CanvasClipRegion with the first parameter as nullptr
    //  add assert
    EXPECT_EQ(OH_Drawing_CanvasClipRegion(nullptr, region, clipOp), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. OH_Drawing_CanvasClipRegion with the second parameter as nullptr
    //  add assert
    EXPECT_EQ(OH_Drawing_CanvasClipRegion(canvas, nullptr, clipOp), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
            
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipRegionMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24600
 * @tc.desc   test for testCanvasClipRegionMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipRegionMultipleCalls()
{
    DrawingNativeCanvasPart8TestSetUp();
    // 1. OH_Drawing_RectCreate
    OH_Drawing_Canvas* canvases[LOOP_COUNT];
    for (int i = 0; i < LOOP_COUNT; i++) {
        canvases[i] = OH_Drawing_CanvasCreate();
        // add assert
        EXPECT_NE(canvases[i], nullptr);
    }
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasClipOp clipOp = { OH_Drawing_CanvasClipOp::DIFFERENCE };
    // 2. OH_Drawing_RegionCreate
    OH_Drawing_Region* region = OH_Drawing_RegionCreate();
    // add assert
    EXPECT_NE(region, nullptr);
    // 3. OH_Drawing_RegionSetRect
    OH_Drawing_RegionSetRect(region, rect);
    // 4. Call OH_Drawing_CanvasClipRegion 10 times
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_CanvasClipRegion(canvases[i], region, clipOp);
    }
    // 5. free memory
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_CanvasDestroy(canvases[i]);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawLineNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24700
 * @tc.desc   test for testCanvasDrawLineNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawLineNull()
{
    DrawingNativeCanvasPart8TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass an empty value for the first parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(nullptr,
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_CANVAS_COORD_20));
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 3. Pass NULL for the second parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_CANVAS_COORD_10),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_CANVAS_COORD_20));

    // 4. Pass NULL for the third parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_CANVAS_COORD_10),
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_CANVAS_COORD_20));

    // 5. Pass NULL for the fourth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_CANVAS_COORD_10),
                              static_cast<int>(TEST_CANVAS_COORD_10),
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_CANVAS_COORD_20));

    // 6. Pass NULL for the fifth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_CANVAS_COORD_10),
                              static_cast<int>(TEST_CANVAS_COORD_10),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_MATRIX_VALUE_0));

    // 7. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawLineAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24800
 * @tc.desc   test for testCanvasDrawLineAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawLineAbnormal()
{
    DrawingNativeCanvasPart8TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass a negative value for the second parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_MATRIX_VALUE_NEG_1),
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_CANVAS_COORD_20));

    // 3. Pass a negative value for the third parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_MATRIX_VALUE_NEG_1),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_CANVAS_COORD_20));

    // 4. Pass a negative value for the fourth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(-TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_CANVAS_COORD_20));

    // 5. Pass a negative value for the fifth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(-TEST_CANVAS_COORD_20));

    // 6. The Y-coordinate (Y1) of the starting point of the line segment in OH_Drawing_CanvasDrawLine is equal to the
    // X-coordinate (X2) of the end point, but the Y-coordinate is different.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_CANVAS_COORD_20 + TEST_MATRIX_VALUE_1));

    // 7. The X-coordinate (X1) of the starting point of the line segment in OH_Drawing_CanvasDrawLine is equal to the
    // Y-coordinate (Y2) of the starting point, but the X-coordinate is different.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_MATRIX_VALUE_0),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_CANVAS_COORD_20 + TEST_MATRIX_VALUE_1),
                              static_cast<int>(TEST_CANVAS_COORD_20));

    // 8. The coordinates of the starting point of the line segment in OH_Drawing_CanvasDrawLine are equal to the
    // coordinates of the end point.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_CANVAS_COORD_10),
                              static_cast<int>(TEST_CANVAS_COORD_10),
                              static_cast<int>(TEST_CANVAS_COORD_10),
                              static_cast<int>(TEST_CANVAS_COORD_10));

    // 9. The coordinates of the starting point of the line segment in OH_Drawing_CanvasDrawLine are greater than the
    // coordinates of the end point.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<int>(TEST_CANVAS_COORD_100),
                              static_cast<int>(TEST_CANVAS_COORD_100),
                              static_cast<int>(TEST_CANVAS_COORD_20),
                              static_cast<int>(TEST_CANVAS_COORD_20));

    // 10. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawLineMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24900
 * @tc.desc   test for testCanvasDrawLineMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawLineMaximum()
{
    DrawingNativeCanvasPart8TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass a maximum value for the second parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(
        canvas, FLT_MAX_VALUE, static_cast<float>(TEST_MATRIX_VALUE_0), TEST_CANVAS_COORD_20, TEST_CANVAS_COORD_20);

    // 3. Pass a maximum value for the third parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(
        canvas, static_cast<float>(TEST_MATRIX_VALUE_0), FLT_MAX_VALUE, TEST_CANVAS_COORD_20, TEST_CANVAS_COORD_20);

    // 4. Pass a maximum value for the fourth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<float>(TEST_MATRIX_VALUE_0),
                              static_cast<float>(TEST_MATRIX_VALUE_0),
                              FLT_MAX_VALUE,
                              TEST_CANVAS_COORD_20);

    // 5. Pass a maximum value for the fifth parameter of OH_Drawing_CanvasDrawLine.
    OH_Drawing_CanvasDrawLine(canvas,
                              static_cast<float>(TEST_MATRIX_VALUE_0),
                              static_cast<float>(TEST_MATRIX_VALUE_0),
                              TEST_CANVAS_COORD_20,
                              FLT_MAX_VALUE);

    // 6. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawLineInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_25000
 * @tc.desc   test for testCanvasDrawLineInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawLineInputDestroyed()
{
    DrawingNativeCanvasPart8TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPathNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_25100
 * @tc.desc   test for testCanvasDrawPathNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawPathNormal()
{
    DrawingNativeCanvasPart8TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);

    // 3. OH_Drawing_PathMoveTo
    OH_Drawing_PathMoveTo(path, TEST_CANVAS_COORD_50, TEST_CANVAS_COORD_50);

    // 4. OH_Drawing_PathLineTo
    OH_Drawing_PathLineTo(path, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_50);

    // 5. OH_Drawing_CanvasDrawPath
    OH_Drawing_CanvasDrawPath(canvas, path);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // 6. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PathDestroy(path);

    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPathNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_25200
 * @tc.desc   test for testCanvasDrawPathNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPathNull()
{
    DrawingNativeCanvasPart8TestSetUp();

    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    // 3. Pass null as the first argument for OH_Drawing_CanvasDrawPath.
    OH_Drawing_CanvasDrawPath(nullptr, path);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 4. Pass null as the second argument for OH_Drawing_CanvasDrawPath.
    OH_Drawing_CanvasDrawPath(canvas, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 5. Pass null path as the second argument for OH_Drawing_CanvasDrawPath.
    OH_Drawing_CanvasDrawPath(canvas, path);
    // 6. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PathDestroy(path);

    DrawingNativeCanvasPart8TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawPathInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_25300
 * @tc.desc   test for testCanvasDrawPathInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawPathInputDestroyed()
{
    DrawingNativeCanvasPart8TestSetUp();
    // Deprecated
    DrawingNativeCanvasPart8TestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS