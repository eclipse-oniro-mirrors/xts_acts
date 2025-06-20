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

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008129,
    "KHR-GL44.geometry_shader.adjacency.adjacency_non_indiced_lines");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008130,
    "KHR-GL44.geometry_shader.adjacency.adjacency_indiced_lines");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008131,
    "KHR-GL44.geometry_shader.adjacency.adjacency_non_indiced_line_strip");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008132,
    "KHR-GL44.geometry_shader.adjacency.adjacency_indiced_line_strip");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008133,
    "KHR-GL44.geometry_shader.adjacency.adjacency_non_indiced_triangles");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008134,
    "KHR-GL44.geometry_shader.adjacency.adjacency_indiced_triangles");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008135,
    "KHR-GL44.geometry_shader.adjacency.adjacency_non_indiced_triangle_strip");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008136,
    "KHR-GL44.geometry_shader.adjacency.adjacency_indiced_triangle_strip");
