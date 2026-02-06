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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_SHADER_EFFECT_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_SHADER_EFFECT_TEST_H

#include <cfloat>
#include <cstdint>

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Constants for test values - shared across DrawingNativeShaderEffect test files
constexpr uint32_t TEST_SHADER_COLOR_RED = 0xFFFF0000;
constexpr uint32_t TEST_SHADER_COLOR_GREEN = 0xFF00FF00;
constexpr uint32_t TEST_SHADER_COLOR_BLUE = 0xFF0000FF;
constexpr uint32_t TEST_SHADER_COLOR_CYAN = 0xFF00FFFF;
constexpr uint32_t TEST_SHADER_COLOR_MAGENTA = 0xFFFF00FF;
constexpr uint32_t TEST_SHADER_COLOR_YELLOW = 0xFFFFFF00;
constexpr uint32_t TEST_SHADER_COLOR_BLACK = 0xFF000000;
constexpr uint32_t TEST_SHADER_COLOR_WHITE = 0xFFFFFFFF;
constexpr uint32_t TEST_SHADER_COLOR_0 = 0;
constexpr uint32_t TEST_SHADER_COLOR_NEGATIVE_RED = 0xFFFF0000; // Used as -0xFFFF0000
constexpr uint32_t TEST_SHADER_COLOR_NEGATIVE_CYAN = 0xFF00FFFF; // Used as -0xFF00FFFF
constexpr uint32_t UINT32_MAX_VALUE = UINT32_MAX;
constexpr float SHADER_FLT_MAX_VALUE = FLT_MAX;
constexpr int SHADER_TEST_LOOP_COUNT_10 = 10;
constexpr float TEST_POINT_X_0 = 0.0f;
constexpr float TEST_POINT_Y_0 = 0.0f;
constexpr float TEST_POINT_X_100 = 100.0f;
constexpr float TEST_POINT_Y_100 = 100.0f;
constexpr float TEST_POINT_X_200 = 200.0f;
constexpr float TEST_POINT_Y_200 = 200.0f;
constexpr float TEST_POINT_NEGATIVE_1 = -1.0f;
constexpr float TEST_POINT_NEGATIVE_100 = -100.0f;
constexpr float TEST_POS_0 = 0.0f;
constexpr float TEST_POS_0_5 = 0.5f;
constexpr float TEST_POS_1 = 1.0f;
constexpr float TEST_POS_NEGATIVE_0_1 = -0.1f;
constexpr float TEST_POS_NEGATIVE_1 = -1.0f;
constexpr int TEST_COLOR_COUNT_3 = 3;
constexpr int TEST_COLOR_COUNT_2 = 2;
constexpr int TEST_ARRAY_INDEX_0 = 0;
constexpr int TEST_ARRAY_INDEX_1 = 1;
constexpr int TEST_ARRAY_INDEX_2 = 2;
constexpr int TEST_EFFECT_COUNT_6 = 6;
constexpr float TEST_RADIUS_5 = 5.0f;
constexpr float TEST_RADIUS_10 = 10.0f;
constexpr float TEST_RADIUS_100 = 100.0f;
constexpr float TEST_RADIUS_NEGATIVE_5 = -5.0f;
constexpr float TEST_RADIUS_NEGATIVE_100 = -100.0f;
constexpr int TEST_IMAGE_SIZE_200 = 200;
constexpr int SHADER_TEST_PIXELMAP_FORMAT_RGBA = 3;
constexpr int SHADER_TEST_PIXELMAP_ALPHA_PREMUL = 2;
constexpr int TEST_BYTES_PER_PIXEL = 4;
constexpr uint32_t TEST_PIXELMAP_COLOR_MAGENTA = 0xFFFF00FF;
constexpr int SHADER_TEST_MATRIX_VALUE_1 = 1;
constexpr int TEST_MATRIX_VALUE_2 = 2;
constexpr int TEST_MATRIX_VALUE_3 = 3;
constexpr int TEST_MATRIX_VALUE_4 = 4;
constexpr int TEST_MATRIX_VALUE_5 = 5;
constexpr int TEST_MATRIX_VALUE_6 = 6;
constexpr int TEST_MATRIX_VALUE_7 = 7;
constexpr int TEST_MATRIX_VALUE_8 = 8;
constexpr int TEST_MATRIX_VALUE_9 = 9;
constexpr int TEST_SIZE_MISMATCH_3 = 3;
constexpr uint32_t TEST_POS_UINT32_MAX = 0xFFFFFFFF;

