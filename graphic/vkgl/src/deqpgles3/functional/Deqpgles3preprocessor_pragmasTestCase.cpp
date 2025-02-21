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
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001140,
        "dEQP-GLES3.functional.shaders.pr",
        "eprocessor.pragmas.pragma_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001141,
        "dEQP-GLES3.functional.shaders.pre",
        "processor.pragmas.pragma_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001142,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.pragmas.pragma_macro_exp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001143,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.pragmas.pragma_macro_exp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001144,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.pragmas.pragma_unrecognized_debug_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001145,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".pragmas.pragma_unrecognized_debug_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001146,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.pragmas.pragma_unrecognized_token_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001147,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".pragmas.pragma_unrecognized_token_fragment");
