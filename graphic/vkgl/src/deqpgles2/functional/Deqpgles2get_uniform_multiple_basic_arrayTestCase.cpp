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
#include "../ActsDeqpgles20015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014303,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014304,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014305,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.multiple_basic_array.both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014623,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014624,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014625,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.multiple_basic_array.both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014927,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014928,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014929,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.multiple_basic_array.both");
