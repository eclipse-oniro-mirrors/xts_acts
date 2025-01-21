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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014845,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_color_texture_samples_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014846,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_color_texture_samples_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014847,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_color_texture_samples_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014848,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_color_texture_samples_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014849,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_depth_texture_samples_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014850,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_depth_texture_samples_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014851,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_depth_texture_samples_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014852,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_depth_texture_samples_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014853,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.max_integer_samples_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014854,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.max_integer_samples_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014855,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_integer_samples_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014856,
        "dEQP-GLES31.functional.state_query.",
        "integer.max_integer_samples_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014857,
        "dEQP-GLES31.functional.state_query.integer",
        ".texture_binding_2d_multisample_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014858,
        "dEQP-GLES31.functional.state_query.integer",
        ".texture_binding_2d_multisample_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014859,
        "dEQP-GLES31.functional.state_query.integer.",
        "texture_binding_2d_multisample_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014860,
        "dEQP-GLES31.functional.state_query.intege",
        "r.texture_binding_2d_multisample_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014861,
        "dEQP-GLES31.functional.state_query.integer.te",
        "xture_binding_2d_multisample_array_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014862,
        "dEQP-GLES31.functional.state_query.integer.te",
        "xture_binding_2d_multisample_array_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014863,
        "dEQP-GLES31.functional.state_query.integer.tex",
        "ture_binding_2d_multisample_array_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014864,
        "dEQP-GLES31.functional.state_query.integer.t",
        "exture_binding_2d_multisample_array_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014865,
        "dEQP-GLES31.functional.state_query.integer",
        ".texture_binding_cube_map_array_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014866,
        "dEQP-GLES31.functional.state_query.integer",
        ".texture_binding_cube_map_array_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014867,
        "dEQP-GLES31.functional.state_query.integer.",
        "texture_binding_cube_map_array_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014868,
        "dEQP-GLES31.functional.state_query.intege",
        "r.texture_binding_cube_map_array_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014869,
        "dEQP-GLES31.functional.state_query.int",
        "eger.texture_binding_buffer_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014870,
        "dEQP-GLES31.functional.state_query.int",
        "eger.texture_binding_buffer_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014871,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.texture_binding_buffer_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014872,
        "dEQP-GLES31.functional.state_query.in",
        "teger.texture_binding_buffer_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014873,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_vertex_attrib_relative_offset_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014874,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_vertex_attrib_relative_offset_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014875,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_vertex_attrib_relative_offset_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014876,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_vertex_attrib_relative_offset_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014877,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_vertex_attrib_bindings_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014878,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_vertex_attrib_bindings_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014879,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_vertex_attrib_bindings_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014880,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_vertex_attrib_bindings_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014881,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_vertex_attrib_stride_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014882,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_vertex_attrib_stride_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014883,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_vertex_attrib_stride_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014884,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_vertex_attrib_stride_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014885,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_sample_mask_words_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014886,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_sample_mask_words_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014887,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_sample_mask_words_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014888,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.max_sample_mask_words_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014889,
        "dEQP-GLES31.functional.state_query.integer.sha",
        "der_storage_buffer_offset_alignment_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014890,
        "dEQP-GLES31.functional.state_query.integer.sha",
        "der_storage_buffer_offset_alignment_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014891,
        "dEQP-GLES31.functional.state_query.integer.shad",
        "er_storage_buffer_offset_alignment_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014892,
        "dEQP-GLES31.functional.state_query.integer.sh",
        "ader_storage_buffer_offset_alignment_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014893,
        "dEQP-GLES31.functional.state_query.intege",
        "r.draw_indirect_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014894,
        "dEQP-GLES31.functional.state_query.intege",
        "r.draw_indirect_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014895,
        "dEQP-GLES31.functional.state_query.integer",
        ".draw_indirect_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014896,
        "dEQP-GLES31.functional.state_query.integ",
        "er.draw_indirect_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014897,
        "dEQP-GLES31.functional.state_query.intege",
        "r.atomic_counter_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014898,
        "dEQP-GLES31.functional.state_query.intege",
        "r.atomic_counter_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014899,
        "dEQP-GLES31.functional.state_query.integer",
        ".atomic_counter_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014900,
        "dEQP-GLES31.functional.state_query.integ",
        "er.atomic_counter_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014901,
        "dEQP-GLES31.functional.state_query.intege",
        "r.shader_storage_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014902,
        "dEQP-GLES31.functional.state_query.intege",
        "r.shader_storage_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014903,
        "dEQP-GLES31.functional.state_query.integer",
        ".shader_storage_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014904,
        "dEQP-GLES31.functional.state_query.integ",
        "er.shader_storage_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014905,
        "dEQP-GLES31.functional.state_query.integer.",
        "dispatch_indirect_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014906,
        "dEQP-GLES31.functional.state_query.integer.",
        "dispatch_indirect_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014907,
        "dEQP-GLES31.functional.state_query.integer.d",
        "ispatch_indirect_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014908,
        "dEQP-GLES31.functional.state_query.integer",
        ".dispatch_indirect_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014909,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_framebuffer_width_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014910,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_framebuffer_width_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014911,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_framebuffer_width_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014912,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.max_framebuffer_width_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014913,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_framebuffer_height_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014914,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_framebuffer_height_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014915,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_framebuffer_height_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014916,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_framebuffer_height_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014917,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_framebuffer_samples_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014918,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_framebuffer_samples_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014919,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_framebuffer_samples_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014920,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_framebuffer_samples_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014921,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.program_pipeline_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014922,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.program_pipeline_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014923,
        "dEQP-GLES31.functional.state_query.integ",
        "er.program_pipeline_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014924,
        "dEQP-GLES31.functional.state_query.int",
        "eger.program_pipeline_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014925,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_vertex_atomic_counter_buffers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014926,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_vertex_atomic_counter_buffers_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014927,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_vertex_atomic_counter_buffers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014928,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_vertex_atomic_counter_buffers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014929,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_vertex_atomic_counters_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014930,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_vertex_atomic_counters_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014931,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_vertex_atomic_counters_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014932,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_vertex_atomic_counters_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014933,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_vertex_image_uniforms_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014934,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_vertex_image_uniforms_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014935,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_vertex_image_uniforms_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014936,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_vertex_image_uniforms_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014937,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_vertex_shader_storage_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014938,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_vertex_shader_storage_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014939,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_vertex_shader_storage_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014940,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_vertex_shader_storage_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014941,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_vertex_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014942,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_vertex_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014943,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_vertex_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014944,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_vertex_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014945,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_fragment_atomic_counter_buffers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014946,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_fragment_atomic_counter_buffers_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014947,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_fragment_atomic_counter_buffers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014948,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_fragment_atomic_counter_buffers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014949,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_fragment_atomic_counters_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014950,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_fragment_atomic_counters_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014951,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_fragment_atomic_counters_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014952,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_fragment_atomic_counters_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014953,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_fragment_image_uniforms_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014954,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_fragment_image_uniforms_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014955,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_fragment_image_uniforms_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014956,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_fragment_image_uniforms_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014957,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_fragment_shader_storage_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014958,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_fragment_shader_storage_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014959,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_fragment_shader_storage_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014960,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_fragment_shader_storage_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014961,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_fragment_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014962,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_fragment_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014963,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_fragment_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014964,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_fragment_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014965,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_compute_work_group_invocations_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014966,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_compute_work_group_invocations_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014967,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_compute_work_group_invocations_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014968,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_compute_work_group_invocations_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014969,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_compute_uniform_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014970,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_compute_uniform_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014971,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_compute_uniform_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014972,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_compute_uniform_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014973,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_compute_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014974,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_compute_texture_image_units_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014975,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_compute_texture_image_units_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014976,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_compute_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014977,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_compute_shared_memory_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014978,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_compute_shared_memory_size_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014979,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_compute_shared_memory_size_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014980,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_compute_shared_memory_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014981,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_compute_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014982,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_compute_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014983,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_compute_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014984,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_compute_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014985,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_compute_atomic_counter_buffers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014986,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_compute_atomic_counter_buffers_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014987,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_compute_atomic_counter_buffers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014988,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_compute_atomic_counter_buffers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014989,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_compute_atomic_counters_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014990,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_compute_atomic_counters_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014991,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_compute_atomic_counters_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014992,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_compute_atomic_counters_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014993,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_compute_image_uniforms_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014994,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_compute_image_uniforms_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014995,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_compute_image_uniforms_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014996,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_compute_image_uniforms_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014997,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_compute_shader_storage_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014998,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_compute_shader_storage_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014999,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_compute_shader_storage_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015000,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_compute_shader_storage_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015001,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_uniform_locations_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015002,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_uniform_locations_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015003,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_uniform_locations_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015004,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.max_uniform_locations_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015005,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_atomic_counter_buffer_bindings_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015006,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_atomic_counter_buffer_bindings_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015007,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_atomic_counter_buffer_bindings_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015008,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_atomic_counter_buffer_bindings_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015009,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_atomic_counter_buffer_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015010,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_atomic_counter_buffer_size_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015011,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_atomic_counter_buffer_size_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015012,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_atomic_counter_buffer_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015013,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_combined_atomic_counter_buffers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015014,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_combined_atomic_counter_buffers_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015015,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_combined_atomic_counter_buffers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015016,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_combined_atomic_counter_buffers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015017,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_combined_atomic_counters_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015018,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_combined_atomic_counters_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015019,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_combined_atomic_counters_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015020,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_combined_atomic_counters_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015021,
        "dEQP-GLES31.functional.state_query",
        ".integer.max_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015022,
        "dEQP-GLES31.functional.state_query",
        ".integer.max_image_units_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015023,
        "dEQP-GLES31.functional.state_query.",
        "integer.max_image_units_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015024,
        "dEQP-GLES31.functional.state_quer",
        "y.integer.max_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015025,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_combined_image_uniforms_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015026,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_combined_image_uniforms_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015027,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_combined_image_uniforms_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015028,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_combined_image_uniforms_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015029,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_shader_storage_buffer_bindings_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015030,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_shader_storage_buffer_bindings_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015031,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_shader_storage_buffer_bindings_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015032,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_shader_storage_buffer_bindings_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015033,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_shader_storage_block_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015034,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_shader_storage_block_size_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015035,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_shader_storage_block_size_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015036,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_shader_storage_block_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015037,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_combined_shader_storage_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015038,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_combined_shader_storage_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015039,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_combined_shader_storage_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015040,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_combined_shader_storage_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015041,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_combined_shader_output_resources_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015042,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_combined_shader_output_resources_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015043,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_combined_shader_output_resources_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015044,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_combined_shader_output_resources_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015045,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_uniform_buffer_bindings_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015046,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_uniform_buffer_bindings_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015047,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_uniform_buffer_bindings_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015048,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_uniform_buffer_bindings_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015049,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_combined_uniform_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015050,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_combined_uniform_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015051,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_combined_uniform_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015052,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_combined_uniform_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015053,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_combined_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015054,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_combined_texture_image_units_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015055,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_combined_texture_image_units_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015056,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_combined_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015057,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_combined_compute_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015058,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_combined_compute_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015059,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "combined_compute_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015060,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_combined_compute_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015061,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_vertex_uniform_vectors_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015062,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_vertex_uniform_vectors_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015063,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_vertex_uniform_vectors_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015064,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_vertex_uniform_vectors_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015065,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_fragment_uniform_vectors_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015066,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_fragment_uniform_vectors_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015067,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_fragment_uniform_vectors_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015068,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_fragment_uniform_vectors_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015069,
        "dEQP-GLES31.functional.state_query.integer.",
        "min_program_texture_gather_offset_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015070,
        "dEQP-GLES31.functional.state_query.integer.",
        "min_program_texture_gather_offset_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015071,
        "dEQP-GLES31.functional.state_query.integer.m",
        "in_program_texture_gather_offset_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015072,
        "dEQP-GLES31.functional.state_query.integer",
        ".min_program_texture_gather_offset_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015073,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_program_texture_gather_offset_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015074,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_program_texture_gather_offset_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015075,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_program_texture_gather_offset_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015076,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_program_texture_gather_offset_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015077,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_framebuffer_layers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015078,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_framebuffer_layers_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015079,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_framebuffer_layers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015080,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_framebuffer_layers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015081,
        "dEQP-GLES31.functional.state_query.integer.f",
        "ragment_interpolation_offset_bits_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015082,
        "dEQP-GLES31.functional.state_query.integer.f",
        "ragment_interpolation_offset_bits_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015083,
        "dEQP-GLES31.functional.state_query.integer.fr",
        "agment_interpolation_offset_bits_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015084,
        "dEQP-GLES31.functional.state_query.integer.",
        "fragment_interpolation_offset_bits_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015085,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_texture_buffer_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015086,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_texture_buffer_size_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015087,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_texture_buffer_size_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015088,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_texture_buffer_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015089,
        "dEQP-GLES31.functional.state_query.integer",
        ".texture_buffer_offset_alignment_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015090,
        "dEQP-GLES31.functional.state_query.integer",
        ".texture_buffer_offset_alignment_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015091,
        "dEQP-GLES31.functional.state_query.integer.",
        "texture_buffer_offset_alignment_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015092,
        "dEQP-GLES31.functional.state_query.intege",
        "r.texture_buffer_offset_alignment_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015093,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.max_tess_gen_level_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015094,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.max_tess_gen_level_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015095,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_tess_gen_level_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015096,
        "dEQP-GLES31.functional.state_query.",
        "integer.max_tess_gen_level_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015097,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.max_patch_vertices_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015098,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.max_patch_vertices_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015099,
        "dEQP-GLES31.functional.state_query.in",
        "teger.max_patch_vertices_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015100,
        "dEQP-GLES31.functional.state_query.",
        "integer.max_patch_vertices_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015101,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_tess_patch_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015102,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_tess_patch_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015103,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_tess_patch_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015104,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_tess_patch_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015105,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_control_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015106,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_control_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015107,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_control_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015108,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_control_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015109,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_control_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015110,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_control_texture_image_units_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015111,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_control_texture_image_units_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015112,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_control_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015113,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_control_output_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015114,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_control_output_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015115,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_control_output_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015116,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_control_output_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015117,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "tess_control_total_output_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015118,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "tess_control_total_output_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015119,
        "dEQP-GLES31.functional.state_query.integer.max_t",
        "ess_control_total_output_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015120,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_control_total_output_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015121,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_control_input_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015122,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_control_input_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015123,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_control_input_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015124,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_tess_control_input_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015125,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_tess_control_uniform_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015126,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_tess_control_uniform_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015127,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_control_uniform_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015128,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_tess_control_uniform_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015129,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_control_atomic_counter_buffers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015130,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_control_atomic_counter_buffers_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015131,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "tess_control_atomic_counter_buffers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015132,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_control_atomic_counter_buffers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015133,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_control_atomic_counters_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015134,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_control_atomic_counters_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015135,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_control_atomic_counters_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015136,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_tess_control_atomic_counters_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015137,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_control_shader_storage_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015138,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_control_shader_storage_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015139,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "tess_control_shader_storage_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015140,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_control_shader_storage_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015141,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_evaluation_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015142,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_evaluation_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015143,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "tess_evaluation_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015144,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_evaluation_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015145,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_evaluation_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015146,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_evaluation_texture_image_units_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015147,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "tess_evaluation_texture_image_units_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015148,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_evaluation_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015149,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_evaluation_output_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015150,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_evaluation_output_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015151,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_evaluation_output_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015152,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_evaluation_output_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015153,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_evaluation_input_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015154,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_evaluation_input_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015155,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_evaluation_input_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015156,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_evaluation_input_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015157,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_evaluation_uniform_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015158,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_evaluation_uniform_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015159,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_evaluation_uniform_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015160,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_evaluation_uniform_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015161,
        "dEQP-GLES31.functional.state_query.integer.max_t",
        "ess_evaluation_atomic_counter_buffers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015162,
        "dEQP-GLES31.functional.state_query.integer.max_t",
        "ess_evaluation_atomic_counter_buffers_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015163,
        "dEQP-GLES31.functional.state_query.integer.max_te",
        "ss_evaluation_atomic_counter_buffers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015164,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "tess_evaluation_atomic_counter_buffers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015165,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_evaluation_atomic_counters_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015166,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_evaluation_atomic_counters_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015167,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_evaluation_atomic_counters_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015168,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_evaluation_atomic_counters_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015169,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "tess_evaluation_shader_storage_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015170,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "tess_evaluation_shader_storage_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015171,
        "dEQP-GLES31.functional.state_query.integer.max_t",
        "ess_evaluation_shader_storage_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015172,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_tess_evaluation_shader_storage_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015173,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_geometry_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015174,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_geometry_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015175,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_geometry_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015176,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015177,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_geometry_uniform_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015178,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_geometry_uniform_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015179,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_uniform_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015180,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_geometry_uniform_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015181,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_input_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015182,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_input_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015183,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_geometry_input_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015184,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_geometry_input_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015185,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_geometry_output_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015186,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_geometry_output_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015187,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_geometry_output_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015188,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_output_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015189,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_output_vertices_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015190,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_output_vertices_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015191,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_geometry_output_vertices_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015192,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_geometry_output_vertices_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015193,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_geometry_total_output_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015194,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_geometry_total_output_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015195,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_geometry_total_output_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015196,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_geometry_total_output_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015197,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_geometry_texture_image_units_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015198,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_geometry_texture_image_units_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015199,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_geometry_texture_image_units_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015200,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_geometry_texture_image_units_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015201,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_geometry_shader_invocations_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015202,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_geometry_shader_invocations_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015203,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_geometry_shader_invocations_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015204,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_shader_invocations_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015205,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_geometry_atomic_counter_buffers_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015206,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_geometry_atomic_counter_buffers_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015207,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_geometry_atomic_counter_buffers_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015208,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_geometry_atomic_counter_buffers_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015209,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_atomic_counters_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015210,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_atomic_counters_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015211,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_geometry_atomic_counters_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015212,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_geometry_atomic_counters_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015213,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_geometry_shader_storage_blocks_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015214,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_geometry_shader_storage_blocks_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015215,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_geometry_shader_storage_blocks_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015216,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_geometry_shader_storage_blocks_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015217,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_tess_control_image_uniforms_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015218,
        "dEQP-GLES31.functional.state_query.integer",
        ".max_tess_control_image_uniforms_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015219,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_control_image_uniforms_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015220,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_tess_control_image_uniforms_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015221,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_evaluation_image_uniforms_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015222,
        "dEQP-GLES31.functional.state_query.integer.m",
        "ax_tess_evaluation_image_uniforms_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015223,
        "dEQP-GLES31.functional.state_query.integer.ma",
        "x_tess_evaluation_image_uniforms_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015224,
        "dEQP-GLES31.functional.state_query.integer.",
        "max_tess_evaluation_image_uniforms_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015225,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_geometry_image_uniforms_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015226,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_geometry_image_uniforms_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015227,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_geometry_image_uniforms_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015228,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_geometry_image_uniforms_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015229,
        "dEQP-GLES31.functional.state_query.in",
        "teger.debug_logged_messages_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015230,
        "dEQP-GLES31.functional.state_query.in",
        "teger.debug_logged_messages_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015231,
        "dEQP-GLES31.functional.state_query.int",
        "eger.debug_logged_messages_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015232,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.debug_logged_messages_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015233,
        "dEQP-GLES31.functional.state_query.integer.",
        "debug_next_logged_message_length_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015234,
        "dEQP-GLES31.functional.state_query.integer.",
        "debug_next_logged_message_length_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015235,
        "dEQP-GLES31.functional.state_query.integer.d",
        "ebug_next_logged_message_length_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015236,
        "dEQP-GLES31.functional.state_query.integer",
        ".debug_next_logged_message_length_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015237,
        "dEQP-GLES31.functional.state_query.int",
        "eger.debug_group_stack_depth_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015238,
        "dEQP-GLES31.functional.state_query.int",
        "eger.debug_group_stack_depth_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015239,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.debug_group_stack_depth_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015240,
        "dEQP-GLES31.functional.state_query.in",
        "teger.debug_group_stack_depth_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015241,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_debug_message_length_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015242,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_debug_message_length_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015243,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_debug_message_length_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015244,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_debug_message_length_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015245,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_debug_logged_messages_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015246,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_debug_logged_messages_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015247,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_debug_logged_messages_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015248,
        "dEQP-GLES31.functional.state_query.int",
        "eger.max_debug_logged_messages_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015249,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_debug_group_stack_depth_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015250,
        "dEQP-GLES31.functional.state_query.integ",
        "er.max_debug_group_stack_depth_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015251,
        "dEQP-GLES31.functional.state_query.intege",
        "r.max_debug_group_stack_depth_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015252,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.max_debug_group_stack_depth_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015253,
        "dEQP-GLES31.functional.state_query.",
        "integer.max_label_length_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015254,
        "dEQP-GLES31.functional.state_query.",
        "integer.max_label_length_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015255,
        "dEQP-GLES31.functional.state_query.i",
        "nteger.max_label_length_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015256,
        "dEQP-GLES31.functional.state_query",
        ".integer.max_label_length_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015257,
        "dEQP-GLES31.functional.state_query.int",
        "eger.texture_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015258,
        "dEQP-GLES31.functional.state_query.int",
        "eger.texture_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015259,
        "dEQP-GLES31.functional.state_query.inte",
        "ger.texture_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015260,
        "dEQP-GLES31.functional.state_query.in",
        "teger.texture_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015261,
        "dEQP-GLES31.functional.state_query.integer.max_co",
        "mbined_tess_control_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015262,
        "dEQP-GLES31.functional.state_query.integer.max_co",
        "mbined_tess_control_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015263,
        "dEQP-GLES31.functional.state_query.integer.max_com",
        "bined_tess_control_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015264,
        "dEQP-GLES31.functional.state_query.integer.max_c",
        "ombined_tess_control_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015265,
        "dEQP-GLES31.functional.state_query.integer.max_com",
        "bined_tess_evaluation_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015266,
        "dEQP-GLES31.functional.state_query.integer.max_com",
        "bined_tess_evaluation_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015267,
        "dEQP-GLES31.functional.state_query.integer.max_comb",
        "ined_tess_evaluation_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015268,
        "dEQP-GLES31.functional.state_query.integer.max_co",
        "mbined_tess_evaluation_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015269,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "combined_geometry_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015270,
        "dEQP-GLES31.functional.state_query.integer.max_",
        "combined_geometry_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015271,
        "dEQP-GLES31.functional.state_query.integer.max_c",
        "ombined_geometry_uniform_components_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_015272,
        "dEQP-GLES31.functional.state_query.integer.max",
        "_combined_geometry_uniform_components_getfloat");
