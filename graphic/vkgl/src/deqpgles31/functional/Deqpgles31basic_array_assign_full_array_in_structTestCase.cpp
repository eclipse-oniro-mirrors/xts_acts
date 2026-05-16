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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017467,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_full.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017468,
        "dEQP-GLES31.functional.program_uniform.basic_arra",
        "y_assign_full.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017469,
        "dEQP-GLES31.functional.program_uniform.basic_ar",
        "ray_assign_full.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017470,
        "dEQP-GLES31.functional.program_uniform.basic_ar",
        "ray_assign_full.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017471,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_full.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017472,
        "dEQP-GLES31.functional.program_uniform.basic_a",
        "rray_assign_full.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017473,
        "dEQP-GLES31.functional.program_uniform.basic_ar",
        "ray_assign_full.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017474,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_full.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017475,
        "dEQP-GLES31.functional.program_uniform.basic_a",
        "rray_assign_full.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017476,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_full.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017477,
        "dEQP-GLES31.functional.program_uniform.basic_arra",
        "y_assign_full.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017478,
        "dEQP-GLES31.functional.program_uniform.basic_ar",
        "ray_assign_full.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017479,
        "dEQP-GLES31.functional.program_uniform.basic_arr",
        "ay_assign_full.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017480,
        "dEQP-GLES31.functional.program_uniform.basic_arra",
        "y_assign_full.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017481,
        "dEQP-GLES31.functional.program_uniform.basic_ar",
        "ray_assign_full.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017482,
        "dEQP-GLES31.functional.program_uniform.basic_array_as",
        "sign_full.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017483,
        "dEQP-GLES31.functional.program_uniform.basic_array_ass",
        "ign_full.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017484,
        "dEQP-GLES31.functional.program_uniform.basic_array_a",
        "ssign_full.array_in_struct.sampler2D_samplerCube_both");
