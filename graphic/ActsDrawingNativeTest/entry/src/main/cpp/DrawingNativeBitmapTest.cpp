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
#include "include/log_common.h"

#define DRAWING_NUMBER_1 1
#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_4 4
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_47 47
#define DRAWING_NUMBER_48 48
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_192 192
#define DRAWING_NUMBER_256 256
#define DRAWING_NUMBER_400 400
#define DRAWING_NUMBER_500 500
#define DRAWING_NUMBER_512 512
#define DRAWING_NUMBER_565 565
#define DRAWING_NUMBER_1000 1000
#define DRAWING_NUMBER_2000 2000
#define DRAWING_NUMBER_4444 4444
#define DRAWING_NUMBER_8888 8888
#define DRAWING_NUMBER_2160 2160
#define DRAWING_NUMBER_4096 4096
#define DRAWING_NUMBER_10000 10000
#define DRAWING_NUMBER_16384 16384
#define DRAWING_NUMBER_1000000 1000000
#define DRAWING_NUMBER_4000000 4000000

namespace OHOS {
namespace Rosen {
namespace Drawing {

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

int TestBitmapDestroyNormal()
{
    DrawingNativeBitmapTestSetUp();
    // step 1
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    // step 2
    OH_Drawing_BitmapDestroy(cBitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapDestroyNull()
{
    DrawingNativeBitmapTestSetUp();
    OH_Drawing_Bitmap *bitmap = nullptr;
    OH_Drawing_BitmapDestroy(nullptr);
    EXPECT_EQ(bitmap, nullptr);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

OH_Drawing_ColorFormat colorFormats[] = {
    COLOR_FORMAT_UNKNOWN,   COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
    COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
};

OH_Drawing_AlphaFormat alphaFormats[] = {
    ALPHA_FORMAT_UNKNOWN,
    ALPHA_FORMAT_OPAQUE,
    ALPHA_FORMAT_PREMUL,
    ALPHA_FORMAT_UNPREMUL,
};

int TestBitmapCreateFromPixelsNormal()
{
    DrawingNativeBitmapTestSetUp();
    // 1. Construct OH_Drawing_Image_Info by iterating through OH_Drawing_ColorFormat and OH_Drawing_AlphaFormat
    int width = DRAWING_NUMBER_100;
    int height = DRAWING_NUMBER_100;
    int rowBytes = DRAWING_NUMBER_400;
    OH_Drawing_Bitmap *bitmap1 = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap1, nullptr);
    for (OH_Drawing_ColorFormat colorFormat : colorFormats) {
        OH_Drawing_BitmapFormat cFormat{colorFormat, OH_Drawing_AlphaFormat::ALPHA_FORMAT_UNKNOWN};
        OH_Drawing_BitmapBuild(bitmap1, width, height, &cFormat);
        void *pixels = OH_Drawing_BitmapGetPixels(bitmap1);
        if (pixels != nullptr) {
            OH_Drawing_Image_Info imageInfo = {
                width, height, colorFormat, OH_Drawing_AlphaFormat::ALPHA_FORMAT_UNKNOWN};
            OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
            // 2. OH_Drawing_BitmapCreateFromPixels
            uint32_t height_ = OH_Drawing_BitmapGetHeight(bitmap);
            uint32_t width_ = OH_Drawing_BitmapGetWidth(bitmap);
            OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(bitmap);
            EXPECT_EQ(height_, height);
            EXPECT_EQ(width_, width);
            EXPECT_EQ(colorFormat_, colorFormat);
            // 4. Free memory
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }
    for (OH_Drawing_AlphaFormat alphaFormat : alphaFormats) {
        OH_Drawing_BitmapFormat cFormat{OH_Drawing_ColorFormat::COLOR_FORMAT_UNKNOWN, alphaFormat};
        OH_Drawing_BitmapBuild(bitmap1, width, height, &cFormat);
        void *pixels = OH_Drawing_BitmapGetPixels(bitmap1);
        if (pixels != nullptr) {
            OH_Drawing_Image_Info imageInfo = {
                width, height, OH_Drawing_ColorFormat::COLOR_FORMAT_UNKNOWN, alphaFormat};
            OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
            OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormat);
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }
    OH_Drawing_BitmapDestroy(bitmap1);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapCreateFromPixelsNull()
{
    DrawingNativeBitmapTestSetUp();
    int width = DRAWING_NUMBER_100;
    int height = DRAWING_NUMBER_100;
    int rowBytes = DRAWING_NUMBER_400;
    uint8_t *pixels = new uint8_t[width * height * DRAWING_NUMBER_4];
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_ALPHA_8, ALPHA_FORMAT_UNKNOWN};
    // 1. OH_Drawing_BitmapCreateFromPixels the first parameter OH_Drawing_Image_Info is empty
    OH_Drawing_Bitmap *bitmap1 = OH_Drawing_BitmapCreateFromPixels(nullptr, pixels, rowBytes);
    EXPECT_EQ(bitmap1, nullptr);
    // 2. OH_Drawing_BitmapCreateFromPixels the second parameter pixels is empty
    OH_Drawing_Bitmap *bitmap2 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, nullptr, rowBytes);
    EXPECT_EQ(bitmap2, nullptr);
    // 3. OH_Drawing_BitmapCreateFromPixels the third parameter rowBytes is 0
    OH_Drawing_Bitmap *bitmap3 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, 0);
    EXPECT_EQ(bitmap3, nullptr);
    // 4. OH_Drawing_BitmapCreateFromPixels the width of the first parameter OH_Drawing_Image_Info is 0
    imageInfo.width = 0;
    OH_Drawing_Bitmap *bitmap4 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    EXPECT_EQ(bitmap4, nullptr);
    // 5. OH_Drawing_BitmapCreateFromPixels the height of the first parameter OH_Drawing_Image_Info is 0
    imageInfo.width = width;
    imageInfo.height = 0;
    OH_Drawing_Bitmap *bitmap5 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
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

int TestBitmapCreateFromPixelsMismatch()
{
    DrawingNativeBitmapTestSetUp();
    int width = DRAWING_NUMBER_48;
    int height = DRAWING_NUMBER_48;
    int rowBytes = DRAWING_NUMBER_192;
    uint8_t *pixels = new uint8_t[width * height * DRAWING_NUMBER_4];
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_ALPHA_8, ALPHA_FORMAT_UNKNOWN};
    // 1. OH_Drawing_BitmapCreateFromPixels initializes a 48*48 image, but the memory allocated for pixels is 47*48
    uint8_t *pixels1 = new uint8_t[DRAWING_NUMBER_47 * height * DRAWING_NUMBER_4];
    OH_Drawing_Bitmap *bitmap1 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels1, rowBytes);
    EXPECT_EQ(bitmap1, nullptr);
    // 2. OH_Drawing_BitmapCreateFromPixels initializes a 48*48 image, but the memory allocated for pixels is 48*47
    uint8_t *pixels2 = new uint8_t[width * DRAWING_NUMBER_47 * DRAWING_NUMBER_4];
    OH_Drawing_Bitmap *bitmap2 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels2, rowBytes);
    EXPECT_EQ(bitmap2, nullptr);
    // 3. OH_Drawing_BitmapCreateFromPixels initializes a 48*48 image, but the memory allocated for pixels is 48*48 and
    // rowBytes is 47
    rowBytes = DRAWING_NUMBER_47;
    uint8_t *pixels3 = new uint8_t[width * height * DRAWING_NUMBER_4];
    OH_Drawing_Bitmap *bitmap3 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels3, rowBytes);
    EXPECT_EQ(bitmap3, nullptr);
    // 4. OH_Drawing_BitmapCreateFromPixels
    rowBytes = width * DRAWING_NUMBER_4 + DRAWING_NUMBER_1;
    OH_Drawing_Bitmap *bitmap4 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    height = OH_Drawing_BitmapGetHeight(bitmap4);
    width = OH_Drawing_BitmapGetWidth(bitmap4);
    EXPECT_EQ(height, 0);
    EXPECT_EQ(width, 0);
    // 4. Free memory
    OH_Drawing_BitmapDestroy(bitmap1);
    OH_Drawing_BitmapDestroy(bitmap2);
    OH_Drawing_BitmapDestroy(bitmap3);
    OH_Drawing_BitmapDestroy(bitmap4);
    delete[] pixels;
    delete[] pixels1;
    delete[] pixels2;
    delete[] pixels3;
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapCreateFromPixelsAbnormal()
{
    DrawingNativeBitmapTestSetUp();
    int width = DRAWING_NUMBER_48;
    int height = DRAWING_NUMBER_48;
    int rowBytes = DRAWING_NUMBER_192;
    uint8_t *pixels = new uint8_t[width * height * DRAWING_NUMBER_4];
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_ALPHA_8, ALPHA_FORMAT_UNKNOWN};
    // 1. After constructing OH_Drawing_Image_Info, modify the byte value to an abnormal value
    imageInfo.width = -DRAWING_NUMBER_1;
    // 2. OH_Drawing_BitmapCreateFromPixels
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    EXPECT_EQ(bitmap, nullptr);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    delete[] pixels;
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

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
            int width = DRAWING_NUMBER_1000000;
            int height = DRAWING_NUMBER_1000000;
            int rowBytes = DRAWING_NUMBER_4000000;
            OH_Drawing_Bitmap *bitmap1 = OH_Drawing_BitmapCreate();
            EXPECT_NE(bitmap1, nullptr);
            OH_Drawing_BitmapFormat cFormat{format, alphaFormat};
            OH_Drawing_BitmapBuild(bitmap1, width, height, &cFormat);
            void *pixels = OH_Drawing_BitmapGetPixels(bitmap1);
            if (pixels != nullptr) {
                OH_Drawing_Image_Info imageInfo;
                OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
                // 2. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with matching image information and call OH_Drawing_BitmapGet related
                // interfaces Verify that the parameters match the initialization parameters
                uint32_t height_ = OH_Drawing_BitmapGetHeight(bitmap);
                uint32_t width_ = OH_Drawing_BitmapGetWidth(bitmap);
                OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(bitmap);
                OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
                EXPECT_EQ(height_, height);
                EXPECT_EQ(width_, width);
                EXPECT_EQ(colorFormat_, format);
                EXPECT_EQ(alphaFormat_, alphaFormat);
                // 3. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with rowBytes larger than the image, call OH_Drawing_BitmapGet related
                // interfaces (OH_Drawing_BitmapGetHeight, OH_Drawing_BitmapGetWidth), Verify that the parameters match
                // the initialization parameters
                int rowBytesDRAWING_NUMBER_2 = width * DRAWING_NUMBER_4 + DRAWING_NUMBER_1;
                bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytesDRAWING_NUMBER_2);
                height_ = OH_Drawing_BitmapGetHeight(bitmap);
                width_ = OH_Drawing_BitmapGetWidth(bitmap);
                EXPECT_EQ(height_, height);
                EXPECT_EQ(width_, width);
                // 4. Free memory
                OH_Drawing_BitmapDestroy(bitmap);
            }
        }
    }
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapCreateFromPixelsBoundary()
{
    DrawingNativeBitmapTestSetUp();
    // 1. Construct OH_Drawing_Image_Info by iterating through OH_Drawing_ColorFormat and OH_Drawing_AlphaFormat
    // 4K screen resolutionp
    int width = DRAWING_NUMBER_4096;
    int height = DRAWING_NUMBER_2160;
    int rowBytes = DRAWING_NUMBER_16384;
    OH_Drawing_Bitmap *bitmap1 = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap1, nullptr);
    for (OH_Drawing_ColorFormat colorFormat : colorFormats) {
        OH_Drawing_BitmapFormat cFormat{colorFormat, OH_Drawing_AlphaFormat::ALPHA_FORMAT_UNKNOWN};
        OH_Drawing_BitmapBuild(bitmap1, width, height, &cFormat);
        void *pixels = OH_Drawing_BitmapGetPixels(bitmap1);
        if (pixels != nullptr) {
            OH_Drawing_Image_Info imageInfo = {
                width, height, colorFormat, OH_Drawing_AlphaFormat::ALPHA_FORMAT_UNKNOWN};
            OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
            // 2. OH_Drawing_BitmapCreateFromPixels
            uint32_t height_ = OH_Drawing_BitmapGetHeight(bitmap);
            uint32_t width_ = OH_Drawing_BitmapGetWidth(bitmap);
            OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(bitmap);
            EXPECT_EQ(height_, height);
            EXPECT_EQ(width_, width);
            EXPECT_EQ(colorFormat_, colorFormat);
            // 4. Free memory
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }
    for (OH_Drawing_AlphaFormat alphaFormat : alphaFormats) {
        OH_Drawing_BitmapFormat cFormat{OH_Drawing_ColorFormat::COLOR_FORMAT_UNKNOWN, alphaFormat};
        OH_Drawing_BitmapBuild(bitmap1, width, height, &cFormat);
        void *pixels = OH_Drawing_BitmapGetPixels(bitmap1);
        if (pixels != nullptr) {
            OH_Drawing_Image_Info imageInfo = {
                width, height, OH_Drawing_ColorFormat::COLOR_FORMAT_UNKNOWN, alphaFormat};
            OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
            OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormat);
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }
    OH_Drawing_BitmapDestroy(bitmap1);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapBuildNormal()
{
    DrawingNativeBitmapTestSetUp();
    const unsigned int width = DRAWING_NUMBER_500;
    const unsigned int height = DRAWING_NUMBER_500;
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
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    // step 2
    for (int i = DRAWING_NUMBER_1; i < sizeof(alphaFormats) / sizeof(alphaFormats[0]); i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[DRAWING_NUMBER_3], alphaFormats[i]};
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

int TestBitmapBuildNull()
{
    DrawingNativeBitmapTestSetUp();
    const unsigned int width = DRAWING_NUMBER_500;
    const unsigned int height = DRAWING_NUMBER_500;

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

    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat bitmapFormat = {formats[DRAWING_NUMBER_3], alphaFormats[0]};

    OH_Drawing_BitmapBuild(bitmap, 0, height, &bitmapFormat);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_BitmapBuild(bitmap, width, 0, &bitmapFormat);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    OH_Drawing_BitmapBuild(bitmap, width, height, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapBuildMultipleCalls()
{
    DrawingNativeBitmapTestSetUp();
    const unsigned int width = DRAWING_NUMBER_500;
    const unsigned int height = DRAWING_NUMBER_500;
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
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    // step 2
    for (int i = DRAWING_NUMBER_1; i < sizeof(alphaFormats) / sizeof(alphaFormats[0]); i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[DRAWING_NUMBER_3], alphaFormats[i]};
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
    OH_Drawing_Image_Info imageInfo = {};
    OH_Drawing_Bitmap *bitmap2 = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap2, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_BitmapBuild(bitmap2, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap2);
    EXPECT_NE(pixels, nullptr);
    uint32_t rowBytes = width * height * DRAWING_NUMBER_4;
    OH_Drawing_Bitmap *bitmap3 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    EXPECT_NE(bitmap3, nullptr);

    // step 5
    for (int i = DRAWING_NUMBER_1; i < sizeof(alphaFormats)/sizeof(alphaFormats[0]); i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[DRAWING_NUMBER_3], alphaFormats[i]};
        OH_Drawing_BitmapBuild(bitmap3, width, height, &bitmapFormat);
        alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap3);
        EXPECT_EQ(alphaFormat_, alphaFormats[i]);
    }
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapBuildBoundary()
{
    DrawingNativeBitmapTestSetUp();
    // 4K screen resolutionp
    const unsigned int width = DRAWING_NUMBER_4096;
    const unsigned int height = DRAWING_NUMBER_2160;
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
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    // step 2
    for (int i = DRAWING_NUMBER_1; i < sizeof(alphaFormats) / sizeof(alphaFormats[0]); i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[DRAWING_NUMBER_3], alphaFormats[i]};
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

int TestBitmapGetXXNormal()
{
    DrawingNativeBitmapTestSetUp();
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    int32_t width = DRAWING_NUMBER_100;
    int32_t height = DRAWING_NUMBER_100;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);

    OH_Drawing_Image_Info imageInfo1{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels1 = new int32_t[width * height];

    // step 1
    bool res = OH_Drawing_BitmapReadPixels(cBitmap, &imageInfo1, pixels1, width * DRAWING_NUMBER_4, 0, 0);
    EXPECT_EQ(res, true);

    // step 2
    int32_t w = OH_Drawing_BitmapGetWidth(cBitmap);
    EXPECT_EQ(w, DRAWING_NUMBER_100);

    // step 3
    int32_t h = OH_Drawing_BitmapGetHeight(cBitmap);
    EXPECT_EQ(h, DRAWING_NUMBER_100);

    // step 5
    OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(cBitmap);
    EXPECT_EQ(colorFormat_, COLOR_FORMAT_RGBA_8888);

    // step 5
    OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(cBitmap);
    EXPECT_EQ(alphaFormat_, ALPHA_FORMAT_OPAQUE);

    // step 6
    void *pixels = OH_Drawing_BitmapGetPixels(cBitmap);
    EXPECT_NE(pixels, nullptr);

    // step 7
    OH_Drawing_Image_Info *imageInfo = new OH_Drawing_Image_Info();
    OH_Drawing_BitmapGetImageInfo(cBitmap, imageInfo);
    EXPECT_EQ(width, imageInfo->width);
    EXPECT_EQ(height, imageInfo->height);

    // step 8
    OH_Drawing_BitmapDestroy(cBitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapGetXXNull()
{
    DrawingNativeBitmapTestSetUp();
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = DRAWING_NUMBER_100;
    uint32_t height = DRAWING_NUMBER_100;
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
    void *pixels = OH_Drawing_BitmapGetPixels(nullptr);
    EXPECT_EQ(pixels, nullptr);

    // step 6
    OH_Drawing_Image_Info *imageInfo = new OH_Drawing_Image_Info();
    OH_Drawing_BitmapGetImageInfo(nullptr, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_BitmapGetImageInfo(cBitmap, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_BitmapDestroy(cBitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapGetXXInputDestroyed()
{
    DrawingNativeBitmapTestSetUp();
    // Deprecated
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapGetXXBoundary()
{
    DrawingNativeBitmapTestSetUp();
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    int32_t width = DRAWING_NUMBER_4096;
    int32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);

    OH_Drawing_Image_Info imageInfo1{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels1 = new int32_t[width * height];

    // step 1
    bool res = OH_Drawing_BitmapReadPixels(cBitmap, &imageInfo1, pixels1, width * DRAWING_NUMBER_4, 0, 0);
    EXPECT_EQ(res, true);

    // step 2
    int32_t w = OH_Drawing_BitmapGetWidth(cBitmap);
    EXPECT_EQ(w, width);

    // step 3
    int32_t h = OH_Drawing_BitmapGetHeight(cBitmap);
    EXPECT_EQ(h, height);

    // step 5
    OH_Drawing_ColorFormat colorFormat_ = OH_Drawing_BitmapGetColorFormat(cBitmap);
    EXPECT_EQ(colorFormat_, COLOR_FORMAT_RGBA_8888);

    // step 5
    OH_Drawing_AlphaFormat alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(cBitmap);
    EXPECT_EQ(alphaFormat_, ALPHA_FORMAT_OPAQUE);

    // step 6
    void *pixels = OH_Drawing_BitmapGetPixels(cBitmap);
    EXPECT_NE(pixels, nullptr);

    // step 7
    OH_Drawing_Image_Info *imageInfo = new OH_Drawing_Image_Info();
    OH_Drawing_BitmapGetImageInfo(cBitmap, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_EQ(width, imageInfo->width);
    EXPECT_EQ(height, imageInfo->height);

    // step 8
    OH_Drawing_BitmapDestroy(cBitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapReadPixelsNormal()
{
    DrawingNativeBitmapTestSetUp();
    const unsigned int width = DRAWING_NUMBER_500;
    const unsigned int height = DRAWING_NUMBER_500;

    // step 1
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};

    // step 2
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels = new uint32_t[width * height];

    // step 3
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * DRAWING_NUMBER_4, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    // don't know how to test

    // step 5
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapReadPixelsNull()
{
    DrawingNativeBitmapTestSetUp();
    const unsigned int width = DRAWING_NUMBER_500;
    const unsigned int height = DRAWING_NUMBER_500;

    // step 1
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};

    // step 2
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels = new uint32_t[width * height];

    // step 3
    bool res = OH_Drawing_BitmapReadPixels(nullptr, &imageInfo, pixels, width * DRAWING_NUMBER_4, 0, 0);
    EXPECT_EQ(res, false);

    // step 4
    res = OH_Drawing_BitmapReadPixels(bitmap, nullptr, pixels, width * DRAWING_NUMBER_4, 0, 0);
    EXPECT_EQ(res, false);

    // step 5
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, nullptr, width * DRAWING_NUMBER_4, 0, 0);
    EXPECT_EQ(res, false);

    // step 6
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, 0, 0, 0);
    EXPECT_EQ(res, false);

    // step 7
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * DRAWING_NUMBER_4, 0, DRAWING_NUMBER_1);
    EXPECT_EQ(res, true);

    // step 8
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * DRAWING_NUMBER_4, DRAWING_NUMBER_1, 0);
    EXPECT_EQ(res, true);

    // step 9
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapReadPixelsInputDestroyed()
{
    DrawingNativeBitmapTestSetUp();
    // Deprecated
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapReadPixelsMismatch()
{
    DrawingNativeBitmapTestSetUp();
    // step 1
    const unsigned int width = DRAWING_NUMBER_500;
    const unsigned int height = DRAWING_NUMBER_500;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);

    // step 2
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);

    // step 3
    OH_Drawing_Image_Info imageInfo{DRAWING_NUMBER_1, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels = new uint32_t[width * height];
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * DRAWING_NUMBER_4, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    OH_Drawing_Image_Info imageInfo2{width, DRAWING_NUMBER_1, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo2, pixels, width * DRAWING_NUMBER_4, 0, 0);
    EXPECT_EQ(res, true);

    // step 5
    // OH_Drawing_BitmapReadPixels OH_Drawing_Image_Info color type mismatch
    // compile error, skip case

    // step 6
    // OH_Drawing_BitmapReadPixels OH_Drawing_Image_Info alpha type mismatch
    // compile error, skip case

    // step 7
    OH_Drawing_Image_Info imageInfo4{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo4, pixels, width * DRAWING_NUMBER_3, 0, 0);
    EXPECT_EQ(res, false);

    // step 8
    OH_Drawing_Image_Info imageInfo5{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo5, pixels, width * DRAWING_NUMBER_4, DRAWING_NUMBER_1000, 0);
    EXPECT_EQ(res, false);

    // step 9
    OH_Drawing_Image_Info imageInfo6{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo6, pixels, width * DRAWING_NUMBER_4, 0, DRAWING_NUMBER_1000);
    EXPECT_EQ(res, false);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapReadPixelsBoundary()
{
    DrawingNativeBitmapTestSetUp();
    const unsigned int width = DRAWING_NUMBER_4096;
    const unsigned int height = DRAWING_NUMBER_2160;

    // step 1
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};

    // step 2
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels = new uint32_t[width * height];

    // step 3
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * DRAWING_NUMBER_4, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    // don't know how to test

    // step 5
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapBuildMaximum()
{
    DrawingNativeBitmapTestSetUp();
    // Build a very large bitmap
    const unsigned int width = DRAWING_NUMBER_10000;
    const unsigned int height = DRAWING_NUMBER_10000;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_PREMUL};
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);

    // Create a new canvas and draw the contents of the image
    OH_Drawing_Canvas *imageCanvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(imageCanvas, nullptr);
    OH_Drawing_CanvasBind(imageCanvas, bitmap);
    OH_Drawing_Rect *imageRect = OH_Drawing_RectCreate(0, 0, DRAWING_NUMBER_5, DRAWING_NUMBER_5);
    OH_Drawing_CanvasDrawRect(imageCanvas, imageRect);

    // Create a picture object
    OH_Drawing_Image *image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);

    // Draws the image onto the specified area of the canvas.
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *dstRect =
        OH_Drawing_RectCreate(DRAWING_NUMBER_100, DRAWING_NUMBER_100, DRAWING_NUMBER_500, DRAWING_NUMBER_500);
    OH_Drawing_SamplingOptions *samplingOptions = OH_Drawing_SamplingOptionsCreate(
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

int TestBitmapGetRowBytesNormal()
{
    DrawingNativeBitmapTestSetUp();
    uint32_t width = DRAWING_NUMBER_256;
    uint32_t height = DRAWING_NUMBER_256;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_ARGB_4444, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    uint32_t bytes = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_BitmapGetRowBytes(bitmap, &bytes);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(bytes, DRAWING_NUMBER_512);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapGetRowBytesNull()
{
    DrawingNativeBitmapTestSetUp();
    uint32_t width = DRAWING_NUMBER_256;
    uint32_t height = DRAWING_NUMBER_256;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_ARGB_4444, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    uint32_t bytes = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_BitmapGetRowBytes(nullptr, &bytes);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    EXPECT_EQ(bytes, 0);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapGetRowBytesAbnormal()
{
    DrawingNativeBitmapTestSetUp();
    uint32_t width = 0;
    uint32_t height = DRAWING_NUMBER_256;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_ARGB_4444, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    uint32_t bytes = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_BitmapGetRowBytes(bitmap, &bytes);
    EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
    EXPECT_EQ(bytes, 0);
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestBitmapGetRowBytesMultipleCalls()
{
    DrawingNativeBitmapTestSetUp();
    uint32_t width = DRAWING_NUMBER_256;
    uint32_t height = DRAWING_NUMBER_256;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_ARGB_4444, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    uint32_t bytes = 0;
    for (int i = 0; i < DRAWING_NUMBER_10; i++) {
        OH_Drawing_ErrorCode errorCode = OH_Drawing_BitmapGetRowBytes(bitmap, &bytes);
        EXPECT_EQ(errorCode, OH_DRAWING_SUCCESS);
        EXPECT_EQ(bytes, DRAWING_NUMBER_512);
    }
    OH_Drawing_BitmapDestroy(bitmap);
    DrawingNativeBitmapTestTearDown();
    return OH_DRAWING_SUCCESS;
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
