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
#ifndef DRAWING_NATIVE_CANVAS_COMMON_TEST_H
#define DRAWING_NATIVE_CANVAS_COMMON_TEST_H

#include <cfloat>
#include <climits>
#include <cmath>
#include <cstdint>
#include <multimedia/image_framework/image/pixelmap_native.h>

namespace OHOS {
namespace Rosen {
namespace Drawing {


// Constants for test values - shared across all DrawingNativeCanvas test files
constexpr uint32_t TEST_CANVAS_BITMAP_SIZE = 200;
constexpr float TEST_CANVAS_RECT_X1 = 10.0f;
constexpr float TEST_CANVAS_RECT_Y1 = 100.0f;
constexpr float TEST_CANVAS_RECT_X2 = 200.0f;
constexpr float TEST_CANVAS_RECT_Y2 = 300.0f;
constexpr float TEST_CANVAS_SCALE = 0.5f;
constexpr float TEST_CANVAS_4K_WIDTH = 4096.0f;
constexpr float TEST_CANVAS_4K_HEIGHT = 2160.0f;
constexpr float TEST_CANVAS_COORD_10 = 10.0f;
constexpr float TEST_CANVAS_COORD_20 = 20.0f;
constexpr float TEST_CANVAS_COORD_100 = 100.0f;
constexpr float TEST_CANVAS_COORD_200 = 200.0f;
constexpr float TEST_CANVAS_COORD_300 = 300.0f;
constexpr float TEST_CANVAS_COORD_500 = 500.0f;
constexpr float TEST_CANVAS_COORD_600 = 600.0f;
constexpr float TEST_CANVAS_COORD_50 = 50.0f;
constexpr float TEST_CANVAS_COORD_150 = 150.0f;
constexpr float TEST_CANVAS_COORD_180 = 180.0f;
constexpr float TEST_CANVAS_COORD_190 = 190.0f;
constexpr float TEST_CANVAS_COORD_340 = 340.0f;
constexpr float TEST_CANVAS_COORD_360 = 360.0f;
constexpr float TEST_CANVAS_COORD_410 = 410.0f;
constexpr float TEST_CANVAS_RECT_SIZE_5 = 5.0f;
constexpr float TEST_CANVAS_COORD_NEGATIVE_10 = -10.0f;

// Rectangle size constants
constexpr float TEST_RECT_SIZE = 100.0f;
constexpr float TEST_RECT_SIZE_200 = 200.0f;
constexpr float TEST_RECT_SIZE_256 = 256.0f;
constexpr float TEST_RECT_SIZE_500 = 500.0f;
constexpr float TEST_RECT_SIZE_600 = 600.0f;
constexpr float TEST_RECT_SIZE_4096 = 4096.0f;
constexpr float TEST_RECT_SIZE_2160 = 2160.0f;

// Point coordinate constants
constexpr float TEST_POINT_X = 100.0f;
constexpr float TEST_POINT_Y = 100.0f;
constexpr float TEST_POINT_X_250 = 250.0f;
constexpr float TEST_POINT_Y_500 = 500.0f;
constexpr float TEST_POINT_Y_700 = 700.0f;
constexpr float TEST_CANVAS_POS_X = 100.0f;
constexpr float TEST_CANVAS_POS_Y = 100.0f;

// Circle and shape constants
constexpr float TEST_CIRCLE_RADIUS = 50.0f;
constexpr float TEST_CANVAS_TEXT_SIZE = 50.0f;

// Offset constants
constexpr float TEST_NEGATIVE_OFFSET = -100.0f;
constexpr float TEST_NEGATIVE_OFFSET_50 = -50.0f;
constexpr float TEST_NEGATIVE_OFFSET_20 = -20.0f;
constexpr float TEST_NEGATIVE_OFFSET_200 = -200.0f;
constexpr float TEST_CANVAS_NEGATIVE_OFFSET = -100.0f;

// Skew constants
constexpr float TEST_SKEW_VALUE_1 = 1.0f;
constexpr float TEST_SKEW_VALUE_2 = 2.0f;
constexpr float TEST_SKEW_INCREMENT = 0.1f;

// Arc angle constants
constexpr float TEST_ARC_START_ANGLE = 0.0f;
constexpr float TEST_ARC_SWEEP_ANGLE_180 = 180.0f;
constexpr float TEST_ARC_SWEEP_ANGLE_360 = 360.0f;
constexpr float TEST_ARC_START_ANGLE_NEGATIVE = -10.0f;
constexpr float TEST_ARC_SWEEP_ANGLE_LARGE = 650.0f;
constexpr float TEST_ARC_SWEEP_ANGLE_90 = 90.0f;
constexpr float TEST_ARC_START_ANGLE_NEGATIVE_90 = -90.0f;
constexpr float TEST_ARC_START_ANGLE_370 = 370.0f;
constexpr float TEST_ROTATE_DEGREES_LARGE = 370.0f;
constexpr float TEST_ARC_SWEEP_ANGLE_400 = 400.0f;
constexpr float TEST_ARC_START_ANGLE_66 = 66.0f;
constexpr float TEST_ARC_SWEEP_ANGLE_NEGATIVE_120 = -120.0f;

// Texture coordinate constants
constexpr float TEST_TEX_COORD_0 = 0.0f;
constexpr float TEST_TEX_COORD_1 = 1.0f;
constexpr float TEST_TEX_COORD_2 = 2.0f;

// Vertex and blend mode constants
constexpr int TEST_VERTEX_COUNT_3 = 3;
constexpr int TEST_BLEND_MODE_COUNT_29 = 29;

// Large value constants
constexpr int TEST_RECT_SIZE_VERY_LARGE = 999999;
constexpr int TEST_LOOP_COUNT_1000 = 1000;

// Color constants
constexpr uint32_t TEST_CANVAS_COLOR_BLUE = 0xFF0000FF;
constexpr uint32_t TEST_COLOR_GREEN = 0xFF00FF00;
constexpr uint32_t TEST_COLOR_RED_VERTEX = 0xFFFF0000;
constexpr uint32_t TEST_COLOR_BLACK = 0x00000000;
constexpr uint32_t TEST_COLOR_BLACK_OPAQUE = 0xFF000000;
constexpr uint32_t TEST_COLOR_WHITE = 0xFFFFFFFF;
constexpr uint32_t TEST_COLOR_WHITE_OPAQUE = 0xFFFFFFFF;
constexpr uint32_t TEST_COLOR_RED_ALPHA = 0xFF000000;
constexpr uint32_t TEST_COLOR_GRAY = 0x11111111;
constexpr uint32_t TEST_COLOR_INCREMENT = 0x11111111;

// Loop and count constants
constexpr int TEST_CANVAS_LOOP_COUNT = 10;
constexpr int TEST_LOOP_COUNT_10 = 10;
constexpr int TEST_LOOP_COUNT_11 = 11;
constexpr int TEST_LOOP_COUNT_20 = 20;
constexpr int TEST_FILTER_MODE_COUNT = 2;
constexpr int TEST_MIPMAP_MODE_COUNT = 3;
constexpr int TEST_COLOR_FORMAT_COUNT = 6;
constexpr int TEST_ALPHA_FORMAT_COUNT = 4;
constexpr int TEST_RECT_PARAMS_COUNT = 5;
constexpr int TEST_SRC_RECTS_COUNT = 8;
constexpr int TEST_DST_RECTS_COUNT = 4;

// OFFSET
constexpr int TEST_OFFSET_NUMER_1 = 1;
constexpr int TEST_OFFSET_NUMER_2 = 2;
constexpr int TEST_OFFSET_NUMER_3 = 3;
constexpr int TEST_OFFSET_NUMER_4 = 4;
constexpr int TEST_OFFSET_NUMER_5 = 5;

// Bitmap size constants
constexpr int TEST_BITMAP_SIZE_48 = 48;
constexpr int TEST_BITMAP_SIZE_47 = 47;
constexpr int TEST_BITMAP_SIZE_500 = 500;
constexpr int TEST_BITMAP_SIZE_600 = 600;
constexpr int BYTES_PER_PIXEL = 4;

// Matrix value constants
constexpr float TEST_MATRIX_VALUE_0 = 0.0f;
constexpr float TEST_MATRIX_VALUE_1 = 1.0f;
constexpr float TEST_MATRIX_VALUE_NEG_1 = -1.0f;
constexpr float TEST_MATRIX_VALUE_10 = 10.0f;

// Maximum value constants
constexpr float FLT_MAX_VALUE = FLT_MAX;
constexpr double DBL_MAX_VALUE = DBL_MAX;
constexpr int INT32_MAX_VALUE = INT32_MAX;

// Pixelmap constants (used in GET_OH_PixelmapNative functions)
constexpr uint32_t TEST_PIXELMAP_SIZE_SMALL = 4;
constexpr uint32_t TEST_PIXELMAP_WIDTH_5 = 5;
constexpr uint32_t TEST_PIXELMAP_HEIGHT_4 = 4;
constexpr int32_t TEST_PIXELMAP_FORMAT_RGBA = 3;
constexpr int32_t TEST_PIXELMAP_FORMAT_6 = 6;
constexpr int32_t TEST_PIXELMAP_ALPHA_PREMUL = 2;
constexpr uint8_t TEST_PIXELMAP_COLOR_VALUE = 255;
constexpr size_t TEST_PIXELMAP_DATA_LENGTH_16 = 16;
constexpr size_t TEST_PIXELMAP_DATA_LENGTH_20 = 20;
constexpr size_t TEST_PIXELMAP_4K_WIDTH = 4096;
constexpr size_t TEST_PIXELMAP_4K_HEIGHT = 2160;
constexpr size_t TEST_PIXELMAP_REPEAT_DIVISOR = 4;
constexpr int TEST_PIXELMAP_NEGATIVE_1 = -1;
constexpr int TEST_PIXELMAP_NEGATIVE_0 = 0;

// Pixelmap mesh constants
constexpr uint32_t TEST_PIXELMAP_MESH_WIDTH_1 = 1;
constexpr uint32_t TEST_PIXELMAP_MESH_HEIGHT_1 = 1;
constexpr uint32_t TEST_PIXELMAP_VERT_OFFSET_1 = 1;
constexpr uint32_t TEST_PIXELMAP_COLOR_OFFSET_1 = 1;
constexpr uint32_t TEST_PIXELMAP_MESH_WIDTH_2 = 2;
constexpr uint32_t TEST_PIXELMAP_MESH_HEIGHT_2 = 2;
constexpr uint32_t TEST_PIXELMAP_VERT_OFFSET_2 = 2;
constexpr uint32_t TEST_PIXELMAP_COLOR_OFFSET_2 = 2;
constexpr size_t TEST_PIXELMAP_VERTICES_SIZE_11 = 11;
constexpr size_t TEST_PIXELMAP_VERTICES_SIZE_12 = 12;
constexpr size_t TEST_PIXELMAP_COLORS_SIZE_6 = 6;

// Canvas DrawPixelMapRect related functions
int TestCanvasDrawPixelMapRectNormal();
int TestCanvasDrawPixelMapRectNull();
int TestCanvasDrawPixelMapRectAbnormal();
int TestCanvasDrawPixelMapRectMaximum();
int TestCanvasDrawPixelMapRect4KBoundary();
int TestCanvasDrawPixelMapRectInputDestroyed();
int TestCanvasDrawPixelMapRect4ByteAlignment();

// Canvas DrawBackground related functions
int TestCanvasDrawBackgroundNormal();
int TestCanvasDrawBackgroundNull();
int TestCanvasDrawBackgroundInputDestroyed();
int TestCanvasDrawBackgroundMultipleCalls();

// Canvas DrawRegion related functions
int TestCanvasDrawRegionNormal();
int TestCanvasDrawRegionNull();
int TestCanvasDrawRegionInputDestroyed();

// Canvas DrawPoints related functions
int TestCanvasDrawPointsNormal();
int TestCanvasDrawPointsNull();
int TestCanvasDrawPointsAbnormal();
int TestCanvasDrawPointsMismatch();
int TestCanvasDrawPointsMaximum();
int TestCanvasDrawPointsInputDestroyed();

// Canvas DrawBitmap related functions
int TestCanvasDrawBitmapNormal();
int TestCanvasDrawBitmapNull();
int TestCanvasDrawBitmapAbnormal();
int TestCanvasDrawBitmapMaximum();
int TestCanvasDrawBitmapInputDestroyed();
int TestCanvasDrawBitmapBoundary();

// Canvas DrawBitmapRect related functions
int TestCanvasDrawBitmapRectNormal();
int TestCanvasDrawBitmapRectNull();
int TestCanvasDrawBitmapRectAbnormal();
int TestCanvasDrawBitmapRectMaximum();
int TestCanvasDrawBitmapRectInputDestroyed();
int TestCanvasDrawBitmapRectBoundary();

// Canvas DrawRect related functions
int TestCanvasDrawRectNormal();
int TestCanvasDrawRectNull();
int TestCanvasDrawRectAbnormal();
int TestCanvasDrawRectMaximum();
int TestCanvasDrawRectInputDestroyed();

// Canvas DrawCircle related functions
int TestCanvasDrawCircleNormal();
int TestCanvasDrawCircleNull();
int TestCanvasDrawCircleAbnormal();
int TestCanvasDrawCircleMaximum();
int TestCanvasDrawCircleInputDestroyed();

// Canvas DrawOval related functions
int TestCanvasDrawOvalNormal();
int TestCanvasDrawOvalNull();
int TestCanvasDrawOvalAbnormal();
int TestCanvasDrawOvalMaximum();
int TestCanvasDrawOvalInputDestroyed();

// Canvas DrawArc related functions
int TestCanvasDrawArcNormal();
int TestCanvasDrawArcNull();
int TestCanvasDrawArcAbnormal();
int TestCanvasDrawArcMaximum();
int TestCanvasDrawArcInputDestroyed();

// Canvas DrawRoundRect related functions
int TestCanvasDrawRoundRectNormal();
int TestCanvasDrawRoundRectNull();
int TestCanvasDrawRoundRectAbnormal();
int TestCanvasDrawRoundRectMaximum();
int TestCanvasDrawRoundRectInputDestroyed();

// Canvas DrawTextBlob related functions
int TestCanvasDrawTextBlobNormal();
int TestCanvasDrawTextBlobNull();
int TestCanvasDrawTextBlobAbnormal();
int TestCanvasDrawTextBlobMaximum();
int TestCanvasDrawTextBlobInputDestroyed();

// Canvas ClipRect related functions
int TestCanvasClipRectNormal();
int TestCanvasClipRectNull();
int TestCanvasClipRectAbnormal();
int TestCanvasClipRectMaximum();
int TestCanvasClipRectInputDestroyed();

// Canvas ClipRoundRect related functions
int TestCanvasClipRoundRectNormal();
int TestCanvasClipRoundRectNull();
int TestCanvasClipRoundRectAbnormal();
int TestCanvasClipRoundRectMaximum();
int TestCanvasClipRoundRectInputDestroyed();

// Canvas ClipPath related functions
int TestCanvasClipPathNormal();
int TestCanvasClipPathNull();
int TestCanvasClipPathInputDestroyed();

// Canvas Skew related functions
int TestCanvasSkewNormal();
int TestCanvasSkewNull();
int TestCanvasSkewMaximum();
int TestCanvasSkewInputDestroyed();
int TestCanvasSkewMultipleCalls();

// Canvas GetWidth/GetHeight related functions
int TestCanvasGetWidthtestCanvasGetHeightNormal();
int TestCanvasGetWidthtestCanvasGetHeightNull();
int TestCanvasGetWidthtestCanvasGetHeightMultipleCalls();
int TestCanvasGetWidthtestCanvasGetHeightInputDestroyed();
int TestCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary();

// Canvas GetLocalClipBounds related functions
int TestCanvasGetLocalClipBoundsNormal();
int TestCanvasGetLocalClipBoundsNull();
int TestCanvasGetLocalClipBoundsAbnormal();
int TestCanvasGetLocalClipBoundsMultipleCalls();
int TestCanvasGetLocalClipBoundsInputDestroyed();
int TestCanvasGetLocalClipBoundsMultipleCallsBoundary();

// Canvas ConcatMatrix/GetTotalMatrix related functions
int TestCanvasConcatMatrixtestCanvasGetTotalMatrixNormal();
int TestCanvasConcatMatrixNull();
int TestCanvasGetTotalMatrixNull();
int TestCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls();
int TestCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed();

// Canvas DrawShadow related functions
int TestCanvasDrawShadowNormal();
int TestCanvasDrawShadowNull();
int TestCanvasDrawShadowAbnormal();
int TestCanvasDrawShadowMaximum();
int TestCanvasDrawShadowInputDestroyed();

// Canvas Clear related functions
int TestCanvasClearNormal();
int TestCanvasClearNull();
int TestCanvasClearAbnormal();
int TestCanvasClearMultipleCalls();
int TestCanvasClearInputDestroyed();
int TestCanvasClearMaximum();

// Canvas SetMatrix related functions
int TestCanvasSetMatrixNormal();
int TestCanvasSetMatrixNull();
int TestCanvasSetMatrixMultipleCalls();
int TestCanvasSetMatrixInputDestroyed();

// Canvas ResetMatrix related functions
int TestCanvasResetMatrixNormal();
int TestCanvasResetMatrixNull();
int TestCanvasResetMatrixMultipleCalls();

// Canvas DrawImageRect related functions
int TestCanvasDrawImageRectWithSrcNormal();
int TestCanvasDrawImageRectWithSrcNull();
int TestCanvasDrawImageRectNormal();
int TestCanvasDrawImageRectNull();

// Canvas DrawVertices related functions
int TestCanvasDrawVerticesNormal();
int TestCanvasDrawVerticesNull();
int TestCanvasDrawVerticesAbnormal();
int TestCanvasDrawVerticesMaximum();

// Canvas ReadPixels related functions
int TestCanvasReadPixelsNormal();
int TestCanvasReadPixelsNull();
int TestCanvasReadPixelsMismatch();
int TestCanvasReadPixelsAbnormal();
int TestCanvasReadPixelsMaximum();
int TestCanvasReadPixelsBoundary();

// Canvas ReadPixelsToBitmap related functions
int TestCanvasReadPixelsToBitmapNormal();
int TestCanvasReadPixelsToBitmapNull();
int TestCanvasReadPixelsToBitmapAbnormal();
int TestCanvasReadPixelsToBitmapMaximum();

// Canvas DrawSingleCharacter related functions
int TestCanvasDrawSingleCharacter();
int TestCanvasDrawSingleCharacterNormal();
int TestCanvasDrawSingleCharacterNull();

// Canvas DrawPoint related functions
int TestCanvasDrawPointNormal();
int TestCanvasDrawPointNull();
int TestCanvasDrawPointMultipleCalls();

// Canvas DrawColor related functions
int TestCanvasDrawColorNormal();
int TestCanvasDrawColorNull();
int TestCanvasDrawColorMaximum();
int TestCanvasDrawColorMultipleCalls();

// Canvas IsClipEmpty related functions
int TestCanvasIsClipEmptyNormal();
int TestCanvasIsClipEmptyNull();
int TestCanvasIsClipEmptyMultipleCalls();

// Canvas GetImageInfo related functions
int TestCanvasGetImageInfoNormal();
int TestCanvasGetImageInfoNull();
int TestCanvasGetImageInfoMultipleCalls();

// Canvas ClipRegion related functions
int TestCanvasClipRegionNormal();
int TestCanvasClipRegionNull();
int TestCanvasClipRegionMultipleCalls();

// Canvas QuickRejectPath related functions
int TestCanvasQuickRejectPathNull();
int TestCanvasQuickRejectPathNormal();
int TestCanvasQuickRejectPathCalls();

// Canvas QuickRejectRect related functions
int TestCanvasQuickRejectRectNull();
int TestCanvasQuickRejectRectNormal();
int TestCanvasQuickRejectRectCalls();

// Canvas DrawArcWithCenter related functions
int TestCanvasDrawArcWithCenterNull();
int TestCanvasDrawArcWithCenterNormal();
int TestCanvasDrawArcWithCenterCalls();

// Canvas DrawNestedRoundRect related functions
int TestCanvasDrawNestedRoundRectNull();
int TestCanvasDrawNestedRoundRectNormal();
int TestCanvasDrawNestedRoundRectCalls();

// Canvas DrawPixelMapNine related functions
int TestCanvasDrawPixelMapNineNull();
int TestCanvasDrawPixelMapNineNormal();
int TestCanvasDrawPixelMapNineCalls();

// Canvas CreateWithPixelMap related functions
int TestCanvasCreateWithPixelMapNormal();
int TestCanvasCreateWithPixelMapNull();
int TestCanvasCreateWithPixelMapMultipleCalls();

// Canvas DrawPixelMapRectConstraint related functions
int TestCanvasDrawPixelMapRectConstraintNormal();
int TestCanvasDrawPixelMapRectConstraintNull();
int TestCanvasDrawPixelMapRectConstraintAbnormal();
int TestCanvasDrawPixelMapRectConstraintMultiCalls();

// Canvas Rotate related functions
int TestCanvasRotateNormal();
int TestCanvasRotateNull();
int TestCanvasRotateAbnormal();
int TestCanvasRotateMaximum();
int TestCanvasRotateInputDestroyed();
int TestCanvasRotateMultipleCalls();

// Canvas Translate related functions
int TestCanvasTranslateNormal();
int TestCanvasTranslateNull();
int TestCanvasTranslateAbnormal();
int TestCanvasTranslateMaximum();
int TestCanvasTranslateInputDestroyed();
int TestCanvasTranslateMultipleCalls();

// Canvas Scale related functions
int TestCanvasScaleNormal();
int TestCanvasScaleNull();
int TestCanvasScaleAbnormal();
int TestCanvasScaleMaximum();
int TestCanvasScaleInputDestroyed();
int TestCanvasScaleMultipleCalls();

// Canvas DrawSingleCharacterWithFeatures related functions
int TestCanvasDrawSingleChaWithFeaturesNormal();
int TestCanvasDrawSingleChaWithFeaturesAbNormal();
int TestCanvasDrawSingleChaWithFeaturesCalls();

// Canvas DrawPixelMapMesh related functions
int TestCanvasDrawPixelMapMeshNormal();
int TestCanvasDrawPixelMapMeshNull01();
int TestCanvasDrawPixelMapMeshNull02();
int TestCanvasDrawPixelMapMeshNull03();
int TestCanvasDrawPixelMapMeshNull04();
int TestCanvasDrawPixelMapMeshBindAndUnbind();
int TestCanvasDrawPixelMapMeshAbnormal01();
int TestCanvasDrawPixelMapMeshAbnormal02();
int TestCanvasDrawPixelMapMeshAbnormal03();
int TestCanvasDrawPixelMapMeshAbnormal04();
int TestCanvasDrawPixelMapMeshMultipleCalls();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

OH_PixelmapNative* GET_OH_PixelmapNative();
OH_PixelmapNative* GET_OH_PixelmapNative(uint32_t width, uint32_t height);
OH_PixelmapNative* GET_OH_PixelmapNative4KBoundary();
OH_PixelmapNative* GET_OH_PixelmapNative_4ByteAlignment();

#endif // DRAWING_NATIVE_CANVAS_COMMON_TEST_H
