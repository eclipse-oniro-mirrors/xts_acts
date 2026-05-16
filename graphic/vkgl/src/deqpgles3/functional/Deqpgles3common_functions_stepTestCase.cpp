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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013190,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.step.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013191,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.step.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013192,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.step.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013193,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.step.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013194,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.step.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013195,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.step.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013196,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.step.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013197,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.step.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013198,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.step.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013199,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.step.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013200,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.step.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013201,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.step.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013202,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.step.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013203,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.step.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013204,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.step.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013205,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.step.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013206,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.step.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013207,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.step.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013208,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.step.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013209,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.step.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013210,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.step.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013211,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.step.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013212,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.step.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013213,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.step.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013214,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.step.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013215,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.step.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013216,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.step.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013217,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.step.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013218,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.step.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013219,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.step.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013220,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.step.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013221,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.step.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013222,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.step.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013223,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.step.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013224,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.step.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013225,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.step.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013226,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.step.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013227,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.step.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013228,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.step.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013229,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.step.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013230,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.step.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013231,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.step.highp_float_vec4_fragment");
