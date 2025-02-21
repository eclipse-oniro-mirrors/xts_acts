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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016819,
        "dEQP-GLES31.functional.program_uniform.by_pointer.",
        "get_uniform.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016820,
        "dEQP-GLES31.functional.program_uniform.by_pointer.g",
        "et_uniform.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016821,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".get_uniform.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016822,
        "dEQP-GLES31.functional.program_uniform.by_pointer.",
        "get_uniform.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016823,
        "dEQP-GLES31.functional.program_uniform.by_pointer.g",
        "et_uniform.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016824,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".get_uniform.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016825,
        "dEQP-GLES31.functional.program_uniform.by_pointer.",
        "get_uniform.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016826,
        "dEQP-GLES31.functional.program_uniform.by_pointer.g",
        "et_uniform.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016827,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".get_uniform.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016828,
        "dEQP-GLES31.functional.program_uniform.by_pointer.",
        "get_uniform.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016829,
        "dEQP-GLES31.functional.program_uniform.by_pointer.g",
        "et_uniform.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016830,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".get_uniform.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016831,
        "dEQP-GLES31.functional.program_uniform.by_pointer.",
        "get_uniform.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016832,
        "dEQP-GLES31.functional.program_uniform.by_pointer.g",
        "et_uniform.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016833,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".get_uniform.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016834,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_un",
        "iform.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016835,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_uni",
        "form.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016836,
        "dEQP-GLES31.functional.program_uniform.by_pointer.get_u",
        "niform.nested_structs_arrays.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017269,
        "dEQP-GLES31.functional.program_uniform.by_value.g",
        "et_uniform.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017270,
        "dEQP-GLES31.functional.program_uniform.by_value.ge",
        "t_uniform.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017271,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "get_uniform.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017272,
        "dEQP-GLES31.functional.program_uniform.by_value.g",
        "et_uniform.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017273,
        "dEQP-GLES31.functional.program_uniform.by_value.ge",
        "t_uniform.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017274,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "get_uniform.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017275,
        "dEQP-GLES31.functional.program_uniform.by_value.g",
        "et_uniform.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017276,
        "dEQP-GLES31.functional.program_uniform.by_value.ge",
        "t_uniform.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017277,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "get_uniform.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017278,
        "dEQP-GLES31.functional.program_uniform.by_value.g",
        "et_uniform.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017279,
        "dEQP-GLES31.functional.program_uniform.by_value.ge",
        "t_uniform.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017280,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "get_uniform.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017281,
        "dEQP-GLES31.functional.program_uniform.by_value.get_uni",
        "form.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017282,
        "dEQP-GLES31.functional.program_uniform.by_value.get_unif",
        "orm.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017283,
        "dEQP-GLES31.functional.program_uniform.by_value.get_un",
        "iform.nested_structs_arrays.sampler2D_samplerCube_both");
