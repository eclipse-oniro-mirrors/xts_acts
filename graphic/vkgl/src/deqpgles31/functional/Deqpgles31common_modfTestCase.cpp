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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000493,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000494,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.modf.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000495,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000496,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.modf.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000497,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000498,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.modf.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000499,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.modf.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000500,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000501,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000502,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.modf.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000503,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000504,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000505,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.modf.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000506,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000507,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000508,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.modf.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000509,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000510,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.modf.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000511,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000512,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000513,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000514,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.modf.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000515,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000516,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.modf.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000517,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.modf.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000518,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000519,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000520,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.modf.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000521,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000522,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.modf.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000523,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000524,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000525,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000526,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.modf.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000527,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000528,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.modf.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000529,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.modf.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000530,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000531,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000532,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.modf.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000533,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000534,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.modf.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000535,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.modf.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000536,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000537,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000538,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.modf.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000539,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.modf.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000540,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.modf.vec4_highp_compute");
