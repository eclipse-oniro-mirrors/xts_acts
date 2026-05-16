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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000877,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.fma.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000878,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000879,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000880,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000881,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000882,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000883,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000884,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000885,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000886,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.fma.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000887,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000888,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000889,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000890,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000891,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000892,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fma.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000893,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000894,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000895,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.fma.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000896,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000897,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000898,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000899,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000900,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.fma.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000901,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000902,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000903,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000904,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fma.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000905,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000906,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000907,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.fma.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000908,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000909,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000910,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000911,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000912,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000913,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.fma.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000914,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000915,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000916,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000917,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000918,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.fma.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000919,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000920,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000921,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000922,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fma.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000923,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000924,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000925,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.fma.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000926,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000927,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000928,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000929,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000930,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000931,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.fma.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000932,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000933,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000934,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000935,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000936,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.fma.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000937,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000938,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000939,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000940,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fma.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000941,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000942,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000943,
        "dEQP-GLES31.functional.shaders.builtin",
        "_functions.common.fma.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000944,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000945,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000946,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fma.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000947,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fma.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000948,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fma.vec4_highp_compute");
