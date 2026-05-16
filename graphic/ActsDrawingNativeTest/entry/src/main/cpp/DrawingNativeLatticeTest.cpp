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

#define DRAWING_NUMBER_2 2
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_9 9
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_20 20
#define DRAWING_NUMBER_30 30
#define DRAWING_NUMBER_33 33
#define DRAWING_NUMBER_40 40
#define DRAWING_NUMBER_50 50
#define DRAWING_NUMBER_60 60
#define DRAWING_NUMBER_70 70
#define DRAWING_NUMBER_80 80
#define DRAWING_NUMBER_90 90
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_0XFFFF0000 0xFFFF0000

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestLatticeCreateNormal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    int yDivs[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[DRAWING_NUMBER_9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[DRAWING_NUMBER_9] = {DRAWING_NUMBER_0XFFFF0000};
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes, DRAWING_NUMBER_9,
            colors, DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeCreateNull()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    int yDivs[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[DRAWING_NUMBER_9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[DRAWING_NUMBER_9] = {DRAWING_NUMBER_0XFFFF0000};
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_LatticeCreate(nullptr, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes, DRAWING_NUMBER_9,
            colors, DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, nullptr, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes,
        DRAWING_NUMBER_9, colors, DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, 0, DRAWING_NUMBER_2, rect, rectTypes, DRAWING_NUMBER_9, colors,
        DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, 0, rect, rectTypes, DRAWING_NUMBER_9, colors,
        DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, nullptr, rectTypes,
        DRAWING_NUMBER_9, colors, DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, nullptr,
        DRAWING_NUMBER_9, colors, DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes, 0, colors,
        DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes,
        DRAWING_NUMBER_9, nullptr, DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes,
        DRAWING_NUMBER_9, colors, 0, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes,
        DRAWING_NUMBER_9, colors, DRAWING_NUMBER_9, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeCreateAbnormal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs1[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    int yDivs1[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    int xDivs2[DRAWING_NUMBER_10] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20, DRAWING_NUMBER_30, DRAWING_NUMBER_40,
        DRAWING_NUMBER_50, DRAWING_NUMBER_60, DRAWING_NUMBER_70, DRAWING_NUMBER_80, DRAWING_NUMBER_90,
        DRAWING_NUMBER_100};
    int yDivs2[DRAWING_NUMBER_10] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20, DRAWING_NUMBER_30, DRAWING_NUMBER_40,
        DRAWING_NUMBER_50, DRAWING_NUMBER_60, DRAWING_NUMBER_70, DRAWING_NUMBER_80, DRAWING_NUMBER_90,
        DRAWING_NUMBER_100};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes1[DRAWING_NUMBER_9] = {OH_Drawing_LatticeRectType::DEFAULT};
    OH_Drawing_LatticeRectType rectTypes2[33] = {OH_Drawing_LatticeRectType::DEFAULT};
    OH_Drawing_LatticeRectType rectTypes3[9] = {static_cast<OH_Drawing_LatticeRectType>(DRAWING_NUMBER_5)};
    uint32_t colors1[DRAWING_NUMBER_9] = {DRAWING_NUMBER_0XFFFF0000};
    uint32_t colors2[DRAWING_NUMBER_33] = {DRAWING_NUMBER_0XFFFF0000};
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeCreate(xDivs2, yDivs1, DRAWING_NUMBER_10, DRAWING_NUMBER_2, rect,
        rectTypes2, DRAWING_NUMBER_33, colors2, DRAWING_NUMBER_33, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs2, DRAWING_NUMBER_2, DRAWING_NUMBER_10, rect, rectTypes2,
        DRAWING_NUMBER_33, colors2, DRAWING_NUMBER_33, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs1, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes1,
        DRAWING_NUMBER_5, colors1, DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs1, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes1,
        DRAWING_NUMBER_9, colors1, DRAWING_NUMBER_5, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs1, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes3,
        DRAWING_NUMBER_9, colors1, DRAWING_NUMBER_9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeCreateEnumTraversal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    int yDivs[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[DRAWING_NUMBER_9] = {
        OH_Drawing_LatticeRectType::DEFAULT,
        OH_Drawing_LatticeRectType::TRANSPARENT,
        OH_Drawing_LatticeRectType::FIXED_COLOR
    };
    uint32_t colors[9] = {DRAWING_NUMBER_0XFFFF0000};
    for (int i = 0; i < DRAWING_NUMBER_3; i++) {
        OH_Drawing_ErrorCode errorCode =
            OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes,
                DRAWING_NUMBER_9, colors, DRAWING_NUMBER_9, &lattice);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeCreateMultipleCalls()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    int yDivs[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[DRAWING_NUMBER_9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[DRAWING_NUMBER_9] = {DRAWING_NUMBER_0XFFFF0000};
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode =
            OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes,
                DRAWING_NUMBER_9, colors, DRAWING_NUMBER_9, &lattice);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestLatticeDestroyNormal()
{
    DrawingNativeLatticeTestSetUp();
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    int yDivs[DRAWING_NUMBER_2] = {DRAWING_NUMBER_10, DRAWING_NUMBER_20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_100, DRAWING_NUMBER_100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[DRAWING_NUMBER_9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[DRAWING_NUMBER_9] = {DRAWING_NUMBER_0XFFFF0000};
    OH_Drawing_LatticeCreate(xDivs, yDivs, DRAWING_NUMBER_2, DRAWING_NUMBER_2, rect, rectTypes, DRAWING_NUMBER_9,
        colors, DRAWING_NUMBER_9, &lattice);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeDestroy(lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    DrawingNativeLatticeTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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