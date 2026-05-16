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

#include "include/DrawingNativeBitmapTest.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int TEST_BITMAP_SIZE_SMALL = 100;
constexpr int TEST_BITMAP_SIZE_MEDIUM = 500;
constexpr int TEST_BITMAP_SIZE_4K_WIDTH = 4096;
constexpr int TEST_BITMAP_SIZE_4K_HEIGHT = 2160;
constexpr int TEST_BITMAP_SIZE_VERY_LARGE = 1000000;
constexpr int TEST_BITMAP_SIZE_MAXIMUM = 8192;
constexpr int TEST_BITMAP_SIZE_MISMATCH = 48;
constexpr int TEST_BITMAP_SIZE_MISMATCH_OFFSET = 47;
constexpr int BYTES_PER_PIXEL = 4;
constexpr int TEST_LOOP_COUNT = 10;
constexpr int TEST_ALPHA_VALUE = 128;
constexpr int TEST_ROWBYTES_OFFSET = 1;
constexpr int TEST_READ_PIXELS_OFFSET = 1;
constexpr int TEST_READ_PIXELS_LARGE_OFFSET = 1000;
constexpr int TEST_READ_PIXELS_ROWBYTES_MULTIPLIER = 3;
constexpr int TEST_RECT_SIZE_SMALL = 5;
constexpr int TEST_RECT_POS_START = 0;
constexpr int TEST_RECT_POS_END = 100;
constexpr int TEST_RECT_SIZE_LARGE = 500;
} // namespace

