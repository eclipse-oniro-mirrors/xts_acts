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
#include "../Gl44masterBaseFunc.h"
#include "../ActsGl44master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008218,
    "KHR-GL44.geometry_shader.limits.max_uniform_components");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008219,
    "KHR-GL44.geometry_shader.limits.max_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008220,
    "KHR-GL44.geometry_shader.limits.max_input_components");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008221,
    "KHR-GL44.geometry_shader.limits.max_output_components");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008222,
    "KHR-GL44.geometry_shader.limits.max_output_vertices");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008223,
    "KHR-GL44.geometry_shader.limits.max_output_components_single_point");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008224,
    "KHR-GL44.geometry_shader.limits.max_texture_units");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008225,
    "KHR-GL44.geometry_shader.limits.max_invocations");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008226,
    "KHR-GL44.geometry_shader.limits.max_combined_texture_units");
