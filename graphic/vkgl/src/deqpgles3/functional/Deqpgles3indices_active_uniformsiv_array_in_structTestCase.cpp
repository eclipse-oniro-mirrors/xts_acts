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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036628,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036629,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036630,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036631,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036632,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036633,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036634,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036635,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036636,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036637,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036638,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036639,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036640,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036641,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036642,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036643,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_acti",
        "ve_uniformsiv.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036644,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_activ",
        "e_uniformsiv.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036645,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_act",
        "ive_uniformsiv.array_in_struct.sampler2D_samplerCube_both");
