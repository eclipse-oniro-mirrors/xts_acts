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

#include "include/DrawingNativeColorSpaceTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

constexpr int LOOP_COUNT = 10;

// Common SetUp and TearDown functions implementation
void DrawingNativeColorSpaceTestSetUp()
{
    std::cout << "DrawingNativeColorSpaceTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeColorSpaceTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeColorSpaceTestTearDown()
{
    std::cout << "DrawingNativeColorSpaceTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeColorSpaceTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testColorSpaceCreateSrgbNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0100
 * @tc.desc   Test for creating an sRGB color space with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestColorSpaceCreateSrgbNormal()
{
    DrawingNativeColorSpaceTestSetUp();
    OH_Drawing_ColorSpace* colorSpace = OH_Drawing_ColorSpaceCreateSrgb();
    EXPECT_NE(colorSpace, nullptr);
    OH_Drawing_ColorSpaceDestroy(colorSpace);

    DrawingNativeColorSpaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testColorSpaceDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0101
 * @tc.desc   Test for destroying a color space with a NULL parameter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestColorSpaceDestroyNull()
{
    DrawingNativeColorSpaceTestSetUp();
    OH_Drawing_ColorSpaceDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeColorSpaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testColorSpaceCreateSrgbMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0100
 * @tc.desc   Test for creating an sRGB color space with multiple calls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestColorSpaceCreateSrgbMultipleCalls()
{
    DrawingNativeColorSpaceTestSetUp();
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ColorSpace* colorSpace = OH_Drawing_ColorSpaceCreateSrgb();
        EXPECT_NE(colorSpace, nullptr);
        OH_Drawing_ColorSpaceDestroy(colorSpace);
    }

    DrawingNativeColorSpaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testColorSpaceCreateSrgbLinearNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0200
 * @tc.desc   Test for creating an sRGB linear color space with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestColorSpaceCreateSrgbLinearNormal()
{
    DrawingNativeColorSpaceTestSetUp();
    OH_Drawing_ColorSpace* colorSpace = OH_Drawing_ColorSpaceCreateSrgbLinear();
    EXPECT_NE(colorSpace, nullptr);
    OH_Drawing_ColorSpaceDestroy(colorSpace);

    DrawingNativeColorSpaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testColorSpaceCreateSrgbLinearMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0300
 * @tc.desc   Test for creating an sRGB linear color space with multiple calls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestColorSpaceCreateSrgbLinearMultipleCalls()
{
    DrawingNativeColorSpaceTestSetUp();
    for (int i = 0; i < LOOP_COUNT; i++) {
        OH_Drawing_ColorSpace* colorSpace = OH_Drawing_ColorSpaceCreateSrgbLinear();
        EXPECT_NE(colorSpace, nullptr);
        OH_Drawing_ColorSpaceDestroy(colorSpace);
    }

    DrawingNativeColorSpaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS