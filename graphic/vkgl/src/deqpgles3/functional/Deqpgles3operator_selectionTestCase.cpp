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
#include "../ActsDeqpgles30014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013636,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013637,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013638,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013639,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013640,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013641,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013642,
        "dEQP-GLES3.functional.shaders.op",
        "erator.selection.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013643,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013644,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013645,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013646,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013647,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013648,
        "dEQP-GLES3.functional.shaders.op",
        "erator.selection.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013649,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013650,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013651,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013652,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013653,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013654,
        "dEQP-GLES3.functional.shaders.op",
        "erator.selection.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013655,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013656,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013657,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013658,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013659,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013660,
        "dEQP-GLES3.functional.shaders.op",
        "erator.selection.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013661,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013662,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013663,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013664,
        "dEQP-GLES3.functional.shaders.op",
        "erator.selection.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013665,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013666,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013667,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013668,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013669,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013670,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013671,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013672,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013673,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013674,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013675,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013676,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013677,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013678,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013679,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013680,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013681,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013682,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013683,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013684,
        "dEQP-GLES3.functional.shaders.op",
        "erator.selection.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013685,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013686,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013687,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013688,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013689,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013690,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013691,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013692,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013693,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013694,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013695,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013696,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013697,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013698,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013699,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013700,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013701,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013702,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013703,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013704,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013705,
        "dEQP-GLES3.functional.shaders.opera",
        "tor.selection.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013706,
        "dEQP-GLES3.functional.shaders.ope",
        "rator.selection.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013707,
        "dEQP-GLES3.functional.shaders.oper",
        "ator.selection.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013708,
        "dEQP-GLES3.functional.shaders.",
        "operator.selection.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013709,
        "dEQP-GLES3.functional.shaders.o",
        "perator.selection.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013710,
        "dEQP-GLES3.functional.shaders.",
        "operator.selection.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013711,
        "dEQP-GLES3.functional.shaders.o",
        "perator.selection.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013712,
        "dEQP-GLES3.functional.shaders.",
        "operator.selection.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013713,
        "dEQP-GLES3.functional.shaders.o",
        "perator.selection.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013714,
        "dEQP-GLES3.functional.shaders.",
        "operator.selection.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013715,
        "dEQP-GLES3.functional.shaders.o",
        "perator.selection.bvec4_fragment");
