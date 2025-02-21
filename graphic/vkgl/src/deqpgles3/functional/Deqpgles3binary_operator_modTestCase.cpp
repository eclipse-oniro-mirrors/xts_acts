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
#include "../ActsDeqpgles30009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008744,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.mod.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008745,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008746,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008747,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008748,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008749,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008750,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008751,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008752,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008753,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008754,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008755,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008756,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008757,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008758,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008759,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008760,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.mod.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008761,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008762,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008763,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008764,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008765,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008766,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008767,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008768,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.mod.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008769,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008770,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008771,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008772,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008773,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008774,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008775,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008776,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008777,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008778,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008779,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008780,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008781,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008782,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008783,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008784,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008785,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008786,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008787,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008788,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008789,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008790,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.mod.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008791,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.mod.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008792,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008793,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008794,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008795,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008796,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008797,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008798,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008799,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008800,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008801,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008802,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008803,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008804,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008805,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008806,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008807,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008808,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008809,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008810,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008811,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008812,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008813,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mod.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008814,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008815,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008816,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008817,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mod.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008818,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008819,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008820,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008821,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mod.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008822,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008823,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008824,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008825,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008826,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008827,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008828,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008829,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008830,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008831,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008832,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008833,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008834,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008835,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008836,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008837,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008838,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008839,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008840,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008841,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008842,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008843,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008844,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008845,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008846,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008847,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008848,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008849,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mod.mediump_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008850,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008851,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008852,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008853,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mod.mediump_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008854,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.mod.lowp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008855,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.lowp_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008856,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.mediump_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008857,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.mod.mediump_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008858,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008859,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.highp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008860,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008861,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.highp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008862,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.mod.highp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008863,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.mod.highp_uint_uvec4_fragment");
