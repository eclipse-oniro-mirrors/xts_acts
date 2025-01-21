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
#include "../ActsDeqpgles30014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013872,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.uniform.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013873,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013874,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.uniform.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013875,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013876,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013877,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013878,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013879,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013880,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013881,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013882,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.uniform.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013883,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013884,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013885,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013886,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013887,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.lowp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013888,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013889,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013890,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013891,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013892,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013893,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013894,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013895,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013896,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013897,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013898,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013899,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.lowp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013900,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013901,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013902,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013903,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013904,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013905,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013906,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013907,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013908,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013909,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013910,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013911,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.lowp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013912,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013913,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013914,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013915,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013916,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013917,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013918,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013919,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013920,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.uniform.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013921,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013922,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.uniform.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013923,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013924,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013925,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013926,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013927,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013928,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013929,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013930,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.uniform.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013931,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013932,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013933,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013934,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013935,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.lowp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013936,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013937,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013938,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013939,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013940,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013941,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013942,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013943,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013944,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013945,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013946,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013947,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.lowp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013948,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013949,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013950,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013951,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013952,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013953,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013954,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013955,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013956,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013957,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013958,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.lowp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013959,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.lowp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013960,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013961,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013962,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013963,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.uniform.mediump_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013964,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013965,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013966,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013967,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.highp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013968,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.uniform.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013969,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013970,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.uniform.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013971,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013972,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013973,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.uniform.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013974,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013975,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013976,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013977,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.uniform.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013978,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.uniform.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013979,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.uniform.highp_mat4_mat4_fragment");
