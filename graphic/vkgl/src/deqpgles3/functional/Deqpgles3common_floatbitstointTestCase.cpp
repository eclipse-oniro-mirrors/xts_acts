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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018279,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018280,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018281,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018282,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.common.floatbitstoint.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018283,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018284,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018285,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018286,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018287,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018288,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018289,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018290,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018291,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018292,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018293,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018294,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018295,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018296,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018297,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018298,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018299,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018300,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018301,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018302,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec4_highp_fragment");
