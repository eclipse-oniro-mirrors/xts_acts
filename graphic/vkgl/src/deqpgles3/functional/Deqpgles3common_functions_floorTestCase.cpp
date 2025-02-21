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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012598,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.floor.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012599,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012600,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.floor.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012601,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.floor.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012602,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012603,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.floor.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012604,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.floor.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012605,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012606,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012607,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.floor.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012608,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.floor.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012609,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012610,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.floor.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012611,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012612,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012613,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.floor.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012614,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.floor.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012615,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012616,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.floor.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012617,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012618,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012619,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.floor.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012620,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.floor.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012621,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.floor.highp_vec4_fragment");
