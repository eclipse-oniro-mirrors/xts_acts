/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "include/DrawingNativeLatticeTest.h"
#include "include/DrawingNativeScalarCommonTest.h"
#include "include/OhosCommonTest.h"
#include <native_drawing/drawing_error_code.h>

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Constants for lattice dimensions and test values
const float DEFAULT_RECT_LEFT = 0.0f;
const float DEFAULT_RECT_TOP = 0.0f;
const float DEFAULT_RECT_RIGHT = 100.0f;
const float DEFAULT_RECT_BOTTOM = 100.0f;

const int DEFAULT_X_DIV1 = 10;
const int DEFAULT_X_DIV2 = 20;
const int DEFAULT_Y_DIV1 = 10;
const int DEFAULT_Y_DIV2 = 20;

const int DEFAULT_X_DIV3 = 30;
const int DEFAULT_X_DIV4 = 40;
const int DEFAULT_X_DIV5 = 50;
const int DEFAULT_X_DIV6 = 60;
const int DEFAULT_X_DIV7 = 70;
const int DEFAULT_X_DIV8 = 80;
const int DEFAULT_X_DIV9 = 90;
const int DEFAULT_X_DIV10 = 100;

const int DEFAULT_Y_DIV3 = 30;
const int DEFAULT_Y_DIV4 = 40;
const int DEFAULT_Y_DIV5 = 50;
const int DEFAULT_Y_DIV6 = 60;
const int DEFAULT_Y_DIV7 = 70;
const int DEFAULT_Y_DIV8 = 80;
const int DEFAULT_Y_DIV9 = 90;
const int DEFAULT_Y_DIV10 = 100;

const int DEFAULT_X_DIV_COUNT = 2;
const int DEFAULT_Y_DIV_COUNT = 2;
const int DEFAULT_RECT_TYPES_COUNT = 9;
const int DEFAULT_COLORS_COUNT = 9;
const int DEFAULT_DIV_ARRAY_SIZE = 2;

const int LARGE_DIV_COUNT = 10;
const int LARGE_RECT_TYPES_COUNT = 33;
const int LARGE_COLORS_COUNT = 33;

const int ENUM_COUNT = 3;
const int LOOP_COUNT = 10;
const int INVALID_RECT_TYPE = 5;

const uint32_t TEST_COLOR = 0xFFFF0000;

const int INVALID_RECT_TYPES_COUNT = 5;
const int INVALID_COLORS_COUNT = 5;

