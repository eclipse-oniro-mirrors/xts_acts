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

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008316,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.tc_non_arrayed_per_vertex_input_blocks");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008317,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.tc_non_arrayed_per_vertex_input_variables");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008318,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.tc_non_arrayed_per_vertex_output_blocks");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008319,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.tc_non_arrayed_per_vertex_output_variabless");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008320,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.te_non_arrayed_per_vertex_input_blocks");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008321,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.te_non_arrayed_per_vertex_input_variables");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008322,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.tc_invalid_array_size_used_for_input_blocks");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008323,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.tc_invalid_array_size_used_for_input_variables");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008324,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.te_invalid_array_size_used_for_input_blocks");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008325,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.te_invalid_array_size_used_for_input_variables");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008326,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.tc_invalid_output_patch_vertex_count");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008327,
    "KHR-GL44.tessellation_shader.compilation_and_linking_error"
    "s.tc_invalid_write_operation_at_non_gl_invocation_id_index");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008328,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.tc_invalid_input_per_patch_attribute_definition");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008329,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.te_invalid_output_per_patch_attribute_definition");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008330,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.tc_non_matching_variable_declarations");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008331,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.te_lacking_primitive_mode_declaration");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008332,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.te_accessing_glTessCoord_as_array");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008333,
    "KHR-GL44.tessellation_shader.compilation_and_linking_errors.te_accessing_glTessCoord_as_gl_in_member");
