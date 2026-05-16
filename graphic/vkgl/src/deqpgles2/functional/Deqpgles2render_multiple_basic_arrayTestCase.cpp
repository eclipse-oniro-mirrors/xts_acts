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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014433,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.render.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014434,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.render.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014435,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.render.multiple_basic_array.both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014765,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.render.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014766,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.render.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014767,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.render.multiple_basic_array.both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015044,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.render.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015045,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.render.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_015046,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.render.multiple_basic_array.both");
