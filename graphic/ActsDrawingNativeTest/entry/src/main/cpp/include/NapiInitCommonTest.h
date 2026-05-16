/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef NAPI_INIT_COMMON_TEST_H
#define NAPI_INIT_COMMON_TEST_H

#include <array>
#include "DrawingCanvasDrawRecordCmdTest.h"
#include "DrawingNativeBitmapTest.h"
#include "DrawingNativeBrushTest.h"
#include "DrawingNativeCanvasCommonTest.h"
#include "DrawingNativeCanvasTest.h"
#include "DrawingNativeColorFilterTest.h"
#include "DrawingNativeColorSpaceTest.h"
#include "DrawingNativeColorTest.h"
#include "DrawingNativeFilterTest.h"
#include "DrawingNativeFontTest.h"
#include "DrawingNativeGpuContextTest.h"
#include "DrawingNativeImageFilterTest.h"
#include "DrawingNativeImageTest.h"
#include "DrawingNativeLatticeTest.h"
#include "DrawingNativeMaskFilterTest.h"
#include "DrawingNativeMatrixTest.h"
#include "DrawingNativeMemoryStreamTest.h"
#include "DrawingNativePathEffectTest.h"
#include "DrawingNativePathIteratorTest.h"
#include "DrawingNativePathTest.h"
#include "DrawingNativePenTest.h"
#include "DrawingNativePixelMapTest.h"
#include "DrawingNativePointTest.h"
#include "DrawingNativeRectTest.h"
#include "DrawingNativeRegionTest.h"
#include "DrawingNativeRoundRectTest.h"
#include "DrawingNativeSamplingOptionsTest.h"
#include "DrawingNativeShaderEffectTest.h"
#include "DrawingNativeShadowLayerTest.h"
#include "DrawingNativeSurFaceTest.h"
#include "DrawingNativeTextBlobTest.h"
#include "DrawingNativeTypeFaceTest.h"
#include "DrawingRecordCmdDestroyTest.h"
#include "DrawingRecordCmdUtilsBeginTest.h"
#include "DrawingRecordCmdUtilsDestroyTest.h"
#include "DrawingRecordCmdUtilsFinishTest.h"
#include "OhosCommonTest.h"
#include "napi/native_api.h"


// Common argument and result constants.
 constexpr int ARG_INDEX = 0;
 constexpr int DEFAULT_ARG = -1;

// Handler count constants for std::array sizes (avoid magic numbers).
 constexpr size_t CANVAS_DRAW_RECORD_CMD_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_DRAW_SINGLE_CHA_WITH_FEATURES_HANDLER_COUNT = 3;
 constexpr size_t RECORD_CMD_DESTROY_HANDLER_COUNT = 2;
 constexpr size_t RECORD_CMD_UTILS_BEGIN_RECORDING_HANDLER_COUNT = 2;
 constexpr size_t RECORD_CMD_UTILS_DESTROY_HANDLER_COUNT = 1;
 constexpr size_t RECORD_CMD_UTILS_FINISH_RECORDING_HANDLER_COUNT = 2;
 constexpr size_t MEMORY_STREAM_HANDLER_COUNT = 4;
 constexpr size_t POINT_CREATE_HANDLER_COUNT = 5;
 constexpr size_t POINT_DESTROY_HANDLER_COUNT = 2;
 constexpr size_t POINT_GET_SET_HANDLER_COUNT = 9;
 constexpr size_t REGION_BASIC_OPERATIONS_HANDLER_COUNT = 18;
 constexpr size_t REGION_QUERY_OPERATIONS_HANDLER_COUNT = 5;
 constexpr size_t REGION_PART2_QUERY_OPERATIONS_HANDLER_COUNT = 18;
 constexpr size_t REGION_ADVANCED_OPERATIONS_HANDLER_COUNT = 11;
 constexpr size_t PATH_EFFECT_HANDLER_COUNT = 19;
 constexpr size_t PATH_ITERATOR_HANDLER_COUNT = 11;
 constexpr size_t PATH_BASIC_HANDLER_COUNT = 30;
 constexpr size_t PATH_RELATIVE_HANDLER_COUNT = 20;
 constexpr size_t PATH_ADD_SHAPE_HANDLER_COUNT = 14;
 constexpr size_t PATH_PART2_ADD_HANDLER_COUNT = 25;
 constexpr size_t PATH_PART2_TRANSFORM_HANDLER_COUNT = 11;
 constexpr size_t PATH_PART2_GET_SET_HANDLER_COUNT = 17;
 constexpr size_t PATH_PART3_QUERY_HANDLER_COUNT = 12;
 constexpr size_t PATH_PART4_INVERSE_FILL_TYPE_HANDLER_COUNT = 8;
 constexpr size_t PATH_PART3_TRANSFORM_HANDLER_COUNT = 16;
 constexpr size_t PATH_PART3_ADVANCED_HANDLER_COUNT = 14;
 constexpr size_t CANVAS_DESTROY_HANDLER_COUNT = 2;
 constexpr size_t CANVAS_BIND_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_SAVE_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_SAVE_LAYER_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_RESTORE_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_RESTORE_TO_COUNT_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_DRAW_LINE_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_DRAW_PATH_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_ATTACH_HANDLER_COUNT = 10;
 constexpr size_t CANVAS_DETACH_HANDLER_COUNT = 2;
 constexpr size_t CANVAS_PART2_DRAW_PIXELMAP_RECT_HANDLER_COUNT = 7;
 constexpr size_t CANVAS_PART2_DRAW_BACKGROUND_HANDLER_COUNT = 4;
 constexpr size_t CANVAS_PART2_DRAW_REGION_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART2_DRAW_POINTS_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_PART2_DRAW_BITMAP_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_PART2_DRAW_BITMAP_RECT_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_PART2_DRAW_RECT_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART2_DRAW_CIRCLE_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART3_DRAW_OVAL_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART3_DRAW_ARC_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART3_DRAW_ROUND_RECT_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART3_DRAW_TEXT_BLOB_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART3_CLIP_RECT_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART3_CLIP_ROUND_RECT_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART3_CLIP_PATH_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART3_ROTATE_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_PART3_TRANSLATE_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_PART3_SCALE_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_PART4_SKEW_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART4_GET_WIDTH_HEIGHT_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART4_GET_LOCAL_CLIP_BOUNDS_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_PART4_CONCAT_MATRIX_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART4_DRAW_SHADOW_HANDLER_COUNT = 5;
 constexpr size_t CANVAS_PART4_CLEAR_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_PART4_SET_MATRIX_HANDLER_COUNT = 4;
 constexpr size_t CANVAS_PART4_RESET_MATRIX_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART4_DRAW_IMAGE_RECT_HANDLER_COUNT = 4;
 constexpr size_t CANVAS_PART4_DRAW_VERTICES_HANDLER_COUNT = 4;
 constexpr size_t CANVAS_PART4_READ_PIXELS_HANDLER_COUNT = 6;
 constexpr size_t CANVAS_PART4_READ_PIXELS_TO_BITMAP_HANDLER_COUNT = 4;
 constexpr size_t CANVAS_PART4_DRAW_SINGLE_CHARACTER_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART4_DRAW_POINT_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART4_DRAW_COLOR_HANDLER_COUNT = 4;
 constexpr size_t CANVAS_PART4_IS_CLIP_EMPTY_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART4_GET_IMAGE_INFO_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART4_CLIP_REGION_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART5_QUICK_REJECT_PATH_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART5_QUICK_REJECT_RECT_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART5_DRAW_ARC_WITH_CENTER_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART5_DRAW_NESTED_ROUND_RECT_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART5_DRAW_PIXEL_MAP_NINE_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART5_CREATE_WITH_PIXEL_MAP_HANDLER_COUNT = 3;
 constexpr size_t CANVAS_PART5_DRAW_PIXEL_MAP_RECT_CONSTRAINT_HANDLER_COUNT = 4;
 constexpr size_t CANVAS_PART5_DRAW_PIXEL_MAP_MESH_HANDLER_COUNT = 11;
 constexpr size_t BITMAP_HANDLER_COUNT = 22;
 constexpr size_t COLOR_FILTER_CREATE_BLEND_MODE_HANDLER_COUNT = 5;
 constexpr size_t COLOR_FILTER_CREATE_COMPOSE_HANDLER_COUNT = 3;
 constexpr size_t COLOR_FILTER_CREATE_MATRIX_HANDLER_COUNT = 4;
 constexpr size_t COLOR_FILTER_CREATE_LINEAR_TO_SRGB_GAMMA_HANDLER_COUNT = 2;
 constexpr size_t COLOR_FILTER_CREATE_SRGB_GAMMA_TO_LINEAR_HANDLER_COUNT = 2;
 constexpr size_t COLOR_FILTER_CREATE_LUMA_HANDLER_COUNT = 2;
 constexpr size_t COLOR_FILTER_DESTROY_HANDLER_COUNT = 2;
 constexpr size_t COLOR_FILTER_CREATE_LIGHTING_HANDLER_COUNT = 4;
 constexpr size_t COLOR_SPACE_CREATE_SRGB_HANDLER_COUNT = 2;
 constexpr size_t COLOR_SPACE_DESTROY_HANDLER_COUNT = 1;
 constexpr size_t COLOR_SPACE_CREATE_SRGB_LINEAR_HANDLER_COUNT = 2;
 constexpr size_t COLOR_SET_ARGB_HANDLER_COUNT = 5;
 constexpr size_t FILTER_CREATE_DESTROY_HANDLER_COUNT = 3;
 constexpr size_t FILTER_SET_IMAGE_FILTER_HANDLER_COUNT = 3;
 constexpr size_t FILTER_SET_MASK_FILTER_HANDLER_COUNT = 3;
 constexpr size_t FILTER_SET_COLOR_FILTER_HANDLER_COUNT = 3;
 constexpr size_t FONT_CREATE_DESTROY_HANDLER_COUNT = 3;
 constexpr size_t FONT_SET_BASELINE_SNAP_HANDLER_COUNT = 4;
 constexpr size_t FONT_SET_SUBPIXEL_HANDLER_COUNT = 4;
 constexpr size_t FONT_SET_FORCE_AUTO_HINTING_HANDLER_COUNT = 4;
 constexpr size_t FONT_SET_TYPEFACE_HANDLER_COUNT = 4;
 constexpr size_t FONT_SET_TEXT_SIZE_HANDLER_COUNT = 5;
 constexpr size_t FONT_COUNT_TEXT_HANDLER_COUNT = 4;
 constexpr size_t FONT_TEXT_TO_GLYPHS_HANDLER_COUNT = 5;
 constexpr size_t FONT_GET_WIDTHS_HANDLER_COUNT = 5;
 constexpr size_t FONT_SET_LINEAR_TEXT_HANDLER_COUNT = 4;
 constexpr size_t FONT_SET_TEXT_SKEW_X_HANDLER_COUNT = 6;
 constexpr size_t FONT_SET_FAKE_BOLD_TEXT_HANDLER_COUNT = 4;
 constexpr size_t FONT_SET_SCALE_X_HANDLER_COUNT = 6;
 constexpr size_t FONT_SET_HINTING_HANDLER_COUNT = 4;
 constexpr size_t FONT_SET_EMBEDDED_BITMAPS_HANDLER_COUNT = 4;
 constexpr size_t FONT_SET_EDGING_HANDLER_COUNT = 4;
 constexpr size_t FONT_GET_METRICS_HANDLER_COUNT = 3;
 constexpr size_t FONT_MEASURE_SINGLE_CHARACTER_HANDLER_COUNT = 4;
 constexpr size_t FONT_MEASURETEXT_HANDLER_COUNT = 3;
 constexpr size_t FONT_ARGUMENTS_CREATE_HANDLER_COUNT = 1;
 constexpr size_t FONT_ARGUMENTS_ADD_VARIATION_HANDLER_COUNT = 4;
 constexpr size_t FONT_ARGUMENTS_DESTROY_HANDLER_COUNT = 3;
 constexpr size_t FONT_SET_THEME_FONT_FOLLOWED_HANDLER_COUNT = 3;
 constexpr size_t FONT_IS_THEME_FONT_FOLLOWED_HANDLER_COUNT = 3;
 constexpr size_t FONT_GET_METRICS_PART2_HANDLER_COUNT = 3;
 constexpr size_t FONT_MEASURE_TEXT_WITH_BRUSH_OR_PEN_HANDLER_COUNT = 5;
 constexpr size_t FONT_GET_WIDTHS_BOUNDS_HANDLER_COUNT = 5;
 constexpr size_t FONT_GET_POS_HANDLER_COUNT = 6;
 constexpr size_t FONT_GET_SPACING_HANDLER_COUNT = 3;
 constexpr size_t FONT_MEASURE_SINGLE_CHA_WITH_FEATURES_HANDLER_COUNT = 3;
 constexpr size_t FONT_FEATURES_HANDLER_COUNT = 3;
 constexpr size_t GPU_CONTEXT_HANDLER_COUNT = 4;
 constexpr size_t IMAGE_FILTER_HANDLER_COUNT = 21;
 constexpr size_t IMAGE_HANDLER_COUNT = 17;
 constexpr size_t LATTICE_HANDLER_COUNT = 7;
 constexpr size_t MASK_FILTER_HANDLER_COUNT = 5;
 constexpr size_t MATRIX_CREATE_HANDLER_COUNT = 18;
 constexpr size_t MATRIX_TRANSFORM_HANDLER_COUNT = 23;
 constexpr size_t MATRIX_OPERATION_HANDLER_COUNT = 20;
 constexpr size_t MATRIX_PART2_TRANSFORM_HANDLER_COUNT = 19;
 constexpr size_t MATRIX_PART2_MAP_QUERY_HANDLER_COUNT = 17;
 constexpr size_t MATRIX_PART2_SET_HANDLER_COUNT = 3;
 constexpr size_t MATRIX_PART3_HANDLER_COUNT = 16;
 constexpr size_t BRUSH_CREATE_DESTROY_HANDLER_COUNT = 7;
 constexpr size_t BRUSH_ANTI_ALIAS_HANDLER_COUNT = 4;
 constexpr size_t BRUSH_COLOR_HANDLER_COUNT = 6;
 constexpr size_t BRUSH_ALPHA_HANDLER_COUNT = 6;
 constexpr size_t BRUSH_SHADER_EFFECT_HANDLER_COUNT = 2;
 constexpr size_t BRUSH_SHADOW_LAYER_HANDLER_COUNT = 2;
 constexpr size_t BRUSH_FILTER_HANDLER_COUNT = 4;
 constexpr size_t BRUSH_BLEND_MODE_HANDLER_COUNT = 2;
 constexpr size_t BRUSH_RESET_HANDLER_COUNT = 2;
 constexpr size_t BRUSH_GET_FLOAT_HANDLER_COUNT = 8;
 constexpr size_t BRUSH_SET_COLOR4F_HANDLER_COUNT = 3;
 constexpr size_t PEN_CREATE_DESTROY_HANDLER_COUNT = 6;
 constexpr size_t PEN_ANTI_ALIAS_HANDLER_COUNT = 4;
 constexpr size_t PEN_COLOR_HANDLER_COUNT = 6;
 constexpr size_t PEN_ALPHA_HANDLER_COUNT = 6;
 constexpr size_t PEN_WIDTH_HANDLER_COUNT = 8;
 constexpr size_t PEN_MITER_LIMIT_HANDLER_COUNT = 6;
 constexpr size_t PEN_CAP_HANDLER_COUNT = 5;
 constexpr size_t PEN_JOIN_HANDLER_COUNT = 5;
 constexpr size_t PEN_EFFECTS_HANDLER_COUNT = 6;
 constexpr size_t PEN_FILTER_HANDLER_COUNT = 4;
 constexpr size_t PEN_BLEND_MODE_HANDLER_COUNT = 2;
 constexpr size_t PEN_GET_FILL_PATH_HANDLER_COUNT = 2;
 constexpr size_t PEN_RESET_HANDLER_COUNT = 3;
 constexpr size_t PEN_GET_FLOAT_HANDLER_COUNT = 8;
 constexpr size_t PEN_SET_COLOR4F_HANDLER_COUNT = 2;
 constexpr size_t PIXEL_MAP_HANDLER_COUNT = 10;
 constexpr size_t RECT_CREATE_DESTROY_INTERSECT_JOIN_HANDLER_COUNT = 9;
 constexpr size_t RECT_SET_GET_LEFT_TOP_RIGHT_BOTTOM_HANDLER_COUNT = 24;
 constexpr size_t RECT_OTHER_OPERATIONS_HANDLER_COUNT = 5;
 constexpr size_t RECT_PART2_OTHER_OPERATIONS_HANDLER_COUNT = 27;
 constexpr size_t ROUND_RECT_HANDLER_COUNT = 19;
 constexpr size_t SAMPLING_OPTIONS_HANDLER_COUNT = 6;
 constexpr size_t SHADOW_LAYER_HANDLER_COUNT = 7;
 constexpr size_t SHADER_EFFECT_CREATE_GRADIENT_HANDLER_COUNT = 30;
 constexpr size_t SHADER_EFFECT_CREATE_SPECIAL_HANDLER_COUNT = 18;
 constexpr size_t SHADER_EFFECT_DESTROY_HANDLER_COUNT = 2;
 constexpr size_t SURFACE_HANDLER_COUNT = 16;
 constexpr size_t TEXT_BLOB_BUILDER_HANDLER_COUNT = 9;
 constexpr size_t TEXT_BLOB_CREATE_HANDLER_COUNT = 12;
 constexpr size_t TEXT_BLOB_OTHER_HANDLER_COUNT = 9;
 constexpr size_t TYPEFACE_CREATE_HANDLER_COUNT = 15;
 constexpr size_t TYPEFACE_IS_BOLD_ITALIC_HANDLER_COUNT = 6;

