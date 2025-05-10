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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014396,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.render.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014397,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.render.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014398,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014399,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014400,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.render.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014401,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.render.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014402,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014403,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.render.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014404,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.render.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014405,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.render.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014406,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.render.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014407,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014719,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.render.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014720,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.render.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014721,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014722,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014723,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.render.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014724,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.render.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014725,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014726,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.render.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014727,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.render.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014728,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.render.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014729,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.render.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014730,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014731,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poi",
        "nter.render.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014732,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poin",
        "ter.render.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014733,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.render.struct_in_array.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015008,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.render.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015009,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.render.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015010,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.render.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015011,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.render.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015012,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.render.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015013,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.render.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015014,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.render.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015015,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.render.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015016,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.render.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015017,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_va",
        "lue.render.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015018,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_val",
        "ue.render.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015019,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v",
        "alue.render.struct_in_array.sampler2D_samplerCube_both");
