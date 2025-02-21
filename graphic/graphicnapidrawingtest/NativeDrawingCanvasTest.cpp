/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include "c/drawing_bitmap.h"
#include "c/drawing_brush.h"
#include "c/drawing_canvas.h"
#include "c/drawing_color.h"
#include "c/drawing_color_filter.h"
#include "c/drawing_filter.h"
#include "c/drawing_font.h"
#include "c/drawing_mask_filter.h"
#include "c/drawing_path.h"
#include "c/drawing_pen.h"
#include "c/drawing_point.h"
#include "c/drawing_rect.h"
#include "c/drawing_round_rect.h"
#include "c/drawing_shader_effect.h"
#include "c/drawing_text_blob.h"
#include "c/drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeDrawingCanvasTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    protected:
        OH_Drawing_Canvas *canvas_ = nullptr;
        OH_Drawing_Brush *brush_ = nullptr;
};

void NativeDrawingCanvasTest::SetUpTestCase() {}
void NativeDrawingCanvasTest::TearDownTestCase() {}
void NativeDrawingCanvasTest::SetUp()
{
    canvas_ = OH_Drawing_CanvasCreate();
    ASSERT_NE(nullptr, canvas_);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    brush_ = OH_Drawing_BrushCreate();
    EXPECT_NE(brush_, nullptr);
    OH_Drawing_BrushSetColor(brush_, 0xffff0000);
    OH_Drawing_CanvasAttachBrush(canvas_, brush_);
}

void NativeDrawingCanvasTest::TearDown()
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
 * @tc.name: NativeDrawingCanvasTest_CanvasNULLPTR
 * @tc.desc: test for OH_Drawing_CanvasBind.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_CanvasNULLPTR, TestSize.Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_CanvasBind(nullptr, bitmap);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasAttachPen(canvas_, nullptr);
    OH_Drawing_CanvasTranslate(canvas_, INT32_MIN, INT32_MIN);
    OH_Drawing_CanvasTranslate(canvas_, INT32_MAX, INT32_MAX);
    OH_Drawing_CanvasDrawLine(nullptr, 0, 0, 20, 20);
    OH_Drawing_CanvasDrawLine(canvas_, 0, 0, INT32_MAX, INT32_MAX);
    OH_Drawing_CanvasDrawLine(canvas_, 0, 0, INT32_MIN, INT32_MIN);
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, INT32_MAX, INT32_MIN);
    OH_Drawing_PathMoveTo(nullptr, 9999, -1000);
    OH_Drawing_PathClose(nullptr);
    OH_Drawing_PathClose(path);
    OH_Drawing_CanvasDrawPath(nullptr, path);
    OH_Drawing_CanvasDrawPath(canvas_, nullptr);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: NativeDrawingCanvasTest_CanvasBind
 * @tc.desc: test for OH_Drawing_CanvasBind.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_CanvasBind, TestSize.Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_CanvasBind(canvas_, bitmap);
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.name: NativeDrawingCanvasTest_canvas002
 * @tc.desc: test for OH_Drawing_CanvasAttachPen & OH_Drawing_CanvasDetachPen.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_canvas002, TestSize.Level1)
{
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    EXPECT_NE(pen, nullptr);
    OH_Drawing_CanvasAttachPen(canvas_, pen);
    OH_Drawing_CanvasDetachPen(canvas_);
    OH_Drawing_PenDestroy(pen);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawLine
 * @tc.desc: test for OH_Drawing_CanvasDrawLine.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawLine, TestSize.Level1)
{
    OH_Drawing_CanvasDrawLine(canvas_, 0, 0, 20, 20);
    OH_Drawing_CanvasDrawLine(canvas_, -15.2f, -1, 0, 20);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawPath
 * @tc.desc: test for OH_Drawing_CanvasDrawPath.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawPath, TestSize.Level1)
{
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    EXPECT_NE(path, nullptr);
    constexpr int height = 300;
    constexpr int width = 300;
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
 * @tc.name: NativeDrawingCanvasTest_SaveAndRestore
 * @tc.desc: test for OH_Drawing_CanvasSave & OH_Drawing_CanvasRestore.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_SaveAndRestore, TestSize.Level1)
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 200, 500, 300);
    EXPECT_NE(nullptr, rect);
    OH_Drawing_CanvasSave(nullptr);
    OH_Drawing_CanvasSave(canvas_);
    OH_Drawing_CanvasTranslate(nullptr, 100, 100);
    OH_Drawing_CanvasTranslate(canvas_, 100, 100);
    OH_Drawing_CanvasDrawArc(nullptr, rect, 10, 200);
    OH_Drawing_CanvasDrawArc(canvas_, nullptr, 10, 200);
    OH_Drawing_CanvasDrawArc(canvas_, rect, 10, 200);
    OH_Drawing_CanvasRestore(nullptr);
    OH_Drawing_CanvasRestore(canvas_);
    OH_Drawing_CanvasTranslate(canvas_, 200, 200);
    OH_Drawing_CanvasDrawOval(nullptr, rect);
    OH_Drawing_CanvasDrawOval(canvas_, nullptr);
    OH_Drawing_CanvasDrawOval(canvas_, rect);
    OH_Drawing_RectDestroy(nullptr);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.name: NativeDrawingCanvasTest_Clear
 * @tc.desc: test for OH_Drawing_CanvasClear.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_Clear, TestSize.Level1)
{
    OH_Drawing_CanvasClear(nullptr, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
    OH_Drawing_CanvasClear(canvas_, -100);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(INT32_MAX, INT32_MAX, INT32_MIN, INT32_MIN));
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0x00, 0x00));
}

