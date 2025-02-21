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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000541,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000542,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000543,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000544,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000545,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000546,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.isnan.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000547,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000548,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000549,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000550,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.isnan.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000551,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000552,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000553,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000554,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000555,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000556,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.isnan.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000557,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000558,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.isnan.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000559,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000560,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000561,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000562,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000563,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000564,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000565,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000566,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000567,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000568,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.isnan.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000569,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000570,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.isnan.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000571,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000572,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000573,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000574,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000575,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000576,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000577,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000578,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000579,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000580,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.isnan.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000581,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000582,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.isnan.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000583,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000584,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000585,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000586,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.isnan.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000587,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.isnan.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000588,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.isnan.vec4_highp_compute");
