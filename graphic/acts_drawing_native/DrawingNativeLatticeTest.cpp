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

#include "DrawingNativeScalarCommon.h"
#include "drawing_error_code.h"
#include "drawing_lattice.h"
#include "drawing_rect.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeLatticeTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeLatticeTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeLatticeTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeLatticeTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeLatticeTest errorCodeReset after each test case." << std::endl;
    }
};

/**
 * @tc.name   testLatticeCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0100
 * @tc.desc   Test for testLatticeCreateNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeLatticeTest, testLatticeCreateNormal, Function | SmallTest | Level0) {
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[2] = {10, 20};
    int yDivs[2] = {10, 20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[9] = {0xFFFF0000};
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 2, rect, rectTypes, 9, colors, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
}

/**
 * @tc.name   testLatticeCreateNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0101
 * @tc.desc   Test for testLatticeCreateNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeLatticeTest, testLatticeCreateNull, Function | SmallTest | Level3) {
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[2] = {10, 20};
    int yDivs[2] = {10, 20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[9] = {0xFFFF0000};
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_LatticeCreate(nullptr, yDivs, 2, 2, rect, rectTypes, 9, colors, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, nullptr, 2, 2, rect, rectTypes, 9, colors, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, 0, 2, rect, rectTypes, 9, colors, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 0, rect, rectTypes, 9, colors, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 2, nullptr, rectTypes, 9, colors, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 2, rect, nullptr, 9, colors, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 2, rect, rectTypes, 0, colors, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 2, rect, rectTypes, 9, nullptr, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 2, rect, rectTypes, 9, colors, 0, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 2, rect, rectTypes, 9, colors, 9, nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
}

/**
 * @tc.name   testLatticeCreateAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0102
 * @tc.desc   Test for testLatticeCreateAbnormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeLatticeTest, testLatticeCreateAbnormal, Function | SmallTest | Level3) {
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs1[2] = {10, 20};
    int yDivs1[2] = {10, 20};
    int xDivs2[10] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    int yDivs2[10] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes1[9] = {OH_Drawing_LatticeRectType::DEFAULT};
    OH_Drawing_LatticeRectType rectTypes2[33] = {OH_Drawing_LatticeRectType::DEFAULT};
    OH_Drawing_LatticeRectType rectTypes3[9] = {static_cast<OH_Drawing_LatticeRectType>(5)};
    uint32_t colors1[9] = {0xFFFF0000};
    uint32_t colors2[33] = {0xFFFF0000};
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_LatticeCreate(xDivs2, yDivs1, 10, 2, rect, rectTypes2, 33, colors2, 33, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs2, 2, 10, rect, rectTypes2, 33, colors2, 33, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs1, 2, 2, rect, rectTypes1, 5, colors1, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs1, 2, 2, rect, rectTypes1, 9, colors1, 5, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    errorCode = OH_Drawing_LatticeCreate(xDivs1, yDivs1, 2, 2, rect, rectTypes3, 9, colors1, 9, &lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
}

/**
 * @tc.name   testLatticeCreateEnumTraversal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0103
 * @tc.desc   Test for testLatticeCreateEnumTraversal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeLatticeTest, testLatticeCreateEnumTraversal, Function | SmallTest | Level3) {
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[2] = {10, 20};
    int yDivs[2] = {10, 20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[9] = {
        OH_Drawing_LatticeRectType::DEFAULT,
        OH_Drawing_LatticeRectType::TRANSPARENT,
        OH_Drawing_LatticeRectType::FIXED_COLOR
    };
    uint32_t colors[9] = {0xFFFF0000};
    for (int i = 0; i < 3; i++) {
        OH_Drawing_ErrorCode errorCode =
            OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 2, rect, rectTypes, 9, colors, 9, &lattice);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
}

/**
 * @tc.name   testLatticeCreateMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0104
 * @tc.desc   Test for testLatticeCreateMultipleCalls
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeLatticeTest, testLatticeCreateMultipleCalls, Function | SmallTest | Level3) {
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[2] = {10, 20};
    int yDivs[2] = {10, 20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[9] = {0xFFFF0000};
    for (int i = 0; i < 10; i++) {
        OH_Drawing_ErrorCode errorCode =
            OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 2, rect, rectTypes, 9, colors, 9, &lattice);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_LatticeDestroy(lattice);
}

/**
 * @tc.name   testLatticeDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0200
 * @tc.desc   Test for testLatticeDestroyNormal
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(DrawingNativeLatticeTest, testLatticeDestroyNormal, Function | SmallTest | Level0) {
    OH_Drawing_Lattice *lattice = nullptr;
    int xDivs[2] = {10, 20};
    int yDivs[2] = {10, 20};
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_LatticeRectType rectTypes[9] = {OH_Drawing_LatticeRectType::DEFAULT};
    uint32_t colors[9] = {0xFFFF0000};
    OH_Drawing_LatticeCreate(xDivs, yDivs, 2, 2, rect, rectTypes, 9, colors, 9, &lattice);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeDestroy(lattice);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
}

/**
 * @tc.name   testLatticeDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0201
 * @tc.desc   Test for testLatticeDestroyNull
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(DrawingNativeLatticeTest, testLatticeDestroyNull, Function | SmallTest | Level3) {
    OH_Drawing_ErrorCode errorCode = OH_Drawing_LatticeDestroy(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS