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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000960,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.conditional_inclusion.basic_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000961,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.conditional_inclusion.basic_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000962,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.conditional_inclusion.basic_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000963,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.conditional_inclusion.basic_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000964,
        "dEQP-GLES3.functional.shaders.preprocessor.co",
        "nditional_inclusion.defined_macro_undef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000965,
        "dEQP-GLES3.functional.shaders.preprocessor.con",
        "ditional_inclusion.defined_macro_undef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000966,
        "dEQP-GLES3.functional.shaders.preprocessor.conditional_in",
        "clusion.defined_invalid_before_all_macros_replaced_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000967,
        "dEQP-GLES3.functional.shaders.preprocessor.conditional_inc",
        "lusion.defined_invalid_before_all_macros_replaced_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000968,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.conditional_inclusion.basic_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000969,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.conditional_inclusion.basic_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000970,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.conditional_inclusion.basic_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000971,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.conditional_inclusion.basic_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000972,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.conditional_inclusion.basic_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000973,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.conditional_inclusion.basic_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000974,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.conditional_inclusion.unary_ops_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000975,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".conditional_inclusion.unary_ops_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000976,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.conditional_inclusion.unary_ops_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000977,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".conditional_inclusion.unary_ops_2_fragment");