// ShaderEffect related functions
int TestShaderEffectCreateColorShaderNormal();
int TestShaderEffectCreateColorShaderNull();
int TestShaderEffectCreateColorShaderAbnormal();
int TestShaderEffectCreateColorShaderMaximum();
int TestShaderEffectCreateColorShaderMultipleCalls();
int TestShaderEffectCreateLinearGradientWithLocalMatrixNormal();
int TestShaderEffectCreateLinearGradientWithLocalMatrixNull();
int TestShaderEffectCreateLinearGradientWithLocalMatrixAbnormal();
int TestShaderEffectCreateLinearGradientWithLocalMatrixMaximum();
int TestShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls();
int TestShaderEffectCreateLinearGradienNormal();
int TestShaderEffectCreateLinearGradienNull();
int TestShaderEffectCreateLinearGradienAbnormal();
int TestShaderEffectCreateLinearGradienMaximum();
int TestShaderEffectCreateLinearGradienMultipleCalls();
int TestShaderEffectCreateRadialGradientNormal();
int TestShaderEffectCreateRadialGradientNull();
int TestShaderEffectCreateRadialGradientAbnormal();
int TestShaderEffectCreateRadialGradientMaximum();
int TestShaderEffectCreateRadialGradientMultipleCalls();
int TestShaderEffectCreateRadialGradientWithLocalMatrixNormal();
int TestShaderEffectCreateRadialGradientWithLocalMatrixNull();
int TestShaderEffectCreateRadialGradientWithLocalMatrixAbnormal();
int TestShaderEffectCreateRadialGradientWithLocalMatrixMaximum();
int TestShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls();
int TestShaderEffectCreateSweepGradientNormal();
int TestShaderEffectCreateSweepGradientNull();
int TestShaderEffectCreateSweepGradientAbnormal();
int TestShaderEffectCreateSweepGradientMaximum();
int TestShaderEffectCreateSweepGradientMultipleCalls();
int TestShaderEffectCreateImageShaderNormal();
int TestShaderEffectCreateImageShaderNull();
int TestShaderEffectCreateImageShaderMultipleCalls();
int TestShaderEffectCreateTwoPointConicalGradientNormal();
int TestShaderEffectCreateTwoPointConicalGradientNull();
int TestShaderEffectCreateTwoPointConicalGradientAbnormal();
int TestShaderEffectCreateTwoPointConicalGradientMaximum();
int TestShaderEffectCreateTwoPointConicalGradientMultipleCalls();
int TestShaderEffectDestroyNormal();
int TestShaderEffectDestroyNull();
int TestShaderEffectCreateSweepGradientWithLocalMatrixNormal();
int TestShaderEffectCreateSweepGradientWithLocalMatrixNull();
int TestShaderEffectCreateSweepGradientWithLocalMatrixAbnormal();
int TestShaderEffectCreateSweepGradientWithLocalMatrixMultipleCalls();
int TestShaderEffectCreateComposeEnumTraversal();
int TestShaderEffectCreateComposeNull();
int TestShaderEffectCreateComposeMultipleCalls();
int TestShaderEffectCreatePixelMapShaderNormal();
int TestShaderEffectCreatePixelMapShaderNull();
int TestShaderEffectCreatePixelMapShaderMultiCalls();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_SHADER_EFFECT_TEST_H
