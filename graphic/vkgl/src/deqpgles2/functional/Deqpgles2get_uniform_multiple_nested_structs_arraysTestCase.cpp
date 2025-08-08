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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014306,
        "dEQP-GLES2.functional.uniform_api.value.initial.",
        "get_uniform.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014307,
        "dEQP-GLES2.functional.uniform_api.value.initial.g",
        "et_uniform.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014308,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.multiple_nested_structs_arrays.both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014626,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014627,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014628,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.multiple_nested_structs_arrays.both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014930,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v",
        "alue.get_uniform.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014931,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_va",
        "lue.get_uniform.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014932,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.multiple_nested_structs_arrays.both");
