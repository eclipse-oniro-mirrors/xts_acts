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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004475,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "plex_expression.and_short_circuits_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004476,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "lex_expression.and_short_circuits_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004477,
        "dEQP-GLES3.functional.shaders.arrays.com",
        "plex_expression.or_short_circuits_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004478,
        "dEQP-GLES3.functional.shaders.arrays.comp",
        "lex_expression.or_short_circuits_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004479,
        "dEQP-GLES3.functional.shaders.arrays.complex_exp",
        "ression.ternary_only_evaluates_one_operand_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004480,
        "dEQP-GLES3.functional.shaders.arrays.complex_expr",
        "ession.ternary_only_evaluates_one_operand_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004481,
        "dEQP-GLES3.functional.shaders.arrays.complex_expression.se",
        "quence_side_effects_affecting_compared_array_content_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004482,
        "dEQP-GLES3.functional.shaders.arrays.complex_expression.seq",
        "uence_side_effects_affecting_compared_array_content_fragment");
