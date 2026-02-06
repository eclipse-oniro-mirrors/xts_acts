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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000253,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000254,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000255,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000256,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000257,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000258,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.trunc.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000259,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000260,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000261,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000262,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.trunc.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000263,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000264,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000265,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000266,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000267,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000268,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.trunc.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000269,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000270,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.trunc.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000271,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000272,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000273,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000274,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000275,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000276,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000277,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000278,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000279,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000280,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.trunc.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000281,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000282,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.trunc.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000283,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000284,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000285,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000286,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000287,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000288,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000289,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000290,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000291,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000292,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.trunc.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000293,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000294,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.trunc.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000295,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000296,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000297,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000298,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.trunc.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000299,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.trunc.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000300,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.trunc.vec4_highp_compute");
