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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018015,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018016,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018017,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018018,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.sign.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018019,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018020,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018021,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018022,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018023,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018024,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018025,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018026,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018027,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018028,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018029,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018030,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018031,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018032,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018033,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018034,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018035,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018036,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018037,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018038,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.vec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018039,
        "dEQP-GLES3.functional.shaders.builtin",
        "_functions.common.sign.int_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018040,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.int_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018041,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.int_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018042,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.int_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018043,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.int_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018044,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.int_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018045,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.ivec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018046,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.ivec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018047,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018048,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018049,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.ivec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018050,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018051,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.ivec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018052,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.ivec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018053,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018054,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018055,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.ivec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018056,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018057,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.sign.ivec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018058,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.ivec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018059,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018060,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.common.sign.ivec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018061,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.sign.ivec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018062,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.sign.ivec4_highp_fragment");
