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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000287,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.conditional_inclusion.basic_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000288,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.conditional_inclusion.basic_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000289,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.conditional_inclusion.basic_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000290,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.conditional_inclusion.basic_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000291,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.conditional_inclusion.basic_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000292,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.conditional_inclusion.basic_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000293,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.conditional_inclusion.basic_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000294,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.conditional_inclusion.basic_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000295,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.conditional_inclusion.basic_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000296,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.conditional_inclusion.basic_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000297,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.conditional_inclusion.unary_ops_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000298,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".conditional_inclusion.unary_ops_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000299,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.conditional_inclusion.unary_ops_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000300,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".conditional_inclusion.unary_ops_2_fragment");
