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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000099,
        "KHR-GLESEXT.geometry_shader.lin",
        "king.incomplete_program_objects");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000100,
        "KHR-GLESEXT.geometry_sha",
        "der.linking.incomplete_gs");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000101,
        "KHR-GLESEXT.geometry_shader.linki",
        "ng.invalid_arrayed_input_variables");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000102,
        "KHR-GLESEXT.geometry_shader.link",
        "ing.vs_gs_variable_type_mismatch");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000103,
        "KHR-GLESEXT.geometry_shader.linkin",
        "g.vs_gs_variable_qualifier_mismatch");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000104,
        "KHR-GLESEXT.geometry_shader.linking.",
        "vs_gs_arrayed_variable_size_mismatch");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000105,
        "KHR-GLESEXT.geometry_shader.l",
        "inking.fragcoord_redeclaration");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000106,
        "KHR-GLESEXT.geometry_shade",
        "r.linking.location_aliasing");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000107,
        "KHR-GLESEXT.geometry_shader.link",
        "ing.more_ACs_in_GS_than_supported");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000108,
        "KHR-GLESEXT.geometry_shader.linki",
        "ng.more_ACBs_in_GS_than_supported");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000109,
        "KHR-GLESEXT.geometry_shader.linkin",
        "g.geometry_shader_compilation_fail");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000110,
        "KHR-GLESEXT.geometry_shader.linking.mo",
        "re_input_vertices_in_GS_than_available");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000111,
        "KHR-GLESEXT.geometry_shader.linking",
        ".tf_capture_from_gs_and_vs_variables");
