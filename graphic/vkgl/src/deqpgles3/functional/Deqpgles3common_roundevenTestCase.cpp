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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018135,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.roundeven.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018136,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.common.roundeven.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018137,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.common.roundeven.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018138,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.roundeven.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018139,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.roundeven.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018140,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.common.roundeven.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018141,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.roundeven.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018142,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018143,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.common.roundeven.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018144,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018145,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018146,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.common.roundeven.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018147,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.roundeven.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018148,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018149,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.common.roundeven.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018150,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018151,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018152,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.common.roundeven.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018153,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.roundeven.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018154,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018155,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.common.roundeven.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018156,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018157,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018158,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.common.roundeven.vec4_highp_fragment");
