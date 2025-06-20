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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036592,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036593,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036594,
        "dEQP-GLES3.functional.uniform_api.info_query.indi",
        "ces_active_uniformsiv.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036595,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036596,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036597,
        "dEQP-GLES3.functional.uniform_api.info_query.indi",
        "ces_active_uniformsiv.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036598,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036599,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036600,
        "dEQP-GLES3.functional.uniform_api.info_query.indi",
        "ces_active_uniformsiv.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036601,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036602,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036603,
        "dEQP-GLES3.functional.uniform_api.info_query.indi",
        "ces_active_uniformsiv.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036604,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036605,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036606,
        "dEQP-GLES3.functional.uniform_api.info_query.indi",
        "ces_active_uniformsiv.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036607,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_act",
        "ive_uniformsiv.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036608,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_acti",
        "ve_uniformsiv.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036609,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_ac",
        "tive_uniformsiv.basic_struct.sampler2D_samplerCube_both");
