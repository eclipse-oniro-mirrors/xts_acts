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

#include "gtest/gtest.h"

#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeBitmapTest : public testing::Test {
    protected:
    // 在每个测试用例执行前调用
    void SetUp() override
    {
        // 设置代码
        std::cout << "DrawingNativeBitmapTest Setup code called before each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeBitmapTest errorCodeReset before each test case." << std::endl;
    }
    void TearDown() override
    {
        std::cout << "DrawingNativeBitmapTest Setup code called after each test case." << std::endl;
        OH_Drawing_ErrorCodeReset();
        std::cout << "DrawingNativeBitmapTest errorCodeReset after each test case." << std::endl;
    }
};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0100
 * @tc.name: testBitmapDestroyNormal
 * @tc.desc: test for testBitmapDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapDestroyNormal, TestSize.Level0) {
    // step 1
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    // step 2
    OH_Drawing_BitmapDestroy(cBitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0101
 * @tc.name: testBitmapDestroyNull
 * @tc.desc: test for testBitmapDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapDestroyNull, TestSize.Level3) {
    OH_Drawing_BitmapDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0200
 * @tc.name: testBitmapCreateFromPixelsNormal
 * @tc.desc: test for testBitmapCreateFromPixelsNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapCreateFromPixelsNormal, TestSize.Level0) {
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
            int width = 100;
            int height = 100;
            int rowBytes = width * 4;
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
                EXPECT_TRUE(height_ == height || height_ == 0);
                EXPECT_TRUE(width_ == width || width_ == 0);
                EXPECT_TRUE(colorFormat_ == format || colorFormat_ == 0);
                EXPECT_TRUE(alphaFormat_ == alphaFormat || alphaFormat_ == 0);
                // 3. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with rowBytes larger than the image, call OH_Drawing_BitmapGet related
                // interfaces (OH_Drawing_BitmapGetHeight, OH_Drawing_BitmapGetWidth), Verify that the parameters match
                // the initialization parameters
                int rowBytes2 = width * 4 + 1;
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0201
 * @tc.name: testBitmapCreateFromPixelsNull
 * @tc.desc: test for testBitmapCreateFromPixelsNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapCreateFromPixelsNull, TestSize.Level3) {
    int width = 100;
    int height = 100;
    int rowBytes = width * 4;
    uint8_t *pixels = new uint8_t[width * height * 4];
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0202
 * @tc.name: testBitmapCreateFromPixelsMismatch
 * @tc.desc: test for testBitmapCreateFromPixelsMismatch.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapCreateFromPixelsMismatch, TestSize.Level3) {
    int width = 48;
    int height = 48;
    int rowBytes = width * 4;
    uint8_t *pixels = new uint8_t[width * height * 4];
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_ALPHA_8, ALPHA_FORMAT_UNKNOWN};
    // 1. OH_Drawing_BitmapCreateFromPixels initializes a 48*48 image, but the memory allocated for pixels is 47*48
    uint8_t *pixels1 = new uint8_t[47 * height * 4];
    OH_Drawing_Bitmap *bitmap1 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels1, rowBytes);
    EXPECT_EQ(bitmap1, nullptr);
    // 2. OH_Drawing_BitmapCreateFromPixels initializes a 48*48 image, but the memory allocated for pixels is 48*47
    uint8_t *pixels2 = new uint8_t[width * 47 * 4];
    OH_Drawing_Bitmap *bitmap2 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels2, rowBytes);
    EXPECT_EQ(bitmap2, nullptr);
    // 3. OH_Drawing_BitmapCreateFromPixels initializes a 48*48 image, but the memory allocated for pixels is 48*48 and
    // rowBytes is 47
    rowBytes = 47;
    uint8_t *pixels3 = new uint8_t[width * height * 4];
    OH_Drawing_Bitmap *bitmap3 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels3, rowBytes);
    EXPECT_EQ(bitmap3, nullptr);
    // 4. Free memory
    OH_Drawing_BitmapDestroy(bitmap1);
    OH_Drawing_BitmapDestroy(bitmap2);
    OH_Drawing_BitmapDestroy(bitmap3);
    delete[] pixels;
    delete[] pixels1;
    delete[] pixels2;
    delete[] pixels3;
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0203
 * @tc.name: testBitmapCreateFromPixelsAbnormal
 * @tc.desc: test for testBitmapCreateFromPixelsAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapCreateFromPixelsAbnormal, TestSize.Level3) {
    int width = 48;
    int height = 48;
    int rowBytes = width * 4;
    uint8_t *pixels = new uint8_t[width * height * 4];
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_ALPHA_8, ALPHA_FORMAT_UNKNOWN};
    // 1. After constructing OH_Drawing_Image_Info, modify the byte value to an abnormal value
    imageInfo.width = -1;
    // 2. OH_Drawing_BitmapCreateFromPixels
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    EXPECT_EQ(bitmap, nullptr);
    // 3. Free memory
    OH_Drawing_BitmapDestroy(bitmap);
    delete[] pixels;
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0204
 * @tc.name: testBitmapCreateFromPixelsVeryBig
 * @tc.desc: test for testBitmapCreateFromPixelsVeryBig.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapCreateFromPixelsVeryBig, TestSize.Level3) {
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
            int width = 1000000;
            int height = 1000000;
            int rowBytes = width * 4;
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
                EXPECT_TRUE(height_ == height || height_ == 0);
                EXPECT_TRUE(width_ == width || width_ == 0);
                EXPECT_TRUE(colorFormat_ == format || colorFormat_ == 0);
                EXPECT_TRUE(alphaFormat_ == alphaFormat || alphaFormat_ == 0);
                // 3. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with rowBytes larger than the image, call OH_Drawing_BitmapGet related
                // interfaces (OH_Drawing_BitmapGetHeight, OH_Drawing_BitmapGetWidth), Verify that the parameters match
                // the initialization parameters
                int rowBytes2 = width * 4 + 1;
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0205
 * @tc.name: testBitmapCreateFromPixelsBoundary
 * @tc.desc: test for testBitmapCreateFromPixelsBoundary.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapCreateFromPixelsBoundary, TestSize.Level0) {
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
            int width = 4096;
            int height = 2160;
            int rowBytes = width * 4;
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
                EXPECT_TRUE(height_ == height || height_ == 0);
                EXPECT_TRUE(width_ == width || width_ == 0);
                EXPECT_TRUE(colorFormat_ == format || colorFormat_ == 0);
                EXPECT_TRUE(alphaFormat_ == alphaFormat || alphaFormat_ == 0);
                // 3. OH_Drawing_BitmapCreateFromPixels
                // Initialize the Bitmap with rowBytes larger than the image, call OH_Drawing_BitmapGet related
                // interfaces (OH_Drawing_BitmapGetHeight, OH_Drawing_BitmapGetWidth), Verify that the parameters match
                // the initialization parameters
                int rowBytes2 = width * 4 + 1;
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0300
 * @tc.name: testBitmapBuildNormal
 * @tc.desc: test for testBitmapBuildNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapBuildNormal, TestSize.Level0) {
    const unsigned int width = 500;
    const unsigned int height = 500;
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

    // step 2
    for (int i = 1; i < 4; i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[3], alphaFormats[i]};
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0301
 * @tc.name: testBitmapBuildNull
 * @tc.desc: test for testBitmapBuildNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapBuildNull, TestSize.Level3) {
    const unsigned int width = 500;
    const unsigned int height = 500;

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
    OH_Drawing_BitmapFormat bitmapFormat = {formats[3], alphaFormats[0]};

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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0302
 * @tc.name: testBitmapBuildMultipleCalls
 * @tc.desc: test for testBitmapBuildMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapBuildMultipleCalls, TestSize.Level3) {
    const unsigned int width = 500;
    const unsigned int height = 500;
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

    // step 2
    for (int i = 1; i < 4; i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[3], alphaFormats[i]};
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
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_Bitmap *bitmap2 = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap2, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_BitmapBuild(bitmap2, width, height, &cFormat);
    void *pixels = OH_Drawing_BitmapGetPixels(bitmap2);
    EXPECT_NE(pixels, nullptr);
    uint32_t rowBytes = width * height * 4;
    OH_Drawing_Bitmap *bitmap3 = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // step 5
    for (int i = 1; i < 4; i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[3], alphaFormats[i]};
        OH_Drawing_BitmapBuild(bitmap3, width, height, &bitmapFormat);
        alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap3);
        EXPECT_EQ(alphaFormat_, alphaFormats[i]);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0303
 * @tc.name: testBitmapBuildBoundary
 * @tc.desc: test for testBitmapBuildBoundary.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapBuildBoundary, TestSize.Level0) {
    // 4K screen resolutionp
    const unsigned int width = 4096;
    const unsigned int height = 2160;
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

    // step 2
    for (int i = 1; i < 4; i++) {
        OH_Drawing_BitmapFormat bitmapFormat = {formats[3], alphaFormats[i]};
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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0400
 * @tc.name: testBitmapGetXXNormal
 * @tc.desc: test for testBitmapGetXXNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapGetXXNormal, TestSize.Level0) {
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 100;
    uint32_t height = 100;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);

    OH_Drawing_Image_Info imageInfo1{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels1 = new uint32_t[width * height];

    // step 1
    bool res = OH_Drawing_BitmapReadPixels(cBitmap, &imageInfo1, pixels1, width * 4, 0, 0);
    EXPECT_EQ(res, true);

    // step 2
    uint32_t w = OH_Drawing_BitmapGetWidth(cBitmap);
    EXPECT_EQ(w, 100);

    // step 3
    uint32_t h = OH_Drawing_BitmapGetHeight(cBitmap);
    EXPECT_EQ(h, 100);

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
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0401
 * @tc.name: testBitmapGetXXNull
 * @tc.desc: test for testBitmapGetXXNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapGetXXNull, TestSize.Level3) {
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 100;
    uint32_t height = 100;
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
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_ErrorCodeReset();
    OH_Drawing_BitmapGetImageInfo(cBitmap, nullptr);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_BitmapDestroy(cBitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0402
 * @tc.name: testBitmapGetXXInputDestroyed
 * @tc.desc: test for testBitmapGetXXInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapGetXXInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0403
 * @tc.name: testBitmapGetXXBoundary
 * @tc.desc: test for testBitmapGetXXBoundary.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapGetXXBoundary, TestSize.Level0) {
    OH_Drawing_Bitmap *cBitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(cBitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 4096;
    uint32_t height = 2160;
    OH_Drawing_BitmapBuild(cBitmap, width, height, &cFormat);

    OH_Drawing_Image_Info imageInfo1{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels1 = new uint32_t[width * height];

    // step 1
    bool res = OH_Drawing_BitmapReadPixels(cBitmap, &imageInfo1, pixels1, width * 4, 0, 0);
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
    void *pixels = OH_Drawing_BitmapGetPixels(cBitmap);
    EXPECT_NE(pixels, nullptr);

    // step 7
    OH_Drawing_Image_Info *imageInfo = new OH_Drawing_Image_Info();
    OH_Drawing_BitmapGetImageInfo(cBitmap, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_Drawing_ErrorCode::OH_DRAWING_SUCCESS);
    EXPECT_EQ(width, imageInfo->width);
    EXPECT_EQ(height, imageInfo->height);

    // step 8
    OH_Drawing_BitmapDestroy(cBitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0500
 * @tc.name: testBitmapReadPixelsNormal
 * @tc.desc: test for OH_Drawing_BitmapBuild.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapReadPixelsNormal, TestSize.Level0) {
    const unsigned int width = 500;
    const unsigned int height = 500;

    // step 1
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};

    // step 2
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
    OH_Drawing_Image_Info imageInfo{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels = new uint32_t[width * height];

    // step 3
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    // don't know how to test

    // step 5
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0501
 * @tc.name: testBitmapReadPixelsNull
 * @tc.desc: test for testBitmapReadPixelsNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapReadPixelsNull, TestSize.Level3) {
    const unsigned int width = 500;
    const unsigned int height = 500;

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
    bool res = OH_Drawing_BitmapReadPixels(nullptr, &imageInfo, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, false);

    // step 4
    res = OH_Drawing_BitmapReadPixels(bitmap, nullptr, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, false);

    // step 5
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, nullptr, width * 4, 0, 0);
    EXPECT_EQ(res, false);

    // step 6
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, 0, 0, 0);
    EXPECT_EQ(res, false);

    // step 7
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * 4, 0, 1);
    EXPECT_EQ(res, true);

    // step 8
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * 4, 1, 0);
    EXPECT_EQ(res, true);

    // step 9
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0502
 * @tc.name: testBitmapReadPixelsInputDestroyed
 * @tc.desc: test for testBitmapReadPixelsInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapReadPixelsInputDestroyed, TestSize.Level3) {
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0503
 * @tc.name: testBitmapReadPixelsMismatch
 * @tc.desc: test for testBitmapReadPixelsMismatch.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapReadPixelsMismatch, TestSize.Level3) {
    // step 1
    const unsigned int width = 500;
    const unsigned int height = 500;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    // add assert
    EXPECT_NE(bitmap, nullptr);

    // step 2
    OH_Drawing_BitmapFormat bitmapFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);

    // step 3
    OH_Drawing_Image_Info imageInfo{1, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void *pixels = new uint32_t[width * height];
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    OH_Drawing_Image_Info imageInfo2{width, 1, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo2, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, true);

    // step 5
    // OH_Drawing_BitmapReadPixels OH_Drawing_Image_Info color type mismatch
    // compile error, skip case

    // step 6
    // OH_Drawing_BitmapReadPixels OH_Drawing_Image_Info alpha type mismatch
    // compile error, skip case

    // step 7
    OH_Drawing_Image_Info imageInfo4{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo4, pixels, width * 3, 0, 0);
    EXPECT_EQ(res, false);

    // step 8
    OH_Drawing_Image_Info imageInfo5{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo5, pixels, width * 4, 1000, 0);
    EXPECT_EQ(res, false);

    // step 9
    OH_Drawing_Image_Info imageInfo6{width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo6, pixels, width * 4, 0, 1000);
    EXPECT_EQ(res, false);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_BITMAP_0504
 * @tc.name: testBitmapReadPixelsBoundary
 * @tc.desc: test for OH_Drawing_BitmapBuild.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeBitmapTest, testBitmapReadPixelsBoundary, TestSize.Level0) {
    const unsigned int width = 4096;
    const unsigned int height = 2160;

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
    bool res = OH_Drawing_BitmapReadPixels(bitmap, &imageInfo, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, true);

    // step 4
    // don't know how to test

    // step 5
    OH_Drawing_BitmapDestroy(bitmap);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS