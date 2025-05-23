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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30037TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036352,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036353,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036354,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".active_uniform.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036355,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".active_uniform.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036356,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036357,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.active_uniform.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036358,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".active_uniform.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036359,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036360,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.active_uniform.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036361,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036362,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036363,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".active_uniform.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036364,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036365,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036366,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".active_uniform.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036367,
        "dEQP-GLES3.functional.uniform_api.info_query.activ",
        "e_uniform.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036368,
        "dEQP-GLES3.functional.uniform_api.info_query.active",
        "_uniform.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036369,
        "dEQP-GLES3.functional.uniform_api.info_query.acti",
        "ve_uniform.basic_struct.sampler2D_samplerCube_both");
