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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012622,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.trunc.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012623,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012624,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.trunc.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012625,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.trunc.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012626,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012627,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.trunc.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012628,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.trunc.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012629,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012630,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012631,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.trunc.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012632,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.trunc.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012633,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012634,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.trunc.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012635,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012636,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012637,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.trunc.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012638,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.trunc.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012639,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012640,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.trunc.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012641,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012642,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012643,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.trunc.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012644,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.trunc.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012645,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.trunc.highp_vec4_fragment");