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

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015762,
        "dEQP-GLES3.functional.shaders.matrix.out",
        "erproduct.dynamic.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015763,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015764,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015765,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015766,
        "dEQP-GLES3.functional.shaders.matrix.out",
        "erproduct.dynamic.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015767,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015768,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015769,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015770,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015771,
        "dEQP-GLES3.functional.shaders.matrix.outerp",
        "roduct.dynamic.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015772,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015773,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015774,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015775,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015776,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015777,
        "dEQP-GLES3.functional.shaders.matrix.outerp",
        "roduct.dynamic.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015778,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015779,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015780,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015781,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015782,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015783,
        "dEQP-GLES3.functional.shaders.matrix.outerp",
        "roduct.dynamic.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015784,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015785,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015786,
        "dEQP-GLES3.functional.shaders.matrix.out",
        "erproduct.dynamic.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015787,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015788,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015789,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015790,
        "dEQP-GLES3.functional.shaders.matrix.out",
        "erproduct.dynamic.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015791,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015792,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015793,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015794,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015795,
        "dEQP-GLES3.functional.shaders.matrix.outerp",
        "roduct.dynamic.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015796,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015797,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015798,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015799,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015800,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015801,
        "dEQP-GLES3.functional.shaders.matrix.outerp",
        "roduct.dynamic.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015802,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015803,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015804,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015805,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015806,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015807,
        "dEQP-GLES3.functional.shaders.matrix.outerp",
        "roduct.dynamic.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015808,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015809,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015810,
        "dEQP-GLES3.functional.shaders.matrix.out",
        "erproduct.dynamic.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015811,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015812,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015813,
        "dEQP-GLES3.functional.shaders.matrix.outer",
        "product.dynamic.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015814,
        "dEQP-GLES3.functional.shaders.matrix.out",
        "erproduct.dynamic.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015815,
        "dEQP-GLES3.functional.shaders.matrix.oute",
        "rproduct.dynamic.highp_mat4_float_fragment");
