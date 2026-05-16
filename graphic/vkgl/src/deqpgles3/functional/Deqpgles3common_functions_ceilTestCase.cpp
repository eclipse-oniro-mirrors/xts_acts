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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012694,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.ceil.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012695,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.ceil.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012696,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.ceil.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012697,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.ceil.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012698,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.ceil.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012699,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.ceil.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012700,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.ceil.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012701,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.ceil.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012702,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.ceil.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012703,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.ceil.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012704,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.ceil.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012705,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.ceil.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012706,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.ceil.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012707,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.ceil.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012708,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.ceil.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012709,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.ceil.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012710,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.ceil.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012711,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.ceil.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012712,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.ceil.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012713,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.ceil.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012714,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.ceil.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012715,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.ceil.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012716,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.ceil.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012717,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.ceil.highp_vec4_fragment");
