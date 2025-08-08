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
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
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
#include "drawing_memory_stream.h"
#include "effect/color_filter.h"
#include "effect/filter.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeDrawingCanvasLargeValueTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    protected:
        OH_Drawing_Canvas *canvas_ = nullptr;
        OH_Drawing_Brush *brush_ = nullptr;
};

void NativeDrawingCanvasLargeValueTest::SetUpTestCase() {}
void NativeDrawingCanvasLargeValueTest::TearDownTestCase() {}
void NativeDrawingCanvasLargeValueTest::SetUp()
{
    canvas_ = OH_Drawing_CanvasCreate();
    ASSERT_NE(nullptr, canvas_);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    brush_ = OH_Drawing_BrushCreate();
    EXPECT_NE(brush_, nullptr);
    OH_Drawing_BrushSetColor(brush_, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas_, brush_);
}

void NativeDrawingCanvasLargeValueTest::TearDown()
{
    if (canvas_ != nullptr) {
        OH_Drawing_CanvasDetachBrush(canvas_);
        OH_Drawing_BrushDestroy(brush_);
        brush_ = nullptr;
        OH_Drawing_CanvasDestroy(canvas_);
        canvas_ = nullptr;
    }
}

/*
 * @tc.name: NativeDrawingCanvasLargeValueTest_DrawPath005
 * @tc.desc: test for OH_Drawing_CanvasDrawPath.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasLargeValueTest, NativeDrawingCanvasLargeValueTest_DrawPath005,
    Function | MediumTest | Level1)
{
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    constexpr int height = 4096;
    constexpr int width = 2160;
    constexpr float arc = 18.0f;
    int len = height / 4;
    float aX = width / 2;
    float aY = height / 4;
    float dX = aX - len * std::sin(arc);
    float dY = aY + len * std::cos(arc);
    float cX = aX + len * std::sin(arc);
    float cY = dY;
    float bX = aX + (len / 2.0);
    float bY = aY + std::sqrt((cX - dX) * (cX - dX) + (len / 2.0) * (len / 2.0));
    float eX = aX - (len / 2.0);
    float eY = bY;
    OH_Drawing_PathMoveTo(path, aX, aY);
    OH_Drawing_PathLineTo(path, bX, bY);
    OH_Drawing_PathLineTo(path, cX, cY);
    OH_Drawing_PathLineTo(path, dX, dY);
    OH_Drawing_PathLineTo(path, eX, eY);
    OH_Drawing_PathClose(path);
    OH_Drawing_CanvasDrawPath(canvas_, path);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: NativeDrawingCanvasLargeValueTest_DrawBitmap021
 * @tc.desc: test for DrawBitmap
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasLargeValueTest, NativeDrawingCanvasLargeValueTest_DrawBitmap021,
    Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 2160;
    constexpr uint32_t height = 4096;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas_, bitmap);
    OH_Drawing_CanvasDrawBitmap(canvas_, bitmap, 0, 0);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_BitmapDestroy(bitmap);
}
/*
 * @tc.name: NativeDrawingCanvasLargeValueTest_DrawBitmapRect022
 * @tc.desc: test for DrawBitmapRect
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasLargeValueTest, NativeDrawingCanvasLargeValueTest_DrawBitmapRect022,
    Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 2160;
    constexpr uint32_t height = 4096;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_Rect* src = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect* dst = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST, OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    EXPECT_NE(options, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas_, bitmap, src, dst, options);
    OH_Drawing_CanvasDrawBitmapRect(canvas_, bitmap, src, dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas_, bitmap, src, nullptr, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas_, bitmap, nullptr, nullptr, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas_, nullptr, nullptr, nullptr, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(nullptr, nullptr, nullptr, nullptr, nullptr);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.name: NativeDrawingCanvasLargeValueTest_DrawImageRect025
 * @tc.desc: test for DrawImageRect
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasLargeValueTest, NativeDrawingCanvasLargeValueTest_DrawImageRect025,
    Function | MediumTest | Level1)
{
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_Image* image = OH_Drawing_ImageCreate();
    EXPECT_NE(image, nullptr);
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 2160;
    constexpr uint32_t height = 4096;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_ImageBuildFromBitmap(image, bitmap);
    OH_Drawing_SamplingOptions* options = OH_Drawing_SamplingOptionsCreate(
        OH_Drawing_FilterMode::FILTER_MODE_NEAREST, OH_Drawing_MipmapMode::MIPMAP_MODE_NEAREST);
    EXPECT_NE(options, nullptr);
    OH_Drawing_CanvasDrawImageRect(canvas_, image, rect, options);
    OH_Drawing_CanvasDrawImageRect(canvas_, image, rect, nullptr);
    OH_Drawing_CanvasDrawImageRect(canvas_, image, nullptr, nullptr);
    OH_Drawing_CanvasDrawImageRect(canvas_, nullptr, nullptr, nullptr);
    OH_Drawing_CanvasDrawImageRect(nullptr, nullptr, nullptr, nullptr);
    OH_Drawing_CanvasDrawImageRectWithSrc(canvas_, image, rect, rect, options, STRICT_SRC_RECT_CONSTRAINT);
    OH_Drawing_CanvasDrawImageRectWithSrc(nullptr, nullptr, nullptr, nullptr, nullptr, STRICT_SRC_RECT_CONSTRAINT);
    OH_Drawing_SamplingOptionsDestroy(options);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_ImageDestroy(image);
}

/*
 * @tc.name: NativeDrawingCanvasLargeValueTest_ReadPixels027
 * @tc.desc: test for ReadPixels
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeDrawingCanvasLargeValueTest, NativeDrawingCanvasLargeValueTest_ReadPixels027,
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
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixels(canvas_, &imageInfo, pixels, 0, 0, 0));
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixels(canvas_, &imageInfo, nullptr, 0, 0, 0));
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixels(canvas_, nullptr, nullptr, 0, 0, 0));
    EXPECT_TRUE(!OH_Drawing_CanvasReadPixels(nullptr, nullptr, nullptr, 0, 0, 0));
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.name: NativeDrawingCanvasLargeValueTest_IsClipEmpty042
 * @tc.desc: test for if clip is empty
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasLargeValueTest, NativeDrawingCanvasLargeValueTest_IsClipEmpty042,
    Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    // 2160: bitmap's width, 2160: bitmap's height
    constexpr uint32_t width = 2160;
    constexpr uint32_t height = 4096;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas_, bitmap);

    // 150.0f: rect's left, 100.0f: rect's top, 500.0f: rect's right, 500.0f: rect's bottom
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(150.0f, 100.0f, 500.f, 500.f);

    OH_Drawing_CanvasClipRect(canvas_, rect, OH_Drawing_CanvasClipOp::INTERSECT, false);

    bool isClipEmpty = false;
    EXPECT_EQ(OH_Drawing_CanvasIsClipEmpty(canvas_, &isClipEmpty), OH_DRAWING_SUCCESS);
    EXPECT_EQ(isClipEmpty, false);

    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.name: NativeDrawingCanvasLargeValueTest_GetImageInfo043
 * @tc.desc: test for Gets ImageInfo of Canvas.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasLargeValueTest, NativeDrawingCanvasLargeValueTest_GetImageInfo043,
    Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    // 2160: bitmap's width, 2160: bitmap's height
    constexpr uint32_t width = 2160;
    constexpr uint32_t height = 4096;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas_, bitmap);
    OH_Drawing_Image_Info* imageInfo = new OH_Drawing_Image_Info();
    EXPECT_EQ(OH_Drawing_CanvasGetImageInfo(canvas_, imageInfo), OH_DRAWING_SUCCESS);
    EXPECT_EQ(2160, imageInfo->width);
    EXPECT_EQ(4096, imageInfo->height);
    EXPECT_EQ(1, imageInfo->alphaType);
    EXPECT_EQ(4, imageInfo->colorType);
    delete imageInfo;
}


/*
 * @tc.name: NativeDrawingCanvasLargeValueTest_ClipRegion044
 * @tc.desc: test for Drawing Canvas Clip Region.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasLargeValueTest, NativeDrawingCanvasLargeValueTest_ClipRegion044,
    Function | MediumTest | Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 2160; // 2160: width of canvas
    constexpr uint32_t height = 4096; // 4096: height of canvas
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas_, bitmap);

    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    // 0.0f: rect's left, 0.0f: rect's top, 4096.0f: rect's right, 2160.0f: rect's bottom
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 2160.f, 4096.f);
    OH_Drawing_RegionSetRect(region, rect);
    EXPECT_EQ(OH_Drawing_CanvasClipRegion(canvas_, region, OH_Drawing_CanvasClipOp::INTERSECT), OH_DRAWING_SUCCESS);
    EXPECT_EQ(OH_Drawing_CanvasClipRegion(nullptr, region, OH_Drawing_CanvasClipOp::INTERSECT),
        OH_DRAWING_ERROR_INVALID_PARAMETER);

    EXPECT_EQ(2160, OH_Drawing_CanvasGetWidth(canvas_));
    EXPECT_EQ(4096, OH_Drawing_CanvasGetHeight(canvas_));

    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_BitmapDestroy(bitmap);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS