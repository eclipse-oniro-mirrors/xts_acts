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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_MATRIX_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_MATRIX_TEST_H

#include <cfloat> // For FLT_MAX
#include <cstdint> // For int, float types

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Constants for test values - shared across DrawingNativeMatrix test files
constexpr int MATRIX_LOOP_COUNT_10 = 10;
constexpr int MATRIX_ARRAY_SIZE_10 = 10;
constexpr int MATRIX_ARRAY_SIZE_9 = 9;
constexpr int MATRIX_ARRAY_SIZE_7 = 7;
constexpr int MATRIX_ARRAY_SIZE_5 = 5;
constexpr int MATRIX_ARRAY_SIZE_4 = 4;
constexpr int MATRIX_ARRAY_SIZE_2 = 2;

constexpr float MATRIX_ANGLE_180 = 180.0f;
constexpr float MATRIX_ANGLE_360 = 360.0f;
constexpr float MATRIX_ANGLE_90 = 90.0f;
constexpr float MATRIX_ANGLE_45 = 45.0f;
constexpr float MATRIX_ANGLE_45_5 = 45.5f;
constexpr float MATRIX_ANGLE_361 = 361.0f;
constexpr float MATRIX_ANGLE_NEGATIVE_90 = -90.0f;
constexpr float MATRIX_ANGLE_NEGATIVE_180 = -180.0f;
constexpr float MATRIX_ANGLE_NEGATIVE_360 = -360.0f;

constexpr float MATRIX_COORD_10 = 10.0f;
constexpr float MATRIX_COORD_20 = 20.0f;
constexpr float MATRIX_COORD_30 = 30.0f;
constexpr float MATRIX_COORD_50 = 50.0f;
constexpr float MATRIX_COORD_100 = 100.0f;
constexpr float MATRIX_COORD_200 = 200.0f;
constexpr float MATRIX_COORD_NEGATIVE_10 = -10.0f;

constexpr float MATRIX_TRANSLATE_1_5 = 1.5f;
constexpr float MATRIX_TRANSLATE_2_5 = 2.5f;
constexpr float MATRIX_TRANSLATE_3 = 3.0f;
constexpr float MATRIX_TRANSLATE_4 = 4.0f;
constexpr float MATRIX_TRANSLATE_NEGATIVE_1_5 = -1.5f;
constexpr float MATRIX_TRANSLATE_NEGATIVE_2_5 = -2.5f;

constexpr float MATRIX_VALUE_1_0 = 1.0f;
constexpr float MATRIX_VALUE_1_1 = 1.1f;
constexpr float MATRIX_VALUE_2_0 = 2.0f;
constexpr float MATRIX_VALUE_3_0 = 3.0f;
constexpr float MATRIX_VALUE_4_0 = 4.0f;
constexpr float MATRIX_VALUE_5_0 = 5.0f;
constexpr float MATRIX_VALUE_6_0 = 6.0f;
constexpr float MATRIX_VALUE_7_0 = 7.0f;
constexpr float MATRIX_VALUE_8_0 = 8.0f;
constexpr float MATRIX_VALUE_9_0 = 9.0f;
constexpr float MATRIX_VALUE_NEGATIVE_1_0 = -1.0f;
constexpr float MATRIX_VALUE_NEGATIVE_1_1 = -1.1f;
constexpr float MATRIX_VALUE_NEGATIVE_2_0 = -2.0f;
constexpr float MATRIX_VALUE_NEGATIVE_3_0 = -3.0f;
constexpr float MATRIX_VALUE_NEGATIVE_7_0 = -7.0f;
constexpr float MATRIX_VALUE_NEGATIVE_8_0 = -8.0f;
constexpr float MATRIX_VALUE_NEGATIVE_10_0 = -10.0f;
constexpr float MATRIX_VALUE_NEGATIVE_12_0 = -12.0f;
constexpr float MATRIX_VALUE_NEGATIVE_18_0 = -18.0f;
constexpr float MATRIX_VALUE_NEGATIVE_32_0 = -32.0f;
constexpr float MATRIX_VALUE_32_0 = 32.0f;
constexpr float MATRIX_VALUE_40_0 = 40.0f;
constexpr float MATRIX_VALUE_38_0 = 38.0f;
constexpr float MATRIX_VALUE_14_0 = 14.0f;
constexpr float MATRIX_VALUE_12_0 = 12.0f;

constexpr int MATRIX_INT_1 = 1;
constexpr int MATRIX_INT_2 = 2;
constexpr int MATRIX_INT_3 = 3;
constexpr int MATRIX_INT_4 = 4;
constexpr int MATRIX_INT_5 = 5;
constexpr int MATRIX_INT_6 = 6;
constexpr int MATRIX_INT_7 = 7;
constexpr int MATRIX_INT_8 = 8;
constexpr int MATRIX_INT_9 = 9;
constexpr int MATRIX_NEGATIVE_1 = -1;

constexpr float MATRIX_RECT_SIZE_100 = 100.0f;
constexpr float MATRIX_RECT_SIZE_200 = 200.0f;
constexpr int MATRIX_RECT_INT_100 = 100;
constexpr int MATRIX_RECT_INT_200 = 200;

constexpr float MATRIX_POINT_X_0 = 0.0f;
constexpr float MATRIX_POINT_X_100 = 100.0f;
constexpr float MATRIX_POINT_Y_0 = 0.0f;
constexpr float MATRIX_POINT_Y_30 = 30.0f;
constexpr float MATRIX_POINT_Y_70 = 70.0f;
constexpr float MATRIX_POINT_Y_100 = 100.0f;

constexpr float MATRIX_POLY_COUNT_1_52 = 1.52;
constexpr int MATRIX_POLY_COUNT_5 = 5;

constexpr float MATRIX_RANDOM_DIST_MIN_0 = 0.0f;
constexpr float MATRIX_RANDOM_DIST_MAX_100 = 100.0f;
constexpr float MATRIX_RANDOM_DIST_MIN_100 = 100.0f;
constexpr float MATRIX_RANDOM_DIST_MAX_200 = 200.0f;
constexpr float MATRIX_RANDOM_DIST_MIN_NEGATIVE_100 = -100.0f;
constexpr int MATRIX_RANDOM_DIST_INT_MIN_NEGATIVE_360 = -360;
constexpr int MATRIX_RANDOM_DIST_INT_MAX_360 = 360;

constexpr float MATRIX_FLT_MAX = FLT_MAX;

constexpr int MATRIX_SCALE_TO_FIT_COUNT_4 = 4;
constexpr int MATRIX_MATRIX_INDEX_0 = 0;
constexpr int MATRIX_MATRIX_INDEX_1 = 1;
constexpr int MATRIX_MATRIX_INDEX_2 = 2;
constexpr int MATRIX_MATRIX_INDEX_3 = 3;
constexpr int MATRIX_MATRIX_INDEX_4 = 4;
constexpr int MATRIX_MATRIX_INDEX_5 = 5;
constexpr int MATRIX_MATRIX_INDEX_6 = 6;
constexpr int MATRIX_MATRIX_INDEX_7 = 7;
constexpr int MATRIX_MATRIX_INDEX_8 = 8;
constexpr int MATRIX_MATRIX_INDEX_9 = 9;

// Matrix related functions
int TestMatrixCreateDestroyNormal();
int TestMatrixCreateDestroyNULL();
int TestMatrixCreateDestroyMultipleCalls();
int TestMatrixCreateRotationNormal();
int TestMatrixCreateRotationNull();
int TestMatrixCreateRotationAbnormal();
int TestMatrixCreateRotationMaximum();
int TestMatrixCreateRotationMultipleCalls();
int TestMatrixCreateTranslationNormal();
int TestMatrixCreateTranslationNull();
int TestMatrixCreateTranslationAbnormal();
int TestMatrixCreateTranslationMaximum();
int TestMatrixCreateTranslationMultipleCalls();
int TestMatrixMatrixSetGetMatrixNormal();
int TestMatrixMatrixSetGetMatrixNull();
int TestMatrixMatrixSetGetMatrixAbnormal();
int TestMatrixMatrixSetGetMatrixMaximum();
int TestMatrixMatrixSetGetMatrixMultipleCalls();
int TestMatrixTranslateNormal();
int TestMatrixTranslateNull();
int TestMatrixTranslateAbnormal();
int TestMatrixTranslateMaximum();
int TestMatrixTranslateMultipleCalls();
int TestMatrixRotateNormal();
int TestMatrixRotateNull();
int TestMatrixRotateAbnormal();
int TestMatrixRotateMaximum();
int TestMatrixRotateMultipleCalls();
int TestMatrixCreateScaleNormal();
int TestMatrixCreateScaleNull();
int TestMatrixCreateScaleAbnormal();
int TestMatrixCreateScaleMaximum();
int TestMatrixCreateScaleMultipleCalls();
int TestMatrixScaleNormal();
int TestMatrixScaleNull();
int TestMatrixScaleAbnormal();
int TestMatrixScaleMaximum();
int TestMatrixScaleMultipleCalls();
int TestMatrixSetRectToRectNormal();
int TestMatrixSetRectToRectNull();
int TestMatrixSetRectToRectMultipleCalls();
int TestMatrixPreRotateNormal();
int TestMatrixPreRotateNull();
int TestMatrixPreRotateAbnormal();
int TestMatrixPreRotateMaximum();
int TestMatrixPreRotateMultipleCalls();
int TestMatrixPreScaleNormal();
int TestMatrixPreScaleNull();
int TestMatrixPreScaleAbnormal();
int TestMatrixPreScaleMaximum();
int TestMatrixPreScaleMultipleCalls();
int TestMatrixPreTranslateNormal();
int TestMatrixPreTranslateNull();
int TestMatrixPreTranslateAbnormal();
int TestMatrixPreTranslateMaximum();
int TestMatrixPreTranslateMultipleCalls();
int TestMatrixPostRotateNormal();
int TestMatrixPostRotateNull();
int TestMatrixPostRotateAbnormal();
int TestMatrixPostRotateMaximum();
int TestMatrixPostRotateMultipleCalls();
int TestMatrixPostScaleNormal();
int TestMatrixPostScaleNull();
int TestMatrixPostScaleAbnormal();
int TestMatrixPostScaleMaximum();
int TestMatrixPostScaleMultipleCalls();

int TestMatrixPostTranslateNormal();
int TestMatrixPostTranslateNull();
int TestMatrixPostTranslateAbnormal();
int TestMatrixPostTranslateMaximum();
int TestMatrixPostTranslateMultipleCalls();
int TestMatrixResetNormal();
int TestMatrixResetNull();
int TestMatrixResetMultipleCalls();
int TestMatrixConcatNormal();
int TestMatrixConcatNull();
int TestMatrixConcatMultipleCalls();
int TestMatrixInvertNormal();
int TestMatrixInvertNull();
int TestMatrixInvertMultipleCalls();
int TestMatrixSetPolyToPolyNormal();
int TestMatrixSetPolyToPolyNull();
int TestMatrixSetPolyToPolyAbnormal();
int TestMatrixSetPolyToPolyMultipleCalls();
int TestMatrixMapPointsNormal();
int TestMatrixMapPointsNull();
int TestMatrixMapPointsAbnormal();
int TestMatrixMapPointsMultipleCalls();
int TestMatrixMapRectNormal();
int TestMatrixMapRectNull();
int TestMatrixMapRectMultipleCalls();
int TestMatrixIsEqualNormal();
int TestMatrixIsEqualNull();
int TestMatrixIsEqualMultipleCalls();
int TestMatrixIsIdentityNormal();
int TestMatrixIsIdentityNull();
int TestMatrixIsIdentityMultipleCalls();
int TestMatrixCopyNormal();
int TestMatrixCopyNull();
int TestMatrixCopyMultipleCalls();
int TestMatrixPerConcatNormal();
int TestMatrixPerConcatNull1();
int TestMatrixPerConcatNull2();
int TestMatrixPerConcatCalls();
int TestMatrixIsAffineNormal();
int TestMatrixIsAffineNull();
int TestMatrixIsAffineMultipleCalls();
int TestMatrixPreSkewNormal();
int TestMatrixPreSkewNull();
int TestMatrixPreSkewMultipleCalls();
int TestMatrixRectStaysRectNormal();
int TestMatrixRectStaysRectNull();
int TestMatrixRectStaysRectMultipleCalls();
int TestMatrixSetSinCosNormal();
int TestMatrixSetSinCosNull();
int TestMatrixSetSinCosMultipleCalls();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_MATRIX_TEST_H
