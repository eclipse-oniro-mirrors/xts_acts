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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012718,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.fract.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012719,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012720,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.fract.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012721,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.fract.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012722,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012723,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.fract.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012724,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.fract.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012725,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012726,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012727,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.fract.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012728,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.fract.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012729,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012730,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.fract.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012731,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012732,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012733,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.fract.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012734,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.fract.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012735,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012736,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.fract.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012737,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012738,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012739,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.fract.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012740,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.fract.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012741,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.fract.highp_vec4_fragment");
