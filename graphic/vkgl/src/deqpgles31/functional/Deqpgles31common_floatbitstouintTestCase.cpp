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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000685,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000686,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000687,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000688,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000689,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000690,
        "dEQP-GLES31.functional.shaders.builtin_functions.",
        "common.floatbitstouint.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000691,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000692,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000693,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000694,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".common.floatbitstouint.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000695,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000696,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000697,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000698,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000699,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000700,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstouint.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000701,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000702,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".common.floatbitstouint.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000703,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000704,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000705,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000706,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000707,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000708,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000709,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000710,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000711,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000712,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstouint.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000713,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000714,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".common.floatbitstouint.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000715,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000716,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000717,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000718,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000719,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000720,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000721,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000722,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000723,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000724,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floatbitstouint.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000725,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000726,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".common.floatbitstouint.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000727,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000728,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000729,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000730,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.floatbitstouint.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000731,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.floatbitstouint.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000732,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.floatbitstouint.vec4_highp_compute");
