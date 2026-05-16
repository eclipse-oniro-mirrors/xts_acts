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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000010,
        "dEQP-GLES3.functional.implemen",
        "tation_limits.max_element_index");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000011,
        "dEQP-GLES3.functional.implem",
        "entation_limits.subpixel_bits");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000012,
        "dEQP-GLES3.functional.implement",
        "ation_limits.max_3d_texture_size");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000013,
        "dEQP-GLES3.functional.implemen",
        "tation_limits.max_texture_size");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000014,
        "dEQP-GLES3.functional.implementati",
        "on_limits.max_array_texture_layers");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000015,
        "dEQP-GLES3.functional.implementa",
        "tion_limits.max_texture_lod_bias");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000016,
        "dEQP-GLES3.functional.implementati",
        "on_limits.max_cube_map_texture_size");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000017,
        "dEQP-GLES3.functional.implementa",
        "tion_limits.max_renderbuffer_size");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000018,
        "dEQP-GLES3.functional.implemen",
        "tation_limits.max_draw_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000019,
        "dEQP-GLES3.functional.implementa",
        "tion_limits.max_color_attachments");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000020,
        "dEQP-GLES3.functional.implementati",
        "on_limits.aliased_point_size_range");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000021,
        "dEQP-GLES3.functional.implementati",
        "on_limits.aliased_line_width_range");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000022,
        "dEQP-GLES3.functional.implementa",
        "tion_limits.max_elements_indices");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000023,
        "dEQP-GLES3.functional.implementa",
        "tion_limits.max_elements_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000024,
        "dEQP-GLES3.functional.implementation_",
        "limits.num_compressed_texture_formats");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000025,
        "dEQP-GLES3.functional.implementatio",
        "n_limits.compressed_texture_formats");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000026,
        "dEQP-GLES3.functional.implementatio",
        "n_limits.num_program_binary_formats");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000027,
        "dEQP-GLES3.functional.implementati",
        "on_limits.num_shader_binary_formats");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000028,
        "dEQP-GLES3.functional.impleme",
        "ntation_limits.shader_compiler");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000029,
        "dEQP-GLES3.functional.implementat",
        "ion_limits.max_server_wait_timeout");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000030,
        "dEQP-GLES3.functional.imple",
        "mentation_limits.extensions");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000031,
        "dEQP-GLES3.functional.impleme",
        "ntation_limits.num_extensions");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000032,
        "dEQP-GLES3.functional.implem",
        "entation_limits.major_version");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000033,
        "dEQP-GLES3.functional.implem",
        "entation_limits.minor_version");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000034,
        "dEQP-GLES3.functional.implement",
        "ation_limits.max_vertex_attribs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000035,
        "dEQP-GLES3.functional.implementation",
        "_limits.max_vertex_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000036,
        "dEQP-GLES3.functional.implementatio",
        "n_limits.max_vertex_uniform_vectors");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000037,
        "dEQP-GLES3.functional.implementati",
        "on_limits.max_vertex_uniform_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000038,
        "dEQP-GLES3.functional.implementation",
        "_limits.max_vertex_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000039,
        "dEQP-GLES3.functional.implementation_",
        "limits.max_vertex_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000040,
        "dEQP-GLES3.functional.implementation_",
        "limits.max_fragment_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000041,
        "dEQP-GLES3.functional.implementation",
        "_limits.max_fragment_uniform_vectors");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000042,
        "dEQP-GLES3.functional.implementatio",
        "n_limits.max_fragment_uniform_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000043,
        "dEQP-GLES3.functional.implementation",
        "_limits.max_fragment_input_components");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000044,
        "dEQP-GLES3.functional.implementat",
        "ion_limits.max_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000045,
        "dEQP-GLES3.functional.implementati",
        "on_limits.min_program_texel_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000046,
        "dEQP-GLES3.functional.implementati",
        "on_limits.max_program_texel_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000047,
        "dEQP-GLES3.functional.implementatio",
        "n_limits.max_uniform_buffer_bindings");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000048,
        "dEQP-GLES3.functional.implementat",
        "ion_limits.max_uniform_block_size");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000049,
        "dEQP-GLES3.functional.implementation_",
        "limits.uniform_buffer_offset_alignment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000050,
        "dEQP-GLES3.functional.implementatio",
        "n_limits.max_combined_uniform_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000051,
        "dEQP-GLES3.functional.implementation_limi",
        "ts.max_combined_vertex_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000052,
        "dEQP-GLES3.functional.implementation_limit",
        "s.max_combined_fragment_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000053,
        "dEQP-GLES3.functional.implementat",
        "ion_limits.max_varying_components");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000054,
        "dEQP-GLES3.functional.implement",
        "ation_limits.max_varying_vectors");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000055,
        "dEQP-GLES3.functional.implementation_l",
        "imits.max_combined_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000056,
        "dEQP-GLES3.functional.implementation_limits.",
        "max_transform_feedback_interleaved_components");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000057,
        "dEQP-GLES3.functional.implementation_limi",
        "ts.max_transform_feedback_separate_attribs");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000058,
        "dEQP-GLES3.functional.implementation_limits",
        ".max_transform_feedback_separate_components");
