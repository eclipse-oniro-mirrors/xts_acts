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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000349,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000350,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000351,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000352,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000353,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000354,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.roundeven.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000355,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000356,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000357,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000358,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.roundeven.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000359,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000360,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000361,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000362,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000363,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000364,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.roundeven.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000365,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000366,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.roundeven.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000367,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000368,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000369,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000370,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000371,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000372,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000373,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000374,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000375,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000376,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.roundeven.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000377,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000378,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.roundeven.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000379,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000380,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000381,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000382,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000383,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000384,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000385,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000386,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000387,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000388,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.roundeven.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000389,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000390,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.roundeven.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000391,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000392,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000393,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000394,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.roundeven.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000395,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.roundeven.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000396,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.roundeven.vec4_highp_compute");
