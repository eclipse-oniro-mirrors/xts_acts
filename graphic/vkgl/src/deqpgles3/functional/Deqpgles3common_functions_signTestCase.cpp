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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012574,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.sign.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012575,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.sign.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012576,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.sign.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012577,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.sign.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012578,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.sign.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012579,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.sign.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012580,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.sign.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012581,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.sign.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012582,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.sign.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012583,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.sign.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012584,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.sign.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012585,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.sign.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012586,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.sign.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012587,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.sign.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012588,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.sign.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012589,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.sign.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012590,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.sign.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012591,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.sign.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012592,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.sign.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012593,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.sign.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012594,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.sign.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012595,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.sign.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012596,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.sign.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012597,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.sign.highp_vec4_fragment");
