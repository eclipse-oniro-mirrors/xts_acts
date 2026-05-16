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
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007746,
        "dEQP-GLES2.functional.shader",
        "s.struct.uniform.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007747,
        "dEQP-GLES2.functional.shaders",
        ".struct.uniform.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007748,
        "dEQP-GLES2.functional.shaders",
        ".struct.uniform.nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007749,
        "dEQP-GLES2.functional.shaders.",
        "struct.uniform.nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007750,
        "dEQP-GLES2.functional.shaders.st",
        "ruct.uniform.array_member_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007751,
        "dEQP-GLES2.functional.shaders.str",
        "uct.uniform.array_member_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007752,
        "dEQP-GLES2.functional.shaders.struct.un",
        "iform.array_member_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007753,
        "dEQP-GLES2.functional.shaders.struct.uni",
        "form.array_member_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007754,
        "dEQP-GLES2.functional.shaders.st",
        "ruct.uniform.struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007755,
        "dEQP-GLES2.functional.shaders.str",
        "uct.uniform.struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007756,
        "dEQP-GLES2.functional.shaders.struct.un",
        "iform.struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007757,
        "dEQP-GLES2.functional.shaders.struct.uni",
        "form.struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007758,
        "dEQP-GLES2.functional.shaders.struc",
        "t.uniform.nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007759,
        "dEQP-GLES2.functional.shaders.struct",
        ".uniform.nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007760,
        "dEQP-GLES2.functional.shaders.struct.unifo",
        "rm.nested_struct_array_dynamic_index_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007761,
        "dEQP-GLES2.functional.shaders.struct.unifor",
        "m.nested_struct_array_dynamic_index_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007762,
        "dEQP-GLES2.functional.shaders.stru",
        "ct.uniform.loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007763,
        "dEQP-GLES2.functional.shaders.struc",
        "t.uniform.loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007764,
        "dEQP-GLES2.functional.shaders.struct.u",
        "niform.loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007765,
        "dEQP-GLES2.functional.shaders.struct.un",
        "iform.loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007766,
        "dEQP-GLES2.functional.shaders.struct.u",
        "niform.dynamic_loop_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007767,
        "dEQP-GLES2.functional.shaders.struct.un",
        "iform.dynamic_loop_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007768,
        "dEQP-GLES2.functional.shaders.struct.unifo",
        "rm.dynamic_loop_nested_struct_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007769,
        "dEQP-GLES2.functional.shaders.struct.unifor",
        "m.dynamic_loop_nested_struct_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007770,
        "dEQP-GLES2.functional.shaders",
        ".struct.uniform.sampler_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007771,
        "dEQP-GLES2.functional.shaders.",
        "struct.uniform.sampler_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007772,
        "dEQP-GLES2.functional.shaders.str",
        "uct.uniform.sampler_nested_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007773,
        "dEQP-GLES2.functional.shaders.stru",
        "ct.uniform.sampler_nested_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007774,
        "dEQP-GLES2.functional.shaders.st",
        "ruct.uniform.sampler_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007775,
        "dEQP-GLES2.functional.shaders.str",
        "uct.uniform.sampler_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007776,
        "dEQP-GLES2.functional.shaders.struct.",
        "uniform.sampler_in_function_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007777,
        "dEQP-GLES2.functional.shaders.struct.u",
        "niform.sampler_in_function_arg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007778,
        "dEQP-GLES2.functional.shaders.struct.uni",
        "form.sampler_in_array_function_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007779,
        "dEQP-GLES2.functional.shaders.struct.unif",
        "orm.sampler_in_array_function_arg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007780,
        "dEQP-GLES2.functional.shader",
        "s.struct.uniform.equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007781,
        "dEQP-GLES2.functional.shaders",
        ".struct.uniform.equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007782,
        "dEQP-GLES2.functional.shaders.",
        "struct.uniform.not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007783,
        "dEQP-GLES2.functional.shaders.s",
        "truct.uniform.not_equal_fragment");
