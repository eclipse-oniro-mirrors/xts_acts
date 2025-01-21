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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018034,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018035,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018036,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018037,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018038,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018039,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018040,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018041,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018042,
        "dEQP-GLES31.functional.uniform_",
        "location.nested_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018043,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018044,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018045,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018046,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018047,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018048,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018049,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018050,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018051,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018052,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018053,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018054,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018055,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018056,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018057,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018058,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018059,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018060,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018061,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018062,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018063,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018064,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018065,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018066,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018067,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018068,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018069,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.nested_array.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018070,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018071,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.nested_array.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018072,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018073,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.nested_array.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018074,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018075,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018076,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018077,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.nested_array.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018078,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018079,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.nested_array.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018080,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018081,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.nested_array.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018082,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.nested_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018083,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.nested_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018084,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.nested_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018085,
        "dEQP-GLES31.functional.uniform_loca",
        "tion.nested_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018086,
        "dEQP-GLES31.functional.uniform_loca",
        "tion.nested_array.isampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018087,
        "dEQP-GLES31.functional.uniform_locat",
        "ion.nested_array.isampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018088,
        "dEQP-GLES31.functional.uniform_loca",
        "tion.nested_array.usampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018089,
        "dEQP-GLES31.functional.uniform_locat",
        "ion.nested_array.usampler2D_fragment");
