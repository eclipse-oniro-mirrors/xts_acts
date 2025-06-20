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
#include "../ActsDeqpgles30019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018183,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.fract.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018184,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.fract.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018185,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.fract.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018186,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.fract.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018187,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.fract.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018188,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.fract.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018189,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.fract.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018190,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.fract.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018191,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.fract.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018192,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.fract.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018193,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.fract.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018194,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.fract.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018195,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.fract.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018196,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.fract.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018197,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.fract.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018198,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.fract.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018199,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.fract.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018200,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.fract.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018201,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.fract.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018202,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.fract.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018203,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.fract.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018204,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.fract.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018205,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.fract.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018206,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.fract.vec4_highp_fragment");
