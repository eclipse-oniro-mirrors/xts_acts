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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002317,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_op_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002318,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_op_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002319,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_op_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002320,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_op_2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002321,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_identifier_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002322,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_identifier_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002323,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_identifier_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002324,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_identifier_2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002325,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_identifier_3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002326,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_identifier_3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002327,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_identifier_4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002328,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_identifier_4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002329,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_identifier_5_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002330,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_identifier_5_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002331,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_rparen_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002332,
    "KHR-GL43.shaders.preprocessor.invalid_ops.invalid_defined_expected_rparen_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002333,
    "KHR-GL43.shaders.preprocessor.invalid_ops.defined_define_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002334,
    "KHR-GL43.shaders.preprocessor.invalid_ops.defined_define_fragment");
