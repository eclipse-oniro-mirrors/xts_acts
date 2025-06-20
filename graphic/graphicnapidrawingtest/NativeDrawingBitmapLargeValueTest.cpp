/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "gtest/gtest.h"

#include "drawing_bitmap.h"
#include "drawing_types.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeDrawingBitmapLargeValueTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    protected:
        OH_Drawing_Bitmap* bitmap_ = nullptr;
};

void NativeDrawingBitmapLargeValueTest::SetUpTestCase() {}
void NativeDrawingBitmapLargeValueTest::TearDownTestCase() {}
void NativeDrawingBitmapLargeValueTest::SetUp()
{
    bitmap_ = OH_Drawing_BitmapCreate();
    ASSERT_NE(bitmap_, nullptr);
}

void NativeDrawingBitmapLargeValueTest::TearDown()
{
    if (bitmap_ != nullptr) {
        OH_Drawing_BitmapDestroy(bitmap_);
        bitmap_ = nullptr;
    }
}

/*
 * @tc.name: NativeDrawingBitmapLargeValueTest_bitmapBuild001
 * @tc.desc: test for drawing_bitmap build.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingBitmapLargeValueTest, NativeDrawingBitmapLargeValueTest_bitmapBuild001,
    Function | MediumTest | Level1)
{
    const unsigned int width = 2160;
    const unsigned int height = 4096;
    OH_Drawing_BitmapFormat bitmapFormat { COLOR_FORMAT_ALPHA_8, ALPHA_FORMAT_PREMUL };
    OH_Drawing_BitmapBuild(bitmap_, width, height, &bitmapFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(bitmap_));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(bitmap_));
}

/*
 * @tc.name: NativeDrawingBitmapLargeValueTest_bitmapBuild003
 * @tc.desc: test for drawing_bitmap build.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingBitmapLargeValueTest, NativeDrawingBitmapLargeValueTest_bitmapBuild003,
    Function | MediumTest | Level1)
{
    const unsigned int width = 2160;
    const unsigned int height = 4096;
    OH_Drawing_BitmapFormat bitmapFormat { COLOR_FORMAT_ARGB_4444, ALPHA_FORMAT_UNPREMUL };
    OH_Drawing_BitmapBuild(bitmap_, width, height, &bitmapFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(bitmap_));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(bitmap_));
    EXPECT_EQ(OH_Drawing_BitmapGetPixels(bitmap_) == nullptr, false);
}

/*
 * @tc.name: NativeDrawingBitmapLargeValueTest_bitmapBuild004
 * @tc.desc: test for drawing_bitmap build.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingBitmapLargeValueTest, NativeDrawingBitmapLargeValueTest_bitmapBuild004,
    Function | MediumTest | Level1)
{
    const unsigned int width = 2160;
    const unsigned int height = 4096;
    OH_Drawing_BitmapFormat bitmapFormat { COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    OH_Drawing_BitmapBuild(bitmap_, width, height, &bitmapFormat);
    EXPECT_EQ(width, OH_Drawing_BitmapGetWidth(bitmap_));
    EXPECT_EQ(height, OH_Drawing_BitmapGetHeight(bitmap_));
}

/*
 * @tc.name: NativeDrawingBitmapLargeValueTest_bitmapCreateFromPixels005
 * @tc.desc: test for OH_Drawing_BitmapCreateFromPixels.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingBitmapLargeValueTest, NativeDrawingBitmapLargeValueTest_bitmapCreateFromPixels005,
    Function | MediumTest | Level1)
{
    OH_Drawing_Image_Info imageInfo;
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 2160;
    constexpr uint32_t height = 4096;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    void* pixels = OH_Drawing_BitmapGetPixels(bitmap);
    EXPECT_NE(pixels, nullptr);
    uint32_t rowBytes = width * height * 4;
    bitmap_ = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    EXPECT_NE(bitmap_, nullptr);
    bitmap_ = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, 0);
    EXPECT_EQ(bitmap_, nullptr);
    bitmap_ = OH_Drawing_BitmapCreateFromPixels(&imageInfo, nullptr, 0);
    EXPECT_EQ(bitmap_, nullptr);
    bitmap_ = OH_Drawing_BitmapCreateFromPixels(nullptr, nullptr, 0);
    EXPECT_EQ(bitmap_, nullptr);
}
/*
 * @tc.name: NativeDrawingBitmapLargeValueTest_bitmapGetImageInfo006
 * @tc.desc: test for drawing_bitmapGetImageInfo.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingBitmapLargeValueTest, NativeDrawingBitmapLargeValueTest_bitmapGetImageInfo006,
    Function | MediumTest | Level1)
{
    const unsigned int width = 2160;
    const unsigned int height = 4096;
    OH_Drawing_BitmapFormat bitmapFormat { COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL };
    OH_Drawing_BitmapBuild(bitmap_, width, height, &bitmapFormat);
    OH_Drawing_Image_Info* imageInfo = new OH_Drawing_Image_Info();
    OH_Drawing_BitmapGetImageInfo(bitmap_, imageInfo);
    EXPECT_EQ(width, imageInfo->width);
    EXPECT_EQ(height, imageInfo->height);
}

/*
 * @tc.name: NativeDrawingBitmapLargeValueTest_BitmapReadPixels007
 * @tc.desc: test for drawing_BitmapReadPixels.
 * @tc.size  : MediumTest
 * @tc.type  : Functionx
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingBitmapLargeValueTest, NativeDrawingBitmapLargeValueTest_BitmapReadPixels007,
    Function | MediumTest | Level1)
{
    const unsigned int width = 2160;
    const unsigned int height = 4096;
    OH_Drawing_BitmapFormat bitmapFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    OH_Drawing_BitmapBuild(bitmap_, width, height, &bitmapFormat);
    OH_Drawing_Image_Info imageInfo {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_UNPREMUL};
    void* pixels = new uint32_t[width * height];
    bool res = OH_Drawing_BitmapReadPixels(nullptr, nullptr, nullptr, width * 4, 0, 0);
    EXPECT_EQ(res, false);
    res = OH_Drawing_BitmapReadPixels(nullptr, &imageInfo, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, false);
    res = OH_Drawing_BitmapReadPixels(bitmap_, nullptr, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, false);
    res = OH_Drawing_BitmapReadPixels(bitmap_, &imageInfo, nullptr, width * 4, 0, 0);
    EXPECT_EQ(res, false);
    res = OH_Drawing_BitmapReadPixels(bitmap_, &imageInfo, pixels, width * 4, 0, 0);
    EXPECT_EQ(res, true);
    if (pixels != nullptr) {
        delete[] reinterpret_cast<uint32_t*>(pixels);
        pixels = nullptr;
    }
}

/*
 * @tc.name: NativeDrawingBitmapLargeValueTest_GetColorFormat008
 * @tc.desc: test for drawing_BitmapGetColorFormat.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingBitmapLargeValueTest, NativeDrawingBitmapLargeValueTest_GetColorFormat008,
    Function | MediumTest | Level1)
{
    const unsigned int width = 2160;
    const unsigned int height = 4096;
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,
        COLOR_FORMAT_ALPHA_8,
        COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444,
        COLOR_FORMAT_RGBA_8888,
        COLOR_FORMAT_BGRA_8888
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL
    };
    OH_Drawing_ColorFormat colorFormat_;
    for (int i = 1; i < 6; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        OH_Drawing_BitmapFormat bitmapFormat = {formats[i], alphaFormats[2]};
        OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
        if (bitmap == nullptr) {
            colorFormat_ = OH_Drawing_BitmapGetColorFormat(bitmap);
            EXPECT_EQ(colorFormat_, formats[0]);
        }
        colorFormat_ = OH_Drawing_BitmapGetColorFormat(bitmap);
        EXPECT_EQ(colorFormat_, formats[i]);
    }
}

/*
 * @tc.name: NativeDrawingBitmapLargeValueTest_GetAlphaFormat009
 * @tc.desc: test for drawing_BitmapGetAlphaFormat.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingBitmapLargeValueTest, NativeDrawingBitmapLargeValueTest_GetAlphaFormat009,
    Function | MediumTest | Level1)
{
    const unsigned int width = 2160;
    const unsigned int height = 4096;
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_UNKNOWN,
        COLOR_FORMAT_ALPHA_8,
        COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444,
        COLOR_FORMAT_RGBA_8888,
        COLOR_FORMAT_BGRA_8888
    };

    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_UNKNOWN,
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL
    };
    OH_Drawing_AlphaFormat alphaFormat_;
    for (int i = 1; i < 4; i++) {
        OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
        OH_Drawing_BitmapFormat bitmapFormat = {formats[3], alphaFormats[i]};
        OH_Drawing_BitmapBuild(bitmap, width, height, &bitmapFormat);
        if (bitmap == nullptr) {
            alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
            EXPECT_EQ(alphaFormat_, alphaFormats[0]);
        }
        alphaFormat_ = OH_Drawing_BitmapGetAlphaFormat(bitmap);
        EXPECT_EQ(alphaFormat_, alphaFormats[i]);
    }
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS