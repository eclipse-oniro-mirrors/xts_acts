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

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002137,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.control_flow.simple_return_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002138,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.control_flow.simple_return_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002139,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.control_flow.return_in_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002140,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.control_flow.return_in_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002141,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.control_flow.return_in_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002142,
        "dEQP-GLES2.functional.shaders.function",
        "s.control_flow.return_in_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002143,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.control_flow.return_in_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002144,
        "dEQP-GLES2.functional.shaders.function",
        "s.control_flow.return_in_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002145,
        "dEQP-GLES2.functional.shaders.function",
        "s.control_flow.return_in_loop_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002146,
        "dEQP-GLES2.functional.shaders.functions",
        ".control_flow.return_in_loop_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002147,
        "dEQP-GLES2.functional.shaders.function",
        "s.control_flow.return_after_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002148,
        "dEQP-GLES2.functional.shaders.functions",
        ".control_flow.return_after_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002149,
        "dEQP-GLES2.functional.shaders.functions",
        ".control_flow.return_after_break_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002150,
        "dEQP-GLES2.functional.shaders.functions.",
        "control_flow.return_after_break_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002151,
        "dEQP-GLES2.functional.shaders.functions.",
        "control_flow.return_after_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002152,
        "dEQP-GLES2.functional.shaders.functions.c",
        "ontrol_flow.return_after_continue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002153,
        "dEQP-GLES2.functional.shaders.functions.",
        "control_flow.return_in_nested_loop_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002154,
        "dEQP-GLES2.functional.shaders.functions.c",
        "ontrol_flow.return_in_nested_loop_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002155,
        "dEQP-GLES2.functional.shaders.functions.con",
        "trol_flow.return_after_loop_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002156,
        "dEQP-GLES2.functional.shaders.functions.cont",
        "rol_flow.return_after_loop_sequence_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002157,
        "dEQP-GLES2.functional.shaders.functions.con",
        "trol_flow.mixed_return_break_continue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002158,
        "dEQP-GLES2.functional.shaders.functions.cont",
        "rol_flow.mixed_return_break_continue_fragment");
