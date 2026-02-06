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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016783,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016784,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016785,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016786,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016787,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016788,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016789,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016790,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016791,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016792,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016793,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016794,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016795,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.get_uniform.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016796,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.get_uniform.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016797,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.get_uniform.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016798,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get",
        "_uniform.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016799,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_",
        "uniform.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016800,
        "dEQP-GLES31.functional.program_uniform.by_pointer.ge",
        "t_uniform.struct_in_array.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017239,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017240,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017241,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017242,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017243,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017244,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017245,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017246,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017247,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017248,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.get_uniform.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017249,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".get_uniform.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017250,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.get_uniform.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017251,
        "dEQP-GLES31.functional.program_uniform.by_value.get_",
        "uniform.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017252,
        "dEQP-GLES31.functional.program_uniform.by_value.get_u",
        "niform.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017253,
        "dEQP-GLES31.functional.program_uniform.by_value.get",
        "_uniform.struct_in_array.sampler2D_samplerCube_both");
