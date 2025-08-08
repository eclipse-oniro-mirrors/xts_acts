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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036673,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.unused_uniforms.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036674,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.unused_uniforms.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036675,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.unused_uniforms.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036676,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.unused_uniforms.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036677,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.unused_uniforms.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036678,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.unused_uniforms.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036679,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.unused_uniforms.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036680,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.unused_uniforms.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036681,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.unused_uniforms.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036682,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.unused_uniforms.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036683,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.unused_uniforms.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036684,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.unused_uniforms.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036685,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.unused_uniforms.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036686,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.unused_uniforms.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036687,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.unused_uniforms.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036688,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_acti",
        "ve_uniformsiv.unused_uniforms.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036689,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_activ",
        "e_uniformsiv.unused_uniforms.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036690,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_act",
        "ive_uniformsiv.unused_uniforms.sampler2D_samplerCube_both");
