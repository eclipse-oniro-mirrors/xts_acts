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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006830,
        "dEQP-GLES2.functional.shaders.operator.s",
        "equence.no_side_effects.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006831,
        "dEQP-GLES2.functional.shaders.operator.se",
        "quence.no_side_effects.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006832,
        "dEQP-GLES2.functional.shaders.operator.se",
        "quence.no_side_effects.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006833,
        "dEQP-GLES2.functional.shaders.operator.seq",
        "uence.no_side_effects.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006834,
        "dEQP-GLES2.functional.shaders.operator.s",
        "equence.no_side_effects.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006835,
        "dEQP-GLES2.functional.shaders.operator.se",
        "quence.no_side_effects.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006836,
        "dEQP-GLES2.functional.shaders.operator.seq",
        "uence.no_side_effects.lowp_float_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006837,
        "dEQP-GLES2.functional.shaders.operator.sequ",
        "ence.no_side_effects.lowp_float_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006838,
        "dEQP-GLES2.functional.shaders.operator.seque",
        "nce.no_side_effects.mediump_float_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006839,
        "dEQP-GLES2.functional.shaders.operator.sequen",
        "ce.no_side_effects.mediump_float_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006840,
        "dEQP-GLES2.functional.shaders.operator.sequ",
        "ence.no_side_effects.highp_float_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006841,
        "dEQP-GLES2.functional.shaders.operator.seque",
        "nce.no_side_effects.highp_float_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006842,
        "dEQP-GLES2.functional.shaders.operator.seq",
        "uence.no_side_effects.lowp_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006843,
        "dEQP-GLES2.functional.shaders.operator.sequ",
        "ence.no_side_effects.lowp_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006844,
        "dEQP-GLES2.functional.shaders.operator.seque",
        "nce.no_side_effects.mediump_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006845,
        "dEQP-GLES2.functional.shaders.operator.sequen",
        "ce.no_side_effects.mediump_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006846,
        "dEQP-GLES2.functional.shaders.operator.sequ",
        "ence.no_side_effects.highp_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006847,
        "dEQP-GLES2.functional.shaders.operator.seque",
        "nce.no_side_effects.highp_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006848,
        "dEQP-GLES2.functional.shaders.operator.sequenc",
        "e.no_side_effects.lowp_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006849,
        "dEQP-GLES2.functional.shaders.operator.sequence",
        ".no_side_effects.lowp_vec4_ivec4_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006850,
        "dEQP-GLES2.functional.shaders.operator.sequence",
        ".no_side_effects.mediump_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006851,
        "dEQP-GLES2.functional.shaders.operator.sequence.",
        "no_side_effects.mediump_vec4_ivec4_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006852,
        "dEQP-GLES2.functional.shaders.operator.sequenc",
        "e.no_side_effects.highp_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006853,
        "dEQP-GLES2.functional.shaders.operator.sequence",
        ".no_side_effects.highp_vec4_ivec4_bvec4_fragment");