using DrawingNativeFn = int (*)();

// Case number constants to replace magic numbers in switch statements.
enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
    CASE_NUM_2,
    CASE_NUM_3,
    CASE_NUM_4,
    CASE_NUM_5,
    CASE_NUM_6,
    CASE_NUM_7,
    CASE_NUM_8,
    CASE_NUM_9,
    CASE_NUM_10,
    CASE_NUM_11,
    CASE_NUM_12,
    CASE_NUM_13,
    CASE_NUM_14,
    CASE_NUM_15,
    CASE_NUM_16,
    CASE_NUM_17,
    CASE_NUM_18,
    CASE_NUM_19,
    CASE_NUM_20,
    CASE_NUM_21,
    CASE_NUM_22,
    CASE_NUM_23,
    CASE_NUM_24,
    CASE_NUM_25,
    CASE_NUM_26,
    CASE_NUM_27,
    CASE_NUM_28,
    CASE_NUM_29,
    CASE_NUM_30,
    CASE_NUM_31,
    CASE_NUM_32,
    CASE_NUM_33,
    CASE_NUM_34,
    CASE_NUM_35,
    CASE_NUM_36,
    CASE_NUM_37,
    CASE_NUM_38,
    CASE_NUM_39,
    CASE_NUM_40,
    CASE_NUM_41,
    CASE_NUM_42,
    CASE_NUM_43,
    CASE_NUM_44,
    CASE_NUM_45,
    CASE_NUM_46,
    CASE_NUM_47,
    CASE_NUM_48,
    CASE_NUM_49,
    CASE_NUM_50,
    CASE_NUM_51,
    CASE_NUM_52,
    CASE_NUM_53,
    CASE_NUM_54,
    CASE_NUM_55,
    CASE_NUM_56,
    CASE_NUM_57,
    CASE_NUM_58,
    CASE_NUM_59,
    CASE_NUM_60,
    CASE_NUM_61,
    CASE_NUM_62,
    CASE_NUM_63,
    CASE_NUM_64,
    CASE_NUM_65
};

