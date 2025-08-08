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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000187,
        "KHR-GLESEXT.tessellation_shader.compilation_and_li",
        "nking_errors.tc_non_arrayed_per_vertex_input_blocks");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000188,
        "KHR-GLESEXT.tessellation_shader.compilation_and_link",
        "ing_errors.tc_non_arrayed_per_vertex_input_variables");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000189,
        "KHR-GLESEXT.tessellation_shader.compilation_and_lin",
        "king_errors.tc_non_arrayed_per_vertex_output_blocks");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000190,
        "KHR-GLESEXT.tessellation_shader.compilation_and_linki",
        "ng_errors.tc_non_arrayed_per_vertex_output_variabless");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000191,
        "KHR-GLESEXT.tessellation_shader.compilation_and_li",
        "nking_errors.te_non_arrayed_per_vertex_input_blocks");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000192,
        "KHR-GLESEXT.tessellation_shader.compilation_and_link",
        "ing_errors.te_non_arrayed_per_vertex_input_variables");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000193,
        "KHR-GLESEXT.tessellation_shader.compilation_and_linki",
        "ng_errors.tc_invalid_array_size_used_for_input_blocks");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000194,
        "KHR-GLESEXT.tessellation_shader.compilation_and_linkin",
        "g_errors.tc_invalid_array_size_used_for_input_variables");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000195,
        "KHR-GLESEXT.tessellation_shader.compilation_and_linki",
        "ng_errors.te_invalid_array_size_used_for_input_blocks");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000196,
        "KHR-GLESEXT.tessellation_shader.compilation_and_linkin",
        "g_errors.te_invalid_array_size_used_for_input_variables");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000197,
        "KHR-GLESEXT.tessellation_shader.compilation_and_l",
        "inking_errors.tc_invalid_output_patch_vertex_count");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000198,
        "KHR-GLESEXT.tessellation_shader.compilation_and_linking_err",
        "ors.tc_invalid_write_operation_at_non_gl_invocation_id_index");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000199,
        "KHR-GLESEXT.tessellation_shader.compilation_and_linking",
        "_errors.tc_invalid_input_per_patch_attribute_definition");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000200,
        "KHR-GLESEXT.tessellation_shader.compilation_and_linking",
        "_errors.te_invalid_output_per_patch_attribute_definition");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000201,
        "KHR-GLESEXT.tessellation_shader.compilation_and_li",
        "nking_errors.tc_non_matching_variable_declarations");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000202,
        "KHR-GLESEXT.tessellation_shader.compilation_and_li",
        "nking_errors.te_lacking_primitive_mode_declaration");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000203,
        "KHR-GLESEXT.tessellation_shader.compilation_and_",
        "linking_errors.te_accessing_glTessCoord_as_array");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000204,
        "KHR-GLESEXT.tessellation_shader.compilation_and_lin",
        "king_errors.te_accessing_glTessCoord_as_gl_in_member");
