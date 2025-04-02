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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004038,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.float_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004039,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.datatypes.float_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004040,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004041,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004042,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004043,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004044,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004045,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004046,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.float_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004047,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.float_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004048,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.float_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004049,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.float_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004050,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.float_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004051,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.float_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004052,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.datatypes.int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004053,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004054,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004055,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004056,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004057,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004058,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004059,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004060,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004061,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004062,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004063,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004064,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004065,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004066,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004067,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004068,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.bool_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004069,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.bool_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004070,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.bool_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004071,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.bool_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004072,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.bool_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004073,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.bool_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004074,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.datatypes.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004075,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004076,
        "dEQP-GLES3.functional.shaders.",
        "functions.datatypes.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004077,
        "dEQP-GLES3.functional.shaders.f",
        "unctions.datatypes.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004078,
        "dEQP-GLES3.functional.shaders.f",
        "unctions.datatypes.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004079,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.datatypes.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004080,
        "dEQP-GLES3.functional.shaders.f",
        "unctions.datatypes.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004081,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.datatypes.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004082,
        "dEQP-GLES3.functional.shaders.f",
        "unctions.datatypes.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004083,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.datatypes.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004084,
        "dEQP-GLES3.functional.shaders.",
        "functions.datatypes.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004085,
        "dEQP-GLES3.functional.shaders.f",
        "unctions.datatypes.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004086,
        "dEQP-GLES3.functional.shaders.f",
        "unctions.datatypes.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004087,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.datatypes.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004088,
        "dEQP-GLES3.functional.shaders.f",
        "unctions.datatypes.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004089,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.datatypes.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004090,
        "dEQP-GLES3.functional.shaders.f",
        "unctions.datatypes.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004091,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.datatypes.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004092,
        "dEQP-GLES3.functional.shaders.",
        "functions.datatypes.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004093,
        "dEQP-GLES3.functional.shaders.f",
        "unctions.datatypes.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004094,
        "dEQP-GLES3.functional.shaders.func",
        "tions.datatypes.float_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004095,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.datatypes.float_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004096,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.datatypes.struct_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004097,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.datatypes.struct_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004098,
        "dEQP-GLES3.functional.shaders.function",
        "s.datatypes.struct_nested_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004099,
        "dEQP-GLES3.functional.shaders.functions",
        ".datatypes.struct_nested_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004100,
        "dEQP-GLES3.functional.shaders.functions.dat",
        "atypes.struct_constructor_highp_in_fragment");
