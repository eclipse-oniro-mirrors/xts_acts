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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018255,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isinf.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018256,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isinf.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018257,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isinf.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018258,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.isinf.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018259,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isinf.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018260,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isinf.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018261,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.isinf.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018262,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isinf.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018263,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018264,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018265,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isinf.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018266,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018267,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.isinf.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018268,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isinf.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018269,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018270,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018271,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isinf.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018272,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018273,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.isinf.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018274,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isinf.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018275,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018276,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.isinf.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018277,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.isinf.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018278,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.isinf.vec4_highp_fragment");
