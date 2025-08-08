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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000459,
        "dEQP-GLES2.functional.shaders.pr",
        "eprocessor.pragmas.pragma_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000460,
        "dEQP-GLES2.functional.shaders.pre",
        "processor.pragmas.pragma_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000461,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.pragmas.pragma_macro_exp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000462,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.pragmas.pragma_macro_exp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000463,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.pragmas.pragma_unrecognized_debug_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000464,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".pragmas.pragma_unrecognized_debug_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000465,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.pragmas.pragma_unrecognized_token_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000466,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".pragmas.pragma_unrecognized_token_fragment");
