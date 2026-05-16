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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000589,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000590,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000591,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000592,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000593,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000594,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.isinf.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000595,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000596,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000597,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000598,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.isinf.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000599,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000600,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000601,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000602,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000603,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000604,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.isinf.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000605,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000606,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.isinf.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000607,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000608,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000609,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000610,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000611,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000612,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000613,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000614,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000615,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000616,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.isinf.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000617,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000618,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.isinf.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000619,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000620,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000621,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000622,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000623,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000624,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000625,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000626,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000627,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000628,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.isinf.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000629,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000630,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.isinf.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000631,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000632,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000633,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000634,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000635,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000636,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isinf.vec4_highp_compute");
