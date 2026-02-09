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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036691,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036692,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036693,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036694,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036695,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036696,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036697,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036698,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036699,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036700,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036701,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036702,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036703,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036704,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036705,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036706,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036707,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036708,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036709,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036710,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036711,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036712,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036713,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036714,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036715,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036716,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036717,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036718,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036719,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036720,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036721,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036722,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036723,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036724,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036725,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036726,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036727,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036728,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036729,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036730,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036731,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036732,
        "dEQP-GLES3.functional.uniform_api.i",
        "nfo_query.consistency.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036733,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036734,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036735,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036736,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036737,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036738,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036739,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036740,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036741,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036742,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036743,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036744,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036745,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036746,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036747,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036748,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036749,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036750,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036751,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036752,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036753,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036754,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036755,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036756,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036757,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036758,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036759,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036760,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036761,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036762,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036763,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.consistency.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036764,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036765,
        "dEQP-GLES3.functional.uniform_api.in",
        "fo_query.consistency.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036766,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036767,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036768,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.consistency.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036769,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.consistency.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036770,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.consistency.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036771,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.consistency.basic.samplerCube_both");
