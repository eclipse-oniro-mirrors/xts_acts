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
#include "../Gl45masterBaseFunc.h"
#include "../ActsGl45master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008436,
    "KHR-GL45.direct_state_access.xfb_creation");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008437,
    "KHR-GL45.direct_state_access.xfb_defaults");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008438,
    "KHR-GL45.direct_state_access.xfb_buffers");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008439,
    "KHR-GL45.direct_state_access.xfb_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008440,
    "KHR-GL45.direct_state_access.xfb_functional");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008441,
    "KHR-GL45.direct_state_access.samplers_creation");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008442,
    "KHR-GL45.direct_state_access.samplers_defaults");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008443,
    "KHR-GL45.direct_state_access.samplers_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008444,
    "KHR-GL45.direct_state_access.samplers_functional");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008445,
    "KHR-GL45.direct_state_access.program_pipelines_creation");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008446,
    "KHR-GL45.direct_state_access.program_pipelines_defaults");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008447,
    "KHR-GL45.direct_state_access.program_pipelines_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008448,
    "KHR-GL45.direct_state_access.program_pipelines_functional");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008449,
    "KHR-GL45.direct_state_access.queries_creation");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008450,
    "KHR-GL45.direct_state_access.queries_defaults");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008451,
    "KHR-GL45.direct_state_access.queries_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008452,
    "KHR-GL45.direct_state_access.queries_functional");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008453,
    "KHR-GL45.direct_state_access.queries_reuse");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008454,
    "KHR-GL45.direct_state_access.buffers_creation");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008455,
    "KHR-GL45.direct_state_access.buffers_data");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008456,
    "KHR-GL45.direct_state_access.buffers_clear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008457,
    "KHR-GL45.direct_state_access.buffers_map_read_only");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008458,
    "KHR-GL45.direct_state_access.buffers_map_read_write");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008459,
    "KHR-GL45.direct_state_access.buffers_map_write_only");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008460,
    "KHR-GL45.direct_state_access.buffers_map_range_read_bit");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008461,
    "KHR-GL45.direct_state_access.buffers_map_range_write_bit");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008462,
    "KHR-GL45.direct_state_access.buffers_get_named_buffer_subdata");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008463,
    "KHR-GL45.direct_state_access.buffers_defaults");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008464,
    "KHR-GL45.direct_state_access.buffers_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008465,
    "KHR-GL45.direct_state_access.buffers_functional");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008466,
    "KHR-GL45.direct_state_access.framebuffers_creation");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008467,
    "KHR-GL45.direct_state_access.framebuffers_renderbuffer_attachment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008468,
    "KHR-GL45.direct_state_access.framebuffers_texture_attachment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008469,
    "KHR-GL45.direct_state_access.framebuffers_texture_layer_attachment");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008470,
    "KHR-GL45.direct_state_access.framebuffers_read_draw_buffer");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008471,
    "KHR-GL45.direct_state_access.framebuffers_draw_buffers");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008472,
    "KHR-GL45.direct_state_access.framebuffers_invalidate_data");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008473,
    "KHR-GL45.direct_state_access.framebuffers_invalidate_subdata");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008474,
    "KHR-GL45.direct_state_access.framebuffers_clear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008475,
    "KHR-GL45.direct_state_access.framebuffers_blit");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008476,
    "KHR-GL45.direct_state_access.framebuffers_check_status");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008477,
    "KHR-GL45.direct_state_access.framebuffers_get_parameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008478,
    "KHR-GL45.direct_state_access.framebuffers_get_attachment_parameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008479,
    "KHR-GL45.direct_state_access.framebuffers_creation_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008480,
    "KHR-GL45.direct_state_access.framebuffers_renderbuffer_attachment_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008481,
    "KHR-GL45.direct_state_access.framebuffers_texture_attachment_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008482,
    "KHR-GL45.direct_state_access.framebuffers_draw_read_buffers_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008483,
    "KHR-GL45.direct_state_access.invalidate_data_and_subdata_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008484,
    "KHR-GL45.direct_state_access.framebuffers_clear_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008485,
    "KHR-GL45.direct_state_access.framebuffers_check_status_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008486,
    "KHR-GL45.direct_state_access.framebuffers_get_parameter_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008487,
    "KHR-GL45.direct_state_access.framebuffers_get_attachment_parameter_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008488,
    "KHR-GL45.direct_state_access.framebuffers_renderbuffers_functional");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008489,
    "KHR-GL45.direct_state_access.renderbuffers_creation");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008490,
    "KHR-GL45.direct_state_access.renderbuffers_storage");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008491,
    "KHR-GL45.direct_state_access.renderbuffers_storage_multisample");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008492,
    "KHR-GL45.direct_state_access.renderbuffers_get_parameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008493,
    "KHR-GL45.direct_state_access.renderbuffers_creation_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008494,
    "KHR-GL45.direct_state_access.renderbuffers_storage_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008495,
    "KHR-GL45.direct_state_access.renderbuffers_storage_multisample_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008496,
    "KHR-GL45.direct_state_access.renderbuffers_get_parameters_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008497,
    "KHR-GL45.direct_state_access.vertex_arrays_creation");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008498,
    "KHR-GL45.direct_state_access.vertex_arrays_enable_disable_attributes");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008499,
    "KHR-GL45.direct_state_access.vertex_arrays_element_buffer");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008500,
    "KHR-GL45.direct_state_access.vertex_arrays_vertex_buffers");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008501,
    "KHR-GL45.direct_state_access.vertex_arrays_attribute_format");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008502,
    "KHR-GL45.direct_state_access.vertex_arrays_attribute_binding");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008503,
    "KHR-GL45.direct_state_access.vertex_arrays_attribute_binding_divisor");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008504,
    "KHR-GL45.direct_state_access.vertex_arrays_get_vertex_array");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008505,
    "KHR-GL45.direct_state_access.vertex_arrays_get_vertex_array_indexed");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008506,
    "KHR-GL45.direct_state_access.vertex_arrays_defaults");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008507,
    "KHR-GL45.direct_state_access.vertex_arrays_creation_error");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008508,
    "KHR-GL45.direct_state_access.vertex_arrays_enable_disable_attribute_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008509,
    "KHR-GL45.direct_state_access.vertex_arrays_element_buffer_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008510,
    "KHR-GL45.direct_state_access.vertex_arrays_vertex_buffers_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008511,
    "KHR-GL45.direct_state_access.vertex_arrays_attribute_format_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008512,
    "KHR-GL45.direct_state_access.vertex_arrays_attribute_binding_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008513,
    "KHR-GL45.direct_state_access.vertex_arrays_attribute_binding_divisor_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008514,
    "KHR-GL45.direct_state_access.vertex_arrays_get_vertex_array_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008515,
    "KHR-GL45.direct_state_access.vertex_arrays_get_vertex_array_indexed_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008516,
    "KHR-GL45.direct_state_access.textures_creation");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008517,
    "KHR-GL45.direct_state_access.textures_buffer_r8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008518,
    "KHR-GL45.direct_state_access.textures_buffer_rg8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008519,
    "KHR-GL45.direct_state_access.textures_buffer_rgba8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008520,
    "KHR-GL45.direct_state_access.textures_buffer_r8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008521,
    "KHR-GL45.direct_state_access.textures_buffer_rg8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008522,
    "KHR-GL45.direct_state_access.textures_buffer_rgba8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008523,
    "KHR-GL45.direct_state_access.textures_buffer_r8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008524,
    "KHR-GL45.direct_state_access.textures_buffer_rg8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008525,
    "KHR-GL45.direct_state_access.textures_buffer_rgba8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008526,
    "KHR-GL45.direct_state_access.textures_buffer_r16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008527,
    "KHR-GL45.direct_state_access.textures_buffer_rg16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008528,
    "KHR-GL45.direct_state_access.textures_buffer_rgba16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008529,
    "KHR-GL45.direct_state_access.textures_buffer_r16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008530,
    "KHR-GL45.direct_state_access.textures_buffer_rg16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008531,
    "KHR-GL45.direct_state_access.textures_buffer_rgba16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008532,
    "KHR-GL45.direct_state_access.textures_buffer_r16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008533,
    "KHR-GL45.direct_state_access.textures_buffer_rg16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008534,
    "KHR-GL45.direct_state_access.textures_buffer_rgba16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008535,
    "KHR-GL45.direct_state_access.textures_buffer_r32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008536,
    "KHR-GL45.direct_state_access.textures_buffer_rg32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008537,
    "KHR-GL45.direct_state_access.textures_buffer_rgb32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008538,
    "KHR-GL45.direct_state_access.textures_buffer_rgba32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008539,
    "KHR-GL45.direct_state_access.textures_buffer_r32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008540,
    "KHR-GL45.direct_state_access.textures_buffer_rg32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008541,
    "KHR-GL45.direct_state_access.textures_buffer_rgb32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008542,
    "KHR-GL45.direct_state_access.textures_buffer_rgba32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008543,
    "KHR-GL45.direct_state_access.textures_buffer_r32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008544,
    "KHR-GL45.direct_state_access.textures_buffer_rg32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008545,
    "KHR-GL45.direct_state_access.textures_buffer_rgb32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008546,
    "KHR-GL45.direct_state_access.textures_buffer_rgba32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008547,
    "KHR-GL45.direct_state_access.textures_storage_1d_r8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008548,
    "KHR-GL45.direct_state_access.textures_storage_1d_rg8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008549,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgba8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008550,
    "KHR-GL45.direct_state_access.textures_storage_2d_r8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008551,
    "KHR-GL45.direct_state_access.textures_storage_2d_rg8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008552,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgba8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008553,
    "KHR-GL45.direct_state_access.textures_storage_3d_r8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008554,
    "KHR-GL45.direct_state_access.textures_storage_3d_rg8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008555,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgba8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008556,
    "KHR-GL45.direct_state_access.textures_storage_1d_r8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008557,
    "KHR-GL45.direct_state_access.textures_storage_1d_rg8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008558,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgba8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008559,
    "KHR-GL45.direct_state_access.textures_storage_2d_r8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008560,
    "KHR-GL45.direct_state_access.textures_storage_2d_rg8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008561,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgba8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008562,
    "KHR-GL45.direct_state_access.textures_storage_3d_r8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008563,
    "KHR-GL45.direct_state_access.textures_storage_3d_rg8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008564,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgba8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008565,
    "KHR-GL45.direct_state_access.textures_storage_1d_r8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008566,
    "KHR-GL45.direct_state_access.textures_storage_1d_rg8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008567,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgba8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008568,
    "KHR-GL45.direct_state_access.textures_storage_2d_r8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008569,
    "KHR-GL45.direct_state_access.textures_storage_2d_rg8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008570,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgba8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008571,
    "KHR-GL45.direct_state_access.textures_storage_3d_r8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008572,
    "KHR-GL45.direct_state_access.textures_storage_3d_rg8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008573,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgba8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008574,
    "KHR-GL45.direct_state_access.textures_storage_1d_r16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008575,
    "KHR-GL45.direct_state_access.textures_storage_1d_rg16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008576,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgba16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008577,
    "KHR-GL45.direct_state_access.textures_storage_2d_r16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008578,
    "KHR-GL45.direct_state_access.textures_storage_2d_rg16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008579,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgba16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008580,
    "KHR-GL45.direct_state_access.textures_storage_3d_r16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008581,
    "KHR-GL45.direct_state_access.textures_storage_3d_rg16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008582,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgba16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008583,
    "KHR-GL45.direct_state_access.textures_storage_1d_r16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008584,
    "KHR-GL45.direct_state_access.textures_storage_1d_rg16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008585,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgba16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008586,
    "KHR-GL45.direct_state_access.textures_storage_2d_r16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008587,
    "KHR-GL45.direct_state_access.textures_storage_2d_rg16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008588,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgba16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008589,
    "KHR-GL45.direct_state_access.textures_storage_3d_r16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008590,
    "KHR-GL45.direct_state_access.textures_storage_3d_rg16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008591,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgba16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008592,
    "KHR-GL45.direct_state_access.textures_storage_1d_r16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008593,
    "KHR-GL45.direct_state_access.textures_storage_1d_rg16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008594,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgba16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008595,
    "KHR-GL45.direct_state_access.textures_storage_2d_r16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008596,
    "KHR-GL45.direct_state_access.textures_storage_2d_rg16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008597,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgba16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008598,
    "KHR-GL45.direct_state_access.textures_storage_3d_r16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008599,
    "KHR-GL45.direct_state_access.textures_storage_3d_rg16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008600,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgba16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008601,
    "KHR-GL45.direct_state_access.textures_storage_1d_r32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008602,
    "KHR-GL45.direct_state_access.textures_storage_1d_rg32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008603,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgb32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008604,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgba32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008605,
    "KHR-GL45.direct_state_access.textures_storage_2d_r32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008606,
    "KHR-GL45.direct_state_access.textures_storage_2d_rg32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008607,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgb32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008608,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgba32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008609,
    "KHR-GL45.direct_state_access.textures_storage_3d_r32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008610,
    "KHR-GL45.direct_state_access.textures_storage_3d_rg32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008611,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgb32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008612,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgba32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008613,
    "KHR-GL45.direct_state_access.textures_storage_1d_r32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008614,
    "KHR-GL45.direct_state_access.textures_storage_1d_rg32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008615,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgb32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008616,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgba32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008617,
    "KHR-GL45.direct_state_access.textures_storage_2d_r32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008618,
    "KHR-GL45.direct_state_access.textures_storage_2d_rg32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008619,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgb32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008620,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgba32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008621,
    "KHR-GL45.direct_state_access.textures_storage_3d_r32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008622,
    "KHR-GL45.direct_state_access.textures_storage_3d_rg32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008623,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgb32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008624,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgba32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008625,
    "KHR-GL45.direct_state_access.textures_storage_1d_r32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008626,
    "KHR-GL45.direct_state_access.textures_storage_1d_rg32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008627,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgb32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008628,
    "KHR-GL45.direct_state_access.textures_storage_1d_rgba32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008629,
    "KHR-GL45.direct_state_access.textures_storage_2d_r32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008630,
    "KHR-GL45.direct_state_access.textures_storage_2d_rg32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008631,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgb32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008632,
    "KHR-GL45.direct_state_access.textures_storage_2d_rgba32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008633,
    "KHR-GL45.direct_state_access.textures_storage_3d_r32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008634,
    "KHR-GL45.direct_state_access.textures_storage_3d_rg32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008635,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgb32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008636,
    "KHR-GL45.direct_state_access.textures_storage_3d_rgba32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008637,
    "KHR-GL45.direct_state_access.textures_subimage_1d_r8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008638,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rg8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008639,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgba8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008640,
    "KHR-GL45.direct_state_access.textures_subimage_2d_r8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008641,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rg8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008642,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgba8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008643,
    "KHR-GL45.direct_state_access.textures_subimage_3d_r8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008644,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rg8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008645,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgba8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008646,
    "KHR-GL45.direct_state_access.textures_subimage_1d_r8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008647,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rg8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008648,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgba8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008649,
    "KHR-GL45.direct_state_access.textures_subimage_2d_r8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008650,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rg8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008651,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgba8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008652,
    "KHR-GL45.direct_state_access.textures_subimage_3d_r8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008653,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rg8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008654,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgba8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008655,
    "KHR-GL45.direct_state_access.textures_subimage_1d_r8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008656,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rg8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008657,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgba8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008658,
    "KHR-GL45.direct_state_access.textures_subimage_2d_r8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008659,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rg8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008660,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgba8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008661,
    "KHR-GL45.direct_state_access.textures_subimage_3d_r8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008662,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rg8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008663,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgba8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008664,
    "KHR-GL45.direct_state_access.textures_subimage_1d_r16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008665,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rg16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008666,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgba16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008667,
    "KHR-GL45.direct_state_access.textures_subimage_2d_r16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008668,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rg16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008669,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgba16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008670,
    "KHR-GL45.direct_state_access.textures_subimage_3d_r16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008671,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rg16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008672,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgba16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008673,
    "KHR-GL45.direct_state_access.textures_subimage_1d_r16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008674,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rg16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008675,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgba16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008676,
    "KHR-GL45.direct_state_access.textures_subimage_2d_r16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008677,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rg16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008678,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgba16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008679,
    "KHR-GL45.direct_state_access.textures_subimage_3d_r16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008680,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rg16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008681,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgba16ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008682,
    "KHR-GL45.direct_state_access.textures_subimage_1d_r16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008683,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rg16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008684,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgba16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008685,
    "KHR-GL45.direct_state_access.textures_subimage_2d_r16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008686,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rg16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008687,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgba16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008688,
    "KHR-GL45.direct_state_access.textures_subimage_3d_r16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008689,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rg16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008690,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgba16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008691,
    "KHR-GL45.direct_state_access.textures_subimage_1d_r32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008692,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rg32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008693,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgb32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008694,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgba32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008695,
    "KHR-GL45.direct_state_access.textures_subimage_2d_r32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008696,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rg32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008697,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgb32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008698,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgba32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008699,
    "KHR-GL45.direct_state_access.textures_subimage_3d_r32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008700,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rg32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008701,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgb32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008702,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgba32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008703,
    "KHR-GL45.direct_state_access.textures_subimage_1d_r32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008704,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rg32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008705,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgb32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008706,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgba32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008707,
    "KHR-GL45.direct_state_access.textures_subimage_2d_r32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008708,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rg32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008709,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgb32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008710,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgba32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008711,
    "KHR-GL45.direct_state_access.textures_subimage_3d_r32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008712,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rg32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008713,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgb32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008714,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgba32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008715,
    "KHR-GL45.direct_state_access.textures_subimage_1d_r32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008716,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rg32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008717,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgb32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008718,
    "KHR-GL45.direct_state_access.textures_subimage_1d_rgba32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008719,
    "KHR-GL45.direct_state_access.textures_subimage_2d_r32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008720,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rg32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008721,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgb32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008722,
    "KHR-GL45.direct_state_access.textures_subimage_2d_rgba32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008723,
    "KHR-GL45.direct_state_access.textures_subimage_3d_r32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008724,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rg32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008725,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgb32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008726,
    "KHR-GL45.direct_state_access.textures_subimage_3d_rgba32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008727,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_r8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008728,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rg8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008729,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgba8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008730,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_r8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008731,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rg8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008732,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgba8i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008733,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_r8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008734,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rg8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008735,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgba8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008736,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_r8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008737,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rg8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008738,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgba8ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008739,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_r8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008740,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rg8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008741,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgba8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008742,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_r8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008743,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rg8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008744,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgba8ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008745,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_r16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008746,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rg16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008747,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgba16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008748,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_r16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008749,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rg16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008750,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgba16i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008751,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_r16u");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008752,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rg16u");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008753,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgba16u");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008754,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_r16u");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008755,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rg16u");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008756,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgba16u");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008757,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_r16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008758,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rg16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008759,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgba16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008760,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_r16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008761,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rg16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008762,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgba16ui_unorm");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008763,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_r32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008764,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rg32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008765,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgb32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008766,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgba32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008767,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_r32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008768,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rg32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008769,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgb32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008770,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgba32i");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008771,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_r32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008772,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rg32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008773,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgb32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008774,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgba32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008775,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_r32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008776,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rg32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008777,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgb32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008778,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgba32ui");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008779,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_r32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008780,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rg32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008781,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgb32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008782,
    "KHR-GL45.direct_state_access.textures_storage_multisample_2d_rgba32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008783,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_r32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008784,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rg32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008785,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgb32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008786,
    "KHR-GL45.direct_state_access.textures_storage_multisample_3d_rgba32f");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008787,
    "KHR-GL45.direct_state_access.textures_compressed_subimage");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008788,
    "KHR-GL45.direct_state_access.textures_copy");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008789,
    "KHR-GL45.direct_state_access.textures_get_set_parameter");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008790,
    "KHR-GL45.direct_state_access.textures_defaults");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008791,
    "KHR-GL45.direct_state_access.textures_generate_mipmaps");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008792,
    "KHR-GL45.direct_state_access.textures_bind_unit");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008793,
    "KHR-GL45.direct_state_access.textures_get_image");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008794,
    "KHR-GL45.direct_state_access.textures_get_level_parameter");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008795,
    "KHR-GL45.direct_state_access.textures_creation_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008796,
    "KHR-GL45.direct_state_access.textures_buffer_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008797,
    "KHR-GL45.direct_state_access.textures_buffer_range_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008798,
    "KHR-GL45.direct_state_access.textures_storage_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008799,
    "KHR-GL45.direct_state_access.textures_subimage_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008800,
    "KHR-GL45.direct_state_access.textures_copy_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008801,
    "KHR-GL45.direct_state_access.textures_parameter_setup_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008802,
    "KHR-GL45.direct_state_access.textures_generate_mipmap_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008803,
    "KHR-GL45.direct_state_access.textures_bind_unit_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008804,
    "KHR-GL45.direct_state_access.textures_image_query_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008805,
    "KHR-GL45.direct_state_access.textures_level_parameter_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008806,
    "KHR-GL45.direct_state_access.textures_parameter_errors");
