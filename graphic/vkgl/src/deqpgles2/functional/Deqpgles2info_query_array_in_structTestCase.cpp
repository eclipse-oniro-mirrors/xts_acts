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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014097,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014098,
        "dEQP-GLES2.functional.uniform_api.info_q",
        "uery.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014099,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014100,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014101,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014102,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014103,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014104,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014105,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014106,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014107,
        "dEQP-GLES2.functional.uniform_api.info_q",
        "uery.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014108,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014109,
        "dEQP-GLES2.functional.uniform_api.info_query",
        ".array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014110,
        "dEQP-GLES2.functional.uniform_api.info_query.",
        "array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014111,
        "dEQP-GLES2.functional.uniform_api.info_quer",
        "y.array_in_struct.sampler2D_samplerCube_both");
