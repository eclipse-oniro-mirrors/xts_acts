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

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008227,
    "KHR-GL44.geometry_shader.linking.incomplete_program_objects");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008228,
    "KHR-GL44.geometry_shader.linking.incomplete_gs");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008229,
    "KHR-GL44.geometry_shader.linking.invalid_arrayed_input_variables");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008230,
    "KHR-GL44.geometry_shader.linking.vs_gs_variable_type_mismatch");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008231,
    "KHR-GL44.geometry_shader.linking.vs_gs_variable_qualifier_mismatch");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008232,
    "KHR-GL44.geometry_shader.linking.vs_gs_arrayed_variable_size_mismatch");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008233,
    "KHR-GL44.geometry_shader.linking.fragcoord_redeclaration");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008234,
    "KHR-GL44.geometry_shader.linking.location_aliasing");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008235,
    "KHR-GL44.geometry_shader.linking.more_ACs_in_GS_than_supported");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008236,
    "KHR-GL44.geometry_shader.linking.more_ACBs_in_GS_than_supported");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008237,
    "KHR-GL44.geometry_shader.linking.geometry_shader_compilation_fail");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008238,
    "KHR-GL44.geometry_shader.linking.more_input_vertices_in_GS_than_available");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008239,
    "KHR-GL44.geometry_shader.linking.tf_capture_from_gs_and_vs_variables");
