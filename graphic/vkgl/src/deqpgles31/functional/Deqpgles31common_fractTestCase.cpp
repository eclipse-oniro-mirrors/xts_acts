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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000445,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000446,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000447,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000448,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000449,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000450,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.common.fract.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000451,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000452,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000453,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000454,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.fract.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000455,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000456,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000457,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000458,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000459,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000460,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fract.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000461,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000462,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.fract.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000463,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000464,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000465,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000466,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000467,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000468,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000469,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000470,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000471,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000472,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fract.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000473,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000474,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.fract.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000475,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000476,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000477,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000478,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000479,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000480,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000481,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000482,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000483,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000484,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.fract.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000485,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000486,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.fract.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000487,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000488,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000489,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000490,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.fract.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000491,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.fract.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000492,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.fract.vec4_highp_compute");
