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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014408,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.render.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014409,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.render.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014410,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014411,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014412,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.render.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014413,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.render.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014414,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014415,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.render.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014416,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.render.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014417,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.render.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014418,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.render.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014419,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014734,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.render.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014735,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.render.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014736,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014737,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014738,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.render.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014739,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.render.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014740,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014741,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.render.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014742,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.render.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014743,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.render.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014744,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.render.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014745,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014746,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poi",
        "nter.render.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014747,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poin",
        "ter.render.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014748,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.render.array_in_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015020,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.render.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015021,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.render.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015022,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.render.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015023,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.render.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015024,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.render.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015025,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.render.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015026,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.render.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015027,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.render.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015028,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.render.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015029,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_va",
        "lue.render.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015030,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_val",
        "ue.render.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015031,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v",
        "alue.render.array_in_struct.sampler2D_samplerCube_both");
