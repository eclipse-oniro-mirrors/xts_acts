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
#include "../ActsDeqpgles30043TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042445,
        "dEQP-GLES3.functional.state_query",
        ".integers.subpixel_bits_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042446,
        "dEQP-GLES3.functional.state_query.",
        "integers.subpixel_bits_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042447,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.subpixel_bits_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042448,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.max_3d_texture_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042449,
        "dEQP-GLES3.functional.state_query.int",
        "egers.max_3d_texture_size_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042450,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.max_3d_texture_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042451,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.max_texture_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042452,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.max_texture_size_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042453,
        "dEQP-GLES3.functional.state_query.",
        "integers.max_texture_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042454,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.max_array_texture_layers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042455,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_array_texture_layers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042456,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.max_array_texture_layers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042457,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.max_cube_map_texture_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042458,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_cube_map_texture_size_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042459,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.max_cube_map_texture_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042460,
        "dEQP-GLES3.functional.state_query.int",
        "egers.max_renderbuffer_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042461,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.max_renderbuffer_size_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042462,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.max_renderbuffer_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042463,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.max_draw_buffers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042464,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.max_draw_buffers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042465,
        "dEQP-GLES3.functional.state_query.",
        "integers.max_draw_buffers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042466,
        "dEQP-GLES3.functional.state_query.int",
        "egers.max_color_attachments_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042467,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.max_color_attachments_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042468,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.max_color_attachments_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042469,
        "dEQP-GLES3.functional.state_query.int",
        "egers.max_elements_indices_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042470,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.max_elements_indices_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042471,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.max_elements_indices_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042472,
        "dEQP-GLES3.functional.state_query.int",
        "egers.max_elements_vertices_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042473,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.max_elements_vertices_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042474,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.max_elements_vertices_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042475,
        "dEQP-GLES3.functional.state_query.",
        "integers.num_extensions_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042476,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.num_extensions_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042477,
        "dEQP-GLES3.functional.state_query",
        ".integers.num_extensions_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042478,
        "dEQP-GLES3.functional.state_query",
        ".integers.major_version_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042479,
        "dEQP-GLES3.functional.state_query.",
        "integers.major_version_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042480,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.major_version_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042481,
        "dEQP-GLES3.functional.state_query",
        ".integers.minor_version_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042482,
        "dEQP-GLES3.functional.state_query.",
        "integers.minor_version_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042483,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.minor_version_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042484,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.max_vertex_attribs_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042485,
        "dEQP-GLES3.functional.state_query.int",
        "egers.max_vertex_attribs_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042486,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.max_vertex_attribs_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042487,
        "dEQP-GLES3.functional.state_query.integer",
        "s.max_vertex_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042488,
        "dEQP-GLES3.functional.state_query.integers",
        ".max_vertex_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042489,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_vertex_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042490,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_vertex_uniform_vectors_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042491,
        "dEQP-GLES3.functional.state_query.integer",
        "s.max_vertex_uniform_vectors_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042492,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.max_vertex_uniform_vectors_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042493,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.max_vertex_uniform_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042494,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_vertex_uniform_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042495,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.max_vertex_uniform_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042496,
        "dEQP-GLES3.functional.state_query.integer",
        "s.max_vertex_output_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042497,
        "dEQP-GLES3.functional.state_query.integers",
        ".max_vertex_output_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042498,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_vertex_output_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042499,
        "dEQP-GLES3.functional.state_query.integers",
        ".max_vertex_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042500,
        "dEQP-GLES3.functional.state_query.integers.",
        "max_vertex_texture_image_units_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042501,
        "dEQP-GLES3.functional.state_query.integer",
        "s.max_vertex_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042502,
        "dEQP-GLES3.functional.state_query.integers",
        ".max_fragment_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042503,
        "dEQP-GLES3.functional.state_query.integers.",
        "max_fragment_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042504,
        "dEQP-GLES3.functional.state_query.integer",
        "s.max_fragment_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042505,
        "dEQP-GLES3.functional.state_query.integer",
        "s.max_fragment_uniform_vectors_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042506,
        "dEQP-GLES3.functional.state_query.integers",
        ".max_fragment_uniform_vectors_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042507,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_fragment_uniform_vectors_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042508,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_fragment_uniform_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042509,
        "dEQP-GLES3.functional.state_query.integer",
        "s.max_fragment_uniform_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042510,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.max_fragment_uniform_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042511,
        "dEQP-GLES3.functional.state_query.integer",
        "s.max_fragment_input_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042512,
        "dEQP-GLES3.functional.state_query.integers",
        ".max_fragment_input_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042513,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_fragment_input_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042514,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.max_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042515,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.max_texture_image_units_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042516,
        "dEQP-GLES3.functional.state_query.int",
        "egers.max_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042517,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.max_program_texel_offset_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042518,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_program_texel_offset_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042519,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.max_program_texel_offset_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042520,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_uniform_buffer_bindings_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042521,
        "dEQP-GLES3.functional.state_query.integer",
        "s.max_uniform_buffer_bindings_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042522,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.max_uniform_buffer_bindings_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042523,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.max_combined_uniform_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042524,
        "dEQP-GLES3.functional.state_query.integer",
        "s.max_combined_uniform_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042525,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.max_combined_uniform_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042526,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.max_varying_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042527,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.max_varying_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042528,
        "dEQP-GLES3.functional.state_query.int",
        "egers.max_varying_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042529,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.max_varying_vectors_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042530,
        "dEQP-GLES3.functional.state_query.int",
        "egers.max_varying_vectors_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042531,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.max_varying_vectors_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042532,
        "dEQP-GLES3.functional.state_query.integers.",
        "max_combined_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042533,
        "dEQP-GLES3.functional.state_query.integers.m",
        "ax_combined_texture_image_units_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042534,
        "dEQP-GLES3.functional.state_query.integers",
        ".max_combined_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042535,
        "dEQP-GLES3.functional.state_query.integers.max_tr",
        "ansform_feedback_interleaved_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042536,
        "dEQP-GLES3.functional.state_query.integers.max_tra",
        "nsform_feedback_interleaved_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042537,
        "dEQP-GLES3.functional.state_query.integers.max_t",
        "ransform_feedback_interleaved_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042538,
        "dEQP-GLES3.functional.state_query.integers.max",
        "_transform_feedback_separate_attribs_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042539,
        "dEQP-GLES3.functional.state_query.integers.max_",
        "transform_feedback_separate_attribs_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042540,
        "dEQP-GLES3.functional.state_query.integers.ma",
        "x_transform_feedback_separate_attribs_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042541,
        "dEQP-GLES3.functional.state_query.integers.max_t",
        "ransform_feedback_separate_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042542,
        "dEQP-GLES3.functional.state_query.integers.max_tr",
        "ansform_feedback_separate_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042543,
        "dEQP-GLES3.functional.state_query.integers.max_",
        "transform_feedback_separate_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042544,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.max_samples_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042545,
        "dEQP-GLES3.functional.state_query",
        ".integers.max_samples_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042546,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.max_samples_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042547,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.red_bits_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042548,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.red_bits_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042549,
        "dEQP-GLES3.functional.state_qu",
        "ery.integers.red_bits_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042550,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.green_bits_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042551,
        "dEQP-GLES3.functional.state_query",
        ".integers.green_bits_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042552,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.green_bits_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042553,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.blue_bits_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042554,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.blue_bits_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042555,
        "dEQP-GLES3.functional.state_qu",
        "ery.integers.blue_bits_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042556,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.alpha_bits_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042557,
        "dEQP-GLES3.functional.state_query",
        ".integers.alpha_bits_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042558,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.alpha_bits_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042559,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.depth_bits_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042560,
        "dEQP-GLES3.functional.state_query",
        ".integers.depth_bits_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042561,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.depth_bits_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042562,
        "dEQP-GLES3.functional.state_query",
        ".integers.stencil_bits_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042563,
        "dEQP-GLES3.functional.state_query.",
        "integers.stencil_bits_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042564,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.stencil_bits_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042565,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.min_program_texel_offset_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042566,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.min_program_texel_offset_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042567,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.min_program_texel_offset_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042568,
        "dEQP-GLES3.functional.state_query.integers",
        ".uniform_buffer_offset_alignment_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042569,
        "dEQP-GLES3.functional.state_query.integers.",
        "uniform_buffer_offset_alignment_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042570,
        "dEQP-GLES3.functional.state_query.integer",
        "s.uniform_buffer_offset_alignment_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042571,
        "dEQP-GLES3.functional.state_query.",
        "integers.sample_buffers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042572,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.sample_buffers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042573,
        "dEQP-GLES3.functional.state_query",
        ".integers.sample_buffers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042574,
        "dEQP-GLES3.functional.state_qu",
        "ery.integers.samples_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042575,
        "dEQP-GLES3.functional.state_qu",
        "ery.integers.samples_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042576,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.samples_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042577,
        "dEQP-GLES3.functional.state_q",
        "uery.integers.samples_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042578,
        "dEQP-GLES3.functional.state_query.int",
        "egers.generate_mipmap_hint_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042579,
        "dEQP-GLES3.functional.state_query.int",
        "egers.generate_mipmap_hint_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042580,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.generate_mipmap_hint_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042581,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.generate_mipmap_hint_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042582,
        "dEQP-GLES3.functional.state_query.integers",
        ".fragment_shader_derivative_hint_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042583,
        "dEQP-GLES3.functional.state_query.integers",
        ".fragment_shader_derivative_hint_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042584,
        "dEQP-GLES3.functional.state_query.integers.",
        "fragment_shader_derivative_hint_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042585,
        "dEQP-GLES3.functional.state_query.integer",
        "s.fragment_shader_derivative_hint_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042586,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.depth_func_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042587,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.depth_func_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042588,
        "dEQP-GLES3.functional.state_query",
        ".integers.depth_func_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042589,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.depth_func_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042590,
        "dEQP-GLES3.functional.state_query.",
        "integers.cull_face_mode_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042591,
        "dEQP-GLES3.functional.state_query.",
        "integers.cull_face_mode_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042592,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.cull_face_mode_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042593,
        "dEQP-GLES3.functional.state_query",
        ".integers.cull_face_mode_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042594,
        "dEQP-GLES3.functional.state_query.",
        "integers.front_face_mode_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042595,
        "dEQP-GLES3.functional.state_query.",
        "integers.front_face_mode_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042596,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.front_face_mode_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042597,
        "dEQP-GLES3.functional.state_query",
        ".integers.front_face_mode_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042598,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.viewport_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042599,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.viewport_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042600,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.viewport_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042601,
        "dEQP-GLES3.functional.state_qu",
        "ery.integers.viewport_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042602,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.scissor_box_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042603,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.scissor_box_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042604,
        "dEQP-GLES3.functional.state_query",
        ".integers.scissor_box_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042605,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.scissor_box_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042606,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.max_viewport_dims_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042607,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.max_viewport_dims_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042608,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.max_viewport_dims_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042609,
        "dEQP-GLES3.functional.state_query.",
        "integers.max_viewport_dims_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042610,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.stencil_ref_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042611,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.stencil_ref_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042612,
        "dEQP-GLES3.functional.state_query",
        ".integers.stencil_ref_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042613,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.stencil_ref_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042614,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.stencil_back_ref_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042615,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.stencil_back_ref_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042616,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_back_ref_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042617,
        "dEQP-GLES3.functional.state_query.",
        "integers.stencil_back_ref_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042618,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_ref_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042619,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_ref_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042620,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_ref_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042621,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_ref_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042622,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_ref_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042623,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_ref_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042624,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_ref_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042625,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_ref_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042626,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_back_ref_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042627,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_back_ref_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042628,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_back_ref_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042629,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_back_ref_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042630,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_ref_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042631,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_ref_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042632,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_back_ref_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042633,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_back_ref_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042634,
        "dEQP-GLES3.functional.state_query",
        ".integers.stencil_fail_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042635,
        "dEQP-GLES3.functional.state_query",
        ".integers.stencil_fail_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042636,
        "dEQP-GLES3.functional.state_query.",
        "integers.stencil_fail_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042637,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.stencil_fail_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042638,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.stencil_back_fail_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042639,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.stencil_back_fail_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042640,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_back_fail_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042641,
        "dEQP-GLES3.functional.state_query.",
        "integers.stencil_back_fail_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042642,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_fail_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042643,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_fail_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042644,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_fail_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042645,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_fail_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042646,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_fail_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042647,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_fail_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042648,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_back_fail_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042649,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_back_fail_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042650,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_fail_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042651,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_fail_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042652,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_fail_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042653,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_fail_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042654,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_back_fail_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042655,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_back_fail_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042656,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_back_fail_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042657,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_back_fail_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042658,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_depth_fail_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042659,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_depth_fail_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042660,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_depth_fail_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042661,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.stencil_depth_fail_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042662,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_back_depth_fail_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042663,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_back_depth_fail_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042664,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_back_depth_fail_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042665,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_back_depth_fail_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042666,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_depth_fail_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042667,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_depth_fail_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042668,
        "dEQP-GLES3.functional.state_query.integers.s",
        "tencil_depth_fail_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042669,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_depth_fail_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042670,
        "dEQP-GLES3.functional.state_query.integers.st",
        "encil_back_depth_fail_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042671,
        "dEQP-GLES3.functional.state_query.integers.st",
        "encil_back_depth_fail_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042672,
        "dEQP-GLES3.functional.state_query.integers.ste",
        "ncil_back_depth_fail_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042673,
        "dEQP-GLES3.functional.state_query.integers.s",
        "tencil_back_depth_fail_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042674,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_depth_fail_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042675,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_depth_fail_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042676,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_depth_fail_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042677,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_depth_fail_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042678,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_back_depth_fail_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042679,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_back_depth_fail_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042680,
        "dEQP-GLES3.functional.state_query.integers.s",
        "tencil_back_depth_fail_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042681,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_depth_fail_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042682,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_depth_pass_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042683,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_depth_pass_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042684,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_depth_pass_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042685,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.stencil_depth_pass_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042686,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_back_depth_pass_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042687,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_back_depth_pass_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042688,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_back_depth_pass_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042689,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_back_depth_pass_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042690,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_depth_pass_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042691,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_depth_pass_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042692,
        "dEQP-GLES3.functional.state_query.integers.s",
        "tencil_depth_pass_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042693,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_depth_pass_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042694,
        "dEQP-GLES3.functional.state_query.integers.st",
        "encil_back_depth_pass_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042695,
        "dEQP-GLES3.functional.state_query.integers.st",
        "encil_back_depth_pass_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042696,
        "dEQP-GLES3.functional.state_query.integers.ste",
        "ncil_back_depth_pass_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042697,
        "dEQP-GLES3.functional.state_query.integers.s",
        "tencil_back_depth_pass_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042698,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_depth_pass_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042699,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_depth_pass_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042700,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_depth_pass_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042701,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_depth_pass_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042702,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_back_depth_pass_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042703,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_back_depth_pass_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042704,
        "dEQP-GLES3.functional.state_query.integers.s",
        "tencil_back_depth_pass_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042705,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_depth_pass_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042706,
        "dEQP-GLES3.functional.state_query",
        ".integers.stencil_func_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042707,
        "dEQP-GLES3.functional.state_query",
        ".integers.stencil_func_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042708,
        "dEQP-GLES3.functional.state_query.",
        "integers.stencil_func_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042709,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.stencil_func_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042710,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_func_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042711,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_func_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042712,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_func_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042713,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_func_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042714,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_func_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042715,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_func_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042716,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_func_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042717,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_func_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042718,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_back_func_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042719,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_back_func_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042720,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_back_func_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042721,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_back_func_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042722,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_func_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042723,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_func_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042724,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_back_func_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042725,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_back_func_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042726,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_value_mask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042727,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_value_mask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042728,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_value_mask_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042729,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.stencil_value_mask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042730,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_back_value_mask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042731,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_back_value_mask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042732,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_back_value_mask_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042733,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_back_value_mask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042734,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_value_mask_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042735,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_value_mask_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042736,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_value_mask_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042737,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_value_mask_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042738,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_value_mask_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042739,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_value_mask_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042740,
        "dEQP-GLES3.functional.state_query.integers.s",
        "tencil_value_mask_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042741,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_value_mask_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042742,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_back_value_mask_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042743,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_back_value_mask_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042744,
        "dEQP-GLES3.functional.state_query.integers.s",
        "tencil_back_value_mask_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042745,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_value_mask_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042746,
        "dEQP-GLES3.functional.state_query.integers.st",
        "encil_back_value_mask_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042747,
        "dEQP-GLES3.functional.state_query.integers.st",
        "encil_back_value_mask_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042748,
        "dEQP-GLES3.functional.state_query.integers.ste",
        "ncil_back_value_mask_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042749,
        "dEQP-GLES3.functional.state_query.integers.s",
        "tencil_back_value_mask_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042750,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.stencil_writemask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042751,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.stencil_writemask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042752,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_writemask_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042753,
        "dEQP-GLES3.functional.state_query.",
        "integers.stencil_writemask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042754,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_back_writemask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042755,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.stencil_back_writemask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042756,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_back_writemask_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042757,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_back_writemask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042758,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_writemask_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042759,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.stencil_writemask_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042760,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_writemask_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042761,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.stencil_writemask_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042762,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_writemask_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042763,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_writemask_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042764,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_writemask_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042765,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_writemask_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042766,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_writemask_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042767,
        "dEQP-GLES3.functional.state_query.integers",
        ".stencil_back_writemask_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042768,
        "dEQP-GLES3.functional.state_query.integers.",
        "stencil_back_writemask_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042769,
        "dEQP-GLES3.functional.state_query.integer",
        "s.stencil_back_writemask_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042770,
        "dEQP-GLES3.functional.state_query.integers.st",
        "encil_back_writemask_separate_both_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042771,
        "dEQP-GLES3.functional.state_query.integers.st",
        "encil_back_writemask_separate_both_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042772,
        "dEQP-GLES3.functional.state_query.integers.ste",
        "ncil_back_writemask_separate_both_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042773,
        "dEQP-GLES3.functional.state_query.integers.s",
        "tencil_back_writemask_separate_both_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042774,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.unpack_image_height_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042775,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.unpack_image_height_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042776,
        "dEQP-GLES3.functional.state_query.int",
        "egers.unpack_image_height_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042777,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.unpack_image_height_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042778,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.unpack_skip_images_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042779,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.unpack_skip_images_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042780,
        "dEQP-GLES3.functional.state_query.int",
        "egers.unpack_skip_images_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042781,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.unpack_skip_images_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042782,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.unpack_row_length_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042783,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.unpack_row_length_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042784,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.unpack_row_length_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042785,
        "dEQP-GLES3.functional.state_query.",
        "integers.unpack_row_length_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042786,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.unpack_skip_rows_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042787,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.unpack_skip_rows_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042788,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.unpack_skip_rows_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042789,
        "dEQP-GLES3.functional.state_query.",
        "integers.unpack_skip_rows_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042790,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.unpack_skip_pixels_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042791,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.unpack_skip_pixels_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042792,
        "dEQP-GLES3.functional.state_query.int",
        "egers.unpack_skip_pixels_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042793,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.unpack_skip_pixels_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042794,
        "dEQP-GLES3.functional.state_query.",
        "integers.pack_row_length_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042795,
        "dEQP-GLES3.functional.state_query.",
        "integers.pack_row_length_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042796,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.pack_row_length_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042797,
        "dEQP-GLES3.functional.state_query",
        ".integers.pack_row_length_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042798,
        "dEQP-GLES3.functional.state_query.",
        "integers.pack_skip_rows_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042799,
        "dEQP-GLES3.functional.state_query.",
        "integers.pack_skip_rows_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042800,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.pack_skip_rows_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042801,
        "dEQP-GLES3.functional.state_query",
        ".integers.pack_skip_rows_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042802,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.pack_skip_pixels_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042803,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.pack_skip_pixels_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042804,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.pack_skip_pixels_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042805,
        "dEQP-GLES3.functional.state_query.",
        "integers.pack_skip_pixels_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042806,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.unpack_alignment_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042807,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.unpack_alignment_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042808,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.unpack_alignment_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042809,
        "dEQP-GLES3.functional.state_query.",
        "integers.unpack_alignment_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042810,
        "dEQP-GLES3.functional.state_query.",
        "integers.pack_alignment_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042811,
        "dEQP-GLES3.functional.state_query.",
        "integers.pack_alignment_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042812,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.pack_alignment_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042813,
        "dEQP-GLES3.functional.state_query",
        ".integers.pack_alignment_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042814,
        "dEQP-GLES3.functional.state_query",
        ".integers.blend_src_rgb_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042815,
        "dEQP-GLES3.functional.state_query",
        ".integers.blend_src_rgb_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042816,
        "dEQP-GLES3.functional.state_query.",
        "integers.blend_src_rgb_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042817,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.blend_src_rgb_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042818,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.blend_src_rgb_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042819,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.blend_src_rgb_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042820,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.blend_src_rgb_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042821,
        "dEQP-GLES3.functional.state_query.int",
        "egers.blend_src_rgb_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042822,
        "dEQP-GLES3.functional.state_query.",
        "integers.blend_src_alpha_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042823,
        "dEQP-GLES3.functional.state_query.",
        "integers.blend_src_alpha_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042824,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.blend_src_alpha_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042825,
        "dEQP-GLES3.functional.state_query",
        ".integers.blend_src_alpha_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042826,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.blend_src_alpha_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042827,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.blend_src_alpha_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042828,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.blend_src_alpha_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042829,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.blend_src_alpha_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042830,
        "dEQP-GLES3.functional.state_query",
        ".integers.blend_dst_rgb_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042831,
        "dEQP-GLES3.functional.state_query",
        ".integers.blend_dst_rgb_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042832,
        "dEQP-GLES3.functional.state_query.",
        "integers.blend_dst_rgb_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042833,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.blend_dst_rgb_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042834,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.blend_dst_rgb_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042835,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.blend_dst_rgb_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042836,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.blend_dst_rgb_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042837,
        "dEQP-GLES3.functional.state_query.int",
        "egers.blend_dst_rgb_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042838,
        "dEQP-GLES3.functional.state_query.",
        "integers.blend_dst_alpha_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042839,
        "dEQP-GLES3.functional.state_query.",
        "integers.blend_dst_alpha_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042840,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.blend_dst_alpha_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042841,
        "dEQP-GLES3.functional.state_query",
        ".integers.blend_dst_alpha_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042842,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.blend_dst_alpha_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042843,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.blend_dst_alpha_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042844,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.blend_dst_alpha_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042845,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.blend_dst_alpha_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042846,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.blend_equation_rgb_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042847,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.blend_equation_rgb_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042848,
        "dEQP-GLES3.functional.state_query.int",
        "egers.blend_equation_rgb_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042849,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.blend_equation_rgb_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042850,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.blend_equation_rgb_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042851,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.blend_equation_rgb_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042852,
        "dEQP-GLES3.functional.state_query.integer",
        "s.blend_equation_rgb_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042853,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.blend_equation_rgb_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042854,
        "dEQP-GLES3.functional.state_query.int",
        "egers.blend_equation_alpha_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042855,
        "dEQP-GLES3.functional.state_query.int",
        "egers.blend_equation_alpha_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042856,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.blend_equation_alpha_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042857,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.blend_equation_alpha_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042858,
        "dEQP-GLES3.functional.state_query.integer",
        "s.blend_equation_alpha_separate_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042859,
        "dEQP-GLES3.functional.state_query.integer",
        "s.blend_equation_alpha_separate_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042860,
        "dEQP-GLES3.functional.state_query.integers",
        ".blend_equation_alpha_separate_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042861,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.blend_equation_alpha_separate_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042862,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.compressed_texture_formats_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042863,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.compressed_texture_formats_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042864,
        "dEQP-GLES3.functional.state_query.integer",
        "s.compressed_texture_formats_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042865,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.compressed_texture_formats_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042866,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.program_binary_formats_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042867,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.program_binary_formats_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042868,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.program_binary_formats_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042869,
        "dEQP-GLES3.functional.state_query.int",
        "egers.program_binary_formats_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042870,
        "dEQP-GLES3.functional.state_query.int",
        "egers.shader_binary_formats_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042871,
        "dEQP-GLES3.functional.state_query.int",
        "egers.shader_binary_formats_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042872,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.shader_binary_formats_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042873,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.shader_binary_formats_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042874,
        "dEQP-GLES3.functional.state_query.int",
        "egers.array_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042875,
        "dEQP-GLES3.functional.state_query.int",
        "egers.array_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042876,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.array_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042877,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.array_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042878,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.uniform_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042879,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.uniform_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042880,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.uniform_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042881,
        "dEQP-GLES3.functional.state_query.int",
        "egers.uniform_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042882,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.pixel_pack_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042883,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.pixel_pack_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042884,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.pixel_pack_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042885,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.pixel_pack_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042886,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.pixel_unpack_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042887,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.pixel_unpack_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042888,
        "dEQP-GLES3.functional.state_query.integer",
        "s.pixel_unpack_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042889,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.pixel_unpack_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042890,
        "dEQP-GLES3.functional.state_query.integers.",
        "transform_feedback_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042891,
        "dEQP-GLES3.functional.state_query.integers.",
        "transform_feedback_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042892,
        "dEQP-GLES3.functional.state_query.integers.t",
        "ransform_feedback_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042893,
        "dEQP-GLES3.functional.state_query.integers",
        ".transform_feedback_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042894,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.copy_read_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042895,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.copy_read_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042896,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.copy_read_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042897,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.copy_read_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042898,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.copy_write_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042899,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.copy_write_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042900,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.copy_write_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042901,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.copy_write_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042902,
        "dEQP-GLES3.functional.state_query.integer",
        "s.element_array_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042903,
        "dEQP-GLES3.functional.state_query.integer",
        "s.element_array_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042904,
        "dEQP-GLES3.functional.state_query.integers",
        ".element_array_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042905,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.element_array_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042906,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.transform_feedback_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042907,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.transform_feedback_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042908,
        "dEQP-GLES3.functional.state_query.integer",
        "s.transform_feedback_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042909,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.transform_feedback_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042910,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.current_program_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042911,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.current_program_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042912,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.current_program_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042913,
        "dEQP-GLES3.functional.state_query.int",
        "egers.current_program_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042914,
        "dEQP-GLES3.functional.state_query.int",
        "egers.vertex_array_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042915,
        "dEQP-GLES3.functional.state_query.int",
        "egers.vertex_array_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042916,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.vertex_array_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042917,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.vertex_array_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042918,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_clear_value_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042919,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.stencil_clear_value_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042920,
        "dEQP-GLES3.functional.state_query.int",
        "egers.stencil_clear_value_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042921,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.stencil_clear_value_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042922,
        "dEQP-GLES3.functional.state_query.",
        "integers.active_texture_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042923,
        "dEQP-GLES3.functional.state_query.",
        "integers.active_texture_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042924,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.active_texture_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042925,
        "dEQP-GLES3.functional.state_query",
        ".integers.active_texture_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042926,
        "dEQP-GLES3.functional.state_query.int",
        "egers.renderbuffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042927,
        "dEQP-GLES3.functional.state_query.int",
        "egers.renderbuffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042928,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.renderbuffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042929,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.renderbuffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042930,
        "dEQP-GLES3.functional.state_query.",
        "integers.sampler_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042931,
        "dEQP-GLES3.functional.state_query.",
        "integers.sampler_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042932,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.sampler_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042933,
        "dEQP-GLES3.functional.state_query",
        ".integers.sampler_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042934,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.texture_binding_2d_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042935,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.texture_binding_2d_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042936,
        "dEQP-GLES3.functional.state_query.int",
        "egers.texture_binding_2d_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042937,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.texture_binding_2d_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042938,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.texture_binding_3d_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042939,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.texture_binding_3d_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042940,
        "dEQP-GLES3.functional.state_query.int",
        "egers.texture_binding_3d_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042941,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.texture_binding_3d_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042942,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.texture_binding_2d_array_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042943,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.texture_binding_2d_array_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042944,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.texture_binding_2d_array_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042945,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.texture_binding_2d_array_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042946,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.texture_binding_cube_map_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042947,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.texture_binding_cube_map_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042948,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.texture_binding_cube_map_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042949,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.texture_binding_cube_map_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042950,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.framebuffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042951,
        "dEQP-GLES3.functional.state_query.in",
        "tegers.framebuffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042952,
        "dEQP-GLES3.functional.state_query.int",
        "egers.framebuffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042953,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers.framebuffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042954,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.implementation_color_read_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042955,
        "dEQP-GLES3.functional.state_query.integ",
        "ers.implementation_color_read_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042956,
        "dEQP-GLES3.functional.state_query.intege",
        "rs.implementation_color_read_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042957,
        "dEQP-GLES3.functional.state_query.inte",
        "gers.implementation_color_read_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042958,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.read_buffer_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042959,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.read_buffer_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042960,
        "dEQP-GLES3.functional.state_query",
        ".integers.read_buffer_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042961,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.read_buffer_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042962,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.draw_buffer_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042963,
        "dEQP-GLES3.functional.state_quer",
        "y.integers.draw_buffer_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042964,
        "dEQP-GLES3.functional.state_query",
        ".integers.draw_buffer_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042965,
        "dEQP-GLES3.functional.state_que",
        "ry.integers.draw_buffer_getfloat");
