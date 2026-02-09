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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013148,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.mix.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013149,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013150,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.mix.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013151,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mix.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013152,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013153,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.mix.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013154,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.mix.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013155,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013156,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013157,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.mix.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013158,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.mix.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013159,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013160,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.mix.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013161,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013162,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013163,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.mix.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013164,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.mix.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013165,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013166,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.mix.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013167,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013168,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013169,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.mix.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013170,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.mix.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013171,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mix.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013172,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mix.lowp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013173,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mix.lowp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013174,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mix.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013175,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.mix.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013176,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mix.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013177,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mix.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013178,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mix.lowp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013179,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mix.lowp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013180,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mix.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013181,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.mix.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013182,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mix.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013183,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mix.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013184,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mix.lowp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013185,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mix.lowp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013186,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mix.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013187,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.mix.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013188,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mix.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013189,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mix.highp_vec4_float_fragment");
