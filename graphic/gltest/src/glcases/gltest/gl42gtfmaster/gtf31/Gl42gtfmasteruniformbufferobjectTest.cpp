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
#include "../Gl42gtfmasterBaseFunc.h"
#include "../ActsGl42gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001416,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_arb_macro");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001417,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_basic_uniform_block_syntax");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001418,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_all_valid_basic_types");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001419,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_arrays_of_all_valid_basic_types");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001420,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_structures_of_all_valid_basic_types");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001421,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_named_uniform_block");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001422,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_two_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001423,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_two_named_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001424,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_repeated_element_name");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001425,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_repeated_uniform_qualifier");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001426,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_nested_structure_declaration");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001427,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_all_shader_languages");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001428,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_global_scope_layouts");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001429,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_uniform_block_layouts");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001430,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_member_layouts");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001431,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_uniform_block_arrays");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001432,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_non_constant_indexing");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001433,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_active_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001434,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_getuniformblockindex");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001435,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_getactiveuniformblockname");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001436,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_getactiveuniformblockiv");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001437,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_getuniformindices");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001438,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_getactiveuniformname");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001439,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_getactiveuniform");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001440,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_getactiveuniformsiv");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001441,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_uniform_block_binding");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001442,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_inherit_and_override_layouts");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001443,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_repeat_global_scope_layouts");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001444,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_bu"
    "ffer_object_different_definitions_of_the_same_block_name");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001445,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_member_names");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001446,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_scoping");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001447,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_storage_layouts");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001448,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_long_uniform_block_names");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001449,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_long_uniform_names");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001450,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buf"
    "fer_object_getactiveuniformblockname_for_small_name_buffer");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001451,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_get_uniform_name_for_small_name_buffer");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001452,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_not_whole_uniform_array_active");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001453,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_same_buffer_bound_to_2_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001454,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_arrays_binding");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001455,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_build_in_constants");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001456,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_implementation_dependent_limits");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001457,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_reset_assigned_binding_point_on_relink");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001458,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_max_number_of_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001459,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_max_uniform_block_size");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001460,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_sharing_between_programs");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001461,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_swapping_buffers");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001462,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_unused_uniforms_in_std140");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001463,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buf"
    "fer_object_accessing_info_for_block_with_an_instance_array");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001464,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_obje"
    "ct_accessing_info_for_uniforms_declared_in_block_with_an_instance");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001465,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_structure_and_array_element_names");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001466,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_arb_spec_example_for_std140");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001467,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_samplers_1");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001468,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_samplers_2");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001469,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_samplers_3");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001470,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_samplers_4");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001471,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_structure_declaration");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001472,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_nested_uniform_block");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001473,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_member_initializers");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001474,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_layouts_for_uniforms_outside_ub0");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001475,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_layouts_not_for_matrix_type");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001476,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buff"
    "er_object_qualifiers_shared_packed_std140_used_for_members");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001477,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_name_conflict");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001478,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_instance_name_conflict");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001479,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_member_name_conflict");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001480,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_illegal_uniform_block_array_indexing");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001481,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_array_size_matching");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001482,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_member_name_matching");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001483,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_member_type_matching");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001484,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_member_sequence_matching");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001485,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_member_array_size_matching");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001486,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_block_member_layout_matching");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001487,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_named_block_uniform_location");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001488,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_index_of_nonexsistent_block_name");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001489,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_index_of_not_active_block");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001490,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer"
    "_object_getactiveuniformblockname_for_nonexistent_block_index");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001491,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffe"
    "r_object_getactiveuniformblockiv_for_nonexistent_block_index");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001492,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_objec"
    "t_getuniformindices_for_for_nonexistent_or_not_active_uniform_names");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001493,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffe"
    "r_object_getactiveuniformname_for_nonexistent_uniform_index");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001494,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buf"
    "fer_object_getactiveuniform_for_nonexistent_uniform_index");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001495,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffe"
    "r_object_getactiveuniformsiv_for_nonexistent_uniform_indices");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001496,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_uniformbufferoffsetalignment");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001497,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_maxuniformbufferbindings_exceeded");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001498,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_max_number_of_uniform_blocks_exceeded");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001499,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_binding_invalid_uniformblockindex");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001500,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_binding_invalid_uniformblockbinding");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001501,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_invalid_program");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001502,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_invalid_uniformcount");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001503,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_invalid_bufsize");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001504,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_invalid_size");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001505,
    "GTF-GL42.gtf31.GL3Tests.uniform_buffer_object.uniform_buffer_object_invalid_pname");
