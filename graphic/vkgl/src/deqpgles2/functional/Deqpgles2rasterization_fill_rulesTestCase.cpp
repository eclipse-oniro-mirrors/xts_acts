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
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013885,
        "dEQP-GLES2.functional.raster",
        "ization.fill_rules.basic_quad");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013886,
        "dEQP-GLES2.functional.rasterizat",
        "ion.fill_rules.basic_quad_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013887,
        "dEQP-GLES2.functional.rasteri",
        "zation.fill_rules.clipped_full");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013888,
        "dEQP-GLES2.functional.rasteriz",
        "ation.fill_rules.clipped_partly");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013889,
        "dEQP-GLES2.functional.raster",
        "ization.fill_rules.projected");
