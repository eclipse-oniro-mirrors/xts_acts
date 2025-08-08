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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012770,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012771,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012772,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012773,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012774,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012775,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012776,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012777,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012778,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012779,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012780,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012781,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012782,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012783,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012784,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012785,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012786,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012787,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012788,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012789,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012790,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012791,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012792,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012793,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012794,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012795,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012796,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012797,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.min.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012798,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012799,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012800,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012801,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012802,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012803,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.min.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012804,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012805,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012806,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012807,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012808,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012809,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.min.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012810,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012811,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012812,
        "dEQP-GLES3.functional.shaders.operato",
        "r.common_functions.min.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012813,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012814,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012815,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012816,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012817,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012818,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012819,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012820,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012821,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012822,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012823,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012824,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012825,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012826,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012827,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012828,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012829,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012830,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012831,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012832,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012833,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012834,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012835,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012836,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012837,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012838,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012839,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.min.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012840,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012841,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012842,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012843,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012844,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012845,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.min.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012846,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012847,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012848,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012849,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012850,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012851,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.min.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012852,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012853,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012854,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012855,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012856,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012857,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012858,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012859,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012860,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012861,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012862,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012863,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012864,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012865,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012866,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012867,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012868,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012869,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012870,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012871,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012872,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.min.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012873,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012874,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012875,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012876,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.min.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012877,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.min.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012878,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012879,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012880,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012881,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.min.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012882,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012883,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012884,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012885,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012886,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012887,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.min.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012888,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012889,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012890,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012891,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012892,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012893,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.min.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012894,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.min.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012895,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.min.highp_uvec4_uint_fragment");
