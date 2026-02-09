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

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001953,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.integer.findmsb.int_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001954,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.int_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001955,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.int_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001956,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.int_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001957,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.int_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001958,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.integer.findmsb.int_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001959,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.int_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001960,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.int_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001961,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.int_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001962,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.int_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001963,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.int_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001964,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.int_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001965,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.integer.findmsb.int_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001966,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.int_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001967,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.int_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001968,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.int_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001969,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.int_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001970,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.int_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001971,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.ivec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001972,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001973,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001974,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.ivec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001975,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001976,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.ivec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001977,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001978,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001979,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001980,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findmsb.ivec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001981,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.ivec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001982,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001983,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.ivec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001984,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001985,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001986,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.ivec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001987,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001988,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001989,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.ivec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001990,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001991,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001992,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.ivec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001993,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001994,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.ivec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001995,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001996,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001997,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001998,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findmsb.ivec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001999,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.ivec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002000,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002001,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.ivec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002002,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002003,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002004,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.ivec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002005,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002006,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002007,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.ivec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002008,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002009,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002010,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.ivec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002011,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002012,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.ivec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002013,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002014,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002015,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002016,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findmsb.ivec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002017,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.ivec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002018,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002019,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.ivec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002020,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002021,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002022,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.ivec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002023,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.ivec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002024,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.ivec4_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002025,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.integer.findmsb.uint_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002026,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uint_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002027,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uint_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002028,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uint_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002029,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uint_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002030,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uint_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002031,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uint_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002032,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uint_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002033,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uint_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002034,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findmsb.uint_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002035,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uint_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002036,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uint_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002037,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uint_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002038,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uint_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002039,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uint_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002040,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.uint_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002041,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uint_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002042,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uint_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002043,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uvec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002044,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002045,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002046,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.uvec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002047,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002048,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uvec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002049,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002050,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002051,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002052,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findmsb.uvec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002053,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.uvec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002054,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002055,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uvec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002056,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002057,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002058,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.uvec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002059,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002060,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002061,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uvec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002062,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002063,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002064,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.uvec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002065,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002066,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uvec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002067,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002068,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002069,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002070,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findmsb.uvec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002071,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.uvec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002072,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002073,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uvec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002074,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002075,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002076,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.uvec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002077,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002078,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002079,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uvec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002080,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002081,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002082,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.uvec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002083,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002084,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uvec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002085,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002086,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002087,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002088,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.findmsb.uvec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002089,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.uvec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002090,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002091,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.integer.findmsb.uvec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002092,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002093,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002094,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.findmsb.uvec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002095,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.findmsb.uvec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_002096,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.integer.findmsb.uvec4_highp_compute");
