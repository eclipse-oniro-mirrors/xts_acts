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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002252,
        "dEQP-GLES2.functional.shaders.ke",
        "ywords.keywords.attribute_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002253,
        "dEQP-GLES2.functional.shaders.key",
        "words.keywords.attribute_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002254,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.const_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002255,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.const_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002256,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002257,
        "dEQP-GLES2.functional.shaders.ke",
        "ywords.keywords.uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002258,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.varying_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002259,
        "dEQP-GLES2.functional.shaders.ke",
        "ywords.keywords.varying_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002260,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002261,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002262,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002263,
        "dEQP-GLES2.functional.shaders.ke",
        "ywords.keywords.continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002264,
        "dEQP-GLES2.functional.shader",
        "s.keywords.keywords.do_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002265,
        "dEQP-GLES2.functional.shaders",
        ".keywords.keywords.do_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002266,
        "dEQP-GLES2.functional.shaders",
        ".keywords.keywords.for_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002267,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.for_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002268,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.while_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002269,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.while_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002270,
        "dEQP-GLES2.functional.shader",
        "s.keywords.keywords.if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002271,
        "dEQP-GLES2.functional.shaders",
        ".keywords.keywords.if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002272,
        "dEQP-GLES2.functional.shaders",
        ".keywords.keywords.else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002273,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002274,
        "dEQP-GLES2.functional.shader",
        "s.keywords.keywords.in_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002275,
        "dEQP-GLES2.functional.shaders",
        ".keywords.keywords.in_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002276,
        "dEQP-GLES2.functional.shaders",
        ".keywords.keywords.out_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002277,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.out_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002278,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002279,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.inout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002280,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002281,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002282,
        "dEQP-GLES2.functional.shaders",
        ".keywords.keywords.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002283,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002284,
        "dEQP-GLES2.functional.shaders",
        ".keywords.keywords.void_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002285,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.void_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002286,
        "dEQP-GLES2.functional.shaders",
        ".keywords.keywords.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002287,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002288,
        "dEQP-GLES2.functional.shaders",
        ".keywords.keywords.lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002289,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002290,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002291,
        "dEQP-GLES2.functional.shaders.ke",
        "ywords.keywords.mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002292,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002293,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002294,
        "dEQP-GLES2.functional.shaders.ke",
        "ywords.keywords.precision_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002295,
        "dEQP-GLES2.functional.shaders.key",
        "words.keywords.precision_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002296,
        "dEQP-GLES2.functional.shaders.ke",
        "ywords.keywords.invariant_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002297,
        "dEQP-GLES2.functional.shaders.key",
        "words.keywords.invariant_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002298,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.discard_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002299,
        "dEQP-GLES2.functional.shaders.ke",
        "ywords.keywords.discard_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002300,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002301,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002302,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002303,
        "dEQP-GLES2.functional.shaders.",
        "keywords.keywords.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002304,
        "dEQP-GLES2.functional.shaders.k",
        "eywords.keywords.struct_fragment");
