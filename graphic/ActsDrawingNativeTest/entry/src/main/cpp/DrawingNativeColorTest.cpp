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

#include <random>

#include "include/DrawingNativeColorTest.h"
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_255 255
#define DRAWING_NUMBER_256 256
#define DRAWING_NUMBER_0XFF 0xFF
#define DRAWING_NUMBER_19937 19937

namespace OHOS {
namespace Rosen {
namespace Drawing {

constexpr int LOOP_COUNT = DRAWING_NUMBER_10;
constexpr int COLOR_COMPONENT_MAX = DRAWING_NUMBER_256;

// Common SetUp and TearDown functions implementation
void DrawingNativeColorTestSetUp()
{
    std::cout << "DrawingNativeColorTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeColorTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeColorTestTearDown()
{
    std::cout << "DrawingNativeColorTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeColorTest errorCodeReset after each test case." << std::endl;
}

int TestColorSetArgbNormal()
{
    DrawingNativeColorTestSetUp();
    // 1
    uint32_t color = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_255, DRAWING_NUMBER_255, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255);
    // add assert
    EXPECT_NE(color, 0);
    // 2
    uint32_t color2 = OH_Drawing_ColorSetArgb(0, 0, 0, 0);
    // add assert
    EXPECT_EQ(color2, 0);
    // 3 Compilation error, unable to test

    DrawingNativeColorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorSetArgbNULL()
{
    DrawingNativeColorTestSetUp();
    // 1、Passing empty for the first argument of OH_Drawing_ColorSetArgb

    uint32_t color1 = OH_Drawing_ColorSetArgb(0, DRAWING_NUMBER_255, DRAWING_NUMBER_255,
        DRAWING_NUMBER_255);
    // add assert
    EXPECT_NE(color1, 0);
    // 2、Passing empty for the second argument of OH_Drawing_ColorSetArgb
    uint32_t color2 = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, 0, DRAWING_NUMBER_0XFF,
        DRAWING_NUMBER_0XFF);
    // add assert
    EXPECT_NE(color2, 0);
    // 3、Passing empty for the third argument of OH_Drawing_ColorSetArgb
    uint32_t color3 = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, DRAWING_NUMBER_0XFF, 0,
        DRAWING_NUMBER_0XFF);
    // add assert
    EXPECT_NE(color3, 0);
    // 4、Passing empty for the fourth argument of OH_Drawing_ColorSetArgb
    uint32_t color4 = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, DRAWING_NUMBER_0XFF,
        DRAWING_NUMBER_0XFF, 0);
    // add assert
    EXPECT_NE(color4, 0);

    DrawingNativeColorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorSetArgbMultipleCalls()
{
    DrawingNativeColorTestSetUp();
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_256);
    // 1. Call OH_Drawing_ColorSetArgb with random numbers between 0 and 255, 10 times
    for (int i = 0; i < 10; i++) {
        uint32_t color = OH_Drawing_ColorSetArgb(dis(gen), dis(gen), dis(gen), dis(gen));
        EXPECT_NE(color, 0);
    }
    DrawingNativeColorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorSetArgbAbnormal()
{
    DrawingNativeColorTestSetUp();
    // 1. The first argument of OH_Drawing_ColorSetArgb is a negative number
    uint32_t color1 = OH_Drawing_ColorSetArgb(-1.0f, DRAWING_NUMBER_0XFF, DRAWING_NUMBER_0XFF,
        DRAWING_NUMBER_0XFF);
    // add assert
    EXPECT_NE(color1, 0);
    // 2. The second argument of OH_Drawing_ColorSetArgb is a negative number
    uint32_t color2 = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, -1.0f, DRAWING_NUMBER_0XFF,
        DRAWING_NUMBER_0XFF);
    // add assert
    EXPECT_NE(color2, 0);
    // 3. The third argument of OH_Drawing_ColorSetArgb is a negative number
    uint32_t color3 = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, DRAWING_NUMBER_0XFF, -1.0f,
        DRAWING_NUMBER_0XFF);
    // add assert
    EXPECT_NE(color3, 0);
    // 4. The fourth argument of OH_Drawing_ColorSetArgb is a negative number
    uint32_t color4 = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, DRAWING_NUMBER_0XFF,
        DRAWING_NUMBER_0XFF, -1.0f);
    // add assert
    EXPECT_NE(color4, 0);

    DrawingNativeColorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorSetArgbMaximum()
{
    DrawingNativeColorTestSetUp();
    // 1
    uint32_t color1 = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF + DRAWING_NUMBER_1, 0, 0,
        DRAWING_NUMBER_0XFF);
    // add assert
    EXPECT_NE(color1, 0);
    // 2
    uint32_t color2 = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, DRAWING_NUMBER_0XFF +
        DRAWING_NUMBER_1, 0, DRAWING_NUMBER_0XFF);
    // add assert
    EXPECT_NE(color2, 0);
    // 3
    uint32_t color3 = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, 0, DRAWING_NUMBER_0XFF +
        DRAWING_NUMBER_1, DRAWING_NUMBER_0XFF);
    // add assert
    EXPECT_NE(color3, 0);
    // 4
    uint32_t color4 = OH_Drawing_ColorSetArgb(DRAWING_NUMBER_0XFF, 0, 0, DRAWING_NUMBER_0XFF +
        DRAWING_NUMBER_1);
    // add assert
    EXPECT_NE(color4, 0);

    DrawingNativeColorTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
