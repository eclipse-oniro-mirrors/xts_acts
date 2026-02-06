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

constexpr int LOOP_COUNT = 10;
constexpr int PATH_COORDINATE = 100;
constexpr int CLIP_ARRAY_SIZE = 2;
constexpr int DEGREES_ARRAY_SIZE = 3;

// Common SetUp and TearDown functions implementation
void DrawingNativeCanvasPart6TestSetUp()
{
    std::cout << "DrawingNativeCanvasPart6Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart6Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativeCanvasPart6TestTearDown()
{
    std::cout << "DrawingNativeCanvasPart6Test Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeCanvasPart6Test errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testCanvasDrawSingleChaWithFeaturesNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_17900
 * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasDrawSingleChaWithFeaturesNormal()
{
    DrawingNativeCanvasPart6TestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    const char* str1 = "1";
    const char* str2 = "H";
    const char* str3 = "a";
    const char* str4 = "你";
    const char* str5 = "（";
    const char* str6 = "(";
    const char* str7 = "{";
    const char* str8 = "龘";
    const char* str9 = "無";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    float curX = TEST_CANVAS_POS_X;
    float curY = TEST_CANVAS_POS_Y;
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str1, font, curX, curY, features),
              OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str2, font, curX, curY, features),
              OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str3, font, curX, curY, features),
              OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str4, font, curX, curY, features),
              OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str5, font, curX, curY, features),
              OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str6, font, curX, curY, features),
              OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str7, font, curX, curY, features),
              OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str8, font, curX, curY, features),
              OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str9, font, curX, curY, features),
              OH_DRAWING_SUCCESS);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawSingleChaWithFeaturesAbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_18000
 * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesAbNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasDrawSingleChaWithFeaturesAbNormal()
{
    DrawingNativeCanvasPart6TestSetUp();

    float curX = TEST_CANVAS_POS_X;
    float curY = TEST_CANVAS_POS_Y;
    float textSize = TEST_CANVAS_TEXT_SIZE;
    const char* str = "(";
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_BrushSetColor(brush, TEST_CANVAS_COLOR_BLUE);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_FontSetTextSize(font, textSize);
    OH_Drawing_FontFeatures* feat = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(nullptr, str, font, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, nullptr, font, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, nullptr, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, font, TEST_CANVAS_NEGATIVE_OFFSET, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, font, curX, TEST_CANVAS_NEGATIVE_OFFSET, feat);
    EXPECT_EQ(code, OH_DRAWING_SUCCESS);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str, font, curX, curY, nullptr);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    code = OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, "", font, curX, curY, feat);
    EXPECT_EQ(code, OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_FontFeaturesDestroy(feat);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasDrawSingleChaWithFeaturesCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_18100
 * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestCanvasDrawSingleChaWithFeaturesCalls()
{
    DrawingNativeCanvasPart6TestSetUp();

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    const char* str1 = "1";
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    float curX = TEST_CANVAS_POS_X;
    float curY = TEST_CANVAS_POS_Y;
    int count = TEST_CANVAS_LOOP_COUNT;
    OH_Drawing_FontFeatures* features = OH_Drawing_FontFeaturesCreate();
    for (int i = 0; i < count; i++) {
        EXPECT_EQ(OH_Drawing_CanvasDrawSingleCharacterWithFeatures(canvas, str1, font, curX, curY, features),
                  OH_DRAWING_SUCCESS);
    }
    OH_Drawing_FontDestroy(font);
    OH_Drawing_FontFeaturesDestroy(features);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipPathNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18200
 * @tc.desc   test for testCanvasClipPathNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasClipPathNormal()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, PATH_COORDINATE, 0);
    OH_Drawing_PathLineTo(path, PATH_COORDINATE, PATH_COORDINATE);
    OH_Drawing_PathLineTo(path, 0, PATH_COORDINATE);
    OH_Drawing_PathClose(path);
    // 3. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, LOOP_COUNT, LOOP_COUNT, PATH_COORDINATE, PATH_COORDINATE,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 4. OH_Drawing_CanvasClipPath
    OH_Drawing_CanvasClipOp clipOp[] = { OH_Drawing_CanvasClipOp::DIFFERENCE, OH_Drawing_CanvasClipOp::INTERSECT };
    bool doAntiAlias[] = { true, false };
    for (int i = 0; i < CLIP_ARRAY_SIZE; i++) {
        for (int j = 0; j < CLIP_ARRAY_SIZE; j++) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_CanvasClipPath(canvas, path, clipOp[i], doAntiAlias[j]);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        }
    }
    // 5. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipPathNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18300
 * @tc.desc   test for testCanvasClipPathNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipPathNull()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PathCreate
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path, nullptr);
    OH_Drawing_PathMoveTo(path, 0, 0);
    OH_Drawing_PathLineTo(path, PATH_COORDINATE, 0);
    OH_Drawing_PathLineTo(path, PATH_COORDINATE, PATH_COORDINATE);
    OH_Drawing_PathLineTo(path, 0, PATH_COORDINATE);
    OH_Drawing_PathClose(path);
    // 3. OH_Drawing_PathAddRect
    OH_Drawing_PathAddRect(path, LOOP_COUNT, LOOP_COUNT, PATH_COORDINATE, PATH_COORDINATE,
                           OH_Drawing_PathDirection::PATH_DIRECTION_CW);
    // 4. OH_Drawing_CanvasClipPath with the first parameter being null
    OH_Drawing_CanvasClipPath(nullptr, path, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 5. OH_Drawing_CanvasClipPath with the second parameter being null
    OH_Drawing_CanvasClipPath(canvas, nullptr, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 6. OH_Drawing_CanvasClipPath with the second parameter being an empty path
    OH_Drawing_Path* path2 = OH_Drawing_PathCreate();
    // add assert
    EXPECT_NE(path2, nullptr);
    OH_Drawing_CanvasClipPath(canvas, path2, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    // 7. Free memory
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PathDestroy(path2);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasClipPathInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18400
 * @tc.desc   test for testCanvasClipPathInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasClipPathInputDestroyed()
{
    DrawingNativeCanvasPart6TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRotateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18500
 * @tc.desc   test for testCanvasRotateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasRotateNormal()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate, rotate degrees with values 0, 180, 360
    float degrees[] = { TEST_ARC_START_ANGLE, TEST_ARC_SWEEP_ANGLE_180, TEST_ARC_SWEEP_ANGLE_360 };
    for (int i = 0; i < DEGREES_ARRAY_SIZE; i++) {
        OH_Drawing_ErrorCodeReset();
        OH_Drawing_CanvasRotate(canvas, degrees[i], TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    }
    // 3. Call drawing class interface to draw a rectangle
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRotateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18600
 * @tc.desc   test for testCanvasRotateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRotateNull()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate with the first parameter being null
    OH_Drawing_CanvasRotate(nullptr, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasRotate with the third parameter being 0
    OH_Drawing_CanvasRotate(canvas, TEST_MATRIX_VALUE_0, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_10);
    // 4. OH_Drawing_CanvasRotate with the fourth parameter being 0
    OH_Drawing_CanvasRotate(canvas, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_10, TEST_MATRIX_VALUE_0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRotateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18700
 * @tc.desc   test for testCanvasRotateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRotateAbnormal()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate with negative degrees input
    OH_Drawing_CanvasRotate(canvas, -TEST_ARC_SWEEP_ANGLE_180, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // 3. OH_Drawing_CanvasRotate with degrees input greater than 360
    OH_Drawing_CanvasRotate(canvas, TEST_ROTATE_DEGREES_LARGE, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // 4. OH_Drawing_CanvasRotate with negative px input for rotation center
    OH_Drawing_CanvasRotate(canvas, TEST_ARC_SWEEP_ANGLE_180, -TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // 5. OH_Drawing_CanvasRotate with negative py input for rotation center
    OH_Drawing_CanvasRotate(canvas, TEST_ARC_SWEEP_ANGLE_180, TEST_CANVAS_COORD_10, -TEST_CANVAS_COORD_10);
    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRotateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18800
 * @tc.desc   test for testCanvasRotateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRotateMaximum()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasRotate with maximum rotation angle degrees input
    OH_Drawing_CanvasRotate(canvas, FLT_MAX_VALUE, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // 3. OH_Drawing_CanvasRotate with maximum x-coordinate px input for rotation center
    OH_Drawing_CanvasRotate(canvas, TEST_ARC_SWEEP_ANGLE_180, FLT_MAX_VALUE, TEST_CANVAS_COORD_10);
    // 4. OH_Drawing_CanvasRotate with maximum y-coordinate py input for rotation center
    OH_Drawing_CanvasRotate(canvas, TEST_ARC_SWEEP_ANGLE_180, TEST_CANVAS_COORD_10, FLT_MAX_VALUE);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRotateInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18900
 * @tc.desc   test for testCanvasRotateInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRotateInputDestroyed()
{
    DrawingNativeCanvasPart6TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasRotateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19000
 * @tc.desc   test for testCanvasRotateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasRotateMultipleCalls()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasRotate 10 times, each time with different rotation angles and rotation center
    // coordinates
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasRotate(canvas, i * TEST_CANVAS_COORD_10, i * TEST_CANVAS_COORD_10, i * TEST_CANVAS_COORD_10);
        // 3. Call drawing class interface
        OH_Drawing_Rect* rect =
            OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
                                  TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_RectDestroy(rect);
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasTranslateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19100
 * @tc.desc   test for testCanvasTranslateNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasTranslateNormal()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate
    OH_Drawing_CanvasTranslate(canvas, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Call drawing class interface to draw a rectangle
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasTranslateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19200
 * @tc.desc   test for testCanvasTranslateNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasTranslateNull()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate with the first parameter being null
    OH_Drawing_CanvasTranslate(nullptr, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. OH_Drawing_CanvasTranslate with the second parameter being 0
    OH_Drawing_CanvasTranslate(canvas, TEST_MATRIX_VALUE_0, TEST_CANVAS_COORD_10);
    // 4. OH_Drawing_CanvasTranslate with the third parameter being 0
    OH_Drawing_CanvasTranslate(canvas, TEST_CANVAS_COORD_10, TEST_MATRIX_VALUE_0);
    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasTranslateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19300
 * @tc.desc   test for testCanvasTranslateAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasTranslateAbnormal()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate with negative movement distance dx in the x-axis direction
    OH_Drawing_CanvasTranslate(canvas, TEST_CANVAS_COORD_NEGATIVE_10, TEST_CANVAS_COORD_10);
    // 3. OH_Drawing_CanvasTranslate with negative movement distance dy in the y-axis direction
    OH_Drawing_CanvasTranslate(canvas, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_NEGATIVE_10);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasTranslateMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19400
 * @tc.desc   test for testCanvasTranslateMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasTranslateMaximum()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_CanvasTranslate with the movement distance dx in the x-axis direction being the maximum value
    OH_Drawing_CanvasTranslate(canvas, FLT_MAX_VALUE, TEST_CANVAS_COORD_10);
    // 3. OH_Drawing_CanvasTranslate with the movement distance dy in the y-axis direction being the maximum value
    OH_Drawing_CanvasTranslate(canvas, TEST_CANVAS_COORD_10, FLT_MAX_VALUE);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasTranslateInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19500
 * @tc.desc   test for testCanvasTranslateInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasTranslateInputDestroyed()
{
    DrawingNativeCanvasPart6TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasTranslateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19600
 * @tc.desc   test for testCanvasTranslateMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasTranslateMultipleCalls()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);
    // 2. Call OH_Drawing_CanvasTranslate 10 times, each time with different movement distances
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_CanvasTranslate(canvas, i * TEST_CANVAS_COORD_10, i * TEST_CANVAS_COORD_10);
        // 3. Call drawing class interface
        OH_Drawing_Rect* rect =
            OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10,
                                  TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
        // add assert
        EXPECT_NE(rect, nullptr);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_RectDestroy(rect);
    }
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasScaleNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19700
 * @tc.desc   test for testCanvasScaleNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestCanvasScaleNormal()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. Create a canvas
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas
    OH_Drawing_CanvasScale(canvas, TEST_SKEW_VALUE_2, TEST_SKEW_VALUE_2);

    // 3. Call drawing class interface
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasScaleNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19800
 * @tc.desc   test for testCanvasScaleNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasScaleNull()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. Create a canvas
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas, with the first parameter being null
    OH_Drawing_CanvasScale(nullptr, TEST_SKEW_VALUE_2, TEST_SKEW_VALUE_2);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 3. Scale the canvas, with the second parameter being 0
    OH_Drawing_CanvasScale(canvas, TEST_MATRIX_VALUE_0, TEST_SKEW_VALUE_2);

    // 4. Scale the canvas, with the third parameter being 0
    OH_Drawing_CanvasScale(canvas, TEST_SKEW_VALUE_2, TEST_MATRIX_VALUE_0);

    // 5. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasScaleAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19900
 * @tc.desc   test for testCanvasScaleAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasScaleAbnormal()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. Create a canvas
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas, with a negative scale ratio in the x-axis
    OH_Drawing_CanvasScale(canvas, -TEST_SKEW_VALUE_2, TEST_SKEW_VALUE_2);

    // 3. Scale the canvas, with a negative scale ratio in the y-axis
    OH_Drawing_CanvasScale(canvas, TEST_SKEW_VALUE_2, -TEST_SKEW_VALUE_2);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasScaleMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20000
 * @tc.desc   test for testCanvasScaleMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasScaleMaximum()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. Create a canvas
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Scale the canvas, with the maximum scale ratio in the x-axis
    OH_Drawing_CanvasScale(canvas, DBL_MAX_VALUE, TEST_SKEW_VALUE_2);

    // 3. Scale the canvas, with the maximum scale ratio in the y-axis
    OH_Drawing_CanvasScale(canvas, TEST_SKEW_VALUE_2, DBL_MAX_VALUE);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasScaleInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20100
 * @tc.desc   test for testCanvasScaleInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasScaleInputDestroyed()
{
    DrawingNativeCanvasPart6TestSetUp();

    // Deprecated

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testCanvasScaleMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20200
 * @tc.desc   test for testCanvasScaleMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestCanvasScaleMultipleCalls()
{
    DrawingNativeCanvasPart6TestSetUp();
    // 1. Create a canvas
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    // add assert
    EXPECT_NE(canvas, nullptr);

    // 2. Call OH_Drawing_CanvasScale 10 times, each time with different compression ratios
    for (int i = 1; i <= LOOP_COUNT; i++) {
        OH_Drawing_CanvasScale(canvas, i * TEST_SKEW_VALUE_1, i * TEST_SKEW_VALUE_1);
    }

    // 3. Call drawing class interface
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_10, TEST_CANVAS_COORD_100, TEST_CANVAS_COORD_100);
    // add assert
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);

    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);

    DrawingNativeCanvasPart6TestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS