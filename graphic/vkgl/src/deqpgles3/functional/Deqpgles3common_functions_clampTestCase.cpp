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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013022,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013023,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013024,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013025,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013026,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013027,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013028,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013029,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013030,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013031,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013032,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013033,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013034,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013035,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013036,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013037,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013038,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013039,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013040,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013041,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013042,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013043,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013044,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013045,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013046,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013047,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013048,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013049,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013050,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013051,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013052,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013053,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013054,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013055,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013056,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013057,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013058,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013059,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013060,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013061,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013062,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013063,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.highp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013064,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.clamp.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013065,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013066,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013067,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013068,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013069,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013070,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013071,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013072,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013073,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013074,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013075,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013076,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013077,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013078,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013079,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013080,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013081,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013082,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013083,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013084,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013085,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013086,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013087,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013088,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013089,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013090,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013091,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013092,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013093,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013094,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013095,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013096,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013097,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013098,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013099,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013100,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013101,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013102,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013103,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013104,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013105,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013106,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013107,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013108,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013109,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013110,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013111,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013112,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013113,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013114,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013115,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013116,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013117,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013118,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013119,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013120,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013121,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013122,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013123,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013124,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.clamp.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013125,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013126,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013127,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013128,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.clamp.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013129,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.clamp.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013130,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013131,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013132,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013133,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013134,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013135,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013136,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013137,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013138,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013139,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013140,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013141,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013142,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013143,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013144,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013145,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.clamp.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013146,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.clamp.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013147,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.clamp.highp_uvec4_uint_fragment");
