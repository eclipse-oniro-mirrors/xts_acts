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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013980,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.dynamic.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013981,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013982,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.dynamic.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013983,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013984,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013985,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013986,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013987,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013988,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013989,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013990,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.dynamic.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013991,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013992,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013993,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013994,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013995,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.lowp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013996,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013997,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013998,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013999,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014000,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014001,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014002,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014003,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014004,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014005,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014006,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014007,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.lowp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014008,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014009,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014010,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014011,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014012,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014013,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014014,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014015,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014016,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014017,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014018,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014019,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.lowp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014020,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014021,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014022,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014023,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014024,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014025,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014026,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014027,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014028,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.dynamic.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014029,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014030,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.dynamic.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014031,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014032,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014033,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014034,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014035,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014036,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014037,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014038,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.dynamic.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014039,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014040,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014041,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014042,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014043,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.lowp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014044,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014045,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014046,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014047,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014048,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014049,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014050,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014051,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014052,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014053,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014054,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014055,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.lowp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014056,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014057,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014058,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014059,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014060,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014061,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014062,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014063,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014064,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014065,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014066,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.lowp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014067,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.lowp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014068,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014069,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014070,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014071,
        "dEQP-GLES3.functional.shaders.matrix.ad",
        "d.dynamic.mediump_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014072,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014073,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014074,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014075,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.highp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014076,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.dynamic.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014077,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014078,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.dynamic.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014079,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014080,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014081,
        "dEQP-GLES3.functional.shaders.matrix.a",
        "dd.dynamic.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014082,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014083,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014084,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014085,
        "dEQP-GLES3.functional.shaders.matrix.",
        "add.dynamic.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014086,
        "dEQP-GLES3.functional.shaders.matri",
        "x.add.dynamic.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_014087,
        "dEQP-GLES3.functional.shaders.matrix",
        ".add.dynamic.highp_mat4_mat4_fragment");