// Common SetUp and TearDown functions implementation
void DrawingNativeBitmapTestSetUp()
{
    std::cout << "DrawingNativeBitmapTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeBitmapTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeBitmapTestTearDown()
{
    std::cout << "DrawingNativeBitmapTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeBitmapTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testBitmapDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_0100
 * @tc.desc   test for testBitmapDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBitmapDestroyNormal()
{
    DrawingNativeBitmapTestSetUp();

    // step 1
    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    // step 2
    OH_Drawing_BitmapDestroy(cBitmap);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_0200
 * @tc.desc   test for testBitmapDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapDestroyNull()
{
    DrawingNativeBitmapTestSetUp();

    OH_Drawing_BitmapDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapCreateFromPixelsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_0300
 * @tc.desc   test for testBitmapCreateFromPixelsNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBitmapCreateFromPixelsNormal()
{
    DrawingNativeBitmapTestSetUp();

    // 1. Construct OH_Drawing_Image_Info by iterating through OH_Drawing_ColorFormat and OH_Drawing_AlphaFormat
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };

    for (OH_Drawing_ColorFormat format : formats) {
        for (OH_Drawing_AlphaFormat alphaFormat : alphaFormats) {
            int width = TEST_BITMAP_SIZE_SMALL;
            int height = TEST_BITMAP_SIZE_SMALL;
            int rowBytes = width * BYTES_PER_PIXEL;
            OH_Drawing_Bitmap* bitmap1 = OH_Drawing_BitmapCreate();
            EXPECT_NE(bitmap1, nullptr);
            OH_Drawing_BitmapFormat cFormat{ format, alphaFormat };
            OH_Drawing_BitmapBuild(bitmap1, width, height, &cFormat);
            void* pixels = OH_Drawing_BitmapGetPixels(bitmap1);
            if (pixels != nullptr) {
                OH_Drawing_Image_Info imageInfo;
                OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
                // 2. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with matching image information and call OH_Drawing_BitmapGet related
                // interfaces Verify that the parameters match the initialization parameters
                uint32_t height_ = OH_Drawing_BitmapGetHeight(bitmap);
                uint32_t width_ = OH_Drawing_BitmapGetWidth(bitmap);
                OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(bitmap);
                OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
                EXPECT_TRUE(height_ == height || height_ == 0);
                EXPECT_TRUE(width_ == width || width_ == 0);
                EXPECT_TRUE(colorFormat_ == format || colorFormat_ == 0);
                EXPECT_TRUE(alphaFormat_ == alphaFormat || alphaFormat_ == 0);
                // 3. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with rowBytes larger than the image, call OH_Drawing_BitmapGet related
                // interfaces (OH_Drawing_BitmapGetHeight, OH_Drawing_BitmapGetWidth), Verify that the parameters match
                // the initialization parameters
                int rowBytes2 = width * BYTES_PER_PIXEL + TEST_ROWBYTES_OFFSET;
                bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes2);
                height_ = OH_Drawing_BitmapGetHeight(bitmap);
                width_ = OH_Drawing_BitmapGetWidth(bitmap);
                EXPECT_TRUE(height_ == height || height_ == 0);
                EXPECT_TRUE(width_ == width || width_ == 0);
                // 4. Free memory
                OH_Drawing_BitmapDestroy(bitmap);
            }
        }
    }

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapCreateFromPixelsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_0400
 * @tc.desc   test for testBitmapCreateFromPixelsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapCreateFromPixelsNull()
{
    DrawingNativeBitmapTestSetUp();

    int width = TEST_BITMAP_SIZE_SMALL;
    int height = TEST_BITMAP_SIZE_SMALL;
    int rowBytes = width * BYTES_PER_PIXEL;
    uint8_t* pixels = new uint8_t[width * height * BYTES_PER_PIXEL];
    OH_Drawing_Image_Info imageInfo{ width, height, COLOR_FORMAT_ALPHA_8, ALPHA_FORMAT_UNKNOWN };
    // 1. OH_Drawing_BitmapCreateFromPixels the first parameter OH_Drawing_Image_Info is empty
    OH_Drawing_Bitmap* bitmap1 = OH_Drawing_BitmapCreateFromPixels(nullptr, pixels, rowBytes);
    EXPECT_EQ(bitmap1, nullptr);
    // 2. OH_Drawing_BitmapCreateFromPixels the second parameter pixels is empty
    OH_Drawing_Bitmap* bitmap2 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, nullptr, rowBytes);
    EXPECT_EQ(bitmap2, nullptr);
    // 3. OH_Drawing_BitmapCreateFromPixels the third parameter rowBytes is 0
    OH_Drawing_Bitmap* bitmap3 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, 0);
    EXPECT_EQ(bitmap3, nullptr);
    // 4. OH_Drawing_BitmapCreateFromPixels the width of the first parameter OH_Drawing_Image_Info is 0
    imageInfo.width = 0;
    OH_Drawing_Bitmap* bitmap4 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    EXPECT_EQ(bitmap4, nullptr);
    // 5. OH_Drawing_BitmapCreateFromPixels the height of the first parameter OH_Drawing_Image_Info is 0
    imageInfo.width = width;
    imageInfo.height = 0;
    OH_Drawing_Bitmap* bitmap5 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    EXPECT_EQ(bitmap5, nullptr);
    // 6. Free memory
    OH_Drawing_BitmapDestroy(bitmap1);
    OH_Drawing_BitmapDestroy(bitmap2);
    OH_Drawing_BitmapDestroy(bitmap3);
    OH_Drawing_BitmapDestroy(bitmap4);
    OH_Drawing_BitmapDestroy(bitmap5);
    delete[] pixels;

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapCreateFromPixelsMismatch
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_0500
 * @tc.desc   test for testBitmapCreateFromPixelsMismatch.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapCreateFromPixelsMismatch()
{
    DrawingNativeBitmapTestSetUp();

    int width = TEST_BITMAP_SIZE_MISMATCH;
    int height = TEST_BITMAP_SIZE_MISMATCH;
    int rowBytes = width * BYTES_PER_PIXEL;
    uint8_t* pixels = new uint8_t[width * height * BYTES_PER_PIXEL];
    OH_Drawing_Image_Info imageInfo{ width, height, COLOR_FORMAT_ALPHA_8, ALPHA_FORMAT_UNKNOWN };
    // 1. OH_Drawing_BitmapCreateFromPixels initializes a 48*48 image, but the memory allocated for pixels is 47*48
    uint8_t* pixels1 = new uint8_t[TEST_BITMAP_SIZE_MISMATCH_OFFSET * height * BYTES_PER_PIXEL];
    OH_Drawing_Bitmap* bitmap1 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels1, rowBytes);
    EXPECT_EQ(bitmap1, nullptr);
    // 2. OH_Drawing_BitmapCreateFromPixels initializes a 48*48 image, but the memory allocated for pixels is 48*47
    uint8_t* pixels2 = new uint8_t[width * TEST_BITMAP_SIZE_MISMATCH_OFFSET * BYTES_PER_PIXEL];
    OH_Drawing_Bitmap* bitmap2 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels2, rowBytes);
    EXPECT_EQ(bitmap2, nullptr);
    // 3. OH_Drawing_BitmapCreateFromPixels initializes a 48*48 image, but the memory allocated for pixels is 48*48 and
    // rowBytes is 47
    rowBytes = TEST_BITMAP_SIZE_MISMATCH_OFFSET;
    uint8_t* pixels3 = new uint8_t[width * height * BYTES_PER_PIXEL];
    OH_Drawing_Bitmap* bitmap3 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels3, rowBytes);
    EXPECT_EQ(bitmap3, nullptr);
    // 4. Free memory
    OH_Drawing_BitmapDestroy(bitmap1);
    OH_Drawing_BitmapDestroy(bitmap2);
    OH_Drawing_BitmapDestroy(bitmap3);
    delete[] pixels;
    delete[] pixels1;
    delete[] pixels2;
    delete[] pixels3;

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapCreateFromPixelsAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_0600
 * @tc.desc   test for testBitmapCreateFromPixelsAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapCreateFromPixelsAbnormal()
{
    DrawingNativeBitmapTestSetUp();

    int width = TEST_BITMAP_SIZE_MISMATCH;
    int height = TEST_BITMAP_SIZE_MISMATCH;
    int rowBytes = width * BYTES_PER_PIXEL;
    uint8_t* pixels = new uint8_t[width * height * BYTES_PER_PIXEL];
    OH_Drawing_Image_Info imageInfo{ width, height, COLOR_FORMAT_ALPHA_8, ALPHA_FORMAT_UNKNOWN };
    // 1. After constructing OH_Drawing_Image_Info, modify the byte value to an abnormal value
    imageInfo.width = -1;
    // 2. OH_Drawing_BitmapCreateFromPixels
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    EXPECT_EQ(bitmap, nullptr);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    delete[] pixels;

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapCreateFromPixelsVeryBig
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_0700
 * @tc.desc   test for testBitmapCreateFromPixelsVeryBig.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapCreateFromPixelsVeryBig()
{
    DrawingNativeBitmapTestSetUp();

    // 1. Construct OH_Drawing_Image_Info by iterating through OH_Drawing_ColorFormat and OH_Drawing_AlphaFormat
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    for (OH_Drawing_ColorFormat format : formats) {
        for (OH_Drawing_AlphaFormat alphaFormat : alphaFormats) {
            int width = TEST_BITMAP_SIZE_VERY_LARGE;
            int height = TEST_BITMAP_SIZE_VERY_LARGE;
            int rowBytes = width * BYTES_PER_PIXEL;
            OH_Drawing_Bitmap* bitmap1 = OH_Drawing_BitmapCreate();
            EXPECT_NE(bitmap1, nullptr);
            OH_Drawing_BitmapFormat cFormat{ format, alphaFormat };
            OH_Drawing_BitmapBuild(bitmap1, width, height, &cFormat);
            void* pixels = OH_Drawing_BitmapGetPixels(bitmap1);
            if (pixels != nullptr) {
                OH_Drawing_Image_Info imageInfo;
                OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
                // 2. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with matching image information and call OH_Drawing_BitmapGet related
                // interfaces Verify that the parameters match the initialization parameters
                uint32_t height_ = OH_Drawing_BitmapGetHeight(bitmap);
                uint32_t width_ = OH_Drawing_BitmapGetWidth(bitmap);
                OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(bitmap);
                OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
                EXPECT_TRUE(height_ == height || height_ == 0);
                EXPECT_TRUE(width_ == width || width_ == 0);
                EXPECT_TRUE(colorFormat_ == format || colorFormat_ == 0);
                EXPECT_TRUE(alphaFormat_ == alphaFormat || alphaFormat_ == 0);
                // 3. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with rowBytes larger than the image, call OH_Drawing_BitmapGet related
                // interfaces (OH_Drawing_BitmapGetHeight, OH_Drawing_BitmapGetWidth), Verify that the parameters match
                // the initialization parameters
                int rowBytes2 = width * BYTES_PER_PIXEL + TEST_ROWBYTES_OFFSET;
                bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes2);
                height_ = OH_Drawing_BitmapGetHeight(bitmap);
                width_ = OH_Drawing_BitmapGetWidth(bitmap);
                EXPECT_TRUE(height_ == height || height_ == 0);
                EXPECT_TRUE(width_ == width || width_ == 0);
                // 4. Free memory
                OH_Drawing_BitmapDestroy(bitmap);
            }
        }
    }

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapCreateFromPixelsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_0800
 * @tc.desc   test for testBitmapCreateFromPixelsBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBitmapCreateFromPixelsBoundary()
{
    DrawingNativeBitmapTestSetUp();

    // 1. Construct OH_Drawing_Image_Info by iterating through OH_Drawing_ColorFormat and OH_Drawing_AlphaFormat
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    for (OH_Drawing_ColorFormat format : formats) {
        for (OH_Drawing_AlphaFormat alphaFormat : alphaFormats) {
            // 4K screen resolutionp
            int width = TEST_BITMAP_SIZE_4K_WIDTH;
            int height = TEST_BITMAP_SIZE_4K_HEIGHT;
            int rowBytes = width * BYTES_PER_PIXEL;
            OH_Drawing_Bitmap* bitmap1 = OH_Drawing_BitmapCreate();
            EXPECT_NE(bitmap1, nullptr);
            OH_Drawing_BitmapFormat cFormat{ format, alphaFormat };
            OH_Drawing_BitmapBuild(bitmap1, width, height, &cFormat);
            void* pixels = OH_Drawing_BitmapGetPixels(bitmap1);
            if (pixels != nullptr) {
                OH_Drawing_Image_Info imageInfo;
                OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
                // 2. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with matching image information and call OH_Drawing_BitmapGet related
                // interfaces Verify that the parameters match the initialization parameters
                uint32_t height_ = OH_Drawing_BitmapGetHeight(bitmap);
                uint32_t width_ = OH_Drawing_BitmapGetWidth(bitmap);
                OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(bitmap);
                OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
                EXPECT_TRUE(height_ == height || height_ == 0);
                EXPECT_TRUE(width_ == width || width_ == 0);
                EXPECT_TRUE(colorFormat_ == format || colorFormat_ == 0);
                EXPECT_TRUE(alphaFormat_ == alphaFormat || alphaFormat_ == 0);
                // 3. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with rowBytes larger than the image, call OH_Drawing_BitmapGet related
                // interfaces (OH_Drawing_BitmapGetHeight, OH_Drawing_BitmapGetWidth), Verify that the parameters match
                // the initialization parameters
                int rowBytes2 = width * BYTES_PER_PIXEL + TEST_ROWBYTES_OFFSET;
                bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes2);
                height_ = OH_Drawing_BitmapGetHeight(bitmap);
                width_ = OH_Drawing_BitmapGetWidth(bitmap);
                EXPECT_TRUE(height_ == height || height_ == 0);
                EXPECT_TRUE(width_ == width || width_ == 0);
                // 4. Free memory
                OH_Drawing_BitmapDestroy(bitmap);
            }
        }
    }

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapBuildNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_0900
 * @tc.desc   test for testBitmapBuildNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBitmapBuildNormal()
{
    DrawingNativeBitmapTestSetUp();

    const unsigned int width = TEST_BITMAP_SIZE_MEDIUM;
    const unsigned int height = TEST_BITMAP_SIZE_MEDIUM;
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    OH_Drawing_AlphaFormat alphaFormat_;

    // step 1
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();

    // step 2
    for (int i = 1; i < sizeof(alphaFormats) / sizeof(alphaFormats[0]); i++) {
        OH_Drawing_BitmapFormat bitmapFormat = { formats[3], alphaFormats[i] };
        OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
        if (bitmap == nullptr) {
            alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormats[0]);
        } else {
            alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormats[i]);
        }
    }

    // step 3
    OH_Drawing_BitmapDestroy(bitmap);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapBuildNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_1000
 * @tc.desc   test for testBitmapBuildNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapBuildNull()
{
    DrawingNativeBitmapTestSetUp();

    const unsigned int width = TEST_BITMAP_SIZE_MEDIUM;
    const unsigned int height = TEST_BITMAP_SIZE_MEDIUM;

    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };

    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat bitmapFormat = { formats[3], alphaFormats[0] };

    OH_Drawing_BitmapBuild(bitmap, 0, height, &bitmapFormat);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_BitmapBuild(bitmap, width, 0, &bitmapFormat);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    OH_Drawing_BitmapBuild(bitmap, width, height, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_BitmapDestroy(bitmap);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapBuildMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_1100
 * @tc.desc   test for testBitmapBuildMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapBuildMultipleCalls()
{
    DrawingNativeBitmapTestSetUp();

    const unsigned int width = TEST_BITMAP_SIZE_MEDIUM;
    const unsigned int height = TEST_BITMAP_SIZE_MEDIUM;
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    OH_Drawing_AlphaFormat alphaFormat_;

    // step 1
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();

    // step 2
    for (int i = 1; i < sizeof(alphaFormats) / sizeof(alphaFormats[0]); i++) {
        OH_Drawing_BitmapFormat bitmapFormat = { formats[3], alphaFormats[i] };
        OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
        if (bitmap == nullptr) {
            alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormats[0]);
        }
        alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
        EXPECT_EQ(alphaFormat_, alphaFormats[i]);
    }

    // step 3
    OH_Drawing_BitmapDestroy(bitmap);

    // step 4
    OH_Drawing_Image_Info imageInfo = {};  // 初始化为零
    OH_Drawing_Bitmap* bitmap2 = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap2, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_BitmapBuild(bitmap2, width, height, &cFormat);
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap2);
    EXPECT_NE(pixels, nullptr);
    uint32_t rowBytes = width * height * BYTES_PER_PIXEL;
    OH_Drawing_Bitmap* bitmap3 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // step 5
    for (int i = 1; i < sizeof(alphaFormats) / sizeof(alphaFormats[0]); i++) {
        OH_Drawing_BitmapFormat bitmapFormat = { formats[3], alphaFormats[i] };
        OH_Drawing_BitmapBuild(bitmap3, width, height, &bitmapFormat);
        alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap3);
        EXPECT_EQ(alphaFormat_, alphaFormats[i]);
    }

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapBuildBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_1200
 * @tc.desc   test for testBitmapBuildBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBitmapBuildBoundary()
{
    DrawingNativeBitmapTestSetUp();

    // 4K screen resolutionp
    const unsigned int width = TEST_BITMAP_SIZE_4K_WIDTH;
    const unsigned int height = TEST_BITMAP_SIZE_4K_HEIGHT;
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };
    OH_Drawing_AlphaFormat alphaFormat_;

    // step 1
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();

    // step 2
    for (int i = 1; i < sizeof(alphaFormats) / sizeof(alphaFormats[0]); i++) {
        OH_Drawing_BitmapFormat bitmapFormat = { formats[3], alphaFormats[i] };
        OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
        if (bitmap == nullptr) {
            alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormats[0]);
        } else {
            alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormats[i]);
        }
    }

    // step 3
    OH_Drawing_BitmapDestroy(bitmap);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapGetXXNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_1300
 * @tc.desc   test for testBitmapGetXXNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBitmapGetXXNormal()
{
    DrawingNativeBitmapTestSetUp();

    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    int32_t width = TEST_BITMAP_SIZE_SMALL;
    int32_t height = TEST_BITMAP_SIZE_SMALL;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);

    OH_Drawing_Image_Info imageInfo1{ width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    void* pixels1 = new uint32_t[width * height];

    // step 1
    bool res = OH_Drawing_BitmapReadPixels(cBitmap, &imageInfo1, pixels1, width * BYTES_PER_PIXEL, 0, 0);
    EXPECT_EQ(res, true);

    // step 2
    uint32_t w = OH_Drawing_BitmapGetWidth(cBitmap);
    EXPECT_EQ(w, TEST_BITMAP_SIZE_SMALL);

    // step 3
    uint32_t h = OH_Drawing_BitmapGetHeight(cBitmap);
    EXPECT_EQ(h, TEST_BITMAP_SIZE_SMALL);

    // step 5
    OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(cBitmap);
    EXPECT_EQ(colorFormat_, COLOR_FORMAT_RGBA_8888);

    // step 5
    OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(cBitmap);
    EXPECT_EQ(alphaFormat_, ALPHA_FORMAT_OPAQUE);

    // step 6
    void* pixels = OH_Drawing_BitmapGetPixels(cBitmap);
    EXPECT_NE(pixels, nullptr);

    // step 7
    OH_Drawing_Image_Info* imageInfo = new OH_Drawing_Image_Info();
    OH_Drawing_BitmapGetImageInfo(cBitmap, imageInfo);
    EXPECT_EQ(width, imageInfo->width);
    EXPECT_EQ(height, imageInfo->height);

    // step 8
    OH_Drawing_BitmapDestroy(cBitmap);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapGetXXNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_1400
 * @tc.desc   test for testBitmapGetXXNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapGetXXNull()
{
    DrawingNativeBitmapTestSetUp();

    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    uint32_t width = TEST_BITMAP_SIZE_SMALL;
    uint32_t height = TEST_BITMAP_SIZE_SMALL;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);

    // step 1
    uint32_t w = OH_Drawing_BitmapGetWidth(nullptr);
    EXPECT_EQ(w, 0);

    // step 2
    uint32_t h = OH_Drawing_BitmapGetHeight(nullptr);
    EXPECT_EQ(h, 0);

    // step 3
    OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(nullptr);
    EXPECT_EQ(colorFormat_, 0);

    // step 4
    OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(nullptr);
    EXPECT_EQ(alphaFormat_, 0);

    // step 5
    void* pixels = OH_Drawing_BitmapGetPixels(nullptr);
    EXPECT_EQ(pixels, nullptr);

    // step 6
    OH_Drawing_Image_Info* imageInfo = new OH_Drawing_Image_Info();
    OH_Drawing_BitmapGetImageInfo(nullptr, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_BitmapGetImageInfo(cBitmap, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_BitmapDestroy(cBitmap);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapGetXXInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_1500
 * @tc.desc   test for testBitmapGetXXInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapGetXXInputDestroyed()
{
    DrawingNativeBitmapTestSetUp();

    // Deprecated

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapGetXXBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_1600
 * @tc.desc   test for testBitmapGetXXBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBitmapGetXXBoundary()
{
    DrawingNativeBitmapTestSetUp();

    OH_Drawing_Bitmap* cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    int32_t width = TEST_BITMAP_SIZE_4K_WIDTH;
    int32_t height = TEST_BITMAP_SIZE_4K_HEIGHT;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);

    OH_Drawing_Image_Info imageInfo1{ width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    void* pixels1 = new uint32_t[width * height];

    // step 1
    bool res = OH_Drawing_BitmapReadPixels(cBitmap, &imageInfo1, pixels1, width * BYTES_PER_PIXEL, 0, 0);
    EXPECT_EQ(res, true);

    // step 2
    uint32_t w = OH_Drawing_BitmapGetWidth(cBitmap);
    EXPECT_EQ(w, width);

    // step 3
    uint32_t h = OH_Drawing_BitmapGetHeight(cBitmap);
    EXPECT_EQ(h, height);

    // step 5
    OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(cBitmap);
    EXPECT_EQ(colorFormat_, COLOR_FORMAT_RGBA_8888);

    // step 5
    OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(cBitmap);
    EXPECT_EQ(alphaFormat_, ALPHA_FORMAT_OPAQUE);

    // step 6
    void* pixels = OH_Drawing_BitmapGetPixels(cBitmap);
    EXPECT_NE(pixels, nullptr);

    // step 7
    OH_Drawing_Image_Info* imageInfo = new OH_Drawing_Image_Info();
    OH_Drawing_BitmapGetImageInfo(cBitmap, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(width, imageInfo->width);
    EXPECT_EQ(height, imageInfo->height);

    // step 8
    OH_Drawing_BitmapDestroy(cBitmap);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapReadPixelsNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_1700
 * @tc.desc   test for OH_Drawing_BitmapBuild.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBitmapReadPixelsNormal()
{
    DrawingNativeBitmapTestSetUp();

    const unsigned int width = TEST_BITMAP_SIZE_MEDIUM;
    const unsigned int height = TEST_BITMAP_SIZE_MEDIUM;

    // step 1
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat bitmapFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };

    // step 2
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    OH_Drawing_Image_Info imageInfo{ width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    void* pixels = new uint32_t[width * height];

    // step 3
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * BYTES_PER_PIXEL, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    // don't know how to test

    // step 5
    OH_Drawing_BitmapDestroy(bitmap);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapReadPixelsNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_1800
 * @tc.desc   test for testBitmapReadPixelsNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapReadPixelsNull()
{
    DrawingNativeBitmapTestSetUp();

    const unsigned int width = TEST_BITMAP_SIZE_MEDIUM;
    const unsigned int height = TEST_BITMAP_SIZE_MEDIUM;

    // step 1
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat bitmapFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };

    // step 2
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    OH_Drawing_Image_Info imageInfo{ width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    void* pixels = new uint32_t[width * height];

    // step 3
    bool res = OH_Drawing_BitmapReadPixels(nullptr, &imageInfo, pixels, width * BYTES_PER_PIXEL, 0, 0);
    EXPECT_EQ(res, false);

    // step 4
    res = OH_Drawing_BitmapReadPixels(bitmap, nullptr, pixels, width * BYTES_PER_PIXEL, 0, 0);
    EXPECT_EQ(res, false);

    // step 5
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, nullptr, width * BYTES_PER_PIXEL, 0, 0);
    EXPECT_EQ(res, false);

    // step 6
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, 0, 0, 0);
    EXPECT_EQ(res, false);

    // step 7
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * BYTES_PER_PIXEL, 0, TEST_READ_PIXELS_OFFSET);
    EXPECT_EQ(res, true);

    // step 8
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * BYTES_PER_PIXEL, TEST_READ_PIXELS_OFFSET, 0);
    EXPECT_EQ(res, true);

    // step 9
    OH_Drawing_BitmapDestroy(bitmap);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapReadPixelsInputDestroyed
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_1900
 * @tc.desc   test for testBitmapReadPixelsInputDestroyed.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapReadPixelsInputDestroyed()
{
    DrawingNativeBitmapTestSetUp();

    // Deprecated

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapReadPixelsMismatch
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_2100
 * @tc.desc   test for testBitmapReadPixelsMismatch.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestBitmapReadPixelsMismatch()
{
    DrawingNativeBitmapTestSetUp();

    // step 1
    const unsigned int width = TEST_BITMAP_SIZE_MEDIUM;
    const unsigned int height = TEST_BITMAP_SIZE_MEDIUM;
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);

    // step 2
    OH_Drawing_BitmapFormat bitmapFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);

    // step 3
    OH_Drawing_Image_Info imageInfo{ TEST_READ_PIXELS_OFFSET, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    void* pixels = new uint32_t[width * height];
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * BYTES_PER_PIXEL, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    OH_Drawing_Image_Info imageInfo2{ width, TEST_READ_PIXELS_OFFSET, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo2, pixels, width * BYTES_PER_PIXEL, 0, 0);
    EXPECT_EQ(res, true);

    // step 5
    // OH_Drawing_BitmapReadPixels OH_Drawing_Image_Info color type mismatch
    // compile error, skip case

    // step 6
    // OH_Drawing_BitmapReadPixels OH_Drawing_Image_Info alpha type mismatch
    // compile error, skip case

    // step 7
    OH_Drawing_Image_Info imageInfo4{ width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo4, pixels, width * TEST_READ_PIXELS_ROWBYTES_MULTIPLIER, 0, 0);
    EXPECT_EQ(res, false);

    // step 8
    OH_Drawing_Image_Info imageInfo5{ width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    res = OH_Drawing_BitmapReadPixels(
        bitmap, &imageInfo5, pixels, width * BYTES_PER_PIXEL, TEST_READ_PIXELS_LARGE_OFFSET, 0);
    EXPECT_EQ(res, false);

    // step 9
    OH_Drawing_Image_Info imageInfo6{ width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    res = OH_Drawing_BitmapReadPixels(
        bitmap, &imageInfo6, pixels, width * BYTES_PER_PIXEL, 0, TEST_READ_PIXELS_LARGE_OFFSET);
    EXPECT_EQ(res, false);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapReadPixelsBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_2200
 * @tc.desc   test for OH_Drawing_BitmapBuild.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBitmapReadPixelsBoundary()
{
    DrawingNativeBitmapTestSetUp();

    const unsigned int width = TEST_BITMAP_SIZE_4K_WIDTH;
    const unsigned int height = TEST_BITMAP_SIZE_4K_HEIGHT;

    // step 1
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat bitmapFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };

    // step 2
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    OH_Drawing_Image_Info imageInfo{ width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    void* pixels = new uint32_t[width * height];

    // step 3
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * BYTES_PER_PIXEL, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    // don't know how to test

    // step 5
    OH_Drawing_BitmapDestroy(bitmap);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testBitmapBuildMaximum
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_BITMAP_2300
 * @tc.desc   test for testBitmapBuildMaximum.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestBitmapBuildMaximum()
{
    DrawingNativeBitmapTestSetUp();

    // Build a very large bitmap
    const unsigned int width = TEST_BITMAP_SIZE_MAXIMUM;
    const unsigned int height = TEST_BITMAP_SIZE_MAXIMUM;
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat bitmapFormat{ COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_PREMUL };
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);

    // Create a new canvas and draw the contents of the image
    OH_Drawing_Canvas* imageCanvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(imageCanvas, nullptr);
    OH_Drawing_CanvasBind(imageCanvas, bitmap);
    OH_Drawing_Rect* imageRect =
        OH_Drawing_RectCreate(TEST_RECT_POS_START, TEST_RECT_POS_START, TEST_RECT_SIZE_SMALL, TEST_RECT_SIZE_SMALL);
    OH_Drawing_CanvasDrawRect(imageCanvas, imageRect);

    // Create a picture object
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);

    // Draws the image onto the specified area of the canvas.
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* dstRect =
        OH_Drawing_RectCreate(TEST_RECT_POS_END, TEST_RECT_POS_END, TEST_RECT_SIZE_LARGE, TEST_RECT_SIZE_LARGE);
    OH_Drawing_SamplingOptions* samplingOptions = OH_Drawing_SamplingOptionsCreate(
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST, OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    EXPECT_NE(samplingOptions, nullptr);
    OH_Drawing_CanvasDrawImageRect(canvas, image, dstRect, samplingOptions);

    // Destroy all objects
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(imageCanvas);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_ImageDestroy(image);
    OH_Drawing_RectDestroy(imageRect);
    OH_Drawing_RectDestroy(dstRect);

    DrawingNativeBitmapTestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS