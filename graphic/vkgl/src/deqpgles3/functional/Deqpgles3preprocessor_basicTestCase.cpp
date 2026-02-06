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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000784,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.basic.correct_phases_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000785,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.basic.correct_phases_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000786,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.basic.invalid_identifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000787,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.basic.invalid_identifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000788,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.basic.null_directive_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000789,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.basic.null_directive_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000790,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.basic.invalid_directive_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000791,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.basic.invalid_directive_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000792,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.basic.missing_identifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000793,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.basic.missing_identifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000794,
        "dEQP-GLES3.functional.shaders.prep",
        "rocessor.basic.empty_object_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000795,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.basic.empty_object_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000796,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.basic.empty_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000797,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.basic.empty_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000798,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.basic.empty_directive_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000799,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.basic.empty_directive_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000800,
        "dEQP-GLES3.functional.shaders.preprocessor.b",
        "asic.identifier_with_double_underscore_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000801,
        "dEQP-GLES3.functional.shaders.preprocessor.ba",
        "sic.identifier_with_double_underscore_fragment");
