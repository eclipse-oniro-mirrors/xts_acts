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
#include "../Gl46masterBaseFunc.h"
#include "../ActsGl46master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008856,
    "KHR-GL46.limits.max_clip_distances");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008857,
    "KHR-GL46.limits.max_cull_distances");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008858,
    "KHR-GL46.limits.max_combined_clip_and_cull_distances");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008859,
    "KHR-GL46.limits.max_3d_texture_size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008860,
    "KHR-GL46.limits.max_texture_size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008861,
    "KHR-GL46.limits.max_array_texture_layers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008862,
    "KHR-GL46.limits.max_cube_map_texture_size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008863,
    "KHR-GL46.limits.max_renderbuffer_size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008864,
    "KHR-GL46.limits.max_viewports");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008865,
    "KHR-GL46.limits.max_elements_indices");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008866,
    "KHR-GL46.limits.max_elements_vertices");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008867,
    "KHR-GL46.limits.max_vertex_attrib_relative_offset");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008868,
    "KHR-GL46.limits.max_vertex_attrib_bindings");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008869,
    "KHR-GL46.limits.max_vertex_attrib_stride");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008870,
    "KHR-GL46.limits.max_texture_buffer_size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008871,
    "KHR-GL46.limits.max_rectangle_texture_size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008872,
    "KHR-GL46.limits.min_map_buffer_alignment");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008873,
    "KHR-GL46.limits.max_vertex_attribs");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008874,
    "KHR-GL46.limits.max_vertex_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008875,
    "KHR-GL46.limits.max_vertex_uniform_vectors");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008876,
    "KHR-GL46.limits.max_vertex_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008877,
    "KHR-GL46.limits.max_vertex_output_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008878,
    "KHR-GL46.limits.max_vertex_texture_image_units");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008879,
    "KHR-GL46.limits.max_vertex_atomic_counter_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008880,
    "KHR-GL46.limits.max_vertex_atomic_counters");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008881,
    "KHR-GL46.limits.max_vertex_shader_storage_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008882,
    "KHR-GL46.limits.max_tess_gen_level");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008883,
    "KHR-GL46.limits.max_patch_vertices");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008884,
    "KHR-GL46.limits.max_tess_control_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008885,
    "KHR-GL46.limits.max_tess_control_texture_image_units");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008886,
    "KHR-GL46.limits.max_tess_control_output_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008887,
    "KHR-GL46.limits.max_tess_patch_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008888,
    "KHR-GL46.limits.max_tess_control_total_output_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008889,
    "KHR-GL46.limits.max_tess_control_input_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008890,
    "KHR-GL46.limits.max_tess_control_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008891,
    "KHR-GL46.limits.max_tess_control_atomic_counter_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008892,
    "KHR-GL46.limits.max_tess_control_atomic_counters");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008893,
    "KHR-GL46.limits.max_tess_control_shader_storage_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008894,
    "KHR-GL46.limits.max_tess_evaluation_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008895,
    "KHR-GL46.limits.max_tess_evaluation_texture_image_units");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008896,
    "KHR-GL46.limits.max_tess_evaluation_output_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008897,
    "KHR-GL46.limits.max_tess_evaluation_input_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008898,
    "KHR-GL46.limits.max_tess_evaluation_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008899,
    "KHR-GL46.limits.max_tess_evaluation_atomic_counter_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008900,
    "KHR-GL46.limits.max_tess_evaluation_atomic_counters");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008901,
    "KHR-GL46.limits.max_tess_evaluation_shader_storage_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008902,
    "KHR-GL46.limits.max_geometry_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008903,
    "KHR-GL46.limits.max_geometry_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008904,
    "KHR-GL46.limits.max_geometry_input_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008905,
    "KHR-GL46.limits.max_geometry_output_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008906,
    "KHR-GL46.limits.max_geometry_output_vertices");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008907,
    "KHR-GL46.limits.max_geometry_total_output_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008908,
    "KHR-GL46.limits.max_geometry_texture_image_units");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008909,
    "KHR-GL46.limits.max_geometry_shader_invocations");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008910,
    "KHR-GL46.limits.max_vertex_streams");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008911,
    "KHR-GL46.limits.max_geometry_atomic_counter_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008912,
    "KHR-GL46.limits.max_geometry_atomic_counters");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008913,
    "KHR-GL46.limits.max_geometry_shader_storage_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008914,
    "KHR-GL46.limits.max_fragment_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008915,
    "KHR-GL46.limits.max_fragment_uniform_vectors");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008916,
    "KHR-GL46.limits.max_fragment_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008917,
    "KHR-GL46.limits.max_fragment_input_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008918,
    "KHR-GL46.limits.max_texture_image_units");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008919,
    "KHR-GL46.limits.min_program_texture_gather_offset");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008920,
    "KHR-GL46.limits.max_program_texture_gather_offset");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008921,
    "KHR-GL46.limits.max_fragment_atomic_counter_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008922,
    "KHR-GL46.limits.max_fragment_atomic_counters");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008923,
    "KHR-GL46.limits.max_fragment_shader_storage_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008924,
    "KHR-GL46.limits.max_compute_work_group_invocations");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008925,
    "KHR-GL46.limits.max_compute_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008926,
    "KHR-GL46.limits.max_compute_texture_image_units");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008927,
    "KHR-GL46.limits.max_compute_atomic_counter_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008928,
    "KHR-GL46.limits.max_compute_atomic_counters");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008929,
    "KHR-GL46.limits.max_compute_shared_memory_size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008930,
    "KHR-GL46.limits.max_compute_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008931,
    "KHR-GL46.limits.max_compute_image_uniforms");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008932,
    "KHR-GL46.limits.max_combined_compute_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008933,
    "KHR-GL46.limits.max_compute_shader_storage_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008934,
    "KHR-GL46.limits.min_program_texel_offset");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008935,
    "KHR-GL46.limits.max_program_texel_offset");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008936,
    "KHR-GL46.limits.max_uniform_buffer_bindings");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008937,
    "KHR-GL46.limits.max_uniform_block_size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008938,
    "KHR-GL46.limits.max_combined_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008939,
    "KHR-GL46.limits.max_varying_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008940,
    "KHR-GL46.limits.max_varying_vectors");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008941,
    "KHR-GL46.limits.max_combined_texture_image_units");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008942,
    "KHR-GL46.limits.max_subroutines");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008943,
    "KHR-GL46.limits.max_subroutine_uniform_locations");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008944,
    "KHR-GL46.limits.max_uniform_locations");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008945,
    "KHR-GL46.limits.max_atomic_counter_buffer_bindings");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008946,
    "KHR-GL46.limits.max_atomic_counter_buffer_size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008947,
    "KHR-GL46.limits.max_combined_atomic_counter_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008948,
    "KHR-GL46.limits.max_combined_atomic_counters");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008949,
    "KHR-GL46.limits.max_shader_storage_buffer_bindings");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008950,
    "KHR-GL46.limits.max_combined_shader_storage_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008951,
    "KHR-GL46.limits.max_image_units");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008952,
    "KHR-GL46.limits.max_combined_shader_output_resources");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008953,
    "KHR-GL46.limits.max_image_samples");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008954,
    "KHR-GL46.limits.max_vertex_image_uniforms");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008955,
    "KHR-GL46.limits.max_tess_control_image_uniforms");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008956,
    "KHR-GL46.limits.max_tess_evaluation_image_uniforms");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008957,
    "KHR-GL46.limits.max_geometry_image_uniforms");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008958,
    "KHR-GL46.limits.max_fragment_image_uniforms");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008959,
    "KHR-GL46.limits.max_combined_image_uniforms");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008960,
    "KHR-GL46.limits.max_combined_vertex_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008961,
    "KHR-GL46.limits.max_combined_geometry_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008962,
    "KHR-GL46.limits.max_combined_tess_control_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008963,
    "KHR-GL46.limits.max_combined_tess_evaluation_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008964,
    "KHR-GL46.limits.max_combined_fragment_uniform_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008965,
    "KHR-GL46.limits.max_debug_message_length");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008966,
    "KHR-GL46.limits.max_debug_logged_messages");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008967,
    "KHR-GL46.limits.max_debug_group_stack_depth");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008968,
    "KHR-GL46.limits.max_label_length");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008969,
    "KHR-GL46.limits.max_framebuffer_width");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008970,
    "KHR-GL46.limits.max_framebuffer_height");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008971,
    "KHR-GL46.limits.max_framebuffer_layers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008972,
    "KHR-GL46.limits.max_framebuffer_samples");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008973,
    "KHR-GL46.limits.max_sample_mask_words");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008974,
    "KHR-GL46.limits.max_samples");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008975,
    "KHR-GL46.limits.max_color_texture_samples");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008976,
    "KHR-GL46.limits.max_depth_texture_samples");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008977,
    "KHR-GL46.limits.max_integer_samples");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008978,
    "KHR-GL46.limits.max_draw_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008979,
    "KHR-GL46.limits.max_dual_source_draw_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008980,
    "KHR-GL46.limits.max_color_attachments");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008981,
    "KHR-GL46.limits.max_transform_feedback_interleaved_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008982,
    "KHR-GL46.limits.max_transform_feedback_separate_attribs");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008983,
    "KHR-GL46.limits.max_transform_feedback_separate_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008984,
    "KHR-GL46.limits.max_transform_feedback_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008985,
    "KHR-GL46.limits.max_atomic_counter_bindings");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008986,
    "KHR-GL46.limits.max_combined_image_units_and_fragment_outputs");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008987,
    "KHR-GL46.limits.max_geometry_varying_components");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008988,
    "KHR-GL46.limits.max_shader_storage_block_size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008989,
    "KHR-GL46.limits.max_element_index");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008990,
    "KHR-GL46.limits.max_server_wait_timeout");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008991,
    "KHR-GL46.limits.max_texture_lod_bias");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008992,
    "KHR-GL46.limits.min_fragment_interpolation_offset");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008993,
    "KHR-GL46.limits.max_fragment_interpolation_offset");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008994,
    "KHR-GL46.limits.max_compute_work_group_count");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008995,
    "KHR-GL46.limits.max_compute_work_group_size");
