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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014436,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.render.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014437,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".render.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014438,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.render.multiple_nested_structs_arrays.both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014768,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.render.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014769,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.render.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014770,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.render.multiple_nested_structs_arrays.both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015047,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.render.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015048,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.render.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015049,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.render.multiple_nested_structs_arrays.both");
