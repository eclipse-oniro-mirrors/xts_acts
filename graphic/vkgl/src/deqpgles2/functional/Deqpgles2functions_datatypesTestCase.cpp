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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001996,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.float_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001997,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.datatypes.float_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001998,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001999,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002000,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002001,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002002,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002003,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002004,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.float_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002005,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.float_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002006,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.float_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002007,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.float_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002008,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.float_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002009,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.float_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002010,
        "dEQP-GLES2.functional.shaders.fu",
        "nctions.datatypes.int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002011,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002012,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002013,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002014,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002015,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002016,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002017,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002018,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.bool_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002019,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.bool_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002020,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.bool_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002021,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.bool_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002022,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.bool_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002023,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.bool_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002024,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.datatypes.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002025,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002026,
        "dEQP-GLES2.functional.shaders.",
        "functions.datatypes.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002027,
        "dEQP-GLES2.functional.shaders.f",
        "unctions.datatypes.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002028,
        "dEQP-GLES2.functional.shaders.",
        "functions.datatypes.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002029,
        "dEQP-GLES2.functional.shaders.f",
        "unctions.datatypes.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002030,
        "dEQP-GLES2.functional.shaders.",
        "functions.datatypes.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002031,
        "dEQP-GLES2.functional.shaders.f",
        "unctions.datatypes.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002032,
        "dEQP-GLES2.functional.shaders.func",
        "tions.datatypes.float_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002033,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.datatypes.float_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002034,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.datatypes.struct_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002035,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.datatypes.struct_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002036,
        "dEQP-GLES2.functional.shaders.function",
        "s.datatypes.struct_nested_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002037,
        "dEQP-GLES2.functional.shaders.functions",
        ".datatypes.struct_nested_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_002038,
        "dEQP-GLES2.functional.shaders.functions.dat",
        "atypes.struct_constructor_highp_in_fragment");
