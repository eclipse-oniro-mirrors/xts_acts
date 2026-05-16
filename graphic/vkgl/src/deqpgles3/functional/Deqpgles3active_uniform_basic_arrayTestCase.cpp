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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036322,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036323,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.active_uniform.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036324,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036325,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036326,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036327,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036328,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036329,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036330,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036331,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036332,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036333,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036334,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036335,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.active_uniform.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036336,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036337,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036338,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036339,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036340,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036341,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.active_uniform.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036342,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036343,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036344,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036345,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036346,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036347,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.active_uniform.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036348,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036349,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".active_uniform.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036350,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "active_uniform.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036351,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.active_uniform.basic_array.sampler2D_both");