/*
 * @tc.name: NativeDrawingCanvasTest_RestoreToCount
 * @tc.desc: test for OH_Drawing_CanvasRestoreToCount.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_RestoreToCount, TestSize.Level1)
{
    OH_Drawing_CanvasSave(canvas_);
    OH_Drawing_CanvasTranslate(canvas_, 300, 300);
    OH_Drawing_CanvasSave(canvas_);
    OH_Drawing_CanvasTranslate(canvas_, 100, 100);
    OH_Drawing_CanvasSave(canvas_);
    OH_Drawing_CanvasTranslate(canvas_, 100, 100);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    int count = OH_Drawing_CanvasGetSaveCount(canvas_);
    EXPECT_EQ(count, 4);
    OH_Drawing_CanvasRestoreToCount(nullptr, count - 2);
    OH_Drawing_CanvasRestoreToCount(canvas_, count - 2);
    EXPECT_EQ(2, OH_Drawing_CanvasGetSaveCount(canvas_));
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(nullptr, 20, 20);
    EXPECT_EQ(roundRect, nullptr);
    roundRect = OH_Drawing_RoundRectCreate(rect, 20, 20);
    EXPECT_NE(roundRect, nullptr);
    OH_Drawing_CanvasDrawRoundRect(nullptr, roundRect);
    OH_Drawing_CanvasDrawRoundRect(canvas_, nullptr);
    OH_Drawing_CanvasDrawRoundRect(canvas_, roundRect);
    OH_Drawing_CanvasRestoreToCount(canvas_, 1);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RoundRectDestroy(nullptr);
    OH_Drawing_RectDestroy(nullptr);
}

/*
 * @tc.name: NativeDrawingCanvasTest_Scale
 * @tc.desc: test for OH_Drawing_CanvasScale.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_Scale, TestSize.Level1)
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 20, 60, 120);
    OH_Drawing_CanvasTranslate(canvas_, 20, 20);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_CanvasScale(nullptr, 2, .5f);
    OH_Drawing_CanvasScale(canvas_, 2, .5f);
    OH_Drawing_BrushSetColor(nullptr, 0xFF67C23A);
    OH_Drawing_BrushSetColor(brush_, 0xFF67C23A);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ClipRect
 * @tc.desc: test for OH_Drawing_CanvasClipRect.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ClipRect, TestSize.Level1)
{
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 90, 90);
    OH_Drawing_CanvasRotate(nullptr, 10, 0, 0);
    OH_Drawing_CanvasRotate(canvas_, 10, 0, 0);
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    OH_Drawing_BrushSetAntiAlias(nullptr, true);
    OH_Drawing_BrushSetAntiAlias(brush_, true);
    for (auto alias : {false, true}) {
        OH_Drawing_CanvasSave(canvas_);
        OH_Drawing_CanvasClipRect(nullptr, rect, OH_Drawing_CanvasClipOp::INTERSECT, alias);
        OH_Drawing_CanvasClipRect(canvas_, nullptr, OH_Drawing_CanvasClipOp::INTERSECT, alias);
        OH_Drawing_CanvasClipRect(canvas_, rect, OH_Drawing_CanvasClipOp::INTERSECT, alias);
        OH_Drawing_CanvasDrawCircle(canvas_, nullptr, 60);
        OH_Drawing_CanvasDrawCircle(nullptr, point, 60);
        OH_Drawing_CanvasDrawCircle(canvas_, point, 60);
        OH_Drawing_CanvasRestore(canvas_);
        OH_Drawing_CanvasTranslate(canvas_, 80, 0);
    }
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PointDestroy(point);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ClipPath
 * @tc.desc: test for OH_Drawing_CanvasClipPath.
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ClipPath, TestSize.Level1)
{
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_PathMoveTo(path, 100, 300);
    OH_Drawing_PathLineTo(path, 200, 300);
    OH_Drawing_PathLineTo(path, 200, 400);
    OH_Drawing_PathLineTo(path, 100, 350);
    OH_Drawing_PathClose(nullptr);
    OH_Drawing_PathClose(path);
    OH_Drawing_CanvasClipPath(nullptr, path, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    OH_Drawing_CanvasClipPath(canvas_, nullptr, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    OH_Drawing_CanvasClipPath(canvas_, path, OH_Drawing_CanvasClipOp::DIFFERENCE, true);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(100, 300, 200, 400);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PathDestroy(path);
}

/*
 * @tc.name: NativeDrawingCanvasTest_LinearGradient
 * @tc.desc: test for LinearGradient
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_LinearGradient, TestSize.Level1)
{
    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect* linearGradient = OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt,
        color, pos, 2, OH_Drawing_TileMode::CLAMP);
    OH_Drawing_BrushSetShaderEffect(nullptr, linearGradient);
    OH_Drawing_BrushSetShaderEffect(brush_, nullptr);
    OH_Drawing_BrushSetShaderEffect(brush_, linearGradient);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ShaderEffectDestroy(nullptr);
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
}

/*
 * @tc.name: NativeDrawingCanvasTest_SweepGradient
 * @tc.desc: test for sweep gradient shader effect
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_SweepGradient, TestSize.Level1)
{
    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(350, 450);
    uint32_t colors[] = {0xffff00ff, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect* sweepGradient = OH_Drawing_ShaderEffectCreateSweepGradient(nullptr, nullptr,
        nullptr, -2, OH_Drawing_TileMode::MIRROR);
    EXPECT_EQ(sweepGradient, nullptr);
    sweepGradient = OH_Drawing_ShaderEffectCreateSweepGradient(centerPt, colors,
        pos, 2, OH_Drawing_TileMode::MIRROR);
    EXPECT_NE(sweepGradient, nullptr);
    OH_Drawing_BrushSetShaderEffect(brush_, sweepGradient);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(300, 400, 500, 500);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ShaderEffectDestroy(sweepGradient);
    OH_Drawing_PointDestroy(centerPt);
}

/*
 * @tc.name: NativeDrawingCanvasTest_RadialGradient
 * @tc.desc: test for Radial gradient shader effect
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_RadialGradient, TestSize.Level1)
{
    OH_Drawing_Point* centerPt = OH_Drawing_PointCreate(350, 450);
    uint32_t colors[] = {0xffff00ff, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect* radialGradient = OH_Drawing_ShaderEffectCreateRadialGradient(nullptr, 20,
        nullptr, nullptr, -2, OH_Drawing_TileMode::MIRROR);
    EXPECT_EQ(radialGradient, nullptr);
    radialGradient = OH_Drawing_ShaderEffectCreateRadialGradient(centerPt, 30, colors,
        pos, 2, OH_Drawing_TileMode::MIRROR);
    EXPECT_NE(radialGradient, nullptr);
    OH_Drawing_BrushSetShaderEffect(brush_, radialGradient);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(300, 400, 500, 500);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ShaderEffectDestroy(radialGradient);
    OH_Drawing_PointDestroy(centerPt);
}

/*
 * @tc.name: NativeDrawingCanvasTest_MaskFilter
 * @tc.desc: test for maskfilter
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_MaskFilter, TestSize.Level1)
{
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush_), 0xFFFF0000);
    OH_Drawing_MaskFilter* maskFilter = OH_Drawing_MaskFilterCreateBlur(OH_Drawing_BlurType::NORMAL, 10, true);
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    OH_Drawing_FilterSetMaskFilter(nullptr, maskFilter);
    OH_Drawing_FilterSetMaskFilter(filter, nullptr);
    OH_Drawing_FilterSetMaskFilter(filter, maskFilter);
    OH_Drawing_BrushSetFilter(brush_, filter);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_MaskFilterDestroy(maskFilter);
    OH_Drawing_FilterDestroy(filter);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ColorFilter
 * @tc.desc: test for colorfilter create blend mode, linear to srgb gamma, luma, matrix
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ColorFilterCreateBlendMode, TestSize.Level1)
{
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush_), 0xFFFF0000);
    OH_Drawing_ColorFilter* colorFilter = OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff,
        OH_Drawing_BlendMode::BLEND_MODE_SRC);
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    OH_Drawing_FilterSetColorFilter(nullptr, colorFilter);
    OH_Drawing_FilterSetColorFilter(filter, nullptr);
    OH_Drawing_FilterSetColorFilter(filter, colorFilter);
    OH_Drawing_BrushSetFilter(brush_, nullptr);
    OH_Drawing_BrushSetFilter(brush_, filter);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_ColorFilter* linear = OH_Drawing_ColorFilterCreateLinearToSrgbGamma();
    OH_Drawing_FilterSetColorFilter(filter, linear);
    OH_Drawing_CanvasTranslate(canvas_, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_ColorFilter* luma = OH_Drawing_ColorFilterCreateLuma();
    OH_Drawing_FilterSetColorFilter(filter, luma);
    OH_Drawing_CanvasTranslate(canvas_, 200, 200);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    const float matrix[20] = {
        1, 0, 0, 0, 0,
        0, 1, 0, 0, 0,
        0, 0, 1, 0, 0,
        0, 0, 0, 0.5f, 0
    };
    OH_Drawing_ColorFilter* matrixFilter = OH_Drawing_ColorFilterCreateMatrix(nullptr);
    EXPECT_EQ(matrixFilter, nullptr);
    matrixFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    EXPECT_NE(matrixFilter, nullptr);
    OH_Drawing_FilterSetColorFilter(filter, matrixFilter);
    OH_Drawing_CanvasTranslate(canvas_, 300, 300);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_ColorFilterDestroy(luma);
    OH_Drawing_ColorFilterDestroy(matrixFilter);
    OH_Drawing_ColorFilterDestroy(linear);
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_FilterDestroy(nullptr);
}

/*
 * @tc.name: NativeDrawingCanvasTest_ColorFilterCreateCompose
 * @tc.desc: test for create compose color filter
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_ColorFilterCreateCompose, TestSize.Level1)
{
    EXPECT_EQ(OH_Drawing_BrushGetColor(brush_), 0xFFFF0000);
    OH_Drawing_ColorFilter* outerFilter = OH_Drawing_ColorFilterCreateLuma();
    OH_Drawing_ColorFilter* innerFilter = OH_Drawing_ColorFilterCreateSrgbGammaToLinear();
    OH_Drawing_ColorFilter* compose = OH_Drawing_ColorFilterCreateCompose(nullptr, nullptr);
    EXPECT_EQ(compose, nullptr);
    compose = OH_Drawing_ColorFilterCreateCompose(outerFilter, innerFilter);
    EXPECT_NE(compose, nullptr);
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    OH_Drawing_FilterSetColorFilter(filter, compose);
    OH_Drawing_BrushSetFilter(brush_, filter);
    OH_Drawing_Canvas* canvas_ = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(200, 500, 300, 600);
    OH_Drawing_CanvasDrawRect(canvas_, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_ColorFilterDestroy(outerFilter);
    OH_Drawing_ColorFilterDestroy(innerFilter);
    OH_Drawing_ColorFilterDestroy(compose);
    OH_Drawing_FilterDestroy(filter);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawBitmap
 * @tc.desc: test for DrawBitmap
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawBitmap, TestSize.Level1)
{
    OH_Drawing_Bitmap* bitmap = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat{COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    constexpr uint32_t width = 200;
    constexpr uint32_t height = 200;
    OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
    OH_Drawing_CanvasBind(canvas_, bitmap);
    OH_Drawing_CanvasDrawBitmap(canvas_, bitmap, 0, 0);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_BitmapDestroy(bitmap);
}

/*
 * @tc.name: NativeDrawingCanvasTest_DrawTextBlob
 * @tc.desc: test for DrawTextBlob
 * @tc.type: FUNC
 * @tc.require: AR000GTO5R
 */
