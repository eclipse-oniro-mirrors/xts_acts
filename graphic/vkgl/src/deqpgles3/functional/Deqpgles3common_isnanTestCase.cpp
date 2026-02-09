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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018231,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isnan.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018232,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isnan.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018233,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isnan.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018234,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.isnan.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018235,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isnan.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018236,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isnan.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018237,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.isnan.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018238,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isnan.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018239,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018240,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018241,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isnan.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018242,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018243,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.isnan.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018244,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isnan.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018245,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018246,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018247,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isnan.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018248,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018249,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.isnan.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018250,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isnan.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018251,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018252,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018253,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isnan.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018254,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec4_highp_fragment");
