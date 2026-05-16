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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018087,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.trunc.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018088,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.trunc.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018089,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.trunc.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018090,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.trunc.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018091,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.trunc.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018092,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.trunc.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018093,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.trunc.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018094,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.trunc.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018095,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018096,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018097,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.trunc.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018098,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018099,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.trunc.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018100,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.trunc.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018101,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018102,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018103,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.trunc.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018104,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018105,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.trunc.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018106,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.trunc.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018107,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018108,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018109,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.trunc.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018110,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec4_highp_fragment");
