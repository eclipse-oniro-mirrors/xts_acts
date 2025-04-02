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
#include "../ActsDeqpgles30013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012742,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.mod.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012743,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mod.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012744,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mod.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012745,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.mod.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012746,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mod.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012747,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.mod.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012748,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.mod.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012749,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mod.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012750,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mod.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012751,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.mod.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012752,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.mod.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012753,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mod.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012754,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mod.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012755,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.mod.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012756,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.mod.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012757,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.mod.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012758,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mod.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012759,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.mod.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012760,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mod.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012761,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mod.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012762,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mod.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012763,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.mod.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012764,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mod.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012765,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mod.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012766,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mod.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012767,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.mod.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012768,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.mod.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012769,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.mod.highp_vec4_float_fragment");
