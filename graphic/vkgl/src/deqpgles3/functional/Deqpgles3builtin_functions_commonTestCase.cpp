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
#include "../ActsDeqpgles30020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019774,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019775,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.abs_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019776,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.abs_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019777,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019778,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.abs_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019779,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019780,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.abs_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019781,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019782,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.abs_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019783,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019784,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019785,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.abs_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019786,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019787,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.abs_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019788,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019789,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.abs_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019790,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019791,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019792,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019793,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019794,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019795,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019796,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019797,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019798,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.sign_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019799,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019800,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019801,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019802,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019803,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019804,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019805,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019806,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.floor_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019807,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.floor_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019808,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.floor_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019809,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.floor_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019810,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.floor_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019811,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.floor_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019812,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.floor_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019813,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.floor_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019814,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.trunc_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019815,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.trunc_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019816,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.trunc_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019817,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.trunc_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019818,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.trunc_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019819,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.trunc_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019820,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.trunc_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019821,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.trunc_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019822,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.round_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019823,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.round_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019824,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.round_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019825,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.round_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019826,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.round_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019827,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.round_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019828,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.round_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019829,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.round_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019830,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.ceil_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019831,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.ceil_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019832,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.ceil_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019833,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.ceil_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019834,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.ceil_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019835,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.ceil_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019836,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.ceil_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019837,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.ceil_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019838,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019839,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.min_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019840,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.min_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019841,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019842,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019843,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019844,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.min_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019845,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019846,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019847,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019848,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.min_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019849,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019850,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019851,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019852,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.min_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019853,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019854,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019855,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.min_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019856,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019857,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019858,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019859,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.min_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019860,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019861,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019862,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019863,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.min_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019864,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019865,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019866,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.min_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019867,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019868,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019869,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.min_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019870,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019871,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019872,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019873,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.min_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019874,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019875,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019876,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019877,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.min_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019878,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019879,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019880,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019881,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.max_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019882,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.max_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019883,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019884,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019885,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019886,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.max_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019887,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019888,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019889,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019890,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.max_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019891,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019892,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019893,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019894,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.max_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019895,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019896,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019897,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.max_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019898,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019899,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019900,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019901,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.max_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019902,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019903,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019904,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019905,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.max_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019906,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019907,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019908,
        "dEQP-GLES3.functional.shaders.constant_expres",
        "sions.builtin_functions.common.max_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019909,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019910,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019911,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.max_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019912,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019913,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019914,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019915,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.max_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019916,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019917,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019918,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019919,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.max_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019920,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019921,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019922,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019923,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.clamp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019924,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.clamp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019925,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019926,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019927,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019928,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.clamp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019929,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019930,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019931,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019932,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.clamp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019933,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019934,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019935,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019936,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.clamp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019937,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019938,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019939,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.clamp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019940,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019941,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019942,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019943,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.clamp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019944,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019945,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019946,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019947,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.clamp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019948,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019949,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019950,
        "dEQP-GLES3.functional.shaders.constant_express",
        "ions.builtin_functions.common.clamp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019951,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019952,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019953,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.clamp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019954,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019955,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019956,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019957,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.clamp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019958,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019959,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019960,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019961,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.clamp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019962,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019963,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_uvec4_uint_fragment");
