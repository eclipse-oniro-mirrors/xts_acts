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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036772,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036773,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.consistency.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036774,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036775,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036776,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.consistency.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036777,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036778,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036779,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.consistency.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036780,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036781,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036782,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036783,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036784,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036785,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.consistency.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036786,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036787,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036788,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.consistency.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036789,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036790,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036791,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.consistency.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036792,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036793,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036794,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.consistency.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036795,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036796,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036797,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.consistency.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036798,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036799,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.consistency.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036800,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.consistency.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036801,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.consistency.basic_array.sampler2D_both");
