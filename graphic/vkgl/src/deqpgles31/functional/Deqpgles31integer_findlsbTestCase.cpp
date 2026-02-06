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
#include "../ActsDeqpgles310002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001809,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.integer.findlsb.int_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001810,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.int_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001811,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.int_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001812,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.int_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001813,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.int_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001814,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.integer.findlsb.int_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001815,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.int_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001816,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.int_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001817,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.int_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001818,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.int_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001819,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.int_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001820,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.int_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001821,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.integer.findlsb.int_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001822,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.int_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001823,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.int_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001824,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.int_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001825,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.int_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001826,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.int_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001827,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.ivec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001828,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001829,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001830,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.ivec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001831,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001832,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.ivec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001833,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001834,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001835,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001836,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findlsb.ivec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001837,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.ivec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001838,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001839,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.ivec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001840,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001841,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001842,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.ivec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001843,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001844,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001845,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.ivec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001846,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001847,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001848,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.ivec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001849,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001850,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.ivec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001851,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001852,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001853,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001854,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findlsb.ivec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001855,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.ivec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001856,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001857,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.ivec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001858,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001859,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001860,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.ivec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001861,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001862,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001863,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.ivec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001864,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001865,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001866,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.ivec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001867,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001868,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.ivec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001869,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001870,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001871,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001872,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findlsb.ivec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001873,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.ivec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001874,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001875,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.ivec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001876,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001877,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001878,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.ivec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001879,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.ivec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001880,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.ivec4_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001881,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.integer.findlsb.uint_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001882,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uint_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001883,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uint_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001884,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uint_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001885,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uint_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001886,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uint_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001887,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uint_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001888,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uint_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001889,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uint_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001890,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findlsb.uint_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001891,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uint_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001892,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uint_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001893,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uint_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001894,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uint_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001895,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uint_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001896,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.uint_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001897,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uint_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001898,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uint_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001899,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uvec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001900,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001901,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001902,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.uvec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001903,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001904,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uvec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001905,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001906,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001907,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001908,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findlsb.uvec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001909,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.uvec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001910,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001911,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uvec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001912,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001913,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001914,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.uvec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001915,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001916,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001917,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uvec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001918,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001919,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001920,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.uvec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001921,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001922,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uvec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001923,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001924,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001925,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001926,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findlsb.uvec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001927,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.uvec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001928,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001929,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uvec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001930,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001931,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001932,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.uvec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001933,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001934,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001935,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uvec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001936,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001937,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001938,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.uvec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001939,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001940,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uvec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001941,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001942,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001943,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001944,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findlsb.uvec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001945,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.uvec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001946,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001947,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findlsb.uvec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001948,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001949,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001950,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findlsb.uvec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001951,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findlsb.uvec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001952,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findlsb.uvec4_highp_compute");
