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
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017518,
        "dEQP-GLES31.functional.program_uniform.basic_arra",
        "y_assign_partial.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017519,
        "dEQP-GLES31.functional.program_uniform.basic_array",
        "_assign_partial.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017520,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_partial.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017521,
        "dEQP-GLES31.functional.program_uniform.basic_arra",
        "y_assign_partial.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017522,
        "dEQP-GLES31.functional.program_uniform.basic_array",
        "_assign_partial.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017523,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_partial.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017524,
        "dEQP-GLES31.functional.program_uniform.basic_arra",
        "y_assign_partial.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017525,
        "dEQP-GLES31.functional.program_uniform.basic_array",
        "_assign_partial.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017526,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_partial.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017527,
        "dEQP-GLES31.functional.program_uniform.basic_arra",
        "y_assign_partial.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017528,
        "dEQP-GLES31.functional.program_uniform.basic_array",
        "_assign_partial.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017529,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_partial.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017530,
        "dEQP-GLES31.functional.program_uniform.basic_arra",
        "y_assign_partial.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017531,
        "dEQP-GLES31.functional.program_uniform.basic_array",
        "_assign_partial.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017532,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_partial.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017533,
        "dEQP-GLES31.functional.program_uniform.basic_array_assi",
        "gn_partial.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017534,
        "dEQP-GLES31.functional.program_uniform.basic_array_assig",
        "n_partial.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017535,
        "dEQP-GLES31.functional.program_uniform.basic_array_ass",
        "ign_partial.array_in_struct.sampler2D_samplerCube_both");
