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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000301,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000302,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000303,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000304,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000305,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000306,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.round.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000307,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000308,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000309,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000310,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.round.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000311,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000312,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000313,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000314,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000315,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000316,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.round.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000317,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000318,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.round.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000319,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000320,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000321,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000322,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000323,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000324,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000325,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000326,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000327,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000328,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.round.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000329,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000330,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.round.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000331,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000332,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000333,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000334,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000335,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000336,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000337,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000338,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000339,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000340,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.round.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000341,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000342,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.round.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000343,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000344,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000345,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000346,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.round.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000347,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.round.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000348,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.round.vec4_highp_compute");
