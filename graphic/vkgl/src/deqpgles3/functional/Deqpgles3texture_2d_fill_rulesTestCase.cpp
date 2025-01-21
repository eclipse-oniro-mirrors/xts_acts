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
#include "../ActsDeqpgles30040TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039820,
        "dEQP-GLES3.functional.rasterization.",
        "fbo.texture_2d.fill_rules.basic_quad");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039821,
        "dEQP-GLES3.functional.rasterization.fbo.",
        "texture_2d.fill_rules.basic_quad_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039822,
        "dEQP-GLES3.functional.rasterization.f",
        "bo.texture_2d.fill_rules.clipped_full");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039823,
        "dEQP-GLES3.functional.rasterization.fb",
        "o.texture_2d.fill_rules.clipped_partly");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039824,
        "dEQP-GLES3.functional.rasterization",
        ".fbo.texture_2d.fill_rules.projected");
