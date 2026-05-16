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
#include "../ActsDeqpgles310005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004976,
        "dEQP-GLES31.functional.shaders.built",
        "in_constants.core.max_vertex_attribs");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004977,
        "dEQP-GLES31.functional.shaders.builtin_c",
        "onstants.core.max_vertex_uniform_vectors");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004978,
        "dEQP-GLES31.functional.shaders.builtin_",
        "constants.core.max_vertex_output_vectors");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004979,
        "dEQP-GLES31.functional.shaders.builtin_c",
        "onstants.core.max_fragment_input_vectors");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004980,
        "dEQP-GLES31.functional.shaders.builtin_co",
        "nstants.core.max_fragment_uniform_vectors");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004981,
        "dEQP-GLES31.functional.shaders.buil",
        "tin_constants.core.max_draw_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004982,
        "dEQP-GLES31.functional.shaders.builtin_con",
        "stants.core.max_vertex_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004983,
        "dEQP-GLES31.functional.shaders.builtin_cons",
        "tants.core.max_combined_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004984,
        "dEQP-GLES31.functional.shaders.builtin",
        "_constants.core.max_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004985,
        "dEQP-GLES31.functional.shaders.builtin_",
        "constants.core.min_program_texel_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004986,
        "dEQP-GLES31.functional.shaders.builtin_",
        "constants.core.max_program_texel_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004987,
        "dEQP-GLES31.functional.shaders.bui",
        "ltin_constants.core.max_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004988,
        "dEQP-GLES31.functional.shaders.builtin_",
        "constants.core.max_vertex_image_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004989,
        "dEQP-GLES31.functional.shaders.builtin_c",
        "onstants.core.max_fragment_image_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004990,
        "dEQP-GLES31.functional.shaders.builtin_c",
        "onstants.core.max_compute_image_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004991,
        "dEQP-GLES31.functional.shaders.builtin_c",
        "onstants.core.max_combined_image_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004992,
        "dEQP-GLES31.functional.shaders.builtin_consta",
        "nts.core.max_combined_shader_output_resources");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004993,
        "dEQP-GLES31.functional.shaders.builtin_con",
        "stants.core.max_compute_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004994,
        "dEQP-GLES31.functional.shaders.builtin_con",
        "stants.core.max_compute_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004995,
        "dEQP-GLES31.functional.shaders.builtin_c",
        "onstants.core.max_compute_atomic_counters");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004996,
        "dEQP-GLES31.functional.shaders.builtin_const",
        "ants.core.max_compute_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004997,
        "dEQP-GLES31.functional.shaders.builtin_c",
        "onstants.core.max_vertex_atomic_counters");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004998,
        "dEQP-GLES31.functional.shaders.builtin_co",
        "nstants.core.max_fragment_atomic_counters");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004999,
        "dEQP-GLES31.functional.shaders.builtin_co",
        "nstants.core.max_combined_atomic_counters");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_005000,
        "dEQP-GLES31.functional.shaders.builtin_c",
        "onstants.core.max_atomic_counter_bindings");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_005001,
        "dEQP-GLES31.functional.shaders.builtin_cons",
        "tants.core.max_vertex_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_005002,
        "dEQP-GLES31.functional.shaders.builtin_const",
        "ants.core.max_fragment_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_005003,
        "dEQP-GLES31.functional.shaders.builtin_const",
        "ants.core.max_combined_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_005004,
        "dEQP-GLES31.functional.shaders.builtin_con",
        "stants.core.max_atomic_counter_buffer_size");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_005005,
        "dEQP-GLES31.functional.shaders.builtin_co",
        "nstants.core.max_compute_work_group_count");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_005006,
        "dEQP-GLES31.functional.shaders.builtin_c",
        "onstants.core.max_compute_work_group_size");
