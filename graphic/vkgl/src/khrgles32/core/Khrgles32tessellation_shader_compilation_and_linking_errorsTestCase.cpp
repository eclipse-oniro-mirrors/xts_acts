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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000215,
        "KHR-GLES32.core.tessellation_shader.compilation_and_",
        "linking_errors.tc_non_arrayed_per_vertex_input_blocks");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000216,
        "KHR-GLES32.core.tessellation_shader.compilation_and_li",
        "nking_errors.tc_non_arrayed_per_vertex_input_variables");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000217,
        "KHR-GLES32.core.tessellation_shader.compilation_and_l",
        "inking_errors.tc_non_arrayed_per_vertex_output_blocks");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000218,
        "KHR-GLES32.core.tessellation_shader.compilation_and_lin",
        "king_errors.tc_non_arrayed_per_vertex_output_variabless");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000219,
        "KHR-GLES32.core.tessellation_shader.compilation_and_",
        "linking_errors.te_non_arrayed_per_vertex_input_blocks");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000220,
        "KHR-GLES32.core.tessellation_shader.compilation_and_li",
        "nking_errors.te_non_arrayed_per_vertex_input_variables");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000221,
        "KHR-GLES32.core.tessellation_shader.compilation_and_lin",
        "king_errors.tc_invalid_array_size_used_for_input_blocks");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000222,
        "KHR-GLES32.core.tessellation_shader.compilation_and_link",
        "ing_errors.tc_invalid_array_size_used_for_input_variables");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000223,
        "KHR-GLES32.core.tessellation_shader.compilation_and_lin",
        "king_errors.te_invalid_array_size_used_for_input_blocks");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000224,
        "KHR-GLES32.core.tessellation_shader.compilation_and_link",
        "ing_errors.te_invalid_array_size_used_for_input_variables");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000225,
        "KHR-GLES32.core.tessellation_shader.compilation_and",
        "_linking_errors.tc_invalid_output_patch_vertex_count");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000226,
        "KHR-GLES32.core.tessellation_shader.compilation_and_linking_e",
        "rrors.tc_invalid_write_operation_at_non_gl_invocation_id_index");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000227,
        "KHR-GLES32.core.tessellation_shader.compilation_and_linki",
        "ng_errors.tc_invalid_input_per_patch_attribute_definition");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000228,
        "KHR-GLES32.core.tessellation_shader.compilation_and_linki",
        "ng_errors.te_invalid_output_per_patch_attribute_definition");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000229,
        "KHR-GLES32.core.tessellation_shader.compilation_and_",
        "linking_errors.tc_non_matching_variable_declarations");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000230,
        "KHR-GLES32.core.tessellation_shader.compilation_and_",
        "linking_errors.te_lacking_primitive_mode_declaration");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000231,
        "KHR-GLES32.core.tessellation_shader.compilation_an",
        "d_linking_errors.te_accessing_glTessCoord_as_array");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000232,
        "KHR-GLES32.core.tessellation_shader.compilation_and_l",
        "inking_errors.te_accessing_glTessCoord_as_gl_in_member");
