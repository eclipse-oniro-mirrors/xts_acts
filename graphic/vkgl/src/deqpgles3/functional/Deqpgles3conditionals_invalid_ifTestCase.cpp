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
#include "../ActsDeqpgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002772,
        "dEQP-GLES3.functional.shaders.conditiona",
        "ls.invalid_if.missing_parenthesis_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002773,
        "dEQP-GLES3.functional.shaders.conditional",
        "s.invalid_if.missing_parenthesis_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002774,
        "dEQP-GLES3.functional.shaders.conditiona",
        "ls.invalid_if.unclosed_parenthesis_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002775,
        "dEQP-GLES3.functional.shaders.conditional",
        "s.invalid_if.unclosed_parenthesis_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002776,
        "dEQP-GLES3.functional.shaders.conditi",
        "onals.invalid_if.int_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002777,
        "dEQP-GLES3.functional.shaders.conditio",
        "nals.invalid_if.int_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002778,
        "dEQP-GLES3.functional.shaders.condition",
        "als.invalid_if.int_zero_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002779,
        "dEQP-GLES3.functional.shaders.conditiona",
        "ls.invalid_if.int_zero_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002780,
        "dEQP-GLES3.functional.shaders.condition",
        "als.invalid_if.int_one_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002781,
        "dEQP-GLES3.functional.shaders.conditiona",
        "ls.invalid_if.int_one_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002782,
        "dEQP-GLES3.functional.shaders.conditional",
        "s.invalid_if.int_uniform_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002783,
        "dEQP-GLES3.functional.shaders.conditionals",
        ".invalid_if.int_uniform_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002784,
        "dEQP-GLES3.functional.shaders.conditio",
        "nals.invalid_if.float_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002785,
        "dEQP-GLES3.functional.shaders.condition",
        "als.invalid_if.float_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002786,
        "dEQP-GLES3.functional.shaders.conditiona",
        "ls.invalid_if.float_zero_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002787,
        "dEQP-GLES3.functional.shaders.conditional",
        "s.invalid_if.float_zero_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002788,
        "dEQP-GLES3.functional.shaders.conditiona",
        "ls.invalid_if.float_one_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002789,
        "dEQP-GLES3.functional.shaders.conditional",
        "s.invalid_if.float_one_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002790,
        "dEQP-GLES3.functional.shaders.condition",
        "als.invalid_if.sampler_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002791,
        "dEQP-GLES3.functional.shaders.conditiona",
        "ls.invalid_if.sampler_condition_fragment");