template <size_t N> int DispatchByCaseNum(int caseNum, const std::array<DrawingNativeFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

// Canvas DrawRecordCmd related functions

// Function declarations
napi_value DrawingCanvasDrawRecordCmd(napi_env env, napi_callback_info info);
napi_value DrawingRecordCmdDestroy(napi_env env, napi_callback_info info);
napi_value DrawingRecordCmdUtilsBeginRecording(napi_env env, napi_callback_info info);
napi_value DrawingRecordCmdUtilsFinishRecording(napi_env env, napi_callback_info info);
napi_value DrawingRecordCmdUtilsDestroy(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawSingleChaWithFeatures(napi_env env, napi_callback_info info);
napi_value DrawingMemoryStream(napi_env env, napi_callback_info info);
napi_value DrawingPointCreate(napi_env env, napi_callback_info info);
napi_value DrawingPointDestroy(napi_env env, napi_callback_info info);
napi_value DrawingPointGetSet(napi_env env, napi_callback_info info);
napi_value DrawingRegionBasicOperations(napi_env env, napi_callback_info info);
napi_value DrawingRegionQueryOperations(napi_env env, napi_callback_info info);
napi_value DrawingRegionPart2QueryOperations(napi_env env, napi_callback_info info);
napi_value DrawingRegionAdvancedOperations(napi_env env, napi_callback_info info);
napi_value DrawingPathEffect(napi_env env, napi_callback_info info);
napi_value DrawingPathIterator(napi_env env, napi_callback_info info);
napi_value DrawingPathBasic(napi_env env, napi_callback_info info);
napi_value DrawingPathRelative(napi_env env, napi_callback_info info);
napi_value DrawingPathAddShape(napi_env env, napi_callback_info info);
napi_value DrawingPathPart2Add(napi_env env, napi_callback_info info);
napi_value DrawingPathPart2Transform(napi_env env, napi_callback_info info);
napi_value DrawingPathPart2GetSet(napi_env env, napi_callback_info info);
napi_value DrawingPathPart3Query(napi_env env, napi_callback_info info);
napi_value DrawingPathPart4InverseFillType(napi_env env, napi_callback_info info);
napi_value DrawingPathPart3Transform(napi_env env, napi_callback_info info);
napi_value DrawingPathPart3Advanced(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDestroy(napi_env env, napi_callback_info info);
napi_value DrawingCanvasBind(napi_env env, napi_callback_info info);
napi_value DrawingCanvasSave(napi_env env, napi_callback_info info);
napi_value DrawingCanvasSaveLayer(napi_env env, napi_callback_info info);
napi_value DrawingCanvasRestore(napi_env env, napi_callback_info info);
napi_value DrawingCanvasRestoreToCount(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawLine(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawPath(napi_env env, napi_callback_info info);
napi_value DrawingCanvasAttach(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDetach(napi_env env, napi_callback_info info);
napi_value DrawingBitmap(napi_env env, napi_callback_info info);
napi_value DrawingColorFilterCreateBlendMode(napi_env env, napi_callback_info info);
napi_value DrawingColorFilterCreateCompose(napi_env env, napi_callback_info info);
napi_value DrawingColorFilterCreateMatrix(napi_env env, napi_callback_info info);
napi_value DrawingColorFilterCreateLinearToSrgbGamma(napi_env env, napi_callback_info info);
napi_value DrawingColorFilterCreateSrgbGammaToLinear(napi_env env, napi_callback_info info);
napi_value DrawingColorFilterCreateLuma(napi_env env, napi_callback_info info);
napi_value DrawingColorFilterDestroy(napi_env env, napi_callback_info info);
napi_value DrawingColorFilterCreateLighting(napi_env env, napi_callback_info info);
napi_value DrawingColorSpaceCreateSrgb(napi_env env, napi_callback_info info);
napi_value DrawingColorSpaceDestroy(napi_env env, napi_callback_info info);
napi_value DrawingColorSpaceCreateSrgbLinear(napi_env env, napi_callback_info info);
napi_value DrawingColorSetArgb(napi_env env, napi_callback_info info);
napi_value DrawingFilterCreateDestroy(napi_env env, napi_callback_info info);
napi_value DrawingFilterSetImageFilter(napi_env env, napi_callback_info info);
napi_value DrawingFilterSetMaskFilter(napi_env env, napi_callback_info info);
napi_value DrawingFilterSetColorFilter(napi_env env, napi_callback_info info);
napi_value DrawingFontCreateDestroy(napi_env env, napi_callback_info info);
napi_value DrawingFontSetBaselineSnap(napi_env env, napi_callback_info info);
napi_value DrawingFontSetSubpixel(napi_env env, napi_callback_info info);
napi_value DrawingFontSetForceAutoHinting(napi_env env, napi_callback_info info);
napi_value DrawingFontSetTypeface(napi_env env, napi_callback_info info);
napi_value DrawingFontSetTextSize(napi_env env, napi_callback_info info);
napi_value DrawingFontCountText(napi_env env, napi_callback_info info);
napi_value DrawingFontTextToGlyphs(napi_env env, napi_callback_info info);
napi_value DrawingFontGetWidths(napi_env env, napi_callback_info info);
napi_value DrawingFontSetLinearText(napi_env env, napi_callback_info info);
napi_value DrawingFontSetTextSkewX(napi_env env, napi_callback_info info);
napi_value DrawingFontSetFakeBoldText(napi_env env, napi_callback_info info);
napi_value DrawingFontSetScaleX(napi_env env, napi_callback_info info);
napi_value DrawingFontSetHinting(napi_env env, napi_callback_info info);
napi_value DrawingFontSetEmbeddedBitmaps(napi_env env, napi_callback_info info);
napi_value DrawingFontSetEdging(napi_env env, napi_callback_info info);
napi_value DrawingFontMeasureSingleCharacter(napi_env env, napi_callback_info info);
napi_value DrawingFontMeasuretext(napi_env env, napi_callback_info info);
napi_value DrawingFontArgumentsCreate(napi_env env, napi_callback_info info);
napi_value DrawingFontArgumentsAddVariation(napi_env env, napi_callback_info info);
napi_value DrawingFontArgumentsDestroy(napi_env env, napi_callback_info info);
napi_value DrawingFontSetThemeFontFollowed(napi_env env, napi_callback_info info);
napi_value DrawingFontIsThemeFontFollowed(napi_env env, napi_callback_info info);
napi_value DrawingFontGetMetricsPart2(napi_env env, napi_callback_info info);
napi_value DrawingFontMeasureTextWithBrushOrPen(napi_env env, napi_callback_info info);
napi_value DrawingFontGetWidthsBounds(napi_env env, napi_callback_info info);
napi_value DrawingFontGetPos(napi_env env, napi_callback_info info);
napi_value DrawingFontGetSpacing(napi_env env, napi_callback_info info);
napi_value DrawingFontMeasureSingleChaWithFeatures(napi_env env, napi_callback_info info);
napi_value DrawingFontFeatures(napi_env env, napi_callback_info info);
napi_value DrawingGpuContext(napi_env env, napi_callback_info info);
napi_value DrawingImageFilter(napi_env env, napi_callback_info info);
napi_value DrawingImage(napi_env env, napi_callback_info info);
napi_value DrawingLattice(napi_env env, napi_callback_info info);
napi_value DrawingMaskFilter(napi_env env, napi_callback_info info);
napi_value DrawingMatrixCreate(napi_env env, napi_callback_info info);
napi_value DrawingMatrixTransform(napi_env env, napi_callback_info info);
napi_value DrawingMatrixOperation(napi_env env, napi_callback_info info);
napi_value DrawingMatrixPart2Transform(napi_env env, napi_callback_info info);
napi_value DrawingMatrixPart2MapQuery(napi_env env, napi_callback_info info);
napi_value DrawingMatrixPart2Set(napi_env env, napi_callback_info info);
napi_value DrawingMatrixPart3(napi_env env, napi_callback_info info);
napi_value DrawingBrushCreateDestroy(napi_env env, napi_callback_info info);
napi_value DrawingBrushAntiAlias(napi_env env, napi_callback_info info);
napi_value DrawingBrushColor(napi_env env, napi_callback_info info);
napi_value DrawingBrushAlpha(napi_env env, napi_callback_info info);
napi_value DrawingBrushShaderEffect(napi_env env, napi_callback_info info);
napi_value DrawingBrushShadowLayer(napi_env env, napi_callback_info info);
napi_value DrawingBrushFilter(napi_env env, napi_callback_info info);
napi_value DrawingBrushBlendMode(napi_env env, napi_callback_info info);
napi_value DrawingBrushReset(napi_env env, napi_callback_info info);
napi_value DrawingBrushGetFloat(napi_env env, napi_callback_info info);
napi_value DrawingBrushSetColor4f(napi_env env, napi_callback_info info);
napi_value DrawingPenCreateDestroy(napi_env env, napi_callback_info info);
napi_value DrawingPenAntiAlias(napi_env env, napi_callback_info info);
napi_value DrawingPenColor(napi_env env, napi_callback_info info);
napi_value DrawingPenAlpha(napi_env env, napi_callback_info info);
napi_value DrawingPenWidth(napi_env env, napi_callback_info info);
napi_value DrawingPenMiterLimit(napi_env env, napi_callback_info info);
napi_value DrawingPenCap(napi_env env, napi_callback_info info);
napi_value DrawingPenJoin(napi_env env, napi_callback_info info);
napi_value DrawingPenEffects(napi_env env, napi_callback_info info);
napi_value DrawingPenFilter(napi_env env, napi_callback_info info);
napi_value DrawingPenBlendMode(napi_env env, napi_callback_info info);
napi_value DrawingPenGetFillPath(napi_env env, napi_callback_info info);
napi_value DrawingPenReset(napi_env env, napi_callback_info info);
napi_value DrawingPenGetFloat(napi_env env, napi_callback_info info);
napi_value DrawingPenSetColor4f(napi_env env, napi_callback_info info);
napi_value DrawingPixelMap(napi_env env, napi_callback_info info);
napi_value DrawingRectCreateDestroyIntersectJoin(napi_env env, napi_callback_info info);
napi_value DrawingRectSetGetLeftTopRightBottom(napi_env env, napi_callback_info info);
napi_value DrawingRectOtherOperations(napi_env env, napi_callback_info info);
napi_value DrawingRectPart2OtherOperations(napi_env env, napi_callback_info info);
napi_value DrawingRoundRect(napi_env env, napi_callback_info info);
napi_value DrawingSamplingOptions(napi_env env, napi_callback_info info);
napi_value DrawingShadowLayer(napi_env env, napi_callback_info info);
napi_value DrawingShaderEffectCreateGradient(napi_env env, napi_callback_info info);
napi_value DrawingShaderEffectCreateSpecial(napi_env env, napi_callback_info info);
napi_value DrawingShaderEffectDestroy(napi_env env, napi_callback_info info);
napi_value DrawingSurface(napi_env env, napi_callback_info info);
napi_value DrawingTextBlobBuilder(napi_env env, napi_callback_info info);
napi_value DrawingTextBlobCreate(napi_env env, napi_callback_info info);
napi_value DrawingTextBlobOther(napi_env env, napi_callback_info info);
napi_value DrawingTypefaceCreate(napi_env env, napi_callback_info info);
napi_value DrawingTypefaceIsBoldItalic(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawPixelMapRect(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawBackground(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawRegion(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawPoints(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawBitmap(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawBitmapRect(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawRect(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawCircle(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawOval(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawArc(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawRoundRect(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawTextBlob(napi_env env, napi_callback_info info);
napi_value DrawingCanvasClipRect(napi_env env, napi_callback_info info);
napi_value DrawingCanvasClipRoundRect(napi_env env, napi_callback_info info);
napi_value DrawingCanvasClipPath(napi_env env, napi_callback_info info);
napi_value DrawingCanvasRotate(napi_env env, napi_callback_info info);
napi_value DrawingCanvasTranslate(napi_env env, napi_callback_info info);
napi_value DrawingCanvasScale(napi_env env, napi_callback_info info);
napi_value DrawingCanvasSkew(napi_env env, napi_callback_info info);
napi_value DrawingCanvasGetWidthHeight(napi_env env, napi_callback_info info);
napi_value DrawingCanvasGetLocalClipBounds(napi_env env, napi_callback_info info);
napi_value DrawingCanvasConcatMatrix(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawShadow(napi_env env, napi_callback_info info);
napi_value DrawingCanvasClear(napi_env env, napi_callback_info info);
napi_value DrawingCanvasSetMatrix(napi_env env, napi_callback_info info);
napi_value DrawingCanvasResetMatrix(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawImageRect(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawVertices(napi_env env, napi_callback_info info);
napi_value DrawingCanvasReadPixels(napi_env env, napi_callback_info info);
napi_value DrawingCanvasReadPixelsToBitmap(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawSingleCharacter(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawPoint(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawColor(napi_env env, napi_callback_info info);
napi_value DrawingCanvasIsClipEmpty(napi_env env, napi_callback_info info);
napi_value DrawingCanvasGetImageInfo(napi_env env, napi_callback_info info);
napi_value DrawingCanvasClipRegion(napi_env env, napi_callback_info info);
napi_value DrawingCanvasQuickRejectPath(napi_env env, napi_callback_info info);
napi_value DrawingCanvasQuickRejectRect(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawArcWithCenter(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawNestedRoundRect(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawPixelMapNine(napi_env env, napi_callback_info info);
napi_value DrawingCanvasCreateWithPixelMap(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawPixelMapRectConstraint(napi_env env, napi_callback_info info);
napi_value DrawingCanvasDrawPixelMapMesh(napi_env env, napi_callback_info info);

#endif // NAPI_INIT_COMMON_TEST_H
