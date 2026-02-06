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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016543,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016544,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016545,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016546,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016547,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016548,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.get_uniform.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016549,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016550,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016551,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.get_uniform.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016552,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016553,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016554,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.get_uniform.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016555,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016556,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016557,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.get_uniform.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016558,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.mat2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016559,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.mat2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016560,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.mat2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016561,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016562,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016563,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016564,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.mat2x3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016565,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic.mat2x3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016566,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.mat2x3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016567,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016568,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016569,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016570,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.mat2x4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016571,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic.mat2x4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016572,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.mat2x4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016573,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016574,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016575,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016576,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.mat3x2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016577,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic.mat3x2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016578,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.mat3x2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016579,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016580,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016581,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.get_uniform.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016582,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.mat3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016583,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.mat3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016584,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.mat3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016585,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016586,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016587,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016588,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.mat3x4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016589,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic.mat3x4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016590,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.mat3x4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016591,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016592,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016593,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016594,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.mat4x2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016595,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic.mat4x2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016596,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.mat4x2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016597,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016598,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016599,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016600,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.mat4x3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016601,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic.mat4x3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016602,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.mat4x3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016603,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016604,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016605,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.get_uniform.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016606,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.mat4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016607,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.mat4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016608,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.mat4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016609,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016610,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016611,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.get_uniform.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016612,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016613,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016614,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016615,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016616,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016617,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016618,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016619,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016620,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016621,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016622,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016623,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.get_uniform.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016624,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016625,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016626,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016627,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016628,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016629,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016630,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.get_uniform.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016631,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016632,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.get_uniform.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016633,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016634,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016635,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016636,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016637,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016638,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.get_uniform.basic.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016639,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016640,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016641,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016642,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bvec2_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016643,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic.bvec2_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016644,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bvec2_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016645,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bvec2_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016646,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bvec2_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016647,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.bvec2_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016648,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bvec2_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016649,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bvec2_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016650,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.bvec2_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016651,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bvec3_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016652,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic.bvec3_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016653,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bvec3_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016654,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bvec3_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016655,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bvec3_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016656,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.bvec3_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016657,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bvec3_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016658,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bvec3_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016659,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.bvec3_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016660,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016661,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.basic.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016662,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016663,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016664,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016665,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016666,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016667,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.get_uniform.basic.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016668,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016669,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.get_uniform.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016670,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016671,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.get_uniform.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016672,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.get_uniform.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016673,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.get_uniform.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016674,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.get_uniform.basic.samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017068,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017069,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017070,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017071,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017072,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017073,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.get_uniform.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017074,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017075,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017076,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.get_uniform.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017077,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017078,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017079,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.get_uniform.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017080,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017081,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017082,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.get_uniform.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017083,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017084,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017085,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017086,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017087,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017088,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017089,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017090,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017091,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017092,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017093,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017094,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.get_uniform.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017095,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017096,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017097,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017098,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017099,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017100,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017101,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.get_uniform.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017102,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017103,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.get_uniform.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017104,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017105,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017106,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017107,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017108,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017109,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.get_uniform.basic.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017110,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017111,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017112,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017113,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bvec2_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017114,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic.bvec2_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017115,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bvec2_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017116,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bvec2_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017117,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bvec2_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017118,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.bvec2_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017119,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bvec2_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017120,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bvec2_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017121,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.bvec2_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017122,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bvec3_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017123,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic.bvec3_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017124,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bvec3_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017125,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bvec3_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017126,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bvec3_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017127,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.bvec3_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017128,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bvec3_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017129,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bvec3_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017130,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.bvec3_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017131,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017132,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.basic.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017133,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017134,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017135,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017136,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017137,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017138,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.get_uniform.basic.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017139,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017140,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.get_uniform.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017141,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017142,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.get_uniform.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017143,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.get_uniform.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017144,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.get_uniform.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017145,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.get_uniform.basic.samplerCube_both");
