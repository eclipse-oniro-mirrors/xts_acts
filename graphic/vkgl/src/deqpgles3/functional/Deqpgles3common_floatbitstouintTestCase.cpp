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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018303,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018304,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018305,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018306,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.common.floatbitstouint.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018307,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018308,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018309,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.floatbitstouint.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018310,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018311,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018312,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018313,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018314,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018315,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.floatbitstouint.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018316,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018317,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018318,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018319,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018320,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018321,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.floatbitstouint.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018322,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018323,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018324,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018325,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018326,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec4_highp_fragment");
