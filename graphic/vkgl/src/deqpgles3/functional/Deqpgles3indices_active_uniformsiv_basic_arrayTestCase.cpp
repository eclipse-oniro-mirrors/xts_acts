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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036532,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036533,
        "dEQP-GLES3.functional.uniform_api.info_query.ind",
        "ices_active_uniformsiv.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036534,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036535,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036536,
        "dEQP-GLES3.functional.uniform_api.info_query.ind",
        "ices_active_uniformsiv.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036537,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036538,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036539,
        "dEQP-GLES3.functional.uniform_api.info_query.ind",
        "ices_active_uniformsiv.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036540,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036541,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036542,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036543,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036544,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036545,
        "dEQP-GLES3.functional.uniform_api.info_query.ind",
        "ices_active_uniformsiv.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036546,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036547,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036548,
        "dEQP-GLES3.functional.uniform_api.info_query.ind",
        "ices_active_uniformsiv.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036549,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036550,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036551,
        "dEQP-GLES3.functional.uniform_api.info_query.ind",
        "ices_active_uniformsiv.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036552,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036553,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036554,
        "dEQP-GLES3.functional.uniform_api.info_query.ind",
        "ices_active_uniformsiv.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036555,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036556,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036557,
        "dEQP-GLES3.functional.uniform_api.info_query.ind",
        "ices_active_uniformsiv.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036558,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036559,
        "dEQP-GLES3.functional.uniform_api.info_query.indi",
        "ces_active_uniformsiv.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036560,
        "dEQP-GLES3.functional.uniform_api.info_query.indic",
        "es_active_uniformsiv.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036561,
        "dEQP-GLES3.functional.uniform_api.info_query.ind",
        "ices_active_uniformsiv.basic_array.sampler2D_both");
