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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002505,
        "KHR-GLES31.core.geometry_shader.l",
        "inking.incomplete_program_objects");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002506,
        "KHR-GLES31.core.geometry_s",
        "hader.linking.incomplete_gs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002507,
        "KHR-GLES31.core.geometry_shader.lin",
        "king.invalid_arrayed_input_variables");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002508,
        "KHR-GLES31.core.geometry_shader.li",
        "nking.vs_gs_variable_type_mismatch");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002509,
        "KHR-GLES31.core.geometry_shader.link",
        "ing.vs_gs_variable_qualifier_mismatch");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002510,
        "KHR-GLES31.core.geometry_shader.linkin",
        "g.vs_gs_arrayed_variable_size_mismatch");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002511,
        "KHR-GLES31.core.geometry_shader",
        ".linking.fragcoord_redeclaration");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002512,
        "KHR-GLES31.core.geometry_sha",
        "der.linking.location_aliasing");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002513,
        "KHR-GLES31.core.geometry_shader.li",
        "nking.more_ACs_in_GS_than_supported");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002514,
        "KHR-GLES31.core.geometry_shader.lin",
        "king.more_ACBs_in_GS_than_supported");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002515,
        "KHR-GLES31.core.geometry_shader.link",
        "ing.geometry_shader_compilation_fail");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002516,
        "KHR-GLES31.core.geometry_shader.linking.",
        "more_input_vertices_in_GS_than_available");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002517,
        "KHR-GLES31.core.geometry_shader.linki",
        "ng.tf_capture_from_gs_and_vs_variables");