HWTEST_F(NativeDrawingCanvasTest, NativeDrawingCanvasTest_DrawTextBlob, TestSize.Level1)
{
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetFakeBoldText(font, true);
    OH_Drawing_FontSetTextSize(font, 20);
    OH_Drawing_FontSetTextSkewX(font, 0.25);
    OH_Drawing_Typeface *typeSurface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_FontSetTypeface(font, typeSurface);
    auto *builder = OH_Drawing_TextBlobBuilderCreate();
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobBuilderAllocRunPos(nullptr, nullptr, INT32_MAX, nullptr));
    EXPECT_EQ(nullptr, OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, INT32_MIN, nullptr));
    const OH_Drawing_RunBuffer* runBuffer = OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, 9, nullptr);
    ASSERT_NE(runBuffer, nullptr);
    runBuffer->glyphs[0] = 65;
    runBuffer->pos[0] = 0;
    runBuffer->pos[1] = 0;
    runBuffer->glyphs[1] = 227;
    runBuffer->pos[2] = 14.9;
    runBuffer->pos[3] = 0;
    runBuffer->glyphs[2] = 283;
    runBuffer->pos[4] = 25.84;
    runBuffer->pos[5] = 0;
    runBuffer->glyphs[3] = 283;
    runBuffer->pos[6] = 30.62;
    runBuffer->pos[7] = 0;
    runBuffer->glyphs[4] = 299;
    runBuffer->pos[8] = 35.4;
    runBuffer->pos[9] = 0;
    runBuffer->glyphs[5] = 2;
    runBuffer->pos[10] = 47.22;
    runBuffer->pos[11] = 0;
    runBuffer->glyphs[6]= 94;
    runBuffer->pos[12] = 52.62;
    runBuffer->pos[13] = 0;
    runBuffer->glyphs[7] = 37;
    runBuffer->pos[14] = 67.42;
    runBuffer->pos[15] = 0;
    runBuffer->glyphs[8] = 84;
    runBuffer->pos[16] = 81.7;
    runBuffer->pos[17] = 0;
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobBuilderMake(builder);
    OH_Drawing_CanvasDrawTextBlob(canvas_, textBlob, 100, 700);
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_TextBlobBuilderDestroy(builder);
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeSurface);
    OH_Drawing_TextBlobDestroy(nullptr);
    OH_Drawing_TextBlobBuilderDestroy(nullptr);
    OH_Drawing_FontDestroy(nullptr);
    OH_Drawing_TypefaceDestroy(nullptr);
}

