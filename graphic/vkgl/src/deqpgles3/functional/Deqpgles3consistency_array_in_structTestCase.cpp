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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036838,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036839,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036840,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036841,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036842,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036843,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036844,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036845,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036846,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036847,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036848,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036849,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036850,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036851,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036852,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036853,
        "dEQP-GLES3.functional.uniform_api.info_query.consi",
        "stency.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036854,
        "dEQP-GLES3.functional.uniform_api.info_query.consis",
        "tency.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036855,
        "dEQP-GLES3.functional.uniform_api.info_query.cons",
        "istency.array_in_struct.sampler2D_samplerCube_both");
