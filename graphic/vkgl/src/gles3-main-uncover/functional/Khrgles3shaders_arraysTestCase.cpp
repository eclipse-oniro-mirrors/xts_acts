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
#include "../Khrgles3BaseFunc.h"
#include "../ActsGles3MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000001,
        "dEQP-GLES3.functional.shaders.arrays.",
        "compare.equal_lowp_int_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000002,
        "dEQP-GLES3.functional.shaders.arrays.c",
        "ompare.equal_lowp_int_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000003,
        "dEQP-GLES3.functional.shaders.arrays.c",
        "ompare.equal_lowp_uint_lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000004,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_uint_lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000005,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_float_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000006,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_lowp_float_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000007,
        "dEQP-GLES3.functional.shaders.arrays.c",
        "ompare.equal_lowp_vec2_lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000008,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_vec2_lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000009,
        "dEQP-GLES3.functional.shaders.arrays.c",
        "ompare.equal_lowp_vec3_lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000010,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_vec3_lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000011,
        "dEQP-GLES3.functional.shaders.arrays.c",
        "ompare.equal_lowp_vec4_lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000012,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_vec4_lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000013,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_ivec2_lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000014,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_lowp_ivec2_lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000015,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_ivec3_lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000016,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_lowp_ivec3_lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000017,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_ivec4_lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000018,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_lowp_ivec4_lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000019,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_uvec2_lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000020,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_lowp_uvec2_lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000021,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_uvec3_lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000022,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_lowp_uvec3_lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000023,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_uvec4_lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000024,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_lowp_uvec4_lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000025,
        "dEQP-GLES3.functional.shaders.arrays.c",
        "ompare.equal_lowp_mat2_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000026,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_mat2_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000027,
        "dEQP-GLES3.functional.shaders.arrays.c",
        "ompare.equal_lowp_mat3_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000028,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_mat3_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000029,
        "dEQP-GLES3.functional.shaders.arrays.c",
        "ompare.equal_lowp_mat4_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000030,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_lowp_mat4_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000031,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_mediump_int_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000032,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_mediump_int_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000033,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_mediump_uint_lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000034,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_uint_lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000035,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_float_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000036,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_float_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000037,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_mediump_vec2_lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000038,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_vec2_lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000039,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_mediump_vec3_lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000040,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_vec3_lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000041,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_mediump_vec4_lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000042,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_vec4_lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000043,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_ivec2_lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000044,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_ivec2_lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000045,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_ivec3_lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000046,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_ivec3_lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000047,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_ivec4_lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000048,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_ivec4_lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000049,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_uvec2_lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000050,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_uvec2_lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000051,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_uvec3_lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000052,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_uvec3_lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000053,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_uvec4_lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000054,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_uvec4_lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000055,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_mediump_mat2_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000056,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_mat2_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000057,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_mediump_mat3_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000058,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_mat3_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000059,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_mediump_mat4_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000060,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_mat4_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000061,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_mediump_int_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000062,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_int_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000063,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_uint_mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000064,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_uint_mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000065,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_float_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000066,
        "dEQP-GLES3.functional.shaders.arrays.compar",
        "e.equal_mediump_float_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000067,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_vec2_mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000068,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_vec2_mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000069,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_vec3_mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000070,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_vec3_mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000071,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_vec4_mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000072,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_vec4_mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000073,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_ivec2_mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000074,
        "dEQP-GLES3.functional.shaders.arrays.compar",
        "e.equal_mediump_ivec2_mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000075,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_ivec3_mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000076,
        "dEQP-GLES3.functional.shaders.arrays.compar",
        "e.equal_mediump_ivec3_mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000077,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_ivec4_mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000078,
        "dEQP-GLES3.functional.shaders.arrays.compar",
        "e.equal_mediump_ivec4_mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000079,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_uvec2_mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000080,
        "dEQP-GLES3.functional.shaders.arrays.compar",
        "e.equal_mediump_uvec2_mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000081,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_uvec3_mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000082,
        "dEQP-GLES3.functional.shaders.arrays.compar",
        "e.equal_mediump_uvec3_mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000083,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_uvec4_mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000084,
        "dEQP-GLES3.functional.shaders.arrays.compar",
        "e.equal_mediump_uvec4_mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000085,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_mat2_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000086,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_mat2_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000087,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_mat3_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000088,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_mat3_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000089,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_mediump_mat4_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000090,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_mediump_mat4_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000091,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_int_mediump_int_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000092,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_int_mediump_int_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000093,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_uint_mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000094,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_uint_mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000095,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_float_mediump_float_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000096,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_highp_float_mediump_float_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000097,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_vec2_mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000098,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_vec2_mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000099,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_vec3_mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000100,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_vec3_mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000101,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_vec4_mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000102,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_vec4_mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000103,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_ivec2_mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000104,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_highp_ivec2_mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000105,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_ivec3_mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000106,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_highp_ivec3_mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000107,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_ivec4_mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000108,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_highp_ivec4_mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000109,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_uvec2_mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000110,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_highp_uvec2_mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000111,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_uvec3_mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000112,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_highp_uvec3_mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000113,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_uvec4_mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000114,
        "dEQP-GLES3.functional.shaders.arrays.compa",
        "re.equal_highp_uvec4_mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000115,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_mat2_mediump_mat2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000116,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_mat2_mediump_mat2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000117,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_mat3_mediump_mat3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000118,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_mat3_mediump_mat3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000119,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_mat4_mediump_mat4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000120,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_mat4_mediump_mat4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000121,
        "dEQP-GLES3.functional.shaders.arrays.c",
        "ompare.equal_highp_int_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000122,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_int_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000123,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_uint_lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000124,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_uint_lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000125,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_float_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000126,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_float_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000127,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_vec2_lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000128,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_vec2_lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000129,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_vec3_lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000130,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_vec3_lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000131,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_vec4_lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000132,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_vec4_lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000133,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_ivec2_lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000134,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_ivec2_lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000135,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_ivec3_lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000136,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_ivec3_lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000137,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_ivec4_lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000138,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_ivec4_lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000139,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_uvec2_lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000140,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_uvec2_lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000141,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_uvec3_lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000142,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_uvec3_lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000143,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_uvec4_lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000144,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_uvec4_lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000145,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_mat2_lowp_mat2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000146,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_mat2_lowp_mat2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000147,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_mat3_lowp_mat3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000148,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_mat3_lowp_mat3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000149,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_mat4_lowp_mat4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000150,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_mat4_lowp_mat4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000151,
        "dEQP-GLES3.functional.shaders.arrays.c",
        "ompare.equal_highp_int_highp_int_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000152,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_int_highp_int_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000153,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_uint_highp_uint_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000154,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_uint_highp_uint_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000155,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_float_highp_float_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000156,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_float_highp_float_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000157,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_vec2_highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000158,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_vec2_highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000159,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_vec3_highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000160,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_vec3_highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000161,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_vec4_highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000162,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_vec4_highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000163,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_ivec2_highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000164,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_ivec2_highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000165,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_ivec3_highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000166,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_ivec3_highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000167,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_ivec4_highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000168,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_ivec4_highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000169,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_uvec2_highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000170,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_uvec2_highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000171,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_uvec3_highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000172,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_uvec3_highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000173,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_uvec4_highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000174,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "are.equal_highp_uvec4_highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000175,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_mat2_highp_mat2_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000176,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_mat2_highp_mat2_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000177,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_mat3_highp_mat3_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000178,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_mat3_highp_mat3_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000179,
        "dEQP-GLES3.functional.shaders.arrays.co",
        "mpare.equal_highp_mat4_highp_mat4_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000180,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "pare.equal_highp_mat4_highp_mat4_fragment");
