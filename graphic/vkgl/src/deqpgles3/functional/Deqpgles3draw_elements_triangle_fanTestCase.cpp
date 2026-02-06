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
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043970,
        "dEQP-GLES3.functional.draw.draw_ele",
        "ments.triangle_fan.single_attribute");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043971,
        "dEQP-GLES3.functional.draw.draw_elem",
        "ents.triangle_fan.multiple_attributes");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043972,
        "dEQP-GLES3.functional.draw.draw_eleme",
        "nts.triangle_fan.instanced_attributes");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043973,
        "dEQP-GLES3.functional.draw.draw_ele",
        "ments.triangle_fan.default_attribute");
