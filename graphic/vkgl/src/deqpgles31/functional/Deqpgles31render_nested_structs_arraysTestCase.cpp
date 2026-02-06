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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017041,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.render.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017042,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".render.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017043,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.render.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017044,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.render.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017045,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.render.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017046,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.render.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017047,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.render.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017048,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.render.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017049,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.render.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017050,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.render.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017051,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".render.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017052,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.render.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017053,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.render.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017054,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".render.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017055,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.render.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017056,
        "dEQP-GLES31.functional.program_uniform.by_pointer.ren",
        "der.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017057,
        "dEQP-GLES31.functional.program_uniform.by_pointer.rend",
        "er.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017058,
        "dEQP-GLES31.functional.program_uniform.by_pointer.re",
        "nder.nested_structs_arrays.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017416,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".render.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017417,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "render.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017418,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.render.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017419,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.render.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017420,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".render.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017421,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.render.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017422,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".render.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017423,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "render.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017424,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.render.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017425,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".render.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017426,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "render.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017427,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.render.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017428,
        "dEQP-GLES31.functional.program_uniform.by_value.rend",
        "er.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017429,
        "dEQP-GLES31.functional.program_uniform.by_value.rende",
        "r.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017430,
        "dEQP-GLES31.functional.program_uniform.by_value.ren",
        "der.nested_structs_arrays.sampler2D_samplerCube_both");