/*
 * @tc.name: NativeDrawingTest001
 * @tc.desc: test for fontSetLinearText
 * @tc.type: FUNC
 */
HWTEST_F(NativeDrawingCanvasTest, OH_Drawing_FontSetLinearText_001, TestSize.Level1)
{
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, 20);
    OH_Drawing_FontSetTextSkewX(font, 0.25);
    OH_Drawing_FontSetLinearText(font, true);
    OH_Drawing_FontDestroy(font);
}

/*
 * @tc.name: NativeDrawingTest002
 * @tc.desc: test for penSetFilter
 * @tc.type: FUNC
 */
HWTEST_F(NativeDrawingCanvasTest, OH_Drawing_PenSetFilter_001, TestSize.Level1)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_EQ(canvas == nullptr, false);
    OH_Drawing_ColorFilter* colorFilter = OH_Drawing_ColorFilterCreateBlendMode(0xff0000ff,
        OH_Drawing_BlendMode::BLEND_MODE_SRC);
    OH_Drawing_Filter* filter = OH_Drawing_FilterCreate();
    OH_Drawing_FilterSetColorFilter(filter, colorFilter);
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_PenSetColor(pen, 0xff00ff00);
    OH_Drawing_PenSetFilter(pen, filter);
    OH_Drawing_CanvasAttachPen(canvas, pen);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(100, 400, 200, 500);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_ColorFilterDestroy(colorFilter);
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.name: NativeDrawingTest003
 * @tc.desc: test for penSetFilter
 * @tc.type: FUNC
 */
HWTEST_F(NativeDrawingCanvasTest, OH_Drawing_PenSetshaderEffect, TestSize.Level1)
{
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_EQ(canvas == nullptr, false);
    OH_Drawing_Point* startPt = OH_Drawing_PointCreate(100, 400);
    OH_Drawing_Point* endPt = OH_Drawing_PointCreate(200, 500);
    uint32_t color[] = {0xffff0000, 0xff00ff00};
    float pos[] = {0., 1.0};
    OH_Drawing_ShaderEffect* linearGradient = OH_Drawing_ShaderEffectCreateLinearGradient(startPt, endPt,
        color, pos, 2, OH_Drawing_TileMode::CLAMP);
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    OH_Drawing_PenSetShaderEffect(pen, linearGradient);
    OH_Drawing_CanvasAttachPen(canvas, pen);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(100, 400, 200, 500);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_ShaderEffectDestroy(linearGradient);
    OH_Drawing_PointDestroy(startPt);
    OH_Drawing_PointDestroy(endPt);
    OH_Drawing_CanvasDestroy(canvas);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS