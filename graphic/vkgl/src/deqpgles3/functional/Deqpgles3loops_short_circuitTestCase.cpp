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
#include "../ActsDeqpgles30008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007278,
        "dEQP-GLES3.functional.shaders.l",
        "oops.short_circuit.while_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007279,
        "dEQP-GLES3.functional.shaders.lo",
        "ops.short_circuit.while_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007280,
        "dEQP-GLES3.functional.shaders.",
        "loops.short_circuit.for_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007281,
        "dEQP-GLES3.functional.shaders.l",
        "oops.short_circuit.for_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007282,
        "dEQP-GLES3.functional.shaders.lo",
        "ops.short_circuit.do_while_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007283,
        "dEQP-GLES3.functional.shaders.loo",
        "ps.short_circuit.do_while_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007284,
        "dEQP-GLES3.functional.shaders.loops",
        ".short_circuit.while_sequence_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007285,
        "dEQP-GLES3.functional.shaders.loops.",
        "short_circuit.while_sequence_fragment");
