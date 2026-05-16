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

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000397,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.float_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000398,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ceil.float_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000399,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.float_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000400,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ceil.float_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000401,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.float_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000402,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.ceil.float_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000403,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ceil.float_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000404,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.float_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000405,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.float_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000406,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ceil.float_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000407,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.float_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000408,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.float_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000409,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ceil.vec2_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000410,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec2_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000411,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec2_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000412,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ceil.vec2_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000413,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec2_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000414,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.ceil.vec2_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000415,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec2_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000416,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec2_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000417,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000418,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ceil.vec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000419,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000420,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ceil.vec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000421,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ceil.vec3_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000422,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec3_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000423,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec3_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000424,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ceil.vec3_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000425,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec3_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000426,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.ceil.vec3_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000427,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec3_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000428,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec3_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000429,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000430,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ceil.vec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000431,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000432,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ceil.vec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000433,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ceil.vec4_lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000434,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec4_lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000435,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec4_lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000436,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ceil.vec4_lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000437,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec4_mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000438,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.common.ceil.vec4_mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000439,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.common.ceil.vec4_mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000440,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec4_mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000441,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000442,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.common.ceil.vec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000443,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.common.ceil.vec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000444,
        "dEQP-GLES31.functional.shaders.builtin_",
        "functions.common.ceil.vec4_highp_compute");
