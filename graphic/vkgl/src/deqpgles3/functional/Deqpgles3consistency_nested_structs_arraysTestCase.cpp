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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036856,
        "dEQP-GLES3.functional.uniform_api.info_query.con",
        "sistency.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036857,
        "dEQP-GLES3.functional.uniform_api.info_query.cons",
        "istency.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036858,
        "dEQP-GLES3.functional.uniform_api.info_query.co",
        "nsistency.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036859,
        "dEQP-GLES3.functional.uniform_api.info_query.co",
        "nsistency.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036860,
        "dEQP-GLES3.functional.uniform_api.info_query.con",
        "sistency.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036861,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036862,
        "dEQP-GLES3.functional.uniform_api.info_query.co",
        "nsistency.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036863,
        "dEQP-GLES3.functional.uniform_api.info_query.con",
        "sistency.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036864,
        "dEQP-GLES3.functional.uniform_api.info_query.c",
        "onsistency.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036865,
        "dEQP-GLES3.functional.uniform_api.info_query.con",
        "sistency.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036866,
        "dEQP-GLES3.functional.uniform_api.info_query.cons",
        "istency.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036867,
        "dEQP-GLES3.functional.uniform_api.info_query.co",
        "nsistency.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036868,
        "dEQP-GLES3.functional.uniform_api.info_query.con",
        "sistency.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036869,
        "dEQP-GLES3.functional.uniform_api.info_query.cons",
        "istency.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036870,
        "dEQP-GLES3.functional.uniform_api.info_query.co",
        "nsistency.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036871,
        "dEQP-GLES3.functional.uniform_api.info_query.consiste",
        "ncy.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036872,
        "dEQP-GLES3.functional.uniform_api.info_query.consisten",
        "cy.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036873,
        "dEQP-GLES3.functional.uniform_api.info_query.consist",
        "ency.nested_structs_arrays.sampler2D_samplerCube_both");
