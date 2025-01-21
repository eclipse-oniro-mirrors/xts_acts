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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014272,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014273,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014274,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014275,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014276,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014277,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014278,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014279,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014280,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014281,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014282,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014283,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014284,
        "dEQP-GLES2.functional.uniform_api.value.initial.get_",
        "uniform.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014285,
        "dEQP-GLES2.functional.uniform_api.value.initial.get_u",
        "niform.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014286,
        "dEQP-GLES2.functional.uniform_api.value.initial.get",
        "_uniform.array_in_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014592,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014593,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014594,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014595,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014596,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014597,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014598,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014599,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014600,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014601,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014602,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014603,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014604,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointe",
        "r.get_uniform.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014605,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer",
        ".get_uniform.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014606,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_point",
        "er.get_uniform.array_in_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014903,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014904,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014905,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014906,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014907,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014908,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014909,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014910,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014911,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014912,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value",
        ".get_uniform.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014913,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.",
        "get_uniform.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014914,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_valu",
        "e.get_uniform.array_in_struct.sampler2D_samplerCube_both");
