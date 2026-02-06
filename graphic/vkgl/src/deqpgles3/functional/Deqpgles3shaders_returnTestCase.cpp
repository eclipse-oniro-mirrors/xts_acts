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
#include "../ActsDeqpgles30017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016410,
        "dEQP-GLES3.functional.shader",
        "s.return.single_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016411,
        "dEQP-GLES3.functional.shaders",
        ".return.single_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016412,
        "dEQP-GLES3.functional.shaders.retu",
        "rn.conditional_return_always_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016413,
        "dEQP-GLES3.functional.shaders.retur",
        "n.conditional_return_always_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016414,
        "dEQP-GLES3.functional.shaders.retu",
        "rn.conditional_return_never_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016415,
        "dEQP-GLES3.functional.shaders.retur",
        "n.conditional_return_never_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016416,
        "dEQP-GLES3.functional.shaders.retur",
        "n.conditional_return_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016417,
        "dEQP-GLES3.functional.shaders.return",
        ".conditional_return_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016418,
        "dEQP-GLES3.functional.shader",
        "s.return.double_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016419,
        "dEQP-GLES3.functional.shaders",
        ".return.double_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016420,
        "dEQP-GLES3.functional.shaders.ret",
        "urn.last_statement_in_main_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016421,
        "dEQP-GLES3.functional.shaders.retu",
        "rn.last_statement_in_main_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016422,
        "dEQP-GLES3.functional.shaders.r",
        "eturn.output_write_always_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016423,
        "dEQP-GLES3.functional.shaders.re",
        "turn.output_write_always_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016424,
        "dEQP-GLES3.functional.shaders.r",
        "eturn.output_write_never_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016425,
        "dEQP-GLES3.functional.shaders.re",
        "turn.output_write_never_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016426,
        "dEQP-GLES3.functional.shaders.re",
        "turn.output_write_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016427,
        "dEQP-GLES3.functional.shaders.ret",
        "urn.output_write_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016428,
        "dEQP-GLES3.functional.shaders.retur",
        "n.output_write_in_func_always_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016429,
        "dEQP-GLES3.functional.shaders.return",
        ".output_write_in_func_always_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016430,
        "dEQP-GLES3.functional.shaders.retur",
        "n.output_write_in_func_never_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016431,
        "dEQP-GLES3.functional.shaders.return",
        ".output_write_in_func_never_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016432,
        "dEQP-GLES3.functional.shaders.return",
        ".output_write_in_func_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016433,
        "dEQP-GLES3.functional.shaders.return.",
        "output_write_in_func_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016434,
        "dEQP-GLES3.functional.shaders.return",
        ".return_in_static_loop_always_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016435,
        "dEQP-GLES3.functional.shaders.return.",
        "return_in_static_loop_always_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016436,
        "dEQP-GLES3.functional.shaders.retur",
        "n.return_in_static_loop_never_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016437,
        "dEQP-GLES3.functional.shaders.return",
        ".return_in_static_loop_never_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016438,
        "dEQP-GLES3.functional.shaders.return",
        ".return_in_static_loop_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016439,
        "dEQP-GLES3.functional.shaders.return.",
        "return_in_static_loop_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016440,
        "dEQP-GLES3.functional.shaders.return",
        ".return_in_dynamic_loop_always_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016441,
        "dEQP-GLES3.functional.shaders.return.",
        "return_in_dynamic_loop_always_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016442,
        "dEQP-GLES3.functional.shaders.return",
        ".return_in_dynamic_loop_never_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016443,
        "dEQP-GLES3.functional.shaders.return.",
        "return_in_dynamic_loop_never_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016444,
        "dEQP-GLES3.functional.shaders.return.",
        "return_in_dynamic_loop_dynamic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016445,
        "dEQP-GLES3.functional.shaders.return.r",
        "eturn_in_dynamic_loop_dynamic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016446,
        "dEQP-GLES3.functional.shaders.ret",
        "urn.return_in_infinite_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016447,
        "dEQP-GLES3.functional.shaders.retu",
        "rn.return_in_infinite_loop_fragment");
