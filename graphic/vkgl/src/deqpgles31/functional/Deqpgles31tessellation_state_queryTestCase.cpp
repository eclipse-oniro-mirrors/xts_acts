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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007926,
        "dEQP-GLES31.functional.tessellati",
        "on.state_query.max_patch_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007927,
        "dEQP-GLES31.functional.tessellati",
        "on.state_query.max_tess_gen_level");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007928,
        "dEQP-GLES31.functional.tessellation.state",
        "_query.max_tess_control_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007929,
        "dEQP-GLES31.functional.tessellation.state_q",
        "uery.max_tess_evaluation_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007930,
        "dEQP-GLES31.functional.tessellation.state_",
        "query.max_tess_control_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007931,
        "dEQP-GLES31.functional.tessellation.state_q",
        "uery.max_tess_evaluation_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007932,
        "dEQP-GLES31.functional.tessellation.state",
        "_query.max_tess_control_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007933,
        "dEQP-GLES31.functional.tessellation.",
        "state_query.max_tess_patch_components");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007934,
        "dEQP-GLES31.functional.tessellation.state_qu",
        "ery.max_tess_control_total_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007935,
        "dEQP-GLES31.functional.tessellation.state_",
        "query.max_tess_evaluation_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007936,
        "dEQP-GLES31.functional.tessellation.sta",
        "te_query.max_tess_control_uniform_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007937,
        "dEQP-GLES31.functional.tessellation.state",
        "_query.max_tess_evaluation_uniform_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007938,
        "dEQP-GLES31.functional.tessellation.stat",
        "e_query.max_tess_control_input_components");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007939,
        "dEQP-GLES31.functional.tessellation.state_",
        "query.max_tess_evaluation_input_components");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007940,
        "dEQP-GLES31.functional.tessellation.state_q",
        "uery.max_tess_control_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007941,
        "dEQP-GLES31.functional.tessellation.state_que",
        "ry.max_tess_evaluation_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007942,
        "dEQP-GLES31.functional.tessellation.stat",
        "e_query.max_tess_control_atomic_counters");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007943,
        "dEQP-GLES31.functional.tessellation.state",
        "_query.max_tess_evaluation_atomic_counters");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007944,
        "dEQP-GLES31.functional.tessellation.sta",
        "te_query.max_tess_control_image_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007945,
        "dEQP-GLES31.functional.tessellation.state",
        "_query.max_tess_evaluation_image_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007946,
        "dEQP-GLES31.functional.tessellation.state_q",
        "uery.max_tess_control_shader_storage_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007947,
        "dEQP-GLES31.functional.tessellation.state_qu",
        "ery.max_tess_evaluation_shader_storage_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007948,
        "dEQP-GLES31.functional.tessellation.s",
        "tate_query.max_uniform_buffer_bindings");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007949,
        "dEQP-GLES31.functional.tessellation.s",
        "tate_query.max_combined_uniform_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007950,
        "dEQP-GLES31.functional.tessellation.stat",
        "e_query.max_combined_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007951,
        "dEQP-GLES31.functional.tessellation.state_quer",
        "y.max_combined_tess_control_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007952,
        "dEQP-GLES31.functional.tessellation.state_query",
        ".max_combined_tess_evaluation_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007953,
        "dEQP-GLES31.functional.tessellation.state_q",
        "uery.primitive_restart_for_patches_supported");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007954,
        "dEQP-GLES31.functional.tessella",
        "tion.state_query.patch_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007955,
        "dEQP-GLES31.functional.tessellation.st",
        "ate_query.tess_control_output_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007956,
        "dEQP-GLES31.functional.tessell",
        "ation.state_query.tess_gen_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007957,
        "dEQP-GLES31.functional.tessellat",
        "ion.state_query.tess_gen_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007958,
        "dEQP-GLES31.functional.tessellatio",
        "n.state_query.tess_gen_vertex_order");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007959,
        "dEQP-GLES31.functional.tessellati",
        "on.state_query.tess_gen_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007960,
        "dEQP-GLES31.functional.tessellation.stat",
        "e_query.referenced_by_tess_control_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007961,
        "dEQP-GLES31.functional.tessellation.state_",
        "query.referenced_by_tess_evaluation_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007962,
        "dEQP-GLES31.functional.tessell",
        "ation.state_query.is_per_patch");
