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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000637,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000638,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstoint.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000639,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000640,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000641,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000642,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".common.floatbitstoint.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000643,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstoint.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000644,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000645,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000646,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstoint.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000647,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000648,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000649,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000650,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000651,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000652,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000653,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000654,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".common.floatbitstoint.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000655,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000656,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000657,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000658,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstoint.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000659,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000660,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000661,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000662,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000663,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000664,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000665,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000666,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".common.floatbitstoint.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000667,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000668,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000669,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000670,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstoint.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000671,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000672,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000673,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000674,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000675,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000676,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000677,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000678,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".common.floatbitstoint.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000679,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstoint.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000680,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000681,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000682,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstoint.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000683,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstoint.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000684,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstoint.vec4_highp_compute");
