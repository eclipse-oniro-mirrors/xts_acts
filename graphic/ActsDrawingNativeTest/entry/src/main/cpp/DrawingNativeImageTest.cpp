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

#include "include/DrawingNativeImageTest.h"
#include <cstdlib>
#include <ctime>
#include <random>
#include "include/OhosCommonTest.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_400 400
#define DRAWING_NUMBER_565 565
#define DRAWING_NUMBER_2160 2160
#define DRAWING_NUMBER_4096 4096
#define DRAWING_NUMBER_4444 4444
#define DRAWING_NUMBER_8888 8888

namespace OHOS {
namespace Rosen {
namespace Drawing {

void DrawingNativeImageTestSetUp()
{
    std::cout << "DrawingNativeImageTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeImageTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeImageTestTearDown()
{
    std::cout << "DrawingNativeImageTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeImageTest errorCodeReset after each test case." << std::endl;
}

int TestImageCreateDestroyNormal()
{
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 2. OH_Drawing_ImageDestroy
    OH_Drawing_ImageDestroy(image);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageCreateDestroyNULL()
{
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageDestroy with a NULL parameter
    OH_Drawing_Image *image = nullptr;
    OH_Drawing_ImageDestroy(nullptr);
    EXPECT_EQ(image, nullptr);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageCreateDestroyMultipleCalls()
{
    DrawingNativeImageTestSetUp();
    // 1. Call OH_Drawing_ImageCreate and OH_Drawing_ImageDestroy 10 times
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_ImageDestroy(image);
    }
    // 2. Call OH_Drawing_ImageCreate 10 times continuously
    OH_Drawing_Image *images[DRAWING_NUMBER_10];
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        images[i] = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(images[i], nullptr);
    }
    // 3. Call OH_Drawing_ImageDestroy 10 times continuously
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ImageDestroy(images[i]);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageBuildFromBitmapNormal()
{
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = DRAWING_NUMBER_200;
    uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    // 3. OH_Drawing_ImageBuildFromBitmap successfully constructs the image content
    bool ret = OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_NE(bitmap, nullptr);
    EXPECT_EQ(ret, true);
    // 4. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageBuildFromBitmapNULL()
{
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 3. OH_Drawing_ImageBuildFromBitmap with a null parameter, check the error code with OH_Drawing_ErrorCodeGet
    bool ret = OH_Drawing_ImageBuildFromBitmap(nullptr, bitmap);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    OH_Drawing_ErrorCodeReset();
    // 4. OH_Drawing_ImageBuildFromBitmap with a null parameter, check the error code with OH_Drawing_ErrorCodeGet
    ret = OH_Drawing_ImageBuildFromBitmap(image, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    EXPECT_EQ(ret, false);
    // 5. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageBuildFromBitmapMultipleCalls()
{
    DrawingNativeImageTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        uint32_t height = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        bool ret = OH_Drawing_ImageBuildFromBitmap(image, bitmap);
        EXPECT_EQ(ret, true);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageBuildFromBitmapMultipleCallsBoundary()
{
    DrawingNativeImageTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_4096;
        uint32_t height = DRAWING_NUMBER_2160;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_ImageBuildFromBitmap(image, bitmap);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageGetWidthHeightNormal()
{
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = DRAWING_NUMBER_200;
    constexpr uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    // 2. OH_Drawing_ImageGetWidth
    int32_t width2 = OH_Drawing_ImageGetWidth(image);
    EXPECT_EQ(width2, DRAWING_NUMBER_200);
    // 3. OH_Drawing_ImageGetHeight
    int32_t height2 = OH_Drawing_ImageGetHeight(image);
    EXPECT_EQ(height2, DRAWING_NUMBER_200);
    // 4. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageGetWidthHeightNULL()
{
    DrawingNativeImageTestSetUp();
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = DRAWING_NUMBER_200;
    uint32_t height = DRAWING_NUMBER_200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    // 1. OH_Drawing_ImageGetWidth with a null parameter, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_ImageGetWidth(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    // 2. OH_Drawing_ImageGetHeight with a null parameter, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_ImageGetHeight(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageGetWidthHeightMultipleCalls()
{
    DrawingNativeImageTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        uint32_t height = DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_ImageBuildFromBitmap(image, bitmap);
        int32_t width2 = OH_Drawing_ImageGetWidth(image);
        EXPECT_EQ(width2, DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10);
        int32_t height2 = OH_Drawing_ImageGetHeight(image);
        EXPECT_EQ(height2, DRAWING_NUMBER_200 + i * DRAWING_NUMBER_10);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageGetWidthHeightMultipleCallsBoundary()
{
    DrawingNativeImageTestSetUp();
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image *image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
        uint32_t width = DRAWING_NUMBER_4096;
        uint32_t height = DRAWING_NUMBER_2160;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        EXPECT_NE(bitmap, nullptr);
        OH_Drawing_ImageBuildFromBitmap(image, bitmap);
        EXPECT_NE(image, nullptr);
        int32_t width2 = OH_Drawing_ImageGetWidth(image);
        EXPECT_EQ(width2, DRAWING_NUMBER_4096);
        int32_t height2 = OH_Drawing_ImageGetHeight(image);
        EXPECT_EQ(height2, DRAWING_NUMBER_2160);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageGetImageInfoNormal()
{
    DrawingNativeImageTestSetUp();
    OH_Drawing_ColorFormat cfs[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat afs[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    for (OH_Drawing_ColorFormat cf : cfs) {
        for (OH_Drawing_AlphaFormat af : afs) {
            OH_Drawing_ErrorCodeReset();
            OH_Drawing_Image *image = OH_Drawing_ImageCreate();
            // add assert
            EXPECT_NE(image, nullptr);
            OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
            // add assert
            EXPECT_NE(bitmap, nullptr);
            OH_Drawing_BitmapFormat cFormat{cf, af};
            uint32_t width = DRAWING_NUMBER_400;
            uint32_t height = DRAWING_NUMBER_400;
            OH_Drawing_Image_Info imageInfo;
            OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
            OH_Drawing_ImageGetImageInfo(image, &imageInfo);
            // add assert
            EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
            OH_Drawing_ImageDestroy(image);
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageGetImageInfoNULL()
{
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_Image_Info
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = DRAWING_NUMBER_400;
    uint32_t height = DRAWING_NUMBER_400;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    // 3. OH_Drawing_ImageGetImageInfo with a null parameter, check the error code with OH_Drawing_ErrorCodeGet
    OH_Drawing_ImageGetImageInfo(nullptr, &imageInfo);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 4. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageGetImageInfoMultipleCalls()
{
    DrawingNativeImageTestSetUp();
    OH_Drawing_ColorFormat cf[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat af[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_Image* image = OH_Drawing_ImageCreate();
        // add assert
        EXPECT_NE(image, nullptr);
        OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
        // add assert
        EXPECT_NE(bitmap, nullptr);
        time_t now = time(nullptr);
        if (now != static_cast<time_t>(-1)) {
            srand(static_cast<unsigned int>(now));
        } else {
            // 兜底处理，避免未初始化随机种子
            srand(1U);
        }
        OH_Drawing_BitmapFormat cFormat{ cf[std::random_device{}() % DRAWING_NUMBER_5 + DRAWING_NUMBER_1],
                                         af[std::random_device{}() % DRAWING_NUMBER_3 + DRAWING_NUMBER_1] };
        uint32_t width = std::random_device{}() % DRAWING_NUMBER_100 + DRAWING_NUMBER_1;
        uint32_t height = std::random_device{}() % DRAWING_NUMBER_100 + DRAWING_NUMBER_1;
        OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
        OH_Drawing_Image_Info imageInfo;
        OH_Drawing_ImageGetImageInfo(image, &imageInfo);
        OH_Drawing_ImageDestroy(image);
        OH_Drawing_BitmapDestroy(bitmap);
    }
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageGetImageInfoAbnormal()
{
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_ImageGetImageInfo creates OH_Drawing_Image_Info with width=-400 and height=-400
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = -DRAWING_NUMBER_400;
    uint32_t height = -DRAWING_NUMBER_400;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    // 3. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageGetImageInfoMaximum()
{
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_ImageGetImageInfo creates OH_Drawing_Image_Info with width=maximum value and height=maximum value
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = UINT32_MAX;
    uint32_t height = UINT32_MAX;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    // 3. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestImageGetImageInfoBoundary()
{
    DrawingNativeImageTestSetUp();
    // 1. OH_Drawing_ImageCreate
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    // add assert
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    // 2. OH_Drawing_ImageGetImageInfo creates OH_Drawing_Image_Info with width=maximum value and height=maximum value
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = DRAWING_NUMBER_4096;
    uint32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_ImageGetImageInfo(image, &imageInfo);
    EXPECT_NE(image, nullptr);
    // 3. Free memory
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeImageTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS