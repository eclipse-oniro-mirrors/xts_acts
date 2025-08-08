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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000109,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000110,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000111,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000112,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000113,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000114,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.sign.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000115,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000116,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000117,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000118,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000119,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000120,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000121,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000122,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000123,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000124,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000125,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000126,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.sign.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000127,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000128,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000129,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000130,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000131,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000132,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000133,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000134,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000135,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000136,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000137,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000138,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.sign.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000139,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000140,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000141,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000142,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000143,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000144,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000145,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000146,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000147,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000148,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000149,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000150,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.sign.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000151,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000152,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000153,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000154,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000155,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000156,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.vec4_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000157,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.int_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000158,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.int_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000159,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.int_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000160,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.sign.int_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000161,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.int_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000162,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.int_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000163,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.int_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000164,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.int_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000165,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.int_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000166,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.int_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000167,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.int_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000168,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.int_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000169,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000170,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000171,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000172,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.ivec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000173,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000174,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.sign.ivec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000175,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000176,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000177,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000178,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000179,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000180,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000181,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000182,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000183,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000184,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.ivec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000185,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000186,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.sign.ivec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000187,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000188,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000189,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000190,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000191,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000192,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000193,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000194,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000195,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000196,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.sign.ivec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000197,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000198,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.sign.ivec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000199,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000200,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000201,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000202,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000203,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000204,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.sign.ivec4_highp_compute");
