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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014134,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.unused_uniforms.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014135,
        "dEQP-GLES2.functional.uniform_api.info_q",
        "uery.unused_uniforms.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014136,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.unused_uniforms.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014137,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.unused_uniforms.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014138,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.unused_uniforms.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014139,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.unused_uniforms.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014140,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.unused_uniforms.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014141,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.unused_uniforms.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014142,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.unused_uniforms.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014143,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.unused_uniforms.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014144,
        "dEQP-GLES2.functional.uniform_api.info_q",
        "uery.unused_uniforms.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014145,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.unused_uniforms.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014146,
        "dEQP-GLES2.functional.uniform_api.info_query",
        ".unused_uniforms.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014147,
        "dEQP-GLES2.functional.uniform_api.info_query.",
        "unused_uniforms.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014148,
        "dEQP-GLES2.functional.uniform_api.info_quer",
        "y.unused_uniforms.sampler2D_samplerCube_both");