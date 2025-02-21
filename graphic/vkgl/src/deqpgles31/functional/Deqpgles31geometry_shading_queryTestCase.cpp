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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016277,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.query.max_geometry_input_components");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016278,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.query.max_geometry_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016279,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.query.max_geometry_image_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016280,
        "dEQP-GLES31.functional.geometry_shading",
        ".query.max_geometry_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016281,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.query.max_geometry_output_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016282,
        "dEQP-GLES31.functional.geometry_shading.q",
        "uery.max_geometry_total_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016283,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.query.max_geometry_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016284,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.query.max_geometry_atomic_counters");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016285,
        "dEQP-GLES31.functional.geometry_shading.",
        "query.max_geometry_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016286,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.query.geometry_linked_vertices_out");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016287,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.query.geometry_linked_input_type");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016288,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.query.geometry_linked_output_type");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016289,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.query.geometry_shader_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016290,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.query.max_geometry_shader_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016291,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.query.max_geometry_uniform_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016292,
        "dEQP-GLES31.functional.geometry_shading.",
        "query.max_geometry_shader_storage_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016293,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.query.layer_provoking_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016294,
        "dEQP-GLES31.functional.geometry_shading",
        ".query.primitives_generated_no_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016295,
        "dEQP-GLES31.functional.geometry_shading.q",
        "uery.primitives_generated_no_amplification");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016296,
        "dEQP-GLES31.functional.geometry_shading.",
        "query.primitives_generated_amplification");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016297,
        "dEQP-GLES31.functional.geometry_shading.qu",
        "ery.primitives_generated_partial_primitives");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016298,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.query.primitives_generated_instanced");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016299,
        "dEQP-GLES31.functional.geometry_s",
        "hading.query.primitives_generated");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016300,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.query.max_framebuffer_layers");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016301,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.query.framebuffer_default_layers");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016302,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.query.framebuffer_attachment_layered");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016303,
        "dEQP-GLES31.functional.geometry_shading.q",
        "uery.framebuffer_incomplete_layer_targets");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016304,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.query.referenced_by_geometry_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016305,
        "dEQP-GLES31.functional.geometry_shading.que",
        "ry.max_combined_geometry_uniform_components");
