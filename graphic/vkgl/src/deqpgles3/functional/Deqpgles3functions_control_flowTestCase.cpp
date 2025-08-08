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
#include "../ActsDeqpgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004207,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.control_flow.simple_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004208,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.control_flow.simple_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004209,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.control_flow.return_in_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004210,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.control_flow.return_in_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004211,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.control_flow.return_in_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004212,
        "dEQP-GLES3.functional.shaders.function",
        "s.control_flow.return_in_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004213,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.control_flow.return_in_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004214,
        "dEQP-GLES3.functional.shaders.function",
        "s.control_flow.return_in_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004215,
        "dEQP-GLES3.functional.shaders.function",
        "s.control_flow.return_in_loop_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004216,
        "dEQP-GLES3.functional.shaders.functions",
        ".control_flow.return_in_loop_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004217,
        "dEQP-GLES3.functional.shaders.function",
        "s.control_flow.return_after_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004218,
        "dEQP-GLES3.functional.shaders.functions",
        ".control_flow.return_after_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004219,
        "dEQP-GLES3.functional.shaders.functions",
        ".control_flow.return_after_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004220,
        "dEQP-GLES3.functional.shaders.functions.",
        "control_flow.return_after_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004221,
        "dEQP-GLES3.functional.shaders.functions.",
        "control_flow.return_after_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004222,
        "dEQP-GLES3.functional.shaders.functions.c",
        "ontrol_flow.return_after_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004223,
        "dEQP-GLES3.functional.shaders.functions.",
        "control_flow.return_in_nested_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004224,
        "dEQP-GLES3.functional.shaders.functions.c",
        "ontrol_flow.return_in_nested_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004225,
        "dEQP-GLES3.functional.shaders.functions.con",
        "trol_flow.return_after_loop_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004226,
        "dEQP-GLES3.functional.shaders.functions.cont",
        "rol_flow.return_after_loop_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004227,
        "dEQP-GLES3.functional.shaders.functions.con",
        "trol_flow.mixed_return_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004228,
        "dEQP-GLES3.functional.shaders.functions.cont",
        "rol_flow.mixed_return_break_continue_fragment");
