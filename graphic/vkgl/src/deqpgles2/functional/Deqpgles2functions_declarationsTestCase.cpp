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

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002089,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.declarations.void_vs_no_void_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002090,
        "dEQP-GLES2.functional.shaders.function",
        "s.declarations.void_vs_no_void_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002091,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.declarations.in_vs_no_in_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002092,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.declarations.in_vs_no_in_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002093,
        "dEQP-GLES2.functional.shaders.functions.decl",
        "arations.default_vs_explicit_precision_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002094,
        "dEQP-GLES2.functional.shaders.functions.decla",
        "rations.default_vs_explicit_precision_fragment");
