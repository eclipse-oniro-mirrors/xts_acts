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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006774,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006775,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006776,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006777,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.selection.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006778,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006779,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006780,
        "dEQP-GLES2.functional.shaders.op",
        "erator.selection.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006781,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006782,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006783,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.selection.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006784,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006785,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006786,
        "dEQP-GLES2.functional.shaders.op",
        "erator.selection.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006787,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006788,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006789,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.selection.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006790,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006791,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006792,
        "dEQP-GLES2.functional.shaders.op",
        "erator.selection.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006793,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006794,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006795,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.selection.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006796,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006797,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006798,
        "dEQP-GLES2.functional.shaders.op",
        "erator.selection.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006799,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006800,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006801,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006802,
        "dEQP-GLES2.functional.shaders.op",
        "erator.selection.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006803,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006804,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006805,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006806,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006807,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.selection.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006808,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006809,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006810,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006811,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006812,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006813,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.selection.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006814,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006815,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006816,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006817,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006818,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006819,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.selection.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006820,
        "dEQP-GLES2.functional.shaders.ope",
        "rator.selection.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006821,
        "dEQP-GLES2.functional.shaders.oper",
        "ator.selection.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006822,
        "dEQP-GLES2.functional.shaders.",
        "operator.selection.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006823,
        "dEQP-GLES2.functional.shaders.o",
        "perator.selection.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006824,
        "dEQP-GLES2.functional.shaders.",
        "operator.selection.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006825,
        "dEQP-GLES2.functional.shaders.o",
        "perator.selection.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006826,
        "dEQP-GLES2.functional.shaders.",
        "operator.selection.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006827,
        "dEQP-GLES2.functional.shaders.o",
        "perator.selection.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006828,
        "dEQP-GLES2.functional.shaders.",
        "operator.selection.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006829,
        "dEQP-GLES2.functional.shaders.o",
        "perator.selection.bvec4_fragment");
