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
#include "../ActsDeqpgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004499,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.const_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004500,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.const_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004501,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004502,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004503,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.layout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004504,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.layout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004505,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.centroid_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004506,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.centroid_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004507,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.flat_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004508,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.flat_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004509,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.smooth_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004510,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.smooth_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004511,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004512,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004513,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004514,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004515,
        "dEQP-GLES3.functional.shader",
        "s.keywords.keywords.do_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004516,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.do_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004517,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.for_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004518,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.for_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004519,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.while_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004520,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.while_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004521,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.switch_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004522,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.switch_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004523,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.case_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004524,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.case_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004525,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.default_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004526,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.default_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004527,
        "dEQP-GLES3.functional.shader",
        "s.keywords.keywords.if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004528,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004529,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004530,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004531,
        "dEQP-GLES3.functional.shader",
        "s.keywords.keywords.in_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004532,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.in_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004533,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.out_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004534,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.out_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004535,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004536,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.inout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004537,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004538,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004539,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004540,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004541,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.void_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004542,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.void_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004543,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004544,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004545,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.true_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004546,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.true_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004547,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.false_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004548,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.false_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004549,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.invariant_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004550,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.invariant_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004551,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.discard_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004552,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.discard_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004553,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004554,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004555,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004556,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004557,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004558,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004559,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004560,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004561,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat2x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004562,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.mat2x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004563,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004564,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004565,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004566,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004567,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004568,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004569,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat3x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004570,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.mat3x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004571,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004572,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004573,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004574,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004575,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004576,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004577,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.mat4x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004578,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.mat4x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004579,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004580,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004581,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004582,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004583,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004584,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004585,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004586,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004587,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004588,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004589,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004590,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004591,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004592,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004593,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004594,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004595,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004596,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004597,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004598,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004599,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004600,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004601,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004602,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004603,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004604,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004605,
        "dEQP-GLES3.functional.shaders",
        ".keywords.keywords.lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004606,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004607,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004608,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004609,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004610,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004611,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.precision_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004612,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.precision_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004613,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004614,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004615,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.sampler3D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004616,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.sampler3D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004617,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004618,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.keywords.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004619,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.keywords.sampler2DShadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004620,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.keywords.sampler2DShadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004621,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.keywords.samplerCubeShadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004622,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.keywords.samplerCubeShadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004623,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.keywords.sampler2DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004624,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.keywords.sampler2DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004625,
        "dEQP-GLES3.functional.shaders.keyword",
        "s.keywords.sampler2DArrayShadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004626,
        "dEQP-GLES3.functional.shaders.keywords",
        ".keywords.sampler2DArrayShadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004627,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.isampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004628,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.isampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004629,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.isampler3D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004630,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.isampler3D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004631,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.isamplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004632,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.keywords.isamplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004633,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.keywords.isampler2DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004634,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.keywords.isampler2DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004635,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.usampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004636,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.usampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004637,
        "dEQP-GLES3.functional.shaders.ke",
        "ywords.keywords.usampler3D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004638,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.usampler3D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004639,
        "dEQP-GLES3.functional.shaders.key",
        "words.keywords.usamplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004640,
        "dEQP-GLES3.functional.shaders.keyw",
        "ords.keywords.usamplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004641,
        "dEQP-GLES3.functional.shaders.keywo",
        "rds.keywords.usampler2DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004642,
        "dEQP-GLES3.functional.shaders.keywor",
        "ds.keywords.usampler2DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004643,
        "dEQP-GLES3.functional.shaders.",
        "keywords.keywords.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004644,
        "dEQP-GLES3.functional.shaders.k",
        "eywords.keywords.struct_fragment");
