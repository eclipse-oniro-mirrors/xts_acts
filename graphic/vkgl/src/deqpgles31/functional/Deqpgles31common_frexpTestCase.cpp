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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000733,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.frexp.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000734,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000735,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000736,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000737,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000738,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000739,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000740,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000741,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000742,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.frexp.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000743,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000744,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000745,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000746,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000747,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000748,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.frexp.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000749,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000750,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000751,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.frexp.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000752,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000753,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000754,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000755,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000756,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.frexp.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000757,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000758,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000759,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000760,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.frexp.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000761,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000762,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000763,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.frexp.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000764,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000765,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000766,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000767,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000768,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000769,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.frexp.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000770,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000771,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000772,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000773,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000774,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.frexp.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000775,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000776,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000777,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000778,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.frexp.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000779,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000780,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000781,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.frexp.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000782,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000783,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000784,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000785,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000786,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000787,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.frexp.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000788,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000789,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000790,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000791,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000792,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.frexp.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000793,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000794,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000795,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000796,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.frexp.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000797,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000798,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000799,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.frexp.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000800,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000801,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000802,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.frexp.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000803,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.frexp.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000804,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.frexp.vec4_highp_compute");
