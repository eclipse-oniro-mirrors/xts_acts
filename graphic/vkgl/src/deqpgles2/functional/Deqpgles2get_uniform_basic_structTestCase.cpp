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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014242,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014243,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014244,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014245,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014246,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014247,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014248,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014249,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014250,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014251,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014252,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014253,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014254,
        "dEQP-GLES2.functional.uniform_api.value.initial.ge",
        "t_uniform.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014255,
        "dEQP-GLES2.functional.uniform_api.value.initial.get",
        "_uniform.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014256,
        "dEQP-GLES2.functional.uniform_api.value.initial.g",
        "et_uniform.basic_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014562,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014563,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014564,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014565,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014566,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014567,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014568,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014569,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014570,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014571,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014572,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014573,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014574,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014575,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_point",
        "er.get_uniform.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014576,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.basic_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014879,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014880,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014881,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014882,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014883,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014884,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014885,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014886,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014887,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014888,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_val",
        "ue.get_uniform.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014889,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_valu",
        "e.get_uniform.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014890,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_va",
        "lue.get_uniform.basic_struct.sampler2D_samplerCube_both");
