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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013716,
        "dEQP-GLES3.functional.shaders.operator.s",
        "equence.no_side_effects.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013717,
        "dEQP-GLES3.functional.shaders.operator.se",
        "quence.no_side_effects.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013718,
        "dEQP-GLES3.functional.shaders.operator.se",
        "quence.no_side_effects.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013719,
        "dEQP-GLES3.functional.shaders.operator.seq",
        "uence.no_side_effects.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013720,
        "dEQP-GLES3.functional.shaders.operator.s",
        "equence.no_side_effects.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013721,
        "dEQP-GLES3.functional.shaders.operator.se",
        "quence.no_side_effects.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013722,
        "dEQP-GLES3.functional.shaders.operator.sequ",
        "ence.no_side_effects.lowp_float_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013723,
        "dEQP-GLES3.functional.shaders.operator.seque",
        "nce.no_side_effects.lowp_float_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013724,
        "dEQP-GLES3.functional.shaders.operator.seque",
        "nce.no_side_effects.mediump_float_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013725,
        "dEQP-GLES3.functional.shaders.operator.sequen",
        "ce.no_side_effects.mediump_float_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013726,
        "dEQP-GLES3.functional.shaders.operator.sequ",
        "ence.no_side_effects.highp_float_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013727,
        "dEQP-GLES3.functional.shaders.operator.seque",
        "nce.no_side_effects.highp_float_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013728,
        "dEQP-GLES3.functional.shaders.operator.seq",
        "uence.no_side_effects.lowp_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013729,
        "dEQP-GLES3.functional.shaders.operator.sequ",
        "ence.no_side_effects.lowp_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013730,
        "dEQP-GLES3.functional.shaders.operator.seque",
        "nce.no_side_effects.mediump_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013731,
        "dEQP-GLES3.functional.shaders.operator.sequen",
        "ce.no_side_effects.mediump_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013732,
        "dEQP-GLES3.functional.shaders.operator.sequ",
        "ence.no_side_effects.highp_bool_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013733,
        "dEQP-GLES3.functional.shaders.operator.seque",
        "nce.no_side_effects.highp_bool_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013734,
        "dEQP-GLES3.functional.shaders.operator.sequenc",
        "e.no_side_effects.lowp_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013735,
        "dEQP-GLES3.functional.shaders.operator.sequence",
        ".no_side_effects.lowp_vec4_ivec4_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013736,
        "dEQP-GLES3.functional.shaders.operator.sequence",
        ".no_side_effects.mediump_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013737,
        "dEQP-GLES3.functional.shaders.operator.sequence.",
        "no_side_effects.mediump_vec4_ivec4_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013738,
        "dEQP-GLES3.functional.shaders.operator.sequenc",
        "e.no_side_effects.highp_vec4_ivec4_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013739,
        "dEQP-GLES3.functional.shaders.operator.sequence",
        ".no_side_effects.highp_vec4_ivec4_bvec4_fragment");
