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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014791,
        "dEQP-GLES31.functional.texture.border_clamp.dept",
        "h_compare_mode.depth_component24.nearest_size_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014792,
        "dEQP-GLES31.functional.texture.border_clamp.depth",
        "_compare_mode.depth_component24.nearest_size_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014793,
        "dEQP-GLES31.functional.texture.border_clamp.dept",
        "h_compare_mode.depth_component24.linear_size_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014794,
        "dEQP-GLES31.functional.texture.border_clamp.dept",
        "h_compare_mode.depth_component24.linear_size_npot");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014795,
        "dEQP-GLES31.functional.texture.border_clamp.dept",
        "h_compare_mode.depth_component24.gather_size_pot");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014796,
        "dEQP-GLES31.functional.texture.border_clamp.dept",
        "h_compare_mode.depth_component24.gather_size_npot");
