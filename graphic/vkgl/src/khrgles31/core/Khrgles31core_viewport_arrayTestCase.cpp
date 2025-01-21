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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002702,
        "KHR-GLES31.core.view",
        "port_array.api_errors");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002703,
        "KHR-GLES31.core.vie",
        "wport_array.queries");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002704,
        "KHR-GLES31.core.viewp",
        "ort_array.viewport_api");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002705,
        "KHR-GLES31.core.viewp",
        "ort_array.scissor_api");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002706,
        "KHR-GLES31.core.viewpor",
        "t_array.depth_range_api");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002707,
        "KHR-GLES31.core.viewport_a",
        "rray.scissor_test_state_api");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002708,
        "KHR-GLES31.core.viewport_array.draw_t",
        "o_single_layer_with_multiple_viewports");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002709,
        "KHR-GLES31.core.viewport_a",
        "rray.dynamic_viewport_index");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002710,
        "KHR-GLES31.core.viewport_array.draw_mu",
        "litple_viewports_with_single_invocation");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002711,
        "KHR-GLES31.core.viewport_arr",
        "ay.viewport_index_subroutine");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002712,
        "KHR-GLES31.core.viewport_",
        "array.draw_multiple_layers");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002713,
        "KHR-GLES31.core.vie",
        "wport_array.scissor");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002714,
        "KHR-GLES31.core.viewport_a",
        "rray.scissor_zero_dimension");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002715,
        "KHR-GLES31.core.viewpo",
        "rt_array.scissor_clear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002716,
        "KHR-GLES31.core.viewp",
        "ort_array.depth_range");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002717,
        "KHR-GLES31.core.viewport_a",
        "rray.depth_range_depth_test");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002718,
        "KHR-GLES31.core.viewpor",
        "t_array.provoking_vertex");
