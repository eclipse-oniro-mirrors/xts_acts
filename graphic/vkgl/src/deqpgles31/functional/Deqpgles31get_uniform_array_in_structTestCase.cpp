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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016801,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016802,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016803,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016804,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016805,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016806,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016807,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016808,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016809,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016810,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016811,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016812,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016813,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016814,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016815,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016816,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get",
        "_uniform.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016817,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_",
        "uniform.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016818,
        "dEQP-GLES31.functional.program_uniform.by_pointer.ge",
        "t_uniform.array_in_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017254,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017255,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017256,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017257,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017258,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017259,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017260,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017261,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017262,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017263,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017264,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017265,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017266,
        "dEQP-GLES31.functional.program_uniform.by_value.get_",
        "uniform.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017267,
        "dEQP-GLES31.functional.program_uniform.by_value.get_u",
        "niform.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017268,
        "dEQP-GLES31.functional.program_uniform.by_value.get",
        "_uniform.array_in_struct.sampler2D_samplerCube_both");
