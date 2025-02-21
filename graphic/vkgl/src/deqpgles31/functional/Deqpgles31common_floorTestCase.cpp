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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000205,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000206,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000207,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000208,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000209,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000210,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.floor.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000211,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000212,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000213,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000214,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.floor.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000215,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000216,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000217,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000218,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000219,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000220,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.floor.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000221,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000222,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.floor.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000223,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000224,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000225,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000226,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000227,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000228,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000229,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000230,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000231,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000232,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.floor.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000233,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000234,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.floor.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000235,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000236,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000237,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000238,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000239,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000240,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000241,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000242,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000243,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000244,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.floor.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000245,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000246,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.floor.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000247,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000248,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000249,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000250,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.floor.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000251,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.floor.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000252,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.floor.vec4_highp_compute");
