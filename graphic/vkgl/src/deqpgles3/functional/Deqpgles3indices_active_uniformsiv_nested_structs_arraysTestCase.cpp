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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036646,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_ac",
        "tive_uniformsiv.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036647,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_act",
        "ive_uniformsiv.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036648,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_a",
        "ctive_uniformsiv.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036649,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_a",
        "ctive_uniformsiv.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036650,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_ac",
        "tive_uniformsiv.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036651,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036652,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_a",
        "ctive_uniformsiv.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036653,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_ac",
        "tive_uniformsiv.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036654,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_",
        "active_uniformsiv.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036655,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_ac",
        "tive_uniformsiv.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036656,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_act",
        "ive_uniformsiv.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036657,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_a",
        "ctive_uniformsiv.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036658,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_ac",
        "tive_uniformsiv.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036659,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_act",
        "ive_uniformsiv.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036660,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_a",
        "ctive_uniformsiv.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036661,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_",
        "uniformsiv.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036662,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active_u",
        "niformsiv.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036663,
        "dEQP-GLES3.functional.uniform_api.info_query.indices_active",
        "_uniformsiv.nested_structs_arrays.sampler2D_samplerCube_both");
