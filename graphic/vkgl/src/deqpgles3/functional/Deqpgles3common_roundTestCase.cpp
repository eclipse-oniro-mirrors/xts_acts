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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018111,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.round.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018112,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.round.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018113,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.round.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018114,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.round.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018115,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.round.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018116,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.round.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018117,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.round.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018118,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.round.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018119,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.round.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018120,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.round.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018121,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.round.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018122,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.round.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018123,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.round.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018124,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.round.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018125,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.round.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018126,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.round.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018127,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.round.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018128,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.round.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018129,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.round.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018130,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.round.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018131,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.round.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018132,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.round.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018133,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.round.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018134,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.round.vec4_highp_fragment");
