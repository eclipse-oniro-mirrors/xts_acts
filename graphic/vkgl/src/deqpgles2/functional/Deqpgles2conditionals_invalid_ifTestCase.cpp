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
#include "../ActsDeqpgles20002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001322,
        "dEQP-GLES2.functional.shaders.conditiona",
        "ls.invalid_if.missing_parenthesis_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001323,
        "dEQP-GLES2.functional.shaders.conditional",
        "s.invalid_if.missing_parenthesis_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001324,
        "dEQP-GLES2.functional.shaders.conditiona",
        "ls.invalid_if.unclosed_parenthesis_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001325,
        "dEQP-GLES2.functional.shaders.conditional",
        "s.invalid_if.unclosed_parenthesis_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001326,
        "dEQP-GLES2.functional.shaders.conditi",
        "onals.invalid_if.int_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001327,
        "dEQP-GLES2.functional.shaders.conditio",
        "nals.invalid_if.int_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001328,
        "dEQP-GLES2.functional.shaders.condition",
        "als.invalid_if.int_zero_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001329,
        "dEQP-GLES2.functional.shaders.conditiona",
        "ls.invalid_if.int_zero_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001330,
        "dEQP-GLES2.functional.shaders.condition",
        "als.invalid_if.int_one_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001331,
        "dEQP-GLES2.functional.shaders.conditiona",
        "ls.invalid_if.int_one_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001332,
        "dEQP-GLES2.functional.shaders.conditional",
        "s.invalid_if.int_uniform_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001333,
        "dEQP-GLES2.functional.shaders.conditionals",
        ".invalid_if.int_uniform_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001334,
        "dEQP-GLES2.functional.shaders.conditio",
        "nals.invalid_if.float_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001335,
        "dEQP-GLES2.functional.shaders.condition",
        "als.invalid_if.float_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001336,
        "dEQP-GLES2.functional.shaders.conditiona",
        "ls.invalid_if.float_zero_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001337,
        "dEQP-GLES2.functional.shaders.conditional",
        "s.invalid_if.float_zero_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001338,
        "dEQP-GLES2.functional.shaders.conditiona",
        "ls.invalid_if.float_one_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001339,
        "dEQP-GLES2.functional.shaders.conditional",
        "s.invalid_if.float_one_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001340,
        "dEQP-GLES2.functional.shaders.condition",
        "als.invalid_if.sampler_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001341,
        "dEQP-GLES2.functional.shaders.conditiona",
        "ls.invalid_if.sampler_condition_fragment");
