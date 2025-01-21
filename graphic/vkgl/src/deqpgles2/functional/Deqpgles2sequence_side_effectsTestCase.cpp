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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006854,
        "dEQP-GLES2.functional.shaders.operator",
        ".sequence.side_effects.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006855,
        "dEQP-GLES2.functional.shaders.operator.",
        "sequence.side_effects.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006856,
        "dEQP-GLES2.functional.shaders.operator.s",
        "equence.side_effects.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006857,
        "dEQP-GLES2.functional.shaders.operator.se",
        "quence.side_effects.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006858,
        "dEQP-GLES2.functional.shaders.operator.",
        "sequence.side_effects.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006859,
        "dEQP-GLES2.functional.shaders.operator.s",
        "equence.side_effects.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006860,
        "dEQP-GLES2.functional.shaders.operator.se",
        "quence.side_effects.lowp_float_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006861,
        "dEQP-GLES2.functional.shaders.operator.seq",
        "uence.side_effects.lowp_float_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006862,
        "dEQP-GLES2.functional.shaders.operator.seq",
        "uence.side_effects.mediump_float_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006863,
        "dEQP-GLES2.functional.shaders.operator.sequ",
        "ence.side_effects.mediump_float_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006864,
        "dEQP-GLES2.functional.shaders.operator.se",
        "quence.side_effects.highp_float_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006865,
        "dEQP-GLES2.functional.shaders.operator.seq",
        "uence.side_effects.highp_float_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006866,
        "dEQP-GLES2.functional.shaders.operator.se",
        "quence.side_effects.lowp_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006867,
        "dEQP-GLES2.functional.shaders.operator.seq",
        "uence.side_effects.lowp_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006868,
        "dEQP-GLES2.functional.shaders.operator.seq",
        "uence.side_effects.mediump_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006869,
        "dEQP-GLES2.functional.shaders.operator.sequ",
        "ence.side_effects.mediump_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006870,
        "dEQP-GLES2.functional.shaders.operator.se",
        "quence.side_effects.highp_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006871,
        "dEQP-GLES2.functional.shaders.operator.seq",
        "uence.side_effects.highp_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006872,
        "dEQP-GLES2.functional.shaders.operator.seque",
        "nce.side_effects.lowp_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006873,
        "dEQP-GLES2.functional.shaders.operator.sequen",
        "ce.side_effects.lowp_vec4_ivec4_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006874,
        "dEQP-GLES2.functional.shaders.operator.sequenc",
        "e.side_effects.mediump_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006875,
        "dEQP-GLES2.functional.shaders.operator.sequence",
        ".side_effects.mediump_vec4_ivec4_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006876,
        "dEQP-GLES2.functional.shaders.operator.sequen",
        "ce.side_effects.highp_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006877,
        "dEQP-GLES2.functional.shaders.operator.sequenc",
        "e.side_effects.highp_vec4_ivec4_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006878,
        "dEQP-GLES2.functional.shaders.operato",
        "r.sequence.side_effects.affect_ternary");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006879,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.sequence.side_effects.affect_and");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006880,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.sequence.side_effects.affect_or");
