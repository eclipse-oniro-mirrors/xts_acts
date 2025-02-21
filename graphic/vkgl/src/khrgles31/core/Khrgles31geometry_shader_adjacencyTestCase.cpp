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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002407,
        "KHR-GLES31.core.geometry_shader.ad",
        "jacency.adjacency_non_indiced_lines");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002408,
        "KHR-GLES31.core.geometry_shader.",
        "adjacency.adjacency_indiced_lines");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002409,
        "KHR-GLES31.core.geometry_shader.adjac",
        "ency.adjacency_non_indiced_line_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002410,
        "KHR-GLES31.core.geometry_shader.adj",
        "acency.adjacency_indiced_line_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002411,
        "KHR-GLES31.core.geometry_shader.adja",
        "cency.adjacency_non_indiced_triangles");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002412,
        "KHR-GLES31.core.geometry_shader.ad",
        "jacency.adjacency_indiced_triangles");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002413,
        "KHR-GLES31.core.geometry_shader.adjacen",
        "cy.adjacency_non_indiced_triangle_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002414,
        "KHR-GLES31.core.geometry_shader.adjac",
        "ency.adjacency_indiced_triangle_strip");
