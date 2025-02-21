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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004153,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.declarations.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004154,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.declarations.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004155,
        "dEQP-GLES3.functional.shaders.func",
        "tions.declarations.basic_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004156,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.declarations.basic_arg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004157,
        "dEQP-GLES3.functional.shaders.function",
        "s.declarations.define_after_use_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004158,
        "dEQP-GLES3.functional.shaders.functions",
        ".declarations.define_after_use_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004159,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.declarations.double_declare_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004160,
        "dEQP-GLES3.functional.shaders.function",
        "s.declarations.double_declare_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004161,
        "dEQP-GLES3.functional.shaders.functions.",
        "declarations.declare_after_define_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004162,
        "dEQP-GLES3.functional.shaders.functions.d",
        "eclarations.declare_after_define_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004163,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.declarations.void_vs_no_void_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004164,
        "dEQP-GLES3.functional.shaders.function",
        "s.declarations.void_vs_no_void_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004165,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.declarations.in_vs_no_in_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004166,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.declarations.in_vs_no_in_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004167,
        "dEQP-GLES3.functional.shaders.functions.decl",
        "arations.default_vs_explicit_precision_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004168,
        "dEQP-GLES3.functional.shaders.functions.decla",
        "rations.default_vs_explicit_precision_fragment");
