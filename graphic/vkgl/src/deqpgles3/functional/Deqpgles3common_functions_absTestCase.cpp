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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012550,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.abs.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012551,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012552,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.abs.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012553,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.abs.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012554,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012555,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.abs.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012556,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.abs.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012557,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012558,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012559,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.abs.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012560,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.abs.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012561,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012562,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.abs.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012563,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012564,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012565,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.abs.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012566,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.abs.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012567,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012568,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.abs.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012569,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012570,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012571,
        "dEQP-GLES3.functional.shaders.operator.c",
        "ommon_functions.abs.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012572,
        "dEQP-GLES3.functional.shaders.operator",
        ".common_functions.abs.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012573,
        "dEQP-GLES3.functional.shaders.operator.",
        "common_functions.abs.highp_vec4_fragment");
