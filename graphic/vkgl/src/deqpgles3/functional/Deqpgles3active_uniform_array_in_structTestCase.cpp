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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036388,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036389,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036390,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036391,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036392,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036393,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036394,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036395,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036396,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036397,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036398,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036399,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036400,
        "dEQP-GLES3.functional.uniform_api.info_query.a",
        "ctive_uniform.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036401,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036402,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036403,
        "dEQP-GLES3.functional.uniform_api.info_query.active_",
        "uniform.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036404,
        "dEQP-GLES3.functional.uniform_api.info_query.active_u",
        "niform.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036405,
        "dEQP-GLES3.functional.uniform_api.info_query.active",
        "_uniform.array_in_struct.sampler2D_samplerCube_both");
