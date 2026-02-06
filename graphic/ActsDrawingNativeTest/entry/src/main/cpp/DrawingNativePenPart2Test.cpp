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

#include "include/DrawingNativePenTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Common SetUp and TearDown functions implementation
void DrawingNativePenPart2TestSetUp()
{
    std::cout << "DrawingNativePenPart2Test Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePenPart2Test errorCodeReset before each test case." << std::endl;
}

void DrawingNativePenPart2TestTearDown()
{
    std::cout << "DrawingNativePenTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativePenTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testPenGetRedFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06500
 * @tc.desc   test for testPenGetRedFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPenGetRedFloatAbnormal()
{
    DrawingNativePenPart2TestSetUp();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    float r = PEN_F_0_0;
    OH_Drawing_PenSetWidth(pen, TEST_PEN_WIDTH_10_0);
    OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_F_0_4,
        PEN_G_1, PEN_B_0_2, nullptr);
    EXPECT_EQ(OH_Drawing_PenGetRedFloat(nullptr, &r), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_PenGetRedFloat(pen, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_PenGetRedFloat(pen, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(r, PEN_F_0_0);
    OH_Drawing_PenDestroy(pen);
    DrawingNativePenPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
/**
 * @tc.name   testPenGetGreenFloatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06600
 * @tc.desc   test for testPenGetGreenFloatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestPenGetGreenFloatNormal()
{
    DrawingNativePenPart2TestSetUp();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    float g = PEN_F_0_0;
    OH_Drawing_PenSetWidth(pen, TEST_PEN_WIDTH_10_0);
    OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_F_0_4,
        PEN_G_1, PEN_B_0_2, nullptr);
    EXPECT_EQ(OH_Drawing_PenGetGreenFloat(pen, &g), OH_DRAWING_SUCCESS);
    EXPECT_EQ(g, PEN_G_1);
    OH_Drawing_PenDestroy(pen);
    DrawingNativePenPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
/**
 * @tc.name   testPenGetGreenFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06700
 * @tc.desc   test for testPenGetGreenFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPenGetGreenFloatAbnormal()
{
    DrawingNativePenPart2TestSetUp();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    float g = PEN_F_0_0;
    OH_Drawing_PenSetWidth(pen, TEST_PEN_WIDTH_10_0);
    OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_F_0_4,
        PEN_G_1, PEN_B_0_2, nullptr);
    EXPECT_EQ(OH_Drawing_PenGetGreenFloat(nullptr, &g), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_PenGetGreenFloat(pen, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_PenGetGreenFloat(pen, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(g, PEN_F_0_0);
    OH_Drawing_PenDestroy(pen);
    DrawingNativePenPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
/**
 * @tc.name   testPenGetBlueFloatNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06800
 * @tc.desc   test for testPenGetBlueFloatNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestPenGetBlueFloatNormal()
{
    DrawingNativePenPart2TestSetUp();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    float b = PEN_F_0_0;
    OH_Drawing_PenSetWidth(pen, TEST_PEN_WIDTH_10_0);
    OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_F_0_4,
        PEN_G_1, PEN_B_0_2, nullptr);
    EXPECT_EQ(OH_Drawing_PenGetBlueFloat(pen, &b), OH_DRAWING_SUCCESS);
    EXPECT_EQ(b, PEN_B_0_2);
    OH_Drawing_PenDestroy(pen);
    DrawingNativePenPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
/**
 * @tc.name   testPenGetBlueFloatAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_06900
 * @tc.desc   test for testPenGetBlueFloatAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPenGetBlueFloatAbnormal()
{
    DrawingNativePenPart2TestSetUp();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    float b = PEN_F_0_0;
    OH_Drawing_PenSetWidth(pen, TEST_PEN_WIDTH_10_0);
    OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_F_0_4,
        PEN_G_1, PEN_B_0_2, nullptr);
    EXPECT_EQ(OH_Drawing_PenGetBlueFloat(nullptr, &b), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_PenGetBlueFloat(pen, 0), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(OH_Drawing_PenGetBlueFloat(pen, NULL), OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(b, PEN_F_0_0);
    OH_Drawing_PenDestroy(pen);
    DrawingNativePenPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
/**
 * @tc.name   testPenSetColor4fNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07000
 * @tc.desc   test for testPenSetColor4fNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL2
 */
int TestPenSetColorFNormal()
{
    DrawingNativePenPart2TestSetUp();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    float a = PEN_F_0_0;
    float r = PEN_F_0_0;
    float g = PEN_F_0_0;
    float b = PEN_F_0_0;
    OH_Drawing_PenSetWidth(pen, TEST_PEN_WIDTH_10_0);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PenSetColor4f(pen, PEN_F_1_0,
        PEN_F_0_4, PEN_G_1, PEN_B_0_2, nullptr);
    OH_Drawing_PenGetAlphaFloat(pen, &a);
    OH_Drawing_PenGetRedFloat(pen, &r);
    OH_Drawing_PenGetGreenFloat(pen, &g);
    OH_Drawing_PenGetBlueFloat(pen, &b);
    EXPECT_EQ(a, PEN_F_1_0);
    EXPECT_EQ(r, PEN_F_0_4);
    EXPECT_EQ(g, PEN_G_1);
    EXPECT_EQ(b, PEN_B_0_2);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    OH_Drawing_PenDestroy(pen);
    DrawingNativePenPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
/**
 * @tc.name   testPenSetColor4fAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07100
 * @tc.desc   test for testPenSetColor4fAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPenSetColorFAbnormal()
{
    DrawingNativePenPart2TestSetUp();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    float a = 0.0f;
    float r = 0.0f;
    float g = 0.0f;
    float b = 0.0f;
    OH_Drawing_PenSetWidth(pen, TEST_PEN_WIDTH_10_0);
    OH_Drawing_ErrorCode errorCode1 = OH_Drawing_PenSetColor4f(nullptr, PEN_F_1_0,
        PEN_F_0_4, PEN_G_1, PEN_B_0_2, nullptr);
    OH_Drawing_ErrorCode errorCode2 = OH_Drawing_PenSetColor4f(pen, PEN_F_1_2,
        PEN_F_0_4, PEN_G_1, PEN_B_0_2, nullptr);
    OH_Drawing_PenGetAlphaFloat(pen, &a);
    EXPECT_EQ(a, PEN_F_1_0);
    OH_Drawing_ErrorCode errorCode3 = OH_Drawing_PenSetColor4f(pen, PEN_N_1, PEN_F_0_4, PEN_G_1, PEN_B_0_2, nullptr);
    OH_Drawing_PenGetAlphaFloat(pen, &a);
    EXPECT_EQ(a, PEN_F_0_0);
    OH_Drawing_ErrorCode errorCode4 = OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_F_1_2, PEN_G_1, PEN_B_0_2, nullptr);
    OH_Drawing_PenGetRedFloat(pen, &r);
    EXPECT_EQ(r, PEN_F_1_0);
    OH_Drawing_ErrorCode errorCode5 = OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_N_0_4, PEN_G_1, PEN_B_0_2, nullptr);
    OH_Drawing_PenGetRedFloat(pen, &r);
    EXPECT_EQ(r, PEN_F_0_0);
    OH_Drawing_ErrorCode errorCode6 = OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_F_0_4, PEN_F_1_2, PEN_B_0_2,
                                                               nullptr);
    OH_Drawing_PenGetGreenFloat(pen, &g);
    EXPECT_EQ(g, PEN_G_1);
    OH_Drawing_ErrorCode errorCode7 = OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_F_0_4, PEN_N_1, PEN_B_0_2, nullptr);
    OH_Drawing_PenGetGreenFloat(pen, &g);
    EXPECT_EQ(g, PEN_F_0_0);
    OH_Drawing_ErrorCode errorCode8 = OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_F_0_4, PEN_G_1, PEN_F_1_2, nullptr);
    OH_Drawing_PenGetBlueFloat(pen, &b);
    EXPECT_EQ(b, PEN_F_1_0);
    OH_Drawing_ErrorCode errorCode9 = OH_Drawing_PenSetColor4f(pen, PEN_F_1_0, PEN_F_0_4, PEN_G_1, PEN_N_0_2, nullptr);
    OH_Drawing_PenGetBlueFloat(pen, &b);
    EXPECT_EQ(b, PEN_F_0_0);
    EXPECT_EQ(errorCode1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(errorCode2, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode3, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode4, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode5, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode6, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode7, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode8, OH_DRAWING_SUCCESS);
    EXPECT_EQ(errorCode9, OH_DRAWING_SUCCESS);
    OH_Drawing_PenDestroy(pen);
    DrawingNativePenPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPenSetPathEffectNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07200
 * @tc.desc   test for testPenSetPathEffectNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestPenSetPathEffectNormal()
{
    DrawingNativePenPart2TestSetUp();
    // 1. Create a pen object using OH_Drawing_PenCreate
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    // add assert
    EXPECT_NE(pen, nullptr);
    // 2. Create a path effect object using OH_Drawing_PathEffectCreate
    float intervals[] = { TEST_PEN_INTERVAL_1_0, TEST_PEN_INTERVAL_1_0, TEST_PEN_INTERVAL_1_0 };
    OH_Drawing_PathEffect* pathEffect = OH_Drawing_CreateDashPathEffect(intervals, TEST_PEN_INTERVAL_COUNT_3,
                                                                        TEST_PEN_INTERVAL_PHASE_0_0);
    // add assert
    EXPECT_NE(pathEffect, nullptr);
    // 3. Set the path effect for the pen using OH_Drawing_PenSetPathEffect
    OH_Drawing_PenSetPathEffect(pen, pathEffect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. Free the memory
    OH_Drawing_PathEffectDestroy(pathEffect);
    OH_Drawing_PenDestroy(pen);
    DrawingNativePenPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testPenSetPathEffectNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PEN_07300
 * @tc.desc   test for testPenSetPathEffectNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestPenSetPathEffectNull()
{
    DrawingNativePenPart2TestSetUp();
    // 1. Create a pen object using OH_Drawing_PenCreate
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    // add assert
    EXPECT_NE(pen, nullptr);
    // 2. Create a path effect object using OH_Drawing_PathEffectCreate
    float intervals[] = { TEST_PEN_INTERVAL_1_0, TEST_PEN_INTERVAL_1_0, TEST_PEN_INTERVAL_1_0 };
    OH_Drawing_PathEffect* pathEffect = OH_Drawing_CreateDashPathEffect(intervals, TEST_PEN_INTERVAL_COUNT_3,
                                                                        TEST_PEN_INTERVAL_PHASE_0_0);
    // add assert
    EXPECT_NE(pathEffect, nullptr);
    // 3. Set the path effect for the pen with nullptr as the first parameter
    OH_Drawing_PenSetPathEffect(nullptr, pathEffect);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Set the path effect for the pen with nullptr as the second parameter
    OH_Drawing_PenSetPathEffect(pen, nullptr);
    // 5. Free the memory
    OH_Drawing_PathEffectDestroy(pathEffect);
    OH_Drawing_PenDestroy(pen);
    DrawingNativePenPart2TestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS