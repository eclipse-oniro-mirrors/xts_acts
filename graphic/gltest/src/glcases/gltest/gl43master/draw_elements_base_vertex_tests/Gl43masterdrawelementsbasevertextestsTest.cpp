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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004470,
    "KHR-GL43.draw_elements_base_vertex_tests.basevertex_behavior1");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004471,
    "KHR-GL43.draw_elements_base_vertex_tests.basevertex_behavior2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004472,
    "KHR-GL43.draw_elements_base_vertex_tests.AEP_shader_stages");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004473,
    "KHR-GL43.draw_elements_base_vertex_tests.underflow");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004474,
    "KHR-GL43.draw_elements_base_vertex_tests.overflow");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004475,
    "KHR-GL43.draw_elements_base_vertex_tests.valid_active_tf");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004476,
    "KHR-GL43.draw_elements_base_vertex_tests.invalid_count_argument");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004477,
    "KHR-GL43.draw_elements_base_vertex_tests.invalid_instancecount_argument");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004478,
    "KHR-GL43.draw_elements_base_vertex_tests.invalid_mode_argument");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004479,
    "KHR-GL43.draw_elements_base_vertex_tests.invalid_primcount_argument");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004480,
    "KHR-GL43.draw_elements_base_vertex_tests.invalid_start_end_arguments");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004481,
    "KHR-GL43.draw_elements_base_vertex_tests.invalid_type_argument");
