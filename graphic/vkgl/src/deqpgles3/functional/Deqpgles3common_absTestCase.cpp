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
#include "../ActsDeqpgles30018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017967,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.float_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017968,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.float_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017969,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.float_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017970,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.abs.float_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017971,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.float_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017972,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.float_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017973,
        "dEQP-GLES3.functional.shaders.builtin",
        "_functions.common.abs.vec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017974,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.vec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017975,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.vec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017976,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.abs.vec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017977,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.vec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017978,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.vec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017979,
        "dEQP-GLES3.functional.shaders.builtin",
        "_functions.common.abs.vec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017980,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.vec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017981,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.vec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017982,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.abs.vec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017983,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.vec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017984,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.vec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017985,
        "dEQP-GLES3.functional.shaders.builtin",
        "_functions.common.abs.vec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017986,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.vec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017987,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.vec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017988,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.abs.vec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017989,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.vec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017990,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.vec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017991,
        "dEQP-GLES3.functional.shaders.builtin",
        "_functions.common.abs.int_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017992,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.int_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017993,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.int_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017994,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.int_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017995,
        "dEQP-GLES3.functional.shaders.builtin",
        "_functions.common.abs.int_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017996,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.int_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017997,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.ivec2_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017998,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.ivec2_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017999,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.ivec2_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018000,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec2_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018001,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.ivec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018002,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.ivec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018003,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.ivec3_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018004,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.ivec3_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018005,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.ivec3_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018006,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec3_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018007,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.ivec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018008,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.ivec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018009,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.ivec4_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018010,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.ivec4_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018011,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.ivec4_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018012,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.common.abs.ivec4_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018013,
        "dEQP-GLES3.functional.shaders.builtin_",
        "functions.common.abs.ivec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_018014,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.common.abs.ivec4_highp_fragment");
