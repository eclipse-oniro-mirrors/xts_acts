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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014384,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.render.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014385,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014386,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.render.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014387,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.render.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014388,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014389,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.render.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014390,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.render.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014391,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014392,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.render.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014393,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.render.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014394,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.render.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014395,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.render.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014704,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014705,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014706,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014707,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014708,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014709,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014710,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014711,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014712,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014713,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014714,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014715,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014716,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.render.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014717,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poi",
        "nter.render.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014718,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.render.basic_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014996,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.render.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014997,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.render.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014998,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.render.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014999,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.render.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015000,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.render.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015001,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.render.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015002,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.render.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015003,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.render.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015004,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.render.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015005,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v",
        "alue.render.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015006,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_va",
        "lue.render.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015007,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.render.basic_struct.sampler2D_samplerCube_both");
