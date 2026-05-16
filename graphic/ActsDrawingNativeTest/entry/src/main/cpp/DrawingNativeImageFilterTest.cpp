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

#include "include/DrawingNativeImageFilterTest.h"
#include <iostream>
#include <random>
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_19937 19937
#define DRAWING_NUMBER_0X7FFFFFFF 0x7FFFFFFF
#define DRAWING_NUMBER_0XFF7F0000 0xFF7F0000
#define DRAWING_NUMBER_0XFFFFFFFF 0xFFFFFFFF

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeImageFilterTestSetUp()
{
    std::cout << "DrawingNativeImageFilterTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeImageFilterTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeImageFilterTestTearDown()
{
    std::cout << "DrawingNativeImageFilterTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeImageFilterTest errorCodeReset after each test case." << std::endl;
}

int TestImageFilterCreateBlurNormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Enumerate OH_Drawing_TileMode values in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_TileMode modes[] = {CLAMP, REPEAT, MIRROR, DECAL};
    for (OH_Drawing_TileMode mode : modes) {
        OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1, mode,
            nullptr);
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
    // 2. Pass decimal values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 3. Pass integer values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    filter = OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 4. Pass NULL for input parameter in OH_Drawing_ImageFilterCreateBlur
    filter = OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 5. Pass non-NULL for input parameter in OH_Drawing_ImageFilterCreateBlur
    filter = OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1, OH_Drawing_TileMode::MIRROR, filter);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 6. Destroy the filter object
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateBlurNULL()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. OH_Drawing_ImageFilterCreateBlur with the first parameter being null
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(0, DRAWING_NUMBER_1, OH_Drawing_TileMode::MIRROR,
        nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. OH_Drawing_ImageFilterCreateBlur with the second parameter being null
    filter = OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, 0, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 3. Destroy the filter object
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateBlurMultipleCalls()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. OH_Drawing_ImageFilterCreateBlur (pass random values for sigmaX and sigmaY, random enum value for
    // OH_Drawing_TileMode), call 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_real_distribution<float> dis(0, DRAWING_NUMBER_10);
        std::uniform_int_distribution<int> enum_dis(0, DRAWING_NUMBER_3);
        OH_Drawing_TileMode tileMode = static_cast<OH_Drawing_TileMode>(enum_dis(gen));
        OH_Drawing_ImageFilter *filter =
            OH_Drawing_ImageFilterCreateBlur(dis(gen), dis(gen), tileMode, nullptr);
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateBlurAbnormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Pass negative values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter *filter =
        OH_Drawing_ImageFilterCreateBlur(-DRAWING_NUMBER_1, -DRAWING_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. Destroy the filter object
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateBlurMaximum()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create a blur image filter with maximum values for sigmaX and sigmaY in OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter *filter =
        OH_Drawing_ImageFilterCreateBlur(FLT_MAX, FLT_MAX, OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. Destroy the filter object
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateFromColorFilterNormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. OH_Drawing_ImageFilterCreateBlur
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 2. OH_Drawing_ColorFilterCreateLinearToSrgbGamma
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    // add assert
    EXPECT_NE(colorFilter, nullptr);
    // 3. OH_Drawing_ImageFilterCreateFromColorFilter with null input parameter
    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
    // add assert
    EXPECT_NE(imageFilter, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 4. OH_Drawing_ImageFilterCreateFromColorFilter with non-null input parameter
    imageFilter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, filter);
    // add assert
    EXPECT_NE(imageFilter, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    // 5. Free memory
    OH_Drawing_ImageFilterDestroy(imageFilter);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateFromColorFilterNULL()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    // 1. OH_Drawing_ImageFilterCreateFromColorFilter with the first parameter being null, check the error code using
    // OH_Drawing_ErrorCodeGet
    OH_Drawing_ImageFilterCreateFromColorFilter(nullptr, filter);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Free memory
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateFromColorFilterMultipleCalls()
{
    DrawingNativeImageFilterTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
        // add assert
        EXPECT_NE(colorFilter, nullptr);
        OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
        EXPECT_NE(filter, nullptr);
        // add assert
        EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
        OH_Drawing_ImageFilterDestroy(filter);
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterDestroyNormal()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1,
        OH_Drawing_TileMode::MIRROR, nullptr);
    // add assert
    EXPECT_NE(filter, nullptr);
    OH_Drawing_ImageFilterDestroy(filter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterDestroyNULL()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_ImageFilter *filter = nullptr;
    OH_Drawing_ImageFilterDestroy(nullptr);
    EXPECT_EQ(filter, nullptr);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterDestroyMultipleCalls()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Call OH_Drawing_ImageFilterCreateFromColorFilter 10 times
    OH_Drawing_ColorFilter *colorFilters[DRAWING_NUMBER_10];
    OH_Drawing_ImageFilter *filters[DRAWING_NUMBER_10];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        colorFilters[i] = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
        // add assert
        EXPECT_NE(colorFilters[i], nullptr);
        filters[i] = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilters[i], nullptr);
        // add assert
        EXPECT_NE(filters[i], nullptr);
    }
    // 2. Call OH_Drawing_ImageFilterDestroy 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ImageFilterDestroy(filters[i]);
        OH_Drawing_ColorFilterDestroy(colorFilters[i]);
    }
    // 3. Call OH_Drawing_ImageFilterCreateBlur and OH_Drawing_ImageFilterDestroy alternately 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ImageFilter *filter = OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1,
            OH_Drawing_TileMode::MIRROR, nullptr);
        // add assert
        EXPECT_NE(filter, nullptr);
        OH_Drawing_ImageFilterDestroy(filter);
    }
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateOffsetNormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ImageFilterCreateBlur.
    OH_Drawing_ImageFilter *imageFilter1 =
        OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    EXPECT_NE(imageFilter1, nullptr);
    // 2. Create an instance object through the interface OH_Drawing_ImageFilterCreateOffset.
    OH_Drawing_ImageFilter *imageFilter2 =
        OH_Drawing_ImageFilterCreateOffset(DRAWING_NUMBER_10, DRAWING_NUMBER_10, imageFilter1);
    EXPECT_NE(imageFilter2, nullptr);
    // 3. Destroy objects.
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateOffsetNULL()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ImageFilterCreateBlur.
    OH_Drawing_ImageFilter *imageFilter1 =
        OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    EXPECT_NE(imageFilter1, nullptr);
    // 2. The first parameter of the interface OH_Drawing_ImageFilterCreateOffset passes to 0.
    OH_Drawing_ImageFilter *imageFilter2 =
        OH_Drawing_ImageFilterCreateOffset(0, DRAWING_NUMBER_10, imageFilter1);
    EXPECT_NE(imageFilter2, nullptr);
    // 3. The second parameter of the interface OH_Drawing_ImageFilterCreateOffset passes to 0.
    OH_Drawing_ImageFilter *imageFilter3 =
        OH_Drawing_ImageFilterCreateOffset(DRAWING_NUMBER_10, 0, imageFilter1);
    EXPECT_NE(imageFilter3, nullptr);
    // 4. The third parameter of the interface OH_Drawing_ImageFilterCreateOffset passes to nullptr.
    OH_Drawing_ImageFilter *imageFilter4 =
        OH_Drawing_ImageFilterCreateOffset(DRAWING_NUMBER_10, DRAWING_NUMBER_10, nullptr);
    EXPECT_NE(imageFilter4, nullptr);
    // 5. Destroy objects.
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    OH_Drawing_ImageFilterDestroy(imageFilter3);
    OH_Drawing_ImageFilterDestroy(imageFilter4);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateOffsetAbnormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ImageFilterCreateBlur.
    OH_Drawing_ImageFilter *imageFilter1 =
        OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    EXPECT_NE(imageFilter1, nullptr);
    // 2. The first parameter of the interface OH_Drawing_ImageFilterCreateOffset passes to maximum value.
    OH_Drawing_ImageFilter *imageFilter2 =
        OH_Drawing_ImageFilterCreateOffset(DRAWING_NUMBER_0X7FFFFFFF, DRAWING_NUMBER_10, imageFilter1);
    EXPECT_NE(imageFilter2, nullptr);
    // 3. The second parameter of the interface OH_Drawing_ImageFilterCreateOffset passes to maximum value.
    OH_Drawing_ImageFilter *imageFilter3 =
        OH_Drawing_ImageFilterCreateOffset(DRAWING_NUMBER_10, DRAWING_NUMBER_0X7FFFFFFF, imageFilter1);
    EXPECT_NE(imageFilter3, nullptr);
    OH_Drawing_ImageFilter *imageFilter4 =
        OH_Drawing_ImageFilterCreateOffset(DRAWING_NUMBER_0XFF7F0000, DRAWING_NUMBER_10, imageFilter1);
    EXPECT_NE(imageFilter4, nullptr);
    OH_Drawing_ImageFilter *imageFilter5 =
        OH_Drawing_ImageFilterCreateOffset(DRAWING_NUMBER_10, DRAWING_NUMBER_0XFF7F0000, imageFilter1);
    EXPECT_NE(imageFilter5, nullptr);
    // 4. Destroy objects.
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    OH_Drawing_ImageFilterDestroy(imageFilter3);
    OH_Drawing_ImageFilterDestroy(imageFilter4);
    OH_Drawing_ImageFilterDestroy(imageFilter5);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateOffsetMultipleCalls()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ImageFilterCreateBlur.
    OH_Drawing_ImageFilter *imageFilter1 =
        OH_Drawing_ImageFilterCreateBlur(DRAWING_NUMBER_1, DRAWING_NUMBER_1, OH_Drawing_TileMode::MIRROR, nullptr);
    EXPECT_NE(imageFilter1, nullptr);
    // 2. OH_Drawing_ImageFilterCreateOffset is called multiple times.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ImageFilter *imageFilter2 =
        OH_Drawing_ImageFilterCreateOffset(DRAWING_NUMBER_0XFFFFFFFF, DRAWING_NUMBER_10, imageFilter1);
        EXPECT_NE(imageFilter2, nullptr);
        OH_Drawing_ImageFilterDestroy(imageFilter2);
    }
    // 3. Destroy objects.
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateFromShderEffectNormal()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ShaderEffectCreateColorShder.
    OH_Drawing_ShaderEffect *shaderEffect = OH_Drawing_ShaderEffectCreateColorShader(0xFF00FF00);
    EXPECT_NE(shaderEffect, nullptr);
    // 2. Create an instance object through the interface OH_Drawing_ImageFilterCreateFromShaderEffect.
    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateFromShaderEffect(shaderEffect);
    EXPECT_NE(imageFilter, nullptr);
    // 3. Destroy objects.
    OH_Drawing_ShaderEffectDestroy(shaderEffect);
    OH_Drawing_ImageFilterDestroy(imageFilter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateFromShderEffectNULL()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ImageFilterCreateFromShaderEffect.
    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateFromShaderEffect(nullptr);
    EXPECT_EQ(imageFilter, nullptr);
    // 2. Destroy objects.
    OH_Drawing_ImageFilterDestroy(imageFilter);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateFromShderEffectMultipleCalls()
{
    DrawingNativeImageFilterTestSetUp();
    // 1. Create an instance object through the interface OH_Drawing_ShaderEffectCreateColorShder.
    OH_Drawing_ShaderEffect *shaderEffect = OH_Drawing_ShaderEffectCreateColorShader(0xFF00FF00);
    EXPECT_NE(shaderEffect, nullptr);
    // 2. Create an instance object through the interface OH_Drawing_ImageFilterCreateFromShaderEffect.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateFromShaderEffect(shaderEffect);
        EXPECT_NE(imageFilter, nullptr);
        OH_Drawing_ImageFilterDestroy(imageFilter);
    }
    // 3. Destroy objects.
    OH_Drawing_ShaderEffectDestroy(shaderEffect);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateBlurWithCropNormal()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_Rect *cropRect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_ImageFilter *imageFilter1 =
        OH_Drawing_ImageFilterCreateBlurWithCrop(DRAWING_NUMBER_10, DRAWING_NUMBER_10, OH_Drawing_TileMode::CLAMP,
            nullptr, nullptr);
    // 1. The interface of OH_Drawing_ImageFilterCreateBlurWithCrop is called normally.
    OH_Drawing_ImageFilter *imageFilter2 =
        OH_Drawing_ImageFilterCreateBlurWithCrop(DRAWING_NUMBER_10, DRAWING_NUMBER_10, OH_Drawing_TileMode::CLAMP,
            imageFilter1, cropRect);
    EXPECT_NE(imageFilter2, nullptr);
    // 2. Destroy objects.
    OH_Drawing_RectDestroy(cropRect);
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateBlurWithCropNull()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_Rect *cropRect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_ImageFilter *imageFilter1 =
        OH_Drawing_ImageFilterCreateBlurWithCrop(DRAWING_NUMBER_10, DRAWING_NUMBER_10, OH_Drawing_TileMode::CLAMP,
            nullptr, nullptr);
    // 1. The first parameter of the verification interface is passed null.
    OH_Drawing_ImageFilter *imageFilter2 =
        OH_Drawing_ImageFilterCreateBlurWithCrop(0, DRAWING_NUMBER_10, OH_Drawing_TileMode::CLAMP, imageFilter1,
            cropRect);
    EXPECT_NE(imageFilter2, nullptr);
    // 2. The second parameter of the verification interface is passed null.
    imageFilter2 = OH_Drawing_ImageFilterCreateBlurWithCrop(DRAWING_NUMBER_10, 0, OH_Drawing_TileMode::CLAMP,
        imageFilter1, cropRect);
    EXPECT_NE(imageFilter2, nullptr);
    // 3. The forth parameter of the verification interface is passed null.
    imageFilter2 = OH_Drawing_ImageFilterCreateBlurWithCrop(DRAWING_NUMBER_10, DRAWING_NUMBER_10,
        OH_Drawing_TileMode::CLAMP, nullptr, cropRect);
    EXPECT_NE(imageFilter2, nullptr);
    // 4. The fifth parameter of the verification interface is passed null.
    imageFilter2 = OH_Drawing_ImageFilterCreateBlurWithCrop(DRAWING_NUMBER_10, DRAWING_NUMBER_10,
        OH_Drawing_TileMode::CLAMP, imageFilter1, nullptr);
    EXPECT_NE(imageFilter2, nullptr);
    // 5. Destroy objects.
    OH_Drawing_RectDestroy(cropRect);
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageFilterCreateBlurWithCropMultiCalls()
{
    DrawingNativeImageFilterTestSetUp();
    OH_Drawing_Rect *cropRect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_200, DRAWING_NUMBER_200);
    OH_Drawing_ImageFilter *imageFilter1 =
        OH_Drawing_ImageFilterCreateBlurWithCrop(DRAWING_NUMBER_10, DRAWING_NUMBER_10, OH_Drawing_TileMode::CLAMP,
            nullptr, nullptr);
    OH_Drawing_ImageFilter *imageFilter2 = nullptr;
    // 1. The interface of OH_Drawing_ImageFilterCreateBlurWithCrop is called 10 times.
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        imageFilter2 = OH_Drawing_ImageFilterCreateBlurWithCrop(
            DRAWING_NUMBER_10, DRAWING_NUMBER_10, OH_Drawing_TileMode::CLAMP, imageFilter1, cropRect);
        EXPECT_NE(imageFilter2, nullptr);
    }
    // 2. Destroy objects.
    OH_Drawing_RectDestroy(cropRect);
    OH_Drawing_ImageFilterDestroy(imageFilter1);
    OH_Drawing_ImageFilterDestroy(imageFilter2);
    DrawingNativeImageFilterTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS