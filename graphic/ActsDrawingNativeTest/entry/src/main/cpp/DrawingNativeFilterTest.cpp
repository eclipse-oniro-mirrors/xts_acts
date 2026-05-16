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

#include "include/DrawingNativeFilterTest.h"
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_10 10

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeFilterTestSetUp()
{
    std::cout << "DrawingNativeFilterTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeFilterTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeFilterTestTearDown()
{
    std::cout << "DrawingNativeFilterTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeFilterTest errorCodeReset after each test case." << std::endl;
}

int TestFilterCreateDestroyNormal()
{
    DrawingNativeFilterTestSetUp();
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    EXPECT_NE(filter, nullptr);

    OH_Drawing_FilterDestroy(filter);
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterCreateDestroyNULL()
{
    DrawingNativeFilterTestSetUp();
    OH_Drawing_Filter *filter = nullptr;
    OH_Drawing_FilterDestroy(nullptr);
    EXPECT_EQ(filter, nullptr);
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterCreateDestroyMultipleCalls()
{
    DrawingNativeFilterTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
        EXPECT_NE(filter, nullptr);
        OH_Drawing_FilterDestroy(filter);
    }
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterSetImageFilterNormal()
{
    DrawingNativeFilterTestSetUp();
    OH_Drawing_Filter *cFilter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(cFilter, nullptr);
    OH_Drawing_ImageFilter *cImageFilter =
        OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_10, DRAWING_NUMBER_10, OH_Drawing_TileMode::CLAMP, nullptr);
    // add assert
    EXPECT_NE(cImageFilter, nullptr);

    OH_Drawing_FilterSetImageFilter(cFilter, cImageFilter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    OH_Drawing_FilterDestroy(cFilter);
    OH_Drawing_ImageFilterDestroy(cImageFilter);
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterSetImageFilterNULL()
{
    DrawingNativeFilterTestSetUp();
    OH_Drawing_Filter *cFilter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(cFilter, nullptr);
    OH_Drawing_ImageFilter *cImageFilter =
        OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_10, DRAWING_NUMBER_10, OH_Drawing_TileMode::CLAMP, nullptr);
    // add assert
    EXPECT_NE(cImageFilter, nullptr);
    OH_Drawing_FilterSetImageFilter(nullptr, cImageFilter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_FilterSetImageFilter(cFilter, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    OH_Drawing_FilterDestroy(cFilter);
    OH_Drawing_ImageFilterDestroy(cImageFilter);
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterSetImageFilterMultipleCalls()
{
    DrawingNativeFilterTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Filter *cFilter = OH_Drawing_FilterCreate();
        // add assert
        EXPECT_NE(cFilter, nullptr);
        OH_Drawing_ImageFilter *cImageFilter =
            OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_10 + i, DRAWING_NUMBER_10 + i, OH_Drawing_TileMode::CLAMP,
                nullptr);
        // add assert
        EXPECT_NE(cImageFilter, nullptr);
        OH_Drawing_FilterSetImageFilter(cFilter, cImageFilter);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_FilterDestroy(cFilter);
        OH_Drawing_ImageFilterDestroy(cImageFilter);
    }
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterSetMaskFilterNormal()
{
    DrawingNativeFilterTestSetUp();
    // 1. Create OH_Drawing_Filter using OH_Drawing_FilterCreate and OH_Drawing_MaskFilter using
    // OH_Drawing_MaskFilterCreateBlur
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(OH_Drawing_BlurType::NORMAL, DRAWING_NUMBER_10,
        true);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 2. Set mask filter using OH_Drawing_FilterSetMaskFilter, should return OH_DRAWING_SUCCESS
    OH_Drawing_FilterSetMaskFilter(filter, maskFilter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Destroy objects, should be successful
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_MaskFilterDestroy(maskFilter);
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterSetMaskFilterNULL()
{
    DrawingNativeFilterTestSetUp();
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(OH_Drawing_BlurType::NORMAL, DRAWING_NUMBER_10,
        true);
    // add assert
    EXPECT_NE(maskFilter, nullptr);
    // 1. Pass nullptr as the first parameter to OH_Drawing_FilterSetMaskFilter and check the error code using
    // OH_Drawing_ErrorCodeGet,
    // 1. No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterSetMaskFilter(nullptr, maskFilter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();

    // 2. Pass nullptr as the second parameter to OH_Drawing_FilterSetMaskFilter and check the error code using
    // OH_Drawing_ErrorCodeGet,
    // 2. No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterSetMaskFilter(filter, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);

    // 3. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_MaskFilterDestroy(maskFilter);
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterSetMaskFilterMultipleCalls()
{
    DrawingNativeFilterTestSetUp();
    // 1. Call OH_Drawing_FilterSetMaskFilter 10 times with different OH_Drawing_Filter and OH_Drawing_MaskFilter
    // objects.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
        // add assert
        EXPECT_NE(filter, nullptr);
        OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(OH_Drawing_BlurType::NORMAL,
            DRAWING_NUMBER_10 + i, true);
        // add assert
        EXPECT_NE(maskFilter, nullptr);
        OH_Drawing_FilterSetMaskFilter(filter, maskFilter);
        OH_Drawing_FilterDestroy(filter);
        OH_Drawing_MaskFilterDestroy(maskFilter);
    }
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterSetColorFilterNormal()
{
    DrawingNativeFilterTestSetUp();
    // 1. Create OH_Drawing_Filter using OH_Drawing_FilterCreate
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    OH_Drawing_ColorFilter *outerFilter = OH_Drawing_ColorFilterCreateLuma();
    // add assert
    EXPECT_NE(outerFilter, nullptr);
    OH_Drawing_ColorFilter *innerFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
    // add assert
    EXPECT_NE(innerFilter, nullptr);
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateCompose(outerFilter, innerFilter);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 2. Set color filter using OH_Drawing_FilterSetColorFilter
    OH_Drawing_FilterSetColorFilter(filter, colorFilter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_FilterGetColorFilter(filter, colorFilter);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 3. Destroy objects, should be successful
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_ColorFilterDestroy(outerFilter);
    OH_Drawing_ColorFilterDestroy(innerFilter);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterSetColorFilterNULL()
{
    DrawingNativeFilterTestSetUp();
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    // add assert
    EXPECT_NE(filter, nullptr);
    OH_Drawing_ColorFilter *outerFilter = OH_Drawing_ColorFilterCreateLuma();
    // add assert
    EXPECT_NE(outerFilter, nullptr);
    OH_Drawing_ColorFilter *innerFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
    // add assert
    EXPECT_NE(innerFilter, nullptr);
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateCompose(outerFilter, innerFilter);
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 1. Pass nullptr as the first parameter to OH_Drawing_FilterSetColorFilter and check the error code using
    // OH_Drawing_ErrorCodeGet, No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterSetColorFilter(nullptr, colorFilter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();

    // 2. Pass nullptr as the second parameter to OH_Drawing_FilterSetColorFilter and check the error code using
    // OH_Drawing_ErrorCodeGet, No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterSetColorFilter(filter, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_ErrorCodeReset();

    // 3. Pass nullptr as the first parameter to OH_Drawing_FilterGetColorFilter and check the error code using
    // OH_Drawing_ErrorCodeGet, No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterGetColorFilter(nullptr, colorFilter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();

    // 4. Pass nullptr as the second parameter to OH_Drawing_FilterGetColorFilter and check the error code using
    // OH_Drawing_ErrorCodeGet, No crash, error code returns OH_DRAWING_ERROR_INVALID_PARAMETER
    OH_Drawing_FilterGetColorFilter(filter, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    // 5. Free memory
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_ColorFilterDestroy(outerFilter);
    OH_Drawing_ColorFilterDestroy(innerFilter);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestFilterSetColorFilterMultipleCalls()
{
    DrawingNativeFilterTestSetUp();
    // 1. Call OH_Drawing_FilterSetColorFilter 10 times with different OH_Drawing_Filter and OH_Drawing_ColorFilter
    // objects. Call successful, errorcode returns OH_DRAWING_SUCCESS
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
        // add assert
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ColorFilter *outerFilter = OH_Drawing_ColorFilterCreateLuma();
        // add assert
        EXPECT_NE(outerFilter, nullptr);
        OH_Drawing_ColorFilter *innerFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
        // add assert
        EXPECT_NE(innerFilter, nullptr);
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateCompose(outerFilter, innerFilter);
        // add assert
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_FilterSetColorFilter(filter, colorFilter);
        OH_Drawing_FilterDestroy(filter);
        OH_Drawing_ColorFilterDestroy(outerFilter);
        OH_Drawing_ColorFilterDestroy(innerFilter);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
    DrawingNativeFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS