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
#include "../KhrglesextBaseFunc.h"
#include "../ActsKhrglesext0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000302,
        "KHR-GLESEXT.viewpo",
        "rt_array.api_errors");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000303,
        "KHR-GLESEXT.viewp",
        "ort_array.queries");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000304,
        "KHR-GLESEXT.viewpor",
        "t_array.viewport_api");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000305,
        "KHR-GLESEXT.viewpor",
        "t_array.scissor_api");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000306,
        "KHR-GLESEXT.viewport_",
        "array.depth_range_api");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000307,
        "KHR-GLESEXT.viewport_arr",
        "ay.scissor_test_state_api");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000308,
        "KHR-GLESEXT.viewport_array.draw_to_",
        "single_layer_with_multiple_viewports");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000309,
        "KHR-GLESEXT.viewport_arr",
        "ay.dynamic_viewport_index");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000310,
        "KHR-GLESEXT.viewport_array.draw_muli",
        "tple_viewports_with_single_invocation");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000311,
        "KHR-GLESEXT.viewport_array",
        ".viewport_index_subroutine");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000312,
        "KHR-GLESEXT.viewport_ar",
        "ray.draw_multiple_layers");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000313,
        "KHR-GLESEXT.viewp",
        "ort_array.scissor");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000314,
        "KHR-GLESEXT.viewport_arr",
        "ay.scissor_zero_dimension");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000315,
        "KHR-GLESEXT.viewport",
        "_array.scissor_clear");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000316,
        "KHR-GLESEXT.viewpor",
        "t_array.depth_range");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000317,
        "KHR-GLESEXT.viewport_arr",
        "ay.depth_range_depth_test");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000318,
        "KHR-GLESEXT.viewport_",
        "array.provoking_vertex");
