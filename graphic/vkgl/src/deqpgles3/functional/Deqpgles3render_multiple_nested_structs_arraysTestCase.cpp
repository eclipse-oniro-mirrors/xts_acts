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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037306,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.render.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037307,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".render.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037308,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.render.multiple_nested_structs_arrays.both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037831,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.render.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037832,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.render.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037833,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.render.multiple_nested_structs_arrays.both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038200,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.render.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038201,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.render.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038202,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.render.multiple_nested_structs_arrays.both");
