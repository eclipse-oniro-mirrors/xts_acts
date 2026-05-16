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
#include "../ActsDeqpgles20015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014420,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".render.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014421,
        "dEQP-GLES2.functional.uniform_api.value.initial.",
        "render.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014422,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.render.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014423,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".render.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014424,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.render.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014425,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".render.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014426,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.render.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014427,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".render.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014428,
        "dEQP-GLES2.functional.uniform_api.value.initial.",
        "render.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014429,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.render.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014749,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.render.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014750,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.render.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014751,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.render.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014752,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.render.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014753,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.render.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014754,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.render.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014755,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.render.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014756,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.render.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014757,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.render.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014758,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.render.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014759,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointe",
        "r.render.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014760,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer",
        ".render.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014761,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_point",
        "er.render.nested_structs_arrays.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015032,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.render.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015033,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v",
        "alue.render.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015034,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.render.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015035,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.render.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015036,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.render.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015037,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.render.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015038,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.render.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015039,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v",
        "alue.render.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015040,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.render.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015041,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value",
        ".render.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015042,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.",
        "render.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015043,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_valu",
        "e.render.nested_structs_arrays.sampler2D_samplerCube_both");
