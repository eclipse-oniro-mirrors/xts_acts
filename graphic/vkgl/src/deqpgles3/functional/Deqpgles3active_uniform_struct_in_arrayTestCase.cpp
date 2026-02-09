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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036370,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036371,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036372,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036373,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036374,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036375,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036376,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036377,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036378,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036379,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036380,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036381,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036382,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036383,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036384,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036385,
        "dEQP-GLES3.functional.uniform_api.info_query.active_",
        "uniform.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036386,
        "dEQP-GLES3.functional.uniform_api.info_query.active_u",
        "niform.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036387,
        "dEQP-GLES3.functional.uniform_api.info_query.active",
        "_uniform.struct_in_array.sampler2D_samplerCube_both");
