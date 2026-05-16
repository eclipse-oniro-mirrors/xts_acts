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

#define DRAWING_NUMBER_10 10

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestColorSpaceCreateSrgbNormal()
{
    DrawingNativeColorSpaceTestSetUp();
    OH_Drawing_ColorSpace *colorSpace = OH_Drawing_ColorSpaceCreateSrgb();
    EXPECT_NE(colorSpace, nullptr);
    OH_Drawing_ColorSpaceDestroy(colorSpace);
    DrawingNativeColorSpaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorSpaceDestroyNull()
{
    DrawingNativeColorSpaceTestSetUp();
    OH_Drawing_ColorSpace *colorSpace = nullptr;
    OH_Drawing_ColorSpaceDestroy(nullptr);
    EXPECT_EQ(colorSpace, nullptr);
    DrawingNativeColorSpaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorSpaceCreateSrgbMultipleCalls()
{
    DrawingNativeColorSpaceTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ColorSpace *colorSpace = OH_Drawing_ColorSpaceCreateSrgb();
        EXPECT_NE(colorSpace, nullptr);
        OH_Drawing_ColorSpaceDestroy(colorSpace);
    }
    DrawingNativeColorSpaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorSpaceCreateSrgbLinearNormal()
{
    DrawingNativeColorSpaceTestSetUp();
    OH_Drawing_ColorSpace *colorSpace = OH_Drawing_ColorSpaceCreateSrgbLinear();
    EXPECT_NE(colorSpace, nullptr);
    OH_Drawing_ColorSpaceDestroy(colorSpace);
    DrawingNativeColorSpaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestColorSpaceCreateSrgbLinearMultipleCalls()
{
    DrawingNativeColorSpaceTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ColorSpace *colorSpace = OH_Drawing_ColorSpaceCreateSrgbLinear();
        EXPECT_NE(colorSpace, nullptr);
        OH_Drawing_ColorSpaceDestroy(colorSpace);
    }
    DrawingNativeColorSpaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS