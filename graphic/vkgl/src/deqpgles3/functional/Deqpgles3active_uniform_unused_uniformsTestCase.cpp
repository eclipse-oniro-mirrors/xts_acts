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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036433,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.unused_uniforms.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036434,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.unused_uniforms.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036435,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.unused_uniforms.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036436,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.unused_uniforms.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036437,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.unused_uniforms.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036438,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.unused_uniforms.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036439,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.unused_uniforms.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036440,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.unused_uniforms.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036441,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.unused_uniforms.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036442,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.unused_uniforms.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036443,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.unused_uniforms.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036444,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.unused_uniforms.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036445,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.unused_uniforms.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036446,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.unused_uniforms.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036447,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.unused_uniforms.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036448,
        "dEQP-GLES3.functional.uniform_api.info_query.active_",
        "uniform.unused_uniforms.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036449,
        "dEQP-GLES3.functional.uniform_api.info_query.active_u",
        "niform.unused_uniforms.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036450,
        "dEQP-GLES3.functional.uniform_api.info_query.active",
        "_uniform.unused_uniforms.sampler2D_samplerCube_both");
