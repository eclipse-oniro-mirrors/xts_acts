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

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044013,
        "dEQP-GLES3.functional.draw.draw_arrays",
        "_instanced.line_strip.single_attribute");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044014,
        "dEQP-GLES3.functional.draw.draw_arrays_",
        "instanced.line_strip.multiple_attributes");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044015,
        "dEQP-GLES3.functional.draw.draw_arrays_i",
        "nstanced.line_strip.instanced_attributes");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044016,
        "dEQP-GLES3.functional.draw.draw_arrays",
        "_instanced.line_strip.default_attribute");