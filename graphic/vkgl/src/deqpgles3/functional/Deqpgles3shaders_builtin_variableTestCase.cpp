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
#include "../ActsDeqpgles30017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016796,
        "dEQP-GLES3.functional.shaders.builti",
        "n_variable.max_vertex_attribs_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016797,
        "dEQP-GLES3.functional.shaders.builtin",
        "_variable.max_vertex_attribs_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016798,
        "dEQP-GLES3.functional.shaders.builtin_va",
        "riable.max_vertex_uniform_vectors_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016799,
        "dEQP-GLES3.functional.shaders.builtin_var",
        "iable.max_vertex_uniform_vectors_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016800,
        "dEQP-GLES3.functional.shaders.builtin_var",
        "iable.max_fragment_uniform_vectors_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016801,
        "dEQP-GLES3.functional.shaders.builtin_vari",
        "able.max_fragment_uniform_vectors_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016802,
        "dEQP-GLES3.functional.shaders.builtin_",
        "variable.max_texture_image_units_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016803,
        "dEQP-GLES3.functional.shaders.builtin_v",
        "ariable.max_texture_image_units_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016804,
        "dEQP-GLES3.functional.shaders.builtin_vari",
        "able.max_vertex_texture_image_units_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016805,
        "dEQP-GLES3.functional.shaders.builtin_varia",
        "ble.max_vertex_texture_image_units_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016806,
        "dEQP-GLES3.functional.shaders.builtin_varia",
        "ble.max_combined_texture_image_units_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016807,
        "dEQP-GLES3.functional.shaders.builtin_variab",
        "le.max_combined_texture_image_units_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016808,
        "dEQP-GLES3.functional.shaders.built",
        "in_variable.max_draw_buffers_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016809,
        "dEQP-GLES3.functional.shaders.builti",
        "n_variable.max_draw_buffers_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016810,
        "dEQP-GLES3.functional.shaders.builtin_v",
        "ariable.max_vertex_output_vectors_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016811,
        "dEQP-GLES3.functional.shaders.builtin_va",
        "riable.max_vertex_output_vectors_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016812,
        "dEQP-GLES3.functional.shaders.builtin_va",
        "riable.max_fragment_input_vectors_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016813,
        "dEQP-GLES3.functional.shaders.builtin_var",
        "iable.max_fragment_input_vectors_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016814,
        "dEQP-GLES3.functional.shaders.builtin_v",
        "ariable.min_program_texel_offset_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016815,
        "dEQP-GLES3.functional.shaders.builtin_va",
        "riable.min_program_texel_offset_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016816,
        "dEQP-GLES3.functional.shaders.builtin_v",
        "ariable.max_program_texel_offset_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016817,
        "dEQP-GLES3.functional.shaders.builtin_va",
        "riable.max_program_texel_offset_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016818,
        "dEQP-GLES3.functional.shaders.bu",
        "iltin_variable.depth_range_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016819,
        "dEQP-GLES3.functional.shaders.bui",
        "ltin_variable.depth_range_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016820,
        "dEQP-GLES3.functional.shader",
        "s.builtin_variable.vertex_id");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016821,
        "dEQP-GLES3.functional.shaders.",
        "builtin_variable.fragcoord_xyz");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016822,
        "dEQP-GLES3.functional.shaders",
        ".builtin_variable.fragcoord_w");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016823,
        "dEQP-GLES3.functional.shader",
        "s.builtin_variable.pointcoord");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016824,
        "dEQP-GLES3.functional.shaders",
        ".builtin_variable.frontfacing");
