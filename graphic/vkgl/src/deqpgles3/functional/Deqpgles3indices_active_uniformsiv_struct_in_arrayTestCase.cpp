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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036610,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036611,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036612,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036613,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036614,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036615,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036616,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036617,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036618,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036619,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036620,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036621,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036622,
        "dEQP-GLES3.functional.uniform_api.info_query.indices",
        "_active_uniformsiv.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036623,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036624,
        "dEQP-GLES3.functional.uniform_api.info_query.indice",
        "s_active_uniformsiv.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036625,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_acti",
        "ve_uniformsiv.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036626,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_activ",
        "e_uniformsiv.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036627,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_act",
        "ive_uniformsiv.struct_in_array.sampler2D_samplerCube_both");