// Common SetUp and TearDown functions implementation
void DrawingNativeLatticeTestSetUp()
{
    std::cout << "DrawingNativeLatticeTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeLatticeTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeLatticeTestTearDown()
{
    std::cout << "DrawingNativeLatticeTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeLatticeTest errorCodeReset after each test case." << std::endl;
}

struct LatticeTestParams {
    int* xDivs;
    int* yDivs;
    OH_Drawing_Rect* rect;
    OH_Drawing_LatticeRectType* rectTypes;
    uint32_t* colors;
    OH_Drawing_Lattice** lattice;
};

struct LatticeAbnormalTestParams {
    int* xDivs1;
    int* yDivs1;
    int* xDivs2;
    int* yDivs2;
    OH_Drawing_Rect* rect;
    OH_Drawing_LatticeRectType* rectTypes1;
    OH_Drawing_LatticeRectType* rectTypes2;
    OH_Drawing_LatticeRectType* rectTypes3;
    uint32_t* colors1;
    uint32_t* colors2;
    OH_Drawing_Lattice** lattice;
};

/**
 * @tc.name   testLatticeCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_Lattice_0100
 * @tc.desc   Test for testLatticeCreateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestLatticeCreateNormal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice* lattice = nullptr;
    int xDivs[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_X_DIV1, DEFAULT_X_DIV2 };
    int yDivs[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_Y_DIV1, DEFAULT_Y_DIV2 };
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[DEFAULT_RECT_TYPES_COUNT] = { OH_Drawing_LatticeRectType::DEFAULT };
    uint32_t colors[DEFAULT_COLORS_COUNT] = { TEST_COLOR };
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(xDivs,
                                                              yDivs,
                                                              DEFAULT_X_DIV_COUNT,
                                                              DEFAULT_Y_DIV_COUNT,
                                                              rect,
                                                              rectTypes,
                                                              DEFAULT_RECT_TYPES_COUNT,
                                                              colors,
                                                              DEFAULT_COLORS_COUNT,
                                                              &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

static void TestLatticeCreateWithNullDivs(const LatticeTestParams& params)
{
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(nullptr, params.yDivs, DEFAULT_X_DIV_COUNT,
        DEFAULT_Y_DIV_COUNT, params.rect, params.rectTypes, DEFAULT_RECT_TYPES_COUNT, params.colors,
        DEFAULT_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(params.xDivs, nullptr, DEFAULT_X_DIV_COUNT, DEFAULT_Y_DIV_COUNT,
        params.rect, params.rectTypes, DEFAULT_RECT_TYPES_COUNT, params.colors, DEFAULT_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
}

static void TestLatticeCreateWithZeroCounts(const LatticeTestParams& params)
{
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(params.xDivs, params.yDivs, 0, DEFAULT_Y_DIV_COUNT,
        params.rect, params.rectTypes, DEFAULT_RECT_TYPES_COUNT, params.colors, DEFAULT_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(params.xDivs, params.yDivs, DEFAULT_X_DIV_COUNT, 0,
        params.rect, params.rectTypes, DEFAULT_RECT_TYPES_COUNT, params.colors, DEFAULT_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
}

static void TestLatticeCreateWithNullOptionalParams(const LatticeTestParams& params)
{
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(params.xDivs, params.yDivs, DEFAULT_X_DIV_COUNT,
        DEFAULT_Y_DIV_COUNT, nullptr, params.rectTypes, DEFAULT_RECT_TYPES_COUNT, params.colors,
        DEFAULT_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_LatticeCreate(params.xDivs, params.yDivs, DEFAULT_X_DIV_COUNT, DEFAULT_Y_DIV_COUNT,
        params.rect, nullptr, DEFAULT_RECT_TYPES_COUNT, params.colors, DEFAULT_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(params.xDivs, params.yDivs, DEFAULT_X_DIV_COUNT, DEFAULT_Y_DIV_COUNT,
        params.rect, params.rectTypes, 0, params.colors, DEFAULT_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(params.xDivs, params.yDivs, DEFAULT_X_DIV_COUNT, DEFAULT_Y_DIV_COUNT,
        params.rect, params.rectTypes, DEFAULT_RECT_TYPES_COUNT, nullptr, DEFAULT_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(params.xDivs, params.yDivs, DEFAULT_X_DIV_COUNT, DEFAULT_Y_DIV_COUNT,
        params.rect, params.rectTypes, DEFAULT_RECT_TYPES_COUNT, params.colors, 0, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(params.xDivs, params.yDivs, DEFAULT_X_DIV_COUNT, DEFAULT_Y_DIV_COUNT,
        params.rect, params.rectTypes, DEFAULT_RECT_TYPES_COUNT, params.colors, DEFAULT_COLORS_COUNT, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
}

/**
 * @tc.name   testLatticeCreateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_Lattice_0200
 * @tc.desc   Test for testLatticeCreateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestLatticeCreateNull()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice* lattice = nullptr;
    int xDivs[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_X_DIV1, DEFAULT_X_DIV2 };
    int yDivs[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_Y_DIV1, DEFAULT_Y_DIV2 };
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[DEFAULT_RECT_TYPES_COUNT] = { OH_Drawing_LatticeRectType::DEFAULT };
    uint32_t colors[DEFAULT_COLORS_COUNT] = { TEST_COLOR };

    LatticeTestParams params = { xDivs, yDivs, rect, rectTypes, colors, &lattice };
    TestLatticeCreateWithNullDivs(params);
    TestLatticeCreateWithZeroCounts(params);
    TestLatticeCreateWithNullOptionalParams(params);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

static void TestLatticeCreateWithMismatchedDivCounts(const LatticeAbnormalTestParams& params)
{
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(params.xDivs2, params.yDivs1, LARGE_DIV_COUNT,
        DEFAULT_Y_DIV_COUNT, params.rect, params.rectTypes2, LARGE_RECT_TYPES_COUNT, params.colors2,
        LARGE_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(params.xDivs1, params.yDivs2, DEFAULT_X_DIV_COUNT, LARGE_DIV_COUNT,
        params.rect, params.rectTypes2, LARGE_RECT_TYPES_COUNT, params.colors2, LARGE_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
}

static void TestLatticeCreateWithInvalidCounts(const LatticeAbnormalTestParams& params)
{
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(params.xDivs1, params.yDivs1, DEFAULT_X_DIV_COUNT,
        DEFAULT_Y_DIV_COUNT, params.rect, params.rectTypes1, INVALID_RECT_TYPES_COUNT, params.colors1,
        DEFAULT_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(params.xDivs1, params.yDivs1, DEFAULT_X_DIV_COUNT, DEFAULT_Y_DIV_COUNT,
        params.rect, params.rectTypes1, DEFAULT_RECT_TYPES_COUNT, params.colors1, INVALID_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
}

static void TestLatticeCreateWithInvalidRectType(const LatticeAbnormalTestParams& params)
{
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(params.xDivs1, params.yDivs1, DEFAULT_X_DIV_COUNT,
        DEFAULT_Y_DIV_COUNT, params.rect, params.rectTypes3, DEFAULT_RECT_TYPES_COUNT, params.colors1,
        DEFAULT_COLORS_COUNT, params.lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
}

/**
 * @tc.name   testLatticeCreateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_Lattice_0300
 * @tc.desc   Test for testLatticeCreateAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestLatticeCreateAbnormal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice* lattice = nullptr;
    int xDivs1[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_X_DIV1, DEFAULT_X_DIV2 };
    int yDivs1[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_Y_DIV1, DEFAULT_Y_DIV2 };
    int xDivs2[LARGE_DIV_COUNT] = { DEFAULT_X_DIV1, DEFAULT_X_DIV2, DEFAULT_X_DIV3, DEFAULT_X_DIV4, DEFAULT_X_DIV5,
                                    DEFAULT_X_DIV6, DEFAULT_X_DIV7, DEFAULT_X_DIV8, DEFAULT_X_DIV9, DEFAULT_X_DIV10 };
    int yDivs2[LARGE_DIV_COUNT] = { DEFAULT_Y_DIV1, DEFAULT_Y_DIV2, DEFAULT_Y_DIV3, DEFAULT_Y_DIV4, DEFAULT_Y_DIV5,
                                    DEFAULT_Y_DIV6, DEFAULT_Y_DIV7, DEFAULT_Y_DIV8, DEFAULT_Y_DIV9, DEFAULT_Y_DIV10 };
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes1[DEFAULT_RECT_TYPES_COUNT] = { OH_Drawing_LatticeRectType::DEFAULT };
    OH_Drawing_LatticeRectType rectTypes2[LARGE_RECT_TYPES_COUNT] = { OH_Drawing_LatticeRectType::DEFAULT };
    OH_Drawing_LatticeRectType rectTypes3[DEFAULT_RECT_TYPES_COUNT] = { static_cast<OH_Drawing_LatticeRectType>(
        INVALID_RECT_TYPE) };
    uint32_t colors1[DEFAULT_COLORS_COUNT] = { TEST_COLOR };
    uint32_t colors2[LARGE_COLORS_COUNT] = { TEST_COLOR };

    LatticeAbnormalTestParams params = { xDivs1, yDivs1, xDivs2, yDivs2, rect,
                                         rectTypes1, rectTypes2, rectTypes3, colors1, colors2, &lattice };
    TestLatticeCreateWithMismatchedDivCounts(params);
    TestLatticeCreateWithInvalidCounts(params);
    TestLatticeCreateWithInvalidRectType(params);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testLatticeCreateEnumTraversal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_Lattice_0400
 * @tc.desc   Test for testLatticeCreateEnumTraversal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestLatticeCreateEnumTraversal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice* lattice = nullptr;
    int xDivs[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_X_DIV1, DEFAULT_X_DIV2 };
    int yDivs[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_Y_DIV1, DEFAULT_Y_DIV2 };
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[DEFAULT_RECT_TYPES_COUNT] = { OH_Drawing_LatticeRectType::DEFAULT,
                                                                       OH_Drawing_LatticeRectType::TRANSPARENT,
                                                                       OH_Drawing_LatticeRectType::FIXED_COLOR };
    uint32_t colors[DEFAULT_COLORS_COUNT] = { TEST_COLOR };
    for (int i = 0; i < ENUM_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(xDivs,
                                                                  yDivs,
                                                                  DEFAULT_X_DIV_COUNT,
                                                                  DEFAULT_Y_DIV_COUNT,
                                                                  rect,
                                                                  rectTypes,
                                                                  DEFAULT_RECT_TYPES_COUNT,
                                                                  colors,
                                                                  DEFAULT_COLORS_COUNT,
                                                                  &lattice);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testLatticeCreateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_Lattice_0500
 * @tc.desc   Test for testLatticeCreateMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestLatticeCreateMultipleCalls()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice* lattice = nullptr;
    int xDivs[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_X_DIV1, DEFAULT_X_DIV2 };
    int yDivs[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_Y_DIV1, DEFAULT_Y_DIV2 };
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[DEFAULT_RECT_TYPES_COUNT] = { OH_Drawing_LatticeRectType::DEFAULT };
    uint32_t colors[DEFAULT_COLORS_COUNT] = { TEST_COLOR };
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(xDivs,
                                                                  yDivs,
                                                                  DEFAULT_X_DIV_COUNT,
                                                                  DEFAULT_Y_DIV_COUNT,
                                                                  rect,
                                                                  rectTypes,
                                                                  DEFAULT_RECT_TYPES_COUNT,
                                                                  colors,
                                                                  DEFAULT_COLORS_COUNT,
                                                                  &lattice);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testLatticeDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_Lattice_0600
 * @tc.desc   Test for testLatticeDestroyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestLatticeDestroyNormal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice* lattice = nullptr;
    int xDivs[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_X_DIV1, DEFAULT_X_DIV2 };
    int yDivs[DEFAULT_DIV_ARRAY_SIZE] = { DEFAULT_Y_DIV1, DEFAULT_Y_DIV2 };
    OH_Drawing_Rect* rect =
        OH_Drawing_RectCreate(DEFAULT_RECT_LEFT, DEFAULT_RECT_TOP, DEFAULT_RECT_RIGHT, DEFAULT_RECT_BOTTOM);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[DEFAULT_RECT_TYPES_COUNT] = { OH_Drawing_LatticeRectType::DEFAULT };
    uint32_t colors[DEFAULT_COLORS_COUNT] = { TEST_COLOR };
    OH_Drawing_LatticeCreate(xDivs,
                             yDivs,
                             DEFAULT_X_DIV_COUNT,
                             DEFAULT_Y_DIV_COUNT,
                             rect,
                             rectTypes,
                             DEFAULT_RECT_TYPES_COUNT,
                             colors,
                             DEFAULT_COLORS_COUNT,
                             &lattice);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeDestroy(lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testLatticeDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_Lattice_0700
 * @tc.desc   Test for testLatticeDestroyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestLatticeDestroyNull()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeDestroy(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
