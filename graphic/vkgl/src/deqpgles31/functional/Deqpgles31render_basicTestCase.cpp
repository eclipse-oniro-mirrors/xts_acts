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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016846,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016847,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016848,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016849,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016850,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016851,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016852,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016853,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016854,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016855,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016856,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016857,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016858,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016859,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016860,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016861,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic.mat2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016862,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic.mat2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016863,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic.mat2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016864,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016865,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016866,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016867,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic.mat2x3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016868,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic.mat2x3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016869,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic.mat2x3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016870,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016871,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016872,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016873,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic.mat2x4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016874,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic.mat2x4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016875,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic.mat2x4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016876,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016877,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016878,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016879,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic.mat3x2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016880,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic.mat3x2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016881,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic.mat3x2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016882,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016883,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016884,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016885,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic.mat3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016886,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic.mat3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016887,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic.mat3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016888,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016889,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016890,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016891,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic.mat3x4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016892,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic.mat3x4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016893,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic.mat3x4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016894,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016895,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016896,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016897,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic.mat4x2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016898,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic.mat4x2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016899,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic.mat4x2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016900,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016901,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016902,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016903,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic.mat4x3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016904,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic.mat4x3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016905,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic.mat4x3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016906,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016907,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016908,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016909,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic.mat4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016910,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic.mat4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016911,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic.mat4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016912,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016913,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016914,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_pointer.render.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016915,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016916,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016917,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016918,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016919,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016920,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016921,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016922,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016923,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016924,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016925,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016926,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016927,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016928,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016929,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016930,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016931,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016932,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016933,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016934,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016935,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016936,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016937,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016938,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016939,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016940,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016941,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016942,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016943,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016944,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016945,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_pointer.render.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016946,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016947,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_pointer.render.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016948,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016949,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016950,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016951,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016952,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016953,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic.samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017290,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017291,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017292,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017293,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017294,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017295,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017296,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017297,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017298,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017299,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017300,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017301,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017302,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017303,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017304,
        "dEQP-GLES31.functional.program_uni",
        "form.by_value.render.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017305,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017306,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017307,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017308,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017309,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017310,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017311,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017312,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017313,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017314,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017315,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017316,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017317,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017318,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017319,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017320,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017321,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017322,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017323,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017324,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017325,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017326,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017327,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017328,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017329,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017330,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017331,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017332,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017333,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017334,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017335,
        "dEQP-GLES31.functional.program_unifo",
        "rm.by_value.render.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017336,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017337,
        "dEQP-GLES31.functional.program_unif",
        "orm.by_value.render.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017338,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.render.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017339,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.render.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017340,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017341,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.render.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017342,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.render.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017343,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.render.basic.samplerCube_both");
