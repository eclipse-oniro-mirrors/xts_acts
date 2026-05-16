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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013764,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.add.const.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013765,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013766,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.add.const.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013767,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013768,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013769,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013770,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013771,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013772,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013773,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013774,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.add.const.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013775,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013776,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013777,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013778,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013779,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.lowp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013780,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013781,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013782,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013783,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013784,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013785,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013786,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013787,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013788,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013789,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013790,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013791,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.lowp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013792,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013793,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013794,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013795,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013796,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013797,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013798,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013799,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013800,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013801,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013802,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013803,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.lowp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013804,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013805,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013806,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013807,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013808,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013809,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013810,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013811,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013812,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.add.const.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013813,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013814,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.add.const.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013815,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013816,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013817,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013818,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013819,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013820,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013821,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013822,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.add.const.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013823,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013824,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013825,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013826,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013827,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.lowp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013828,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013829,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013830,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013831,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013832,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013833,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013834,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013835,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013836,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013837,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013838,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013839,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.lowp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013840,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013841,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013842,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013843,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013844,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013845,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013846,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013847,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013848,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013849,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013850,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.lowp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013851,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.lowp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013852,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013853,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013854,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013855,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.const.mediump_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013856,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013857,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013858,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013859,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.highp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013860,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.add.const.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013861,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013862,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.add.const.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013863,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013864,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013865,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.const.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013866,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013867,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013868,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013869,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.const.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013870,
        "dEQP-GLES3.functional.shaders.matr",
        "ix.add.const.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013871,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.const.highp_mat4_mat4_fragment");
