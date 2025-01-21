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
#include "../ActsDeqpgles30013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012896,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012897,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012898,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012899,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012900,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012901,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012902,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012903,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012904,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012905,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012906,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012907,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012908,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012909,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012910,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012911,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012912,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012913,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012914,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012915,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012916,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012917,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012918,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012919,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012920,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012921,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012922,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012923,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.max.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012924,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012925,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012926,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012927,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012928,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012929,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.max.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012930,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012931,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012932,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012933,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012934,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012935,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.max.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012936,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012937,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012938,
        "dEQP-GLES3.functional.shaders.operato",
        "r.common_functions.max.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012939,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012940,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012941,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012942,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012943,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012944,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012945,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012946,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012947,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012948,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012949,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012950,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012951,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012952,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012953,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012954,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012955,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012956,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012957,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012958,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012959,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012960,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012961,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012962,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012963,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012964,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012965,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.max.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012966,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012967,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012968,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012969,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012970,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012971,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.max.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012972,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012973,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012974,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012975,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012976,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012977,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.max.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012978,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012979,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012980,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012981,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012982,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012983,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012984,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012985,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012986,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012987,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012988,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012989,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012990,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012991,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012992,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012993,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012994,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012995,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012996,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012997,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012998,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.max.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012999,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013000,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013001,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013002,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.max.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013003,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.max.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013004,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013005,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013006,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013007,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.max.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013008,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013009,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013010,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013011,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013012,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013013,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.max.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013014,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013015,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013016,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013017,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013018,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013019,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.max.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013020,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.max.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_013021,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.max.highp_uvec4_uint_fragment");
