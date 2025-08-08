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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036883,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.unused_uniforms.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036884,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.unused_uniforms.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036885,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.unused_uniforms.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036886,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.unused_uniforms.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036887,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.unused_uniforms.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036888,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.unused_uniforms.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036889,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.unused_uniforms.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036890,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.unused_uniforms.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036891,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.unused_uniforms.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036892,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.unused_uniforms.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036893,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.unused_uniforms.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036894,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.unused_uniforms.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036895,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.unused_uniforms.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036896,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.unused_uniforms.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036897,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.unused_uniforms.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036898,
        "dEQP-GLES3.functional.uniform_api.info_query.consi",
        "stency.unused_uniforms.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036899,
        "dEQP-GLES3.functional.uniform_api.info_query.consis",
        "tency.unused_uniforms.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036900,
        "dEQP-GLES3.functional.uniform_api.info_query.cons",
        "istency.unused_uniforms.sampler2D_samplerCube_both");
