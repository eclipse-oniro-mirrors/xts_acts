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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000805,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ldexp.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000806,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000807,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000808,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000809,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000810,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000811,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000812,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000813,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000814,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.ldexp.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000815,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000816,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000817,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000818,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000819,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000820,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.ldexp.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000821,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000822,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000823,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ldexp.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000824,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000825,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000826,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000827,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000828,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ldexp.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000829,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000830,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000831,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000832,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.ldexp.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000833,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000834,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000835,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ldexp.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000836,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000837,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000838,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000839,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000840,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000841,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ldexp.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000842,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000843,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000844,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000845,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000846,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ldexp.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000847,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000848,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000849,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000850,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.ldexp.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000851,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000852,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000853,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ldexp.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000854,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000855,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000856,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000857,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000858,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000859,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ldexp.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000860,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000861,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000862,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000863,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000864,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ldexp.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000865,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000866,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000867,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000868,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.ldexp.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000869,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000870,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000871,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ldexp.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000872,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000873,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000874,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ldexp.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000875,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ldexp.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000876,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ldexp.vec4_highp_compute");
