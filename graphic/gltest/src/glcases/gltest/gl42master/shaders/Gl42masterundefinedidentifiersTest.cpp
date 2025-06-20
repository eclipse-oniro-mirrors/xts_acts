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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002335,
    "KHR-GL42.shaders.preprocessor.undefined_identifiers.basic_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002336,
    "KHR-GL42.shaders.preprocessor.undefined_identifiers.basic_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002337,
    "KHR-GL42.shaders.preprocessor.undefined_identifiers.in_expression_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002338,
    "KHR-GL42.shaders.preprocessor.undefined_identifiers.in_expression_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002339,
    "KHR-GL42.shaders.preprocessor.undefined_identifiers.not_used_in_eval_1_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002340,
    "KHR-GL42.shaders.preprocessor.undefined_identifiers.not_used_in_eval_1_fragment");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002341,
    "KHR-GL42.shaders.preprocessor.undefined_identifiers.not_used_in_eval_2_vertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002342,
    "KHR-GL42.shaders.preprocessor.undefined_identifiers.not_used_in_eval_2_fragment");
