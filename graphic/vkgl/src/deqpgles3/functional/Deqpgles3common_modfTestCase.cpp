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
#include "../ActsDeqpgles30019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018207,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.modf.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018208,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018209,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.modf.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018210,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.modf.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018211,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018212,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.modf.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018213,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.modf.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018214,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018215,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018216,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.modf.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018217,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.modf.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018218,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018219,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.modf.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018220,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018221,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018222,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.modf.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018223,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.modf.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018224,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018225,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.modf.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018226,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018227,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018228,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.modf.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018229,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.modf.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018230,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.modf.vec4_highp_fragment");
