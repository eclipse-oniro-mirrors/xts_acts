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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004774,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004775,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004776,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004777,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004778,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004779,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004780,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.div.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004781,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004782,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004783,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004784,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004785,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004786,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.div.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004787,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004788,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004789,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004790,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004791,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004792,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.div.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004793,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004794,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004795,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004796,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004797,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004798,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.div.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004799,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004800,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004801,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004802,
        "dEQP-GLES2.functional.shaders.operato",
        "r.binary_operator.div.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004803,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004804,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004805,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004806,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004807,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004808,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004809,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004810,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004811,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004812,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004813,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004814,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004815,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004816,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004817,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004818,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004819,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004820,
        "dEQP-GLES2.functional.shaders.operator",
        ".binary_operator.div.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004821,
        "dEQP-GLES2.functional.shaders.operator.",
        "binary_operator.div.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004822,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004823,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004824,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004825,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.div.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004826,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004827,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004828,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004829,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004830,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004831,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.div.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004832,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004833,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004834,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004835,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004836,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004837,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.div.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004838,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004839,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004840,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004841,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004842,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004843,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004844,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004845,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004846,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004847,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004848,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004849,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004850,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004851,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004852,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004853,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004854,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004855,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004856,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004857,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004858,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004859,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004860,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004861,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.div.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004862,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004863,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004864,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004865,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004866,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004867,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.div.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004868,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004869,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004870,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004871,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004872,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004873,
        "dEQP-GLES2.functional.shaders.operator.bina",
        "ry_operator.div.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004874,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004875,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.highp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004876,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004877,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004878,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004879,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004880,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004881,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004882,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004883,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004884,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004885,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004886,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004887,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004888,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004889,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004890,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004891,
        "dEQP-GLES2.functional.shaders.operator.bin",
        "ary_operator.div.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004892,
        "dEQP-GLES2.functional.shaders.operator.b",
        "inary_operator.div.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004893,
        "dEQP-GLES2.functional.shaders.operator.bi",
        "nary_operator.div.highp_int_ivec4_fragment");
