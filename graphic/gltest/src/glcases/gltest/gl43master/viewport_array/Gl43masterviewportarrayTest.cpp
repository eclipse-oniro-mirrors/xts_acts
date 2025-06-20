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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005383,
    "KHR-GL43.viewport_array.api_errors");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005384,
    "KHR-GL43.viewport_array.queries");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005385,
    "KHR-GL43.viewport_array.viewport_api");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005386,
    "KHR-GL43.viewport_array.scissor_api");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005387,
    "KHR-GL43.viewport_array.depth_range_api");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005388,
    "KHR-GL43.viewport_array.scissor_test_state_api");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005389,
    "KHR-GL43.viewport_array.draw_to_single_layer_with_multiple_viewports");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005390,
    "KHR-GL43.viewport_array.dynamic_viewport_index");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005391,
    "KHR-GL43.viewport_array.draw_mulitple_viewports_with_single_invocation");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005392,
    "KHR-GL43.viewport_array.viewport_index_subroutine");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005393,
    "KHR-GL43.viewport_array.draw_multiple_layers");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005394,
    "KHR-GL43.viewport_array.scissor");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005395,
    "KHR-GL43.viewport_array.scissor_zero_dimension");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005396,
    "KHR-GL43.viewport_array.scissor_clear");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005397,
    "KHR-GL43.viewport_array.depth_range");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005398,
    "KHR-GL43.viewport_array.depth_range_depth_test");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005399,
    "KHR-GL43.viewport_array.provoking_vertex");
