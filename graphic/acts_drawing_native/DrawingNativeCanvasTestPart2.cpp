/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "DrawingNativeCanvasCommon.h"
#include "drawing_bitmap.h"
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_error_code.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_pixel_map.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"
#include "image/pixelmap_native.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1100
 * @tc.name: testCanvasDrawPixelMapRectNormal
 * @tc.desc: test for testCanvasDrawPixelMapRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPixelMapRectNormal, TestSize.Level0)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Obtain OH_Drawing_PixelMap from OH_Drawing_PixelMapGetFromNativePixelMap()

    // 3. Create src and dst using OH_Drawing_RectCreate
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(dst, nullptr);

    // 4. Obtain OH_Drawing_PixelMap from OH_Drawing_PixelMapGetFromOhPixelMapNative
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    // 5. Iterate through OH_Drawing_FilterMode and OH_Drawing_MipmapMode to construct OH_Drawing_SamplingOptions for
    OH_Drawing_FilterMode filterMode[] = {FILTER_MODE_NEAREST, FILTER_MODE_LINEAR};
    OH_Drawing_MipmapMode mode[] = {MIPMAP_MODE_NEAREST, MIPMAP_MODE_LINEAR, MIPMAP_MODE_NONE};
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(filterMode[i], mode[j]);
            OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, options);
        }
    }

    // 6. Free the memory.
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1101
 * @tc.name: testCanvasDrawPixelMapRectNull
 * @tc.desc: test for testCanvasDrawPixelMapRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPixelMapRectNull, TestSize.Level3)
{
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_SamplingOptions *sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);

    OH_Drawing_CanvasDrawPixelMapRect(nullptr, drPixelMap, src, dst, sampleOptions);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, nullptr, src, dst, sampleOptions);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, nullptr, dst, sampleOptions);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, nullptr, sampleOptions);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, nullptr);
    OH_Drawing_PixelMapGetFromNativePixelMap(nullptr);

    float rectParams[][4] = {
        {0, 1, 1, 1}, {1, 0, 1, 1}, {1, 1, 0, 1}, {1, 1, 1, 0}, {0, 0, 0, 0},
    };
    for (int i = 0; i < sizeof(rectParams) / sizeof(rectParams[0]); ++i) {
        OH_Drawing_Rect *src =
            OH_Drawing_RectCreate(rectParams[i][0], rectParams[i][1], rectParams[i][2], rectParams[i][3]);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);

        OH_Drawing_Rect *dst =
            OH_Drawing_RectCreate(rectParams[i][0], rectParams[i][1], rectParams[i][2], rectParams[i][3]);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);

        OH_Drawing_RectDestroy(src);
        OH_Drawing_RectDestroy(dst);
    }

    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1102
 * @tc.name: testCanvasDrawPixelMapRectAbnormal
 * @tc.desc: test for testCanvasDrawPixelMapRectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPixelMapRectAbnormal, TestSize.Level3)
{
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_SamplingOptions *sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    OH_Drawing_CanvasDrawPixelMapRect(nullptr, drPixelMap, src, dst, sampleOptions);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, nullptr, src, dst, sampleOptions);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, nullptr, dst, sampleOptions);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, nullptr, sampleOptions);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, nullptr);
    OH_Drawing_PixelMapGetFromNativePixelMap(nullptr);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    // Define parameter arrays for source and destination rectangles
    int srcRects[][4] = {
        {-1, 1, 1, 1},        {1, -1, 1, 1},        {1, 1, -1, 1},        {1, 1, 1, -1},    {100, 100, 100, 200},
        {100, 200, 200, 200}, {100, 100, 100, 100}, {200, 200, 100, 100}, {0, 0, 100, 100},
    };
    // Loop to draw the first 7 src rectangles
    for (int i = 0; i < 8; i++) {
        src = OH_Drawing_RectCreate(srcRects[i][0], srcRects[i][1], srcRects[i][2], srcRects[i][3]);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);
        OH_Drawing_RectDestroy(src);
    }
    src = OH_Drawing_RectCreate(0, 0, 100, 100);
    int dstRects[][4] = {
        {100, 100, 100, 200},
        {100, 200, 200, 200},
        {100, 100, 100, 100},
        {200, 200, 100, 100},
    };
    // Loop to draw all dst rectangles using the last src rectangle
    for (int i = 0; i < 4; i++) {
        dst = OH_Drawing_RectCreate(dstRects[i][0], dstRects[i][1], dstRects[i][2], dstRects[i][3]);
        OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst, sampleOptions);
        OH_Drawing_RectDestroy(dst);
    }
    OH_Drawing_RectDestroy(src);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1103
 * @tc.name: testCanvasDrawPixelMapRectMaximum
 * @tc.desc: test for testCanvasDrawPixelMapRectMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPixelMapRectMaximum, TestSize.Level3)
{
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative();
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(dst, nullptr);

    OH_Drawing_SamplingOptions *sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // 2
    OH_Drawing_Rect *src1 = OH_Drawing_RectCreate(FLT_MAX, FLT_MAX, 100, 100);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src1, dst, sampleOptions);
    // 3
    OH_Drawing_Rect *src2 = OH_Drawing_RectCreate(0, 0, FLT_MAX, FLT_MAX);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src2, dst, sampleOptions);
    // 4
    OH_Drawing_Rect *dst1 = OH_Drawing_RectCreate(FLT_MAX, FLT_MAX, 100, 100);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst1, sampleOptions);
    // 5
    OH_Drawing_Rect *dst2 = OH_Drawing_RectCreate(0, 0, FLT_MAX, FLT_MAX);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst2, sampleOptions);
    // 6
    OH_Drawing_RectDestroy(src1);
    OH_Drawing_RectDestroy(src2);
    OH_Drawing_RectDestroy(dst1);
    OH_Drawing_RectDestroy(dst2);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1103
 * @tc.name: testCanvasDrawPixelMapRect4KBoundary
 * @tc.desc: test for testCanvasDrawPixelMapRect4KBoundary.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPixelMapRect4KBoundary, TestSize.Level3)
{
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative4KBoundary();
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(dst, nullptr);

    OH_Drawing_SamplingOptions *sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // 2
    OH_Drawing_Rect *src1 = OH_Drawing_RectCreate(FLT_MAX, FLT_MAX, 100, 100);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src1, dst, sampleOptions);
    // 3
    OH_Drawing_Rect *src2 = OH_Drawing_RectCreate(0, 0, FLT_MAX, FLT_MAX);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src2, dst, sampleOptions);
    // 4
    OH_Drawing_Rect *dst1 = OH_Drawing_RectCreate(FLT_MAX, FLT_MAX, 100, 100);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst1, sampleOptions);
    // 5
    OH_Drawing_Rect *dst2 = OH_Drawing_RectCreate(0, 0, FLT_MAX, FLT_MAX);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst2, sampleOptions);
    // 6
    OH_Drawing_RectDestroy(src1);
    OH_Drawing_RectDestroy(src2);
    OH_Drawing_RectDestroy(dst1);
    OH_Drawing_RectDestroy(dst2);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1104
 * @tc.name: testCanvasDrawPixelMapRectInputDestroyed
 * @tc.desc: test for testCanvasDrawPixelMapRectInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPixelMapRectInputDestroyed, TestSize.Level3)
{
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1200
 * @tc.name: testCanvasDrawBackgroundNormal
 * @tc.desc: test for testCanvasDrawBackgroundNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBackgroundNormal, TestSize.Level0)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 3. OH_Drawing_CanvasDrawBackground
    OH_Drawing_CanvasDrawBackground(canvas, brush);

    // 4. Free the memory.
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1201
 * @tc.name: testCanvasDrawBackgroundNull
 * @tc.desc: test for testCanvasDrawBackgroundNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBackgroundNull, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 3. Pass an empty value as the first argument for OH_Drawing_CanvasDrawBackground.
    OH_Drawing_CanvasDrawBackground(nullptr, brush);

    // 4. Pass an empty value as the second argument for OH_Drawing_CanvasDrawBackground.
    OH_Drawing_CanvasDrawBackground(canvas, nullptr);

    // 5. Free the memory.
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1202
 * @tc.name: testCanvasDrawBackgroundInputDestroyed
 * @tc.desc: test for testCanvasDrawBackgroundInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBackgroundInputDestroyed, TestSize.Level3)
{
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1203
 * @tc.name: testCanvasDrawBackgroundMultipleCalls
 * @tc.desc: test for testCanvasDrawBackgroundMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBackgroundMultipleCalls, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BrushCreate
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    EXPECT_NE(brush, nullptr);

    // 3. OH_Drawing_CanvasDrawBackground, 10 times.
    for (int i = 0; i < 10; i++) {
        OH_Drawing_CanvasDrawBackground(canvas, brush);
    }

    // 4. Free the memory.
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1300
 * @tc.name: testCanvasDrawRegionNormal
 * @tc.desc: test for testCanvasDrawRegionNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawRegionNormal, TestSize.Level0)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_RegionCreate
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);

    // 3. OH_Drawing_RegionSetRect
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    OH_Drawing_RegionSetRect(region, rect);

    // 4. OH_Drawing_CanvasDrawRegion
    OH_Drawing_CanvasDrawRegion(canvas, region);

    // 5. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1301
 * @tc.name: testCanvasDrawRegionNull
 * @tc.desc: test for testCanvasDrawRegionNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawRegionNull, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_RegionCreate
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    EXPECT_NE(region, nullptr);

    // 3. OH_Drawing_CanvasDrawRegion, first parameter is nullptr
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0.0f, 0.0f, 256.0f, 256.0f);
    OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_CanvasDrawRegion(nullptr, region);

    // 4. OH_Drawing_CanvasDrawRegion, second parameter is nullptr
    OH_Drawing_CanvasDrawRegion(canvas, nullptr);

    // 5. OH_Drawing_CanvasDrawRegion, region is empty
    OH_Drawing_Region *region2 = OH_Drawing_RegionCreate();
    OH_Drawing_CanvasDrawRegion(canvas, region2);

    // 6. Free the memory.
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
    OH_Drawing_RegionDestroy(region2);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1302
 * @tc.name: testCanvasDrawRegionInputDestroyed
 * @tc.desc: test for testCanvasDrawRegionInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawRegionInputDestroyed, TestSize.Level3)
{
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1400
 * @tc.name: testCanvasDrawPointsNormal
 * @tc.desc: test for testCanvasDrawPointsNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPointsNormal, TestSize.Level0)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_Point2D creates an array of points.
    OH_Drawing_Point2D point = {250, 500};
    OH_Drawing_Point2D points1[1] = {point};

    // 3. OH_Drawing_CanvasDrawPoints iterates through the enum values OH_Drawing_PointMode, with count set to the
    // length of the corresponding value.
    OH_Drawing_PointMode modeArray[3] = {POINT_MODE_POINTS, POINT_MODE_LINES, POINT_MODE_POLYGON};
    for (int i = 0; i < 3; i++) {
        OH_Drawing_CanvasDrawPoints(canvas, modeArray[i], 1, points1);
    }

    // 4. OH_Drawing_Point2D creates an array of multiple points.
    OH_Drawing_Point2D pointOne = {250, 500};
    OH_Drawing_Point2D pointTwo = {200, 500};
    OH_Drawing_Point2D pointThree = {500, 700};
    OH_Drawing_Point2D points2[3] = {pointOne, pointTwo, pointThree};

    // 5. OH_Drawing_CanvasDrawPoints iterates through the enum values OH_Drawing_PointMode, with count set to the
    // length of the corresponding value.
    for (int i = 0; i < 3; i++) {
        OH_Drawing_CanvasDrawPoints(canvas, modeArray[i], 3, points2);
    }

    // 6. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1401
 * @tc.name: testCanvasDrawPointsNull
 * @tc.desc: test for testCanvasDrawPointsNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPointsNull, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_Drawing_Point2D pointOne = {250, 500};
    OH_Drawing_Point2D pointTwo = {200, 500};
    OH_Drawing_Point2D pointThree = {500, 700};
    OH_Drawing_Point2D points[3] = {pointOne, pointTwo, pointThree};
    OH_Drawing_Point2D pointsEmpty[0] = {};

    // 2. Pass an empty value as the first argument for OH_Drawing_CanvasDrawPoints.
    OH_Drawing_CanvasDrawPoints(nullptr, POINT_MODE_LINES, 3, points);

    // 3. Set the third argument of OH_Drawing_CanvasDrawPoints to 0.
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 0, points);

    // 4. Pass an empty array as the fourth argument for OH_Drawing_CanvasDrawPoints.
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 3, pointsEmpty);

    // 5. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1402
 * @tc.name: testCanvasDrawPointsAbnormal
 * @tc.desc: test for testCanvasDrawPointsAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPointsAbnormal, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass a negative value for the count parameter in OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne = {250, 500};
    OH_Drawing_Point2D pointTwo = {200, 500};
    OH_Drawing_Point2D pointThree = {500, 700};
    OH_Drawing_Point2D points[3] = {pointOne, pointTwo, pointThree};

    if (0) {
        // todo cpp crash
        // libc++abi: terminating due to uncaught exception of type std::bad_alloc: std::bad_alloc
        OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, -1, points);
    }

    // 3. Pass a floating-point value for the count parameter in OH_Drawing_CanvasDrawPoints.
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1.0f, points);

    // 4. Set the x-coordinate of the point in OH_Drawing_Point2D parameter to a negative number in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point1 = {-250, 500};
    OH_Drawing_Point2D points1[1] = {point1};
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points1);

    // 5. Set the y-coordinate of the point in OH_Drawing_Point2D parameter to a negative number in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point2 = {250, -500};
    OH_Drawing_Point2D points2[1] = {point2};
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points2);

    // 6. Set both the x and y coordinates of the point in OH_Drawing_Point2D parameter to negative numbers in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point3 = {-250, -500};
    OH_Drawing_Point2D points3[1] = {point3};
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points3);

    // 7. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1403
 * @tc.name: testCanvasDrawPointsMismatch
 * @tc.desc: test for testCanvasDrawPointsMismatch.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPointsMismatch, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass an array of OH_Drawing_Point2D with a length of 1 and pass 2 as the count parameter in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne = {250, 500};
    OH_Drawing_Point2D points1[1] = {pointOne};
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 2, points1);

    // 3. Pass an array of OH_Drawing_Point2D with a length of 3 and pass 1 as the count parameter in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne1 = {250, 500};
    OH_Drawing_Point2D pointTwo1 = {200, 500};
    OH_Drawing_Point2D pointThree1 = {500, 700};
    OH_Drawing_Point2D points2[3] = {pointOne1, pointTwo1, pointThree1};
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points2);

    // 4. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1404
 * @tc.name: testCanvasDrawPointsMaximum
 * @tc.desc: test for testCanvasDrawPointsMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPointsMaximum, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. Pass an extremely large value for the count parameter in OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D pointOne = {250, 500};
    OH_Drawing_Point2D pointTwo = {200, 500};
    OH_Drawing_Point2D pointThree = {500, 700};
    OH_Drawing_Point2D points[3] = {pointOne, pointTwo, pointThree};
    if (0) {
        // todo cpp crash
        // libc++abi: terminating due to uncaught exception of type std::bad_alloc: std::bad_alloc
        OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, INT32_MAX, points);
    }

    // 3. Set the x-coordinate of the point in OH_Drawing_Point2D parameter to an extremely large value in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point1 = {INT32_MAX, 500};
    OH_Drawing_Point2D points1[1] = {point1};
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points1);

    // 4. Set the y-coordinate of the point in OH_Drawing_Point2D parameter to an extremely large value in
    // OH_Drawing_CanvasDrawPoints.
    OH_Drawing_Point2D point2 = {250, INT32_MAX};
    OH_Drawing_Point2D points2[1] = {point2};
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_LINES, 1, points2);

    // 5. Free the memory.
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1405
 * @tc.name: testCanvasDrawPointsInputDestroyed
 * @tc.desc: test for testCanvasDrawPointsInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPointsInputDestroyed, TestSize.Level3)
{
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1500
 * @tc.name: testCanvasDrawBitmapNormal
 * @tc.desc: test for testCanvasDrawBitmapNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapNormal, TestSize.Level0)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);

    // 3. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);

    // 4. OH_Drawing_BitmapCreateFromPixels, iterate through OH_Drawing_ColorFormat and OH_Drawing_AlphaFormat to
    // construct OH_Drawing_Image_Info.
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

    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 4; j++) {
            int width = 500;
            int height = 500;
            int rowBytes = width * height * 4;
            OH_Drawing_Image_Info imageInfo = {width, height, formats[i], alphaFormats[j]};
            OH_Drawing_BitmapFormat cFormat{formats[i], alphaFormats[j]};
            OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
            void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
            bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
            // 5. OH_Drawing_CanvasDrawBitmap
            OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }

    // 6. OH_Drawing_BitmapCreateFromPixels, initialize the Bitmap with rowBytes greater than the image.
    int width = 500;
    int height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN};
    int rowBytes = 600 * 600 * 4;
    void *pixels = new int[width * height];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // 7. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);

    // 8. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1501
 * @tc.name: testCanvasDrawBitmapNull
 * @tc.desc: test for testCanvasDrawBitmapNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapNull, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);

    // 3. The first parameter in OH_Drawing_CanvasDrawBitmap is empty.
    OH_Drawing_CanvasDrawBitmap(nullptr, bitmap, 0, 0);

    // 4. The second parameter in OH_Drawing_CanvasDrawBitmap is empty.
    OH_Drawing_CanvasDrawBitmap(canvas, nullptr, 0, 0);

    // 5. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, and allocate memory for pixels
    // as 47*48.
    int width = 48;
    int height = 48;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN};
    int rowBytes = width * height * 4;
    void *pixels = new int[47 * 48];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // 6. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    OH_Drawing_BitmapDestroy(bitmap);

    // 7. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, and allocate memory for pixels
    // as 48*47.
    width = 48;
    height = 48;
    imageInfo = {width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN};
    rowBytes = width * height * 4;
    pixels = new int[48 * 47];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // 8. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    OH_Drawing_BitmapDestroy(bitmap);

    // 9. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, allocate memory for pixels as
    // 48*48, and set rowBytes as 47.
    width = 48;
    height = 48;
    imageInfo = {width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN};
    rowBytes = 47;
    pixels = new int[48 * 48];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // 10. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);

    // 11. The third parameter in OH_Drawing_CanvasDrawBitmap is 0.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);

    // 12. The fourth parameter in OH_Drawing_CanvasDrawBitmap is 0.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);

    // 13. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1502
 * @tc.name: testCanvasDrawBitmapAbnormal
 * @tc.desc: test for testCanvasDrawBitmapAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapAbnormal, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);

    // 3. The x-coordinate of the top-left corner of the bitmap object in OH_Drawing_CanvasDrawBitmap is negative.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, -1, 0);

    // 4. The y-coordinate of the top-left corner of the bitmap object in OH_Drawing_CanvasDrawBitmap is negative.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, -1);

    // 5. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1503
 * @tc.name: testCanvasDrawBitmapMaximum
 * @tc.desc: test for testCanvasDrawBitmapMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapMaximum, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);

    // 3. The x-coordinate of the top-left corner of the bitmap object in OH_Drawing_CanvasDrawBitmap is set to a very
    // large value.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, FLT_MAX, 0);

    // 4. The y-coordinate of the top-left corner of the bitmap object in OH_Drawing_CanvasDrawBitmap is set to a very
    // large value.
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, FLT_MAX);

    // 5. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1504
 * @tc.name: testCanvasDrawBitmapInputDestroyed
 * @tc.desc: test for testCanvasDrawBitmapInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapInputDestroyed, TestSize.Level3)
{
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1505
 * @tc.name: testCanvasDrawBitmapBoundary
 * @tc.desc: test for testCanvasDrawBitmapBoundary.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapBoundary, TestSize.Level0)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);

    // 3. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);

    // 4. OH_Drawing_BitmapCreateFromPixels, iterate through OH_Drawing_ColorFormat and OH_Drawing_AlphaFormat to
    // construct OH_Drawing_Image_Info.
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

    int width = 4096;
    int height = 2160;
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 4; j++) {
            int rowBytes = width * height * 4;
            OH_Drawing_Image_Info imageInfo = {width, height, formats[i], alphaFormats[j]};
            OH_Drawing_BitmapFormat cFormat{formats[i], alphaFormats[j]};
            OH_Drawing_BitmapBuild(bitmap, width, height, &cFormat);
            void *pixels = OH_Drawing_BitmapGetPixels(bitmap);
            bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
            // 5. OH_Drawing_CanvasDrawBitmap
            OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
            OH_Drawing_BitmapDestroy(bitmap);
        }
    }

    // 6. OH_Drawing_BitmapCreateFromPixels, initialize the Bitmap with rowBytes greater than the image.
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN};
    int rowBytes = 600 * 600 * 4;
    void *pixels = new int[width * height];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // 7. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);

    // 8. Free the memory.
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1600
 * @tc.name: testCanvasDrawBitmapRectNormal
 * @tc.desc: test for testCanvasDrawBitmapRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapRectNormal, TestSize.Level0)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    // 3. OH_Drawing_RectCreate src and dst
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 4. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    // 5. OH_Drawing_CanvasDrawBitmapRect, iterate through OH_Drawing_FilterMode and OH_Drawing_MipmapMode to construct
    // OH_Drawing_SamplingOptions
    OH_Drawing_FilterMode filterMode[] = {FILTER_MODE_NEAREST, FILTER_MODE_LINEAR};
    OH_Drawing_MipmapMode mode[] = {MIPMAP_MODE_NEAREST, MIPMAP_MODE_LINEAR, MIPMAP_MODE_NONE};
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(filterMode[i], mode[j]);
            OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
    // 6. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    OH_Drawing_BitmapDestroy(bitmap);
    // 7. OH_Drawing_BitmapCreateFromPixels, initialize Bitmap with a rowBytes larger than the image
    int width = 500;
    int height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN};
    int rowBytes = 600 * 600 * 4;
    void *pixels = new int[width * height];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // 8. OH_Drawing_CanvasDrawBitmapRect, iterate through OH_Drawing_FilterMode and OH_Drawing_MipmapMode to construct
    // OH_Drawing_SamplingOptions
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(filterMode[i], mode[j]);
            OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
    // 9. CanvasDrawBitmapRect with src parameter set to nullptr
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_LINEAR);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, nullptr, dst, options);
    // 10. Free memory
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_SamplingOptionsDestroy(options);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1601
 * @tc.name: testCanvasDrawBitmapRectNull
 * @tc.desc: test for testCanvasDrawBitmapRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapRectNull, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_BitmapCreate, OH_Drawing_SamplingOptionsCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_LINEAR);

    // 3. OH_Drawing_CanvasDrawBitmapRect with the first parameter set to nullptr
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(nullptr, bitmap, src, dst, options);

    // 4. OH_Drawing_CanvasDrawBitmapRect with the second parameter set to nullptr
    OH_Drawing_CanvasDrawBitmapRect(canvas, nullptr, src, dst, options);

    // 5. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, and allocate memory for pixels
    // as 47*48.
    int width = 48;
    int height = 48;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN};
    int rowBytes = width * height * 4;
    void *pixels = new int[47 * 48];
    OH_Drawing_BitmapDestroy(bitmap);
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // 6. OH_Drawing_CanvasDrawBitmapRect
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);

    // 7. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, and allocate memory for pixels
    // as 48*47.
    width = 48;
    height = 48;
    imageInfo = {width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN};
    rowBytes = width * height * 4;
    pixels = new int[48 * 47];
    OH_Drawing_BitmapDestroy(bitmap);
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // 8. OH_Drawing_CanvasDrawBitmapRect
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);

    // 9. OH_Drawing_BitmapCreateFromPixels, initialize the image with a size of 48*48, allocate memory for pixels as
    // 48*48, and set rowBytes as 47.
    width = 48;
    height = 48;
    imageInfo = {width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN};
    rowBytes = 47;
    pixels = new int[48 * 48];
    OH_Drawing_BitmapDestroy(bitmap);
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);

    // 10. OH_Drawing_CanvasDrawBitmapRect
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);

    // 11. OH_Drawing_CanvasDrawBitmapRect with the fourth parameter set to nullptr
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, nullptr);

    // 12. OH_Drawing_CanvasDrawBitmapRect with the fifth parameter set to nullptr
    // error: no matching function for call to 'OH_Drawing_CanvasDrawBitmapRect'

    // 13. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(options);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1602
 * @tc.name: testCanvasDrawBitmapRectAbnormal
 * @tc.desc: test for testCanvasDrawBitmapRectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapRectAbnormal, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BitmapCreate, OH_Drawing_SamplingOptionsCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_LINEAR);
    // 3. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect created with negative values for left, top, right, bottom
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(-100, -100, -50, -50);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(-100, -100, -50, -50);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 4. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect src created with the top-left coordinate equal to the
    // bottom-right coordinate
    src = OH_Drawing_RectCreate(100, 100, 100, 100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 5. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect src created with the top-left coordinate greater than the
    // bottom-right coordinate
    src = OH_Drawing_RectCreate(200, 200, 100, 100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 6. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect dst created with the top-left coordinate equal to the
    // bottom-right coordinate
    dst = OH_Drawing_RectCreate(100, 100, 100, 100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 7. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect dst created with the top-left coordinate greater than the
    // bottom-right coordinate
    dst = OH_Drawing_RectCreate(200, 200, 100, 100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 8. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect dst created with the top-left coordinate equal to the
    // bottom-right coordinate
    dst = OH_Drawing_RectCreate(100, 100, 100, 100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 9. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect dst created with the top-left coordinate greater than the
    // bottom-right coordinate
    dst = OH_Drawing_RectCreate(200, 200, 100, 100);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 10. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(options);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1603
 * @tc.name: testCanvasDrawBitmapRectMaximum
 * @tc.desc: test for testCanvasDrawBitmapRectMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapRectMaximum, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BitmapCreate, OH_Drawing_SamplingOptionsCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_LINEAR);
    // 3. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect src created with maximum values for the top-left
    // coordinate
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(FLT_MAX, FLT_MAX, 200, 200);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 4. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect src created with maximum values for the top-right
    // coordinate
    src = OH_Drawing_RectCreate(0, 0, FLT_MAX, FLT_MAX);
    EXPECT_NE(src, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 5. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect dst created with maximum values for the top-left
    // coordinate
    dst = OH_Drawing_RectCreate(FLT_MAX, FLT_MAX, 200, 200);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 6. OH_Drawing_CanvasDrawBitmapRect with OH_Drawing_Rect dst created with maximum values for the top-right
    // coordinate
    dst = OH_Drawing_RectCreate(0, 0, FLT_MAX, FLT_MAX);
    EXPECT_NE(dst, nullptr);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(options);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1604
 * @tc.name: testCanvasDrawBitmapRectInputDestroyed
 * @tc.desc: test for testCanvasDrawBitmapRectInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapRectInputDestroyed, TestSize.Level3)
{
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1605
 * @tc.name: testCanvasDrawBitmapRectBoundary
 * @tc.desc: test for testCanvasDrawBitmapRectBoundary.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawBitmapRectBoundary, TestSize.Level0)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_BitmapCreate
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    EXPECT_NE(bitmap, nullptr);
    // 3. OH_Drawing_RectCreate src and dst
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 100, 100);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 100, 100);
    // 4. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    // 5. OH_Drawing_CanvasDrawBitmapRect, iterate through OH_Drawing_FilterMode and OH_Drawing_MipmapMode to construct
    // OH_Drawing_SamplingOptions
    OH_Drawing_FilterMode filterMode[] = {FILTER_MODE_NEAREST, FILTER_MODE_LINEAR};
    OH_Drawing_MipmapMode mode[] = {MIPMAP_MODE_NEAREST, MIPMAP_MODE_LINEAR, MIPMAP_MODE_NONE};
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(filterMode[i], mode[j]);
            OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
    // 6. OH_Drawing_CanvasDrawBitmap
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, 0, 0);
    OH_Drawing_BitmapDestroy(bitmap);
    // 7. OH_Drawing_BitmapCreateFromPixels, initialize Bitmap with a rowBytes larger than the image
    int width = 4096;
    int height = 2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_UNKNOWN, ALPHA_FORMAT_UNKNOWN};
    int rowBytes = 600 * 600 * 4;
    void *pixels = new int[width * height];
    bitmap = OH_Drawing_BitmapCreateFromPixels(&imageInfo, pixels, rowBytes);
    // 8. OH_Drawing_CanvasDrawBitmapRect, iterate through OH_Drawing_FilterMode and OH_Drawing_MipmapMode to construct
    // OH_Drawing_SamplingOptions
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(filterMode[i], mode[j]);
            OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, src, dst, options);
            OH_Drawing_SamplingOptionsDestroy(options);
        }
    }
    // 9. CanvasDrawBitmapRect with src parameter set to nullptr
    OH_Drawing_SamplingOptions *options = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_LINEAR);
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, nullptr, dst, options);
    // 10. Free memory
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_BitmapDestroy(bitmap);
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_SamplingOptionsDestroy(options);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1700
 * @tc.name: testCanvasDrawRectNormal
 * @tc.desc: test for testCanvasDrawRectNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawRectNormal, TestSize.Level0)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawRect
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1701
 * @tc.name: testCanvasDrawRectNull
 * @tc.desc: test for testCanvasDrawRectNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawRectNull, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_RectCreate
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(0, 0, 200, 200);
    EXPECT_NE(rect, nullptr);
    // 3. OH_Drawing_CanvasDrawRect with the first parameter being null
    OH_Drawing_CanvasDrawRect(canvas, nullptr);
    // 4. OH_Drawing_CanvasDrawRect with the second parameter being null
    OH_Drawing_CanvasDrawRect(nullptr, rect);
    // 5. OH_Drawing_CanvasDrawRect with the second parameter OH_Drawing_Rect created with left, top, right, bottom
    // respectively set to 0
    rect = OH_Drawing_RectCreate(0, 200, 200, 200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(200, 0, 200, 200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(200, 200, 0, 200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(200, 200, 200, 0);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 6. OH_Drawing_CanvasDrawRect with the second parameter OH_Drawing_Rect created with all values set to 0
    rect = OH_Drawing_RectCreate(0, 0, 0, 0);
    EXPECT_NE(rect, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1702
 * @tc.name: testCanvasDrawRectAbnormal
 * @tc.desc: test for testCanvasDrawRectAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawRectAbnormal, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with left, top, right, bottom being negative numbers
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(-100, 100, 50, 50);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(100, -100, 50, 50);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, -50, 50);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(100, 100, 50, -50);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 3. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with the top-left coordinate equal to the bottom-right
    // coordinate
    rect = OH_Drawing_RectCreate(100, 100, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    rect = OH_Drawing_RectCreate(200, 200, 200, 200);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 4. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with the top-left coordinate equal to the bottom-right
    // coordinate
    rect = OH_Drawing_RectCreate(200, 200, 200, 200);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 5. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with the top-left coordinate greater than the
    // bottom-right coordinate
    rect = OH_Drawing_RectCreate(200, 200, 100, 100);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_RectDestroy(rect);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1703
 * @tc.name: testCanvasDrawRectMaximum
 * @tc.desc: test for testCanvasDrawRectMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawRectMaximum, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    // 2. OH_Drawing_CanvasDrawRect with OH_Drawing_Rect created with left, top, right, bottom set to maximum values
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(FLT_MAX, 200, 200, 200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(200, FLT_MAX, 200, 200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(200, 200, FLT_MAX, 200);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    rect = OH_Drawing_RectCreate(200, 200, 200, FLT_MAX);
    OH_Drawing_CanvasDrawRect(canvas, rect);

    // 3. Free memory
    OH_Drawing_CanvasDestroy(canvas);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1704
 * @tc.name: testCanvasDrawRectInputDestroyed
 * @tc.desc: test for testCanvasDrawRectInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawRectInputDestroyed, TestSize.Level3)
{
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1800
 * @tc.name: testCanvasDrawCircleNormal
 * @tc.desc: test for testCanvasDrawCircleNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawCircleNormal, TestSize.Level0)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate
    OH_Drawing_Point *center = OH_Drawing_PointCreate(100, 100);
    EXPECT_NE(center, nullptr);
    // 3. OH_Drawing_CanvasDrawCircle
    OH_Drawing_CanvasDrawCircle(canvas, center, 50);
    // 4. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PointDestroy(center);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1801
 * @tc.name: testCanvasDrawCircleNull
 * @tc.desc: test for testCanvasDrawCircleNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawCircleNull, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate
    OH_Drawing_Point *center = OH_Drawing_PointCreate(100, 100);
    EXPECT_NE(center, nullptr);
    // 3. OH_Drawing_CanvasDrawCircle with the first parameter being null
    OH_Drawing_CanvasDrawCircle(nullptr, center, 50);
    // 4. OH_Drawing_CanvasDrawCircle with the second parameter being null
    OH_Drawing_CanvasDrawCircle(canvas, nullptr, 50);
    // 5. OH_Drawing_CanvasDrawCircle with the third parameter being 0
    OH_Drawing_CanvasDrawCircle(canvas, center, 0);
    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PointDestroy(center);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1802
 * @tc.name: testCanvasDrawCircleAbnormal
 * @tc.desc: test for testCanvasDrawCircleAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawCircleAbnormal, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate with x parameter being negative
    OH_Drawing_Point *center = OH_Drawing_PointCreate(-100, 100);
    // 3. OH_Drawing_CanvasDrawCircle
    OH_Drawing_CanvasDrawCircle(canvas, center, 50);
    // 4. OH_Drawing_PointCreate with y parameter being negative
    center = OH_Drawing_PointCreate(100, -100);
    OH_Drawing_CanvasDrawCircle(canvas, center, 50);
    // 5. OH_Drawing_CanvasDrawCircle with radius parameter being negative
    OH_Drawing_CanvasDrawCircle(canvas, center, -50);
    // 6. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PointDestroy(center);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1803
 * @tc.name: testCanvasDrawCircleMaximum
 * @tc.desc: test for testCanvasDrawCircleMaximum.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawCircleMaximum, TestSize.Level3)
{
    // 1. OH_Drawing_CanvasCreate
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    // 2. OH_Drawing_PointCreate with x parameter set to the maximum value
    OH_Drawing_Point *center = OH_Drawing_PointCreate(FLT_MAX, 100);
    EXPECT_NE(center, nullptr);
    // 3. OH_Drawing_CanvasDrawCircle
    OH_Drawing_CanvasDrawCircle(canvas, center, 50);
    // 4. OH_Drawing_PointCreate with y parameter set to the maximum value
    center = OH_Drawing_PointCreate(100, FLT_MAX);
    EXPECT_NE(center, nullptr);
    // 5. OH_Drawing_CanvasDrawCircle
    OH_Drawing_CanvasDrawCircle(canvas, center, 50);
    // 6. OH_Drawing_CanvasDrawCircle with radius parameter set to the maximum value
    OH_Drawing_CanvasDrawCircle(canvas, center, FLT_MAX);
    // 7. Free memory
    OH_Drawing_CanvasDestroy(canvas);
    OH_Drawing_PointDestroy(center);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_1804
 * @tc.name: testCanvasDrawCircleInputDestroyed
 * @tc.desc: test for testCanvasDrawCircleInputDestroyed.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawCircleInputDestroyed, TestSize.Level3)
{
    // Deprecated
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_CANVAS_4BYTEALIGNMENT
 * @tc.name: testCanvasDrawPixelMapRect4ByteAlignment
 * @tc.desc: test for Canvas Draw PixelMap Rect 4ByteAlignment.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeCanvasTest, testCanvasDrawPixelMapRect4ByteAlignment, TestSize.Level3)
{
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);

    OH_PixelmapNative *pixelMap = GET_OH_PixelmapNative_4ByteAlignment();
    OH_Drawing_PixelMap *drPixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMap);
    EXPECT_NE(drPixelMap, nullptr);

    OH_Drawing_Rect *src = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(src, nullptr);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(0, 0, 100, 100);
    EXPECT_NE(dst, nullptr);

    OH_Drawing_SamplingOptions *sampleOptions =
        OH_Drawing_SamplingOptionsCreate(FILTER_MODE_NEAREST, MIPMAP_MODE_NEAREST);
    // 2
    OH_Drawing_Rect *src1 = OH_Drawing_RectCreate(FLT_MAX, FLT_MAX, 100, 100);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src1, dst, sampleOptions);
    // 3
    OH_Drawing_Rect *src2 = OH_Drawing_RectCreate(0, 0, FLT_MAX, FLT_MAX);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src2, dst, sampleOptions);
    // 4
    OH_Drawing_Rect *dst1 = OH_Drawing_RectCreate(FLT_MAX, FLT_MAX, 100, 100);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst1, sampleOptions);
    // 5
    OH_Drawing_Rect *dst2 = OH_Drawing_RectCreate(0, 0, FLT_MAX, FLT_MAX);
    OH_Drawing_CanvasDrawPixelMapRect(canvas, drPixelMap, src, dst2, sampleOptions);
    // 6
    OH_Drawing_RectDestroy(src1);
    OH_Drawing_RectDestroy(src2);
    OH_Drawing_RectDestroy(dst1);
    OH_Drawing_RectDestroy(dst2);
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
    OH_Drawing_SamplingOptionsDestroy(sampleOptions);
    OH_Drawing_PixelMapDissolve(drPixelMap);
    OH_Drawing_CanvasDestroy(canvas);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS