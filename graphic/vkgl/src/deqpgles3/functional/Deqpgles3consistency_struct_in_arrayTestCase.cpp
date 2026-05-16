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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036820,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036821,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036822,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036823,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036824,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036825,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036826,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036827,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036828,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036829,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036830,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036831,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036832,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "consistency.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036833,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036834,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036835,
        "dEQP-GLES3.functional.uniform_api.info_query.consi",
        "stency.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036836,
        "dEQP-GLES3.functional.uniform_api.info_query.consis",
        "tency.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036837,
        "dEQP-GLES3.functional.uniform_api.info_query.cons",
        "istency.struct_in_array.sampler2D_samplerCube_both");
