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
#include "../ActsDeqpgles30038TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037123,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037124,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037125,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.get_uniform.multiple_basic_array.both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037606,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037607,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037608,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.multiple_basic_array.both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038050,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038051,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038052,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.multiple_basic_array.both");
