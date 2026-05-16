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

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015960,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.negation.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015961,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015962,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015963,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015964,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.negation.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015965,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015966,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015967,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015968,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015969,
        "dEQP-GLES3.functional.shaders.matrix.",
        "negation.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015970,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015971,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015972,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015973,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015974,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015975,
        "dEQP-GLES3.functional.shaders.matrix.",
        "negation.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015976,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015977,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015978,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015979,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015980,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015981,
        "dEQP-GLES3.functional.shaders.matrix.",
        "negation.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015982,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015983,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015984,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.negation.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015985,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015986,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015987,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015988,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.negation.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015989,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015990,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015991,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015992,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015993,
        "dEQP-GLES3.functional.shaders.matrix.",
        "negation.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015994,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015995,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015996,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015997,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015998,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015999,
        "dEQP-GLES3.functional.shaders.matrix.",
        "negation.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016000,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016001,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016002,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016003,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016004,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016005,
        "dEQP-GLES3.functional.shaders.matrix.",
        "negation.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016006,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016007,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016008,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.negation.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016009,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016010,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016011,
        "dEQP-GLES3.functional.shaders.matrix",
        ".negation.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016012,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.negation.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_016013,
        "dEQP-GLES3.functional.shaders.matri",
        "x.negation.highp_mat4_float_fragment");
