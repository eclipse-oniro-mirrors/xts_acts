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
#include "../ActsDeqpgles30041TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040444,
        "dEQP-GLES3.functional.instanced.draw_arra",
        "ys_instanced.attribute_divisor.1_instances");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040445,
        "dEQP-GLES3.functional.instanced.draw_arra",
        "ys_instanced.attribute_divisor.2_instances");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040446,
        "dEQP-GLES3.functional.instanced.draw_arra",
        "ys_instanced.attribute_divisor.4_instances");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040447,
        "dEQP-GLES3.functional.instanced.draw_array",
        "s_instanced.attribute_divisor.20_instances");
