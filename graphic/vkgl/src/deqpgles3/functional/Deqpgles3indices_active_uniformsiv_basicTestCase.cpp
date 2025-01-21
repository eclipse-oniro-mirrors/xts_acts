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

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036451,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036452,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036453,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036454,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036455,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036456,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036457,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036458,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036459,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036460,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036461,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036462,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036463,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036464,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036465,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036466,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036467,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036468,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036469,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036470,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036471,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036472,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036473,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036474,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036475,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036476,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036477,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036478,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036479,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036480,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036481,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036482,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036483,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036484,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036485,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036486,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036487,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036488,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036489,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036490,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036491,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036492,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.indices_active_uniformsiv.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036493,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036494,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036495,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036496,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036497,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036498,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036499,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036500,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036501,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036502,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036503,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036504,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036505,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036506,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036507,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036508,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036509,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036510,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036511,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036512,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036513,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036514,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036515,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036516,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036517,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036518,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036519,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036520,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036521,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036522,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036523,
        "dEQP-GLES3.functional.uniform_api.info_query",
        ".indices_active_uniformsiv.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036524,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036525,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.indices_active_uniformsiv.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036526,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036527,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036528,
        "dEQP-GLES3.functional.uniform_api.info_query.",
        "indices_active_uniformsiv.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036529,
        "dEQP-GLES3.functional.uniform_api.info_query.in",
        "dices_active_uniformsiv.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036530,
        "dEQP-GLES3.functional.uniform_api.info_query.ind",
        "ices_active_uniformsiv.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036531,
        "dEQP-GLES3.functional.uniform_api.info_query.i",
        "ndices_active_uniformsiv.basic.samplerCube_both");
