/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015906,
        "dEQP-GLES3.functional.shaders.matrix.",
        "unary_addition.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015907,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015908,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015909,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015910,
        "dEQP-GLES3.functional.shaders.matrix.",
        "unary_addition.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015911,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015912,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015913,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015914,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015915,
        "dEQP-GLES3.functional.shaders.matrix.una",
        "ry_addition.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015916,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015917,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015918,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015919,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015920,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015921,
        "dEQP-GLES3.functional.shaders.matrix.una",
        "ry_addition.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015922,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015923,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015924,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015925,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015926,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015927,
        "dEQP-GLES3.functional.shaders.matrix.una",
        "ry_addition.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015928,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015929,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015930,
        "dEQP-GLES3.functional.shaders.matrix.",
        "unary_addition.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015931,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015932,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015933,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015934,
        "dEQP-GLES3.functional.shaders.matrix.",
        "unary_addition.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015935,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015936,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015937,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015938,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015939,
        "dEQP-GLES3.functional.shaders.matrix.una",
        "ry_addition.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015940,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015941,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015942,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015943,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015944,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015945,
        "dEQP-GLES3.functional.shaders.matrix.una",
        "ry_addition.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015946,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015947,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015948,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015949,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015950,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015951,
        "dEQP-GLES3.functional.shaders.matrix.una",
        "ry_addition.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015952,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015953,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015954,
        "dEQP-GLES3.functional.shaders.matrix.",
        "unary_addition.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015955,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015956,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015957,
        "dEQP-GLES3.functional.shaders.matrix.un",
        "ary_addition.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015958,
        "dEQP-GLES3.functional.shaders.matrix.",
        "unary_addition.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015959,
        "dEQP-GLES3.functional.shaders.matrix.u",
        "nary_addition.highp_mat4_float_fragment");
