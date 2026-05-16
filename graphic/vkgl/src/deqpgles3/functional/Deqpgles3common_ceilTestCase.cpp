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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018159,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.ceil.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018160,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018161,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.ceil.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018162,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.ceil.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018163,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018164,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.ceil.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018165,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.ceil.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018166,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018167,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018168,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018169,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.ceil.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018170,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018171,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.ceil.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018172,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018173,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018174,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018175,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.ceil.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018176,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018177,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.ceil.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018178,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018179,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018180,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018181,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.ceil.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018182,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.ceil.vec4_highp_fragment");
