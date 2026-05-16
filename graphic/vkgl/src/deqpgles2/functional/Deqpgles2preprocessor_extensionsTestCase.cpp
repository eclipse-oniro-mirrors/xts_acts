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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000467,
        "dEQP-GLES2.functional.shaders.pre",
        "processor.extensions.basic_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000468,
        "dEQP-GLES2.functional.shaders.prep",
        "rocessor.extensions.basic_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000469,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.extensions.macro_exp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000470,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.extensions.macro_exp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000471,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.extensions.missing_extension_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000472,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".extensions.missing_extension_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000473,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.extensions.invalid_extension_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000474,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".extensions.invalid_extension_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000475,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.extensions.missing_colon_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000476,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.extensions.missing_colon_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000477,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.extensions.expected_colon_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000478,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.extensions.expected_colon_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000479,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.extensions.missing_behavior_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000480,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.extensions.missing_behavior_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000481,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.extensions.invalid_behavior_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000482,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.extensions.invalid_behavior_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000483,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.extensions.invalid_behavior_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000484,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.extensions.invalid_behavior_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000485,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.extensions.invalid_char_in_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000486,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.extensions.invalid_char_in_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000487,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".extensions.invalid_char_in_behavior_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000488,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "extensions.invalid_char_in_behavior_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000489,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.extensions.unterminated_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000490,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.extensions.unterminated_comment_fragment");
