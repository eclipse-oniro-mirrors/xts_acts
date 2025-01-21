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
#include "../ActsDeqpgles30045TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044060,
        "dEQP-GLES3.functional.draw.draw_rang",
        "e_elements.triangles.single_attribute");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044061,
        "dEQP-GLES3.functional.draw.draw_range_",
        "elements.triangles.multiple_attributes");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044062,
        "dEQP-GLES3.functional.draw.draw_range_",
        "elements.triangles.instanced_attributes");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044063,
        "dEQP-GLES3.functional.draw.draw_range",
        "_elements.triangles.default_attribute");
