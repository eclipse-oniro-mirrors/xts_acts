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
#include "../ActsDeqpgles30037TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036901,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036902,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036903,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036904,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036905,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036906,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036907,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036908,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036909,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036910,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036911,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036912,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036913,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036914,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036915,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036916,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036917,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036918,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036919,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036920,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036921,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036922,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036923,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036924,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036925,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036926,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036927,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036928,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036929,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036930,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036931,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036932,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036933,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036934,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036935,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036936,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036937,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036938,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036939,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036940,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036941,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036942,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036943,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036944,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036945,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036946,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036947,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036948,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036949,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036950,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036951,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036952,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036953,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036954,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036955,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036956,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036957,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036958,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036959,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036960,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036961,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.get_uniform.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036962,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036963,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036964,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036965,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036966,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036967,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036968,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036969,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.get_uniform.basic.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036970,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036971,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036972,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036973,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec2_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036974,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic.bvec2_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036975,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec2_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036976,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec2_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036977,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec2_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036978,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bvec2_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036979,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec2_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036980,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec2_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036981,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bvec2_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036982,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec3_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036983,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic.bvec3_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036984,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec3_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036985,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec3_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036986,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec3_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036987,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bvec3_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036988,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec3_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036989,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec3_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036990,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bvec3_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036991,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036992,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036993,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036994,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036995,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036996,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036997,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036998,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036999,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037000,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.get_uniform.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037001,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037002,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.get_uniform.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037003,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037004,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037005,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.get_uniform.basic.samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037309,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037310,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037311,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037312,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037313,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037314,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037315,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037316,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037317,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037318,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037319,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037320,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037321,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037322,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037323,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037324,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.mat2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037325,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.mat2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037326,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.mat2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037327,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037328,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037329,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037330,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.mat2x3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037331,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.mat2x3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037332,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.mat2x3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037333,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037334,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037335,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037336,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.mat2x4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037337,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.mat2x4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037338,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.mat2x4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037339,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037340,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037341,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037342,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.mat3x2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037343,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.mat3x2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037344,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.mat3x2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037345,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037346,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037347,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037348,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.mat3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037349,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.mat3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037350,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.mat3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037351,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037352,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037353,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037354,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.mat3x4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037355,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.mat3x4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037356,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.mat3x4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037357,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037358,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037359,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037360,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.mat4x2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037361,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.mat4x2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037362,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.mat4x2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037363,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037364,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037365,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037366,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.mat4x3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037367,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.mat4x3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037368,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.mat4x3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037369,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037370,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037371,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037372,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.mat4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037373,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.mat4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037374,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.mat4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037375,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037376,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037377,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037378,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037379,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037380,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037381,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037382,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037383,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037384,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037385,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037386,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037387,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037388,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037389,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037390,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037391,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037392,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037393,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037394,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037395,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037396,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037397,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037398,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037399,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037400,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037401,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037402,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037403,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037404,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037405,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037406,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037407,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037408,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec2_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037409,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.bvec2_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037410,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec2_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037411,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec2_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037412,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec2_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037413,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bvec2_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037414,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec2_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037415,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec2_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037416,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bvec2_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037417,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec3_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037418,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.bvec3_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037419,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec3_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037420,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec3_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037421,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec3_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037422,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bvec3_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037423,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec3_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037424,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec3_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037425,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bvec3_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037426,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037427,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037428,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037429,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037430,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037431,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037432,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037433,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037434,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037435,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037436,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037437,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037438,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037439,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037440,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic.samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037834,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037835,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037836,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037837,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037838,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037839,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.get_uniform.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037840,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037841,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037842,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.get_uniform.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037843,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037844,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037845,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.get_uniform.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037846,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037847,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037848,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.get_uniform.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037849,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037850,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037851,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037852,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037853,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037854,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037855,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037856,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037857,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037858,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037859,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037860,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.get_uniform.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037861,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037862,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037863,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037864,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037865,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037866,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037867,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037868,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037869,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037870,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037871,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037872,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037873,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037874,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037875,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037876,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037877,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037878,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037879,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec2_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037880,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic.bvec2_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037881,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec2_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037882,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec2_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037883,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec2_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037884,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bvec2_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037885,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec2_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037886,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec2_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037887,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bvec2_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037888,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec3_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037889,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic.bvec3_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037890,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec3_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037891,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec3_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037892,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec3_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037893,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bvec3_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037894,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec3_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037895,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec3_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037896,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bvec3_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037897,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037898,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037899,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037900,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037901,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037902,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037903,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037904,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037905,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037906,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037907,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037908,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037909,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037910,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_037911,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic.samplerCube_both");
