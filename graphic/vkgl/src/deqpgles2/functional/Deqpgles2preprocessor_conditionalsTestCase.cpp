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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000399,
        "dEQP-GLES2.functional.shaders.preprocessor.c",
        "onditionals.unterminated_nested_blocks_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000400,
        "dEQP-GLES2.functional.shaders.preprocessor.co",
        "nditionals.unterminated_nested_blocks_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000401,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.conditionals.ifdef_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000402,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.conditionals.ifdef_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000403,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.conditionals.ifdef_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000404,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.conditionals.ifdef_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000405,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.conditionals.ifdef_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000406,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.conditionals.ifdef_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000407,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.conditionals.invalid_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000408,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.conditionals.invalid_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000409,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.conditionals.ifndef_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000410,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.conditionals.ifndef_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000411,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.conditionals.ifndef_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000412,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.conditionals.ifndef_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000413,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.conditionals.invalid_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000414,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.conditionals.invalid_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000415,
        "dEQP-GLES2.functional.shaders.preprocessor.co",
        "nditionals.mixed_conditional_inclusion_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000416,
        "dEQP-GLES2.functional.shaders.preprocessor.con",
        "ditionals.mixed_conditional_inclusion_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000417,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.conditionals.nested_if_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000418,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.conditionals.nested_if_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000419,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.conditionals.nested_if_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000420,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.conditionals.nested_if_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000421,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.conditionals.nested_if_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000422,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.conditionals.nested_if_3_fragment");
