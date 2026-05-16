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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013740,
        "dEQP-GLES3.functional.shaders.operator",
        ".sequence.side_effects.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013741,
        "dEQP-GLES3.functional.shaders.operator.",
        "sequence.side_effects.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013742,
        "dEQP-GLES3.functional.shaders.operator.s",
        "equence.side_effects.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013743,
        "dEQP-GLES3.functional.shaders.operator.se",
        "quence.side_effects.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013744,
        "dEQP-GLES3.functional.shaders.operator.",
        "sequence.side_effects.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013745,
        "dEQP-GLES3.functional.shaders.operator.s",
        "equence.side_effects.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013746,
        "dEQP-GLES3.functional.shaders.operator.se",
        "quence.side_effects.lowp_float_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013747,
        "dEQP-GLES3.functional.shaders.operator.seq",
        "uence.side_effects.lowp_float_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013748,
        "dEQP-GLES3.functional.shaders.operator.sequ",
        "ence.side_effects.mediump_float_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013749,
        "dEQP-GLES3.functional.shaders.operator.seque",
        "nce.side_effects.mediump_float_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013750,
        "dEQP-GLES3.functional.shaders.operator.seq",
        "uence.side_effects.highp_float_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013751,
        "dEQP-GLES3.functional.shaders.operator.sequ",
        "ence.side_effects.highp_float_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013752,
        "dEQP-GLES3.functional.shaders.operator.se",
        "quence.side_effects.lowp_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013753,
        "dEQP-GLES3.functional.shaders.operator.seq",
        "uence.side_effects.lowp_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013754,
        "dEQP-GLES3.functional.shaders.operator.seq",
        "uence.side_effects.mediump_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013755,
        "dEQP-GLES3.functional.shaders.operator.sequ",
        "ence.side_effects.mediump_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013756,
        "dEQP-GLES3.functional.shaders.operator.se",
        "quence.side_effects.highp_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013757,
        "dEQP-GLES3.functional.shaders.operator.seq",
        "uence.side_effects.highp_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013758,
        "dEQP-GLES3.functional.shaders.operator.seque",
        "nce.side_effects.lowp_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013759,
        "dEQP-GLES3.functional.shaders.operator.sequen",
        "ce.side_effects.lowp_vec4_ivec4_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013760,
        "dEQP-GLES3.functional.shaders.operator.sequenc",
        "e.side_effects.mediump_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013761,
        "dEQP-GLES3.functional.shaders.operator.sequence",
        ".side_effects.mediump_vec4_ivec4_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013762,
        "dEQP-GLES3.functional.shaders.operator.sequen",
        "ce.side_effects.highp_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013763,
        "dEQP-GLES3.functional.shaders.operator.sequenc",
        "e.side_effects.highp_vec4_ivec4_bvec4_fragment");
