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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014067,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014068,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014069,
        "dEQP-GLES2.functional.uniform_api.in",
        "fo_query.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014070,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014071,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014072,
        "dEQP-GLES2.functional.uniform_api.in",
        "fo_query.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014073,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014074,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014075,
        "dEQP-GLES2.functional.uniform_api.in",
        "fo_query.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014076,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014077,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014078,
        "dEQP-GLES2.functional.uniform_api.in",
        "fo_query.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014079,
        "dEQP-GLES2.functional.uniform_api.info_quer",
        "y.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014080,
        "dEQP-GLES2.functional.uniform_api.info_query",
        ".basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014081,
        "dEQP-GLES2.functional.uniform_api.info_que",
        "ry.basic_struct.sampler2D_samplerCube_both");
