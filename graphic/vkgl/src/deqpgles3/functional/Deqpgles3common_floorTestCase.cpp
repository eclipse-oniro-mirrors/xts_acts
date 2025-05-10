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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018063,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.floor.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018064,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.floor.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018065,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.floor.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018066,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.floor.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018067,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.floor.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018068,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.floor.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018069,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.floor.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018070,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.floor.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018071,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.floor.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018072,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.floor.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018073,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.floor.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018074,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.floor.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018075,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.floor.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018076,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.floor.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018077,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.floor.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018078,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.floor.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018079,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.floor.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018080,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.floor.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018081,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.floor.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018082,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.floor.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018083,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.floor.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018084,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.floor.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018085,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.floor.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018086,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.floor.vec4_highp_fragment");
