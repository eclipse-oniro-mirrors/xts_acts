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

#include "include/DrawingNativeMaskFilterTest.h"
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_10 10


namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeMaskFilterTestSetUp()
{
    std::cout << "DrawingNativeMaskFilterTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMaskFilterTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeMaskFilterTestTearDown()
{
    std::cout << "DrawingNativeMaskFilterTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeMaskFilterTest errorCodeReset after each test case." << std::endl;
}

int TestMaskFilterCreateBlurDestroyNormal()
{
    DrawingNativeMaskFilterTestSetUp();
    OH_Drawing_BlurType types[] = {
        NORMAL,
        SOLID,
        OUTER,
        INNER,
    };
    // 1. Enumerate through the blurType values in OH_Drawing_MaskFilterCreateBlur
    for (OH_Drawing_BlurType type : types) {
        OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(type, DRAWING_NUMBER_10, true);
        EXPECT_NE(maskFilter, nullptr);
        OH_Drawing_MaskFilterDestroy(maskFilter);
    }
    // 2. Call OH_Drawing_MaskFilterCreateBlur with a floating-point value for sigma
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, DRAWING_NUMBER_10, true);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 3. Call OH_Drawing_MaskFilterCreateBlur with an integer value for sigma
    maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, DRAWING_NUMBER_10, true);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 4. Call OH_Drawing_MaskFilterCreateBlur with respectCTM set to false
    maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, DRAWING_NUMBER_10, false);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 5. Call OH_Drawing_MaskFilterCreateBlur with respectCTM set to true
    maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, DRAWING_NUMBER_10, true);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 6. Call OH_Drawing_MaskFilterDestroy
    OH_Drawing_MaskFilterDestroy(maskFilter);
    DrawingNativeMaskFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMaskFilterCreateBlurDestroyNULL()
{
    DrawingNativeMaskFilterTestSetUp();
    // 1. Call OH_Drawing_MaskFilterCreateBlur with the second parameter as zero and check the error code using
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, 0, true);
    EXPECT_NE(maskFilter, nullptr);
    // 2. Free memory
    OH_Drawing_MaskFilterDestroy(maskFilter);
    DrawingNativeMaskFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMaskFilterCreateBlurDestroyMultipleCalls()
{
    DrawingNativeMaskFilterTestSetUp();
    // 1. Call OH_Drawing_MaskFilterCreateBlur and OH_Drawing_MaskFilterDestroy 10 times in a loop
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, DRAWING_NUMBER_10, true);
        EXPECT_NE(maskFilter, nullptr);
        OH_Drawing_MaskFilterDestroy(maskFilter);
    }
    // 2. Call OH_Drawing_MaskFilterCreateBlur 10 times consecutively
    OH_Drawing_MaskFilter *maskFilters[DRAWING_NUMBER_10];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        maskFilters[i] = OH_Drawing_MaskFilterCreateBlur(NORMAL, DRAWING_NUMBER_10, true);
        // add assert
        EXPECT_NE(maskFilters[i], nullptr);
    }
    // 3. Call OH_Drawing_MaskFilterDestroy 10 times consecutively
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_MaskFilterDestroy(maskFilters[i]);
    }
    DrawingNativeMaskFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMaskFilterCreateBlurDestroyAbnormal()
{
    DrawingNativeMaskFilterTestSetUp();
    // 1. Call OH_Drawing_MaskFilterCreateBlur with a negative value for sigma and check the error code using
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, -DRAWING_NUMBER_10, true);
    EXPECT_NE(maskFilter, nullptr);
    OH_Drawing_MaskFilterDestroy(maskFilter);
    DrawingNativeMaskFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestMaskFilterCreateBlurDestroyMaximum()
{
    DrawingNativeMaskFilterTestSetUp();
    // 1. Call OH_Drawing_MaskFilterCreateBlur with a maximum value for sigma
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, FLT_MAX, true);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 2. Call OH_Drawing_MaskFilterDestroy to free memory
    OH_Drawing_MaskFilterDestroy(maskFilter);
    DrawingNativeMaskFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS