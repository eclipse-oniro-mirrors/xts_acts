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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014082,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014083,
        "dEQP-GLES2.functional.uniform_api.info_q",
        "uery.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014084,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014085,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014086,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014087,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014088,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014089,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014090,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014091,
        "dEQP-GLES2.functional.uniform_api.info_",
        "query.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014092,
        "dEQP-GLES2.functional.uniform_api.info_q",
        "uery.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014093,
        "dEQP-GLES2.functional.uniform_api.info",
        "_query.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014094,
        "dEQP-GLES2.functional.uniform_api.info_query",
        ".struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014095,
        "dEQP-GLES2.functional.uniform_api.info_query.",
        "struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014096,
        "dEQP-GLES2.functional.uniform_api.info_quer",
        "y.struct_in_array.sampler2D_samplerCube_both");
