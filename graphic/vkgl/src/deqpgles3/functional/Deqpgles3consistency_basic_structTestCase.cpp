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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036802,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036803,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036804,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.consistency.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036805,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036806,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036807,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.consistency.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036808,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036809,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036810,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.consistency.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036811,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036812,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036813,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.consistency.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036814,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036815,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".consistency.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036816,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.consistency.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036817,
        "dEQP-GLES3.functional.uniform_api.info_query.cons",
        "istency.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036818,
        "dEQP-GLES3.functional.uniform_api.info_query.consi",
        "stency.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036819,
        "dEQP-GLES3.functional.uniform_api.info_query.con",
        "sistency.basic_struct.sampler2D_samplerCube_both");
