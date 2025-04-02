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
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007619,
        "dEQP-GLES2.functional.shader",
        "s.return.single_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007620,
        "dEQP-GLES2.functional.shaders",
        ".return.single_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007621,
        "dEQP-GLES2.functional.shaders.retu",
        "rn.conditional_return_always_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007622,
        "dEQP-GLES2.functional.shaders.retur",
        "n.conditional_return_always_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007623,
        "dEQP-GLES2.functional.shaders.retu",
        "rn.conditional_return_never_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007624,
        "dEQP-GLES2.functional.shaders.retur",
        "n.conditional_return_never_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007625,
        "dEQP-GLES2.functional.shaders.retur",
        "n.conditional_return_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007626,
        "dEQP-GLES2.functional.shaders.return",
        ".conditional_return_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007627,
        "dEQP-GLES2.functional.shader",
        "s.return.double_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007628,
        "dEQP-GLES2.functional.shaders",
        ".return.double_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007629,
        "dEQP-GLES2.functional.shaders.ret",
        "urn.last_statement_in_main_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007630,
        "dEQP-GLES2.functional.shaders.retu",
        "rn.last_statement_in_main_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007631,
        "dEQP-GLES2.functional.shaders.r",
        "eturn.output_write_always_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007632,
        "dEQP-GLES2.functional.shaders.re",
        "turn.output_write_always_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007633,
        "dEQP-GLES2.functional.shaders.r",
        "eturn.output_write_never_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007634,
        "dEQP-GLES2.functional.shaders.re",
        "turn.output_write_never_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007635,
        "dEQP-GLES2.functional.shaders.re",
        "turn.output_write_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007636,
        "dEQP-GLES2.functional.shaders.ret",
        "urn.output_write_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007637,
        "dEQP-GLES2.functional.shaders.retur",
        "n.output_write_in_func_always_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007638,
        "dEQP-GLES2.functional.shaders.return",
        ".output_write_in_func_always_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007639,
        "dEQP-GLES2.functional.shaders.retur",
        "n.output_write_in_func_never_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007640,
        "dEQP-GLES2.functional.shaders.return",
        ".output_write_in_func_never_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007641,
        "dEQP-GLES2.functional.shaders.return",
        ".output_write_in_func_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007642,
        "dEQP-GLES2.functional.shaders.return.",
        "output_write_in_func_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007643,
        "dEQP-GLES2.functional.shaders.return",
        ".return_in_static_loop_always_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007644,
        "dEQP-GLES2.functional.shaders.return.",
        "return_in_static_loop_always_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007645,
        "dEQP-GLES2.functional.shaders.retur",
        "n.return_in_static_loop_never_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007646,
        "dEQP-GLES2.functional.shaders.return",
        ".return_in_static_loop_never_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007647,
        "dEQP-GLES2.functional.shaders.return",
        ".return_in_static_loop_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007648,
        "dEQP-GLES2.functional.shaders.return.",
        "return_in_static_loop_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007649,
        "dEQP-GLES2.functional.shaders.return",
        ".return_in_dynamic_loop_always_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007650,
        "dEQP-GLES2.functional.shaders.return.",
        "return_in_dynamic_loop_always_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007651,
        "dEQP-GLES2.functional.shaders.return",
        ".return_in_dynamic_loop_never_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007652,
        "dEQP-GLES2.functional.shaders.return.",
        "return_in_dynamic_loop_never_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007653,
        "dEQP-GLES2.functional.shaders.return.",
        "return_in_dynamic_loop_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007654,
        "dEQP-GLES2.functional.shaders.return.r",
        "eturn_in_dynamic_loop_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007655,
        "dEQP-GLES2.functional.shaders.ret",
        "urn.return_in_infinite_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007656,
        "dEQP-GLES2.functional.shaders.retu",
        "rn.return_in_infinite_loop_fragment");
