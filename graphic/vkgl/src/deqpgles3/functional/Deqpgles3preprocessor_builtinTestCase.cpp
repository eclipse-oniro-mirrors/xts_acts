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

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001124,
        "dEQP-GLES3.functional.shaders.p",
        "reprocessor.builtin.line_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001125,
        "dEQP-GLES3.functional.shaders.pr",
        "eprocessor.builtin.line_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001126,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.builtin.line_and_file_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001127,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.builtin.line_and_file_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001128,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.builtin.line_defined_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001129,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.builtin.line_defined_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001130,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.builtin.line_defined_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001131,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.builtin.line_defined_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001132,
        "dEQP-GLES3.functional.shaders.prep",
        "rocessor.builtin.empty_line_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001133,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.builtin.empty_line_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001134,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.builtin.invalid_line_file_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001135,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.builtin.invalid_line_file_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001136,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.builtin.invalid_line_file_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001137,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.builtin.invalid_line_file_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001138,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.builtin.invalid_line_file_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001139,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.builtin.invalid_line_file_4_fragment");
