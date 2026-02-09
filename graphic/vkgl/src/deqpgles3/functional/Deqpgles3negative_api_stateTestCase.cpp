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

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042170,
        "dEQP-GLES3.functional.n",
        "egative_api.state.enable");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042171,
        "dEQP-GLES3.functional.ne",
        "gative_api.state.disable");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042172,
        "dEQP-GLES3.functional.nega",
        "tive_api.state.get_booleanv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042173,
        "dEQP-GLES3.functional.neg",
        "ative_api.state.get_floatv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042174,
        "dEQP-GLES3.functional.nega",
        "tive_api.state.get_integerv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042175,
        "dEQP-GLES3.functional.negat",
        "ive_api.state.get_integer64v");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042176,
        "dEQP-GLES3.functional.negat",
        "ive_api.state.get_integeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042177,
        "dEQP-GLES3.functional.negati",
        "ve_api.state.get_integer64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042178,
        "dEQP-GLES3.functional.neg",
        "ative_api.state.get_string");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042179,
        "dEQP-GLES3.functional.nega",
        "tive_api.state.get_stringi");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042180,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_attached_shaders");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042181,
        "dEQP-GLES3.functional.nega",
        "tive_api.state.get_shaderiv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042182,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_shader_info_log");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042183,
        "dEQP-GLES3.functional.negative_api",
        ".state.get_shader_precision_format");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042184,
        "dEQP-GLES3.functional.negativ",
        "e_api.state.get_shader_source");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042185,
        "dEQP-GLES3.functional.negat",
        "ive_api.state.get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042186,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_program_info_log");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042187,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_tex_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042188,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_tex_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042189,
        "dEQP-GLES3.functional.negat",
        "ive_api.state.get_uniformfv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042190,
        "dEQP-GLES3.functional.negat",
        "ive_api.state.get_uniformiv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042191,
        "dEQP-GLES3.functional.negat",
        "ive_api.state.get_uniformuiv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042192,
        "dEQP-GLES3.functional.negativ",
        "e_api.state.get_active_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042193,
        "dEQP-GLES3.functional.negative_",
        "api.state.get_active_uniformsiv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042194,
        "dEQP-GLES3.functional.negative_ap",
        "i.state.get_active_uniform_blockiv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042195,
        "dEQP-GLES3.functional.negative_api.",
        "state.get_active_uniform_block_name");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042196,
        "dEQP-GLES3.functional.negativ",
        "e_api.state.get_active_attrib");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042197,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_uniform_indices");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042198,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_vertex_attribfv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042199,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_vertex_attribiv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042200,
        "dEQP-GLES3.functional.negative_",
        "api.state.get_vertex_attribi_iv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042201,
        "dEQP-GLES3.functional.negative_",
        "api.state.get_vertex_attribi_uiv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042202,
        "dEQP-GLES3.functional.negative_ap",
        "i.state.get_vertex_attrib_pointerv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042203,
        "dEQP-GLES3.functional.negative_",
        "api.state.get_frag_data_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042204,
        "dEQP-GLES3.functional.negative_",
        "api.state.get_buffer_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042205,
        "dEQP-GLES3.functional.negative_a",
        "pi.state.get_buffer_parameteri64v");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042206,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_buffer_pointerv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042207,
        "dEQP-GLES3.functional.negative_api.stat",
        "e.get_framebuffer_attachment_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042208,
        "dEQP-GLES3.functional.negative_api",
        ".state.get_renderbuffer_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042209,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_internalformativ");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042210,
        "dEQP-GLES3.functional.nega",
        "tive_api.state.get_queryiv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042211,
        "dEQP-GLES3.functional.negative",
        "_api.state.get_query_objectuiv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042212,
        "dEQP-GLES3.functional.neg",
        "ative_api.state.get_synciv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042213,
        "dEQP-GLES3.functional.neg",
        "ative_api.state.is_enabled");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042214,
        "dEQP-GLES3.functional.",
        "negative_api.state.hint");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042215,
        "dEQP-GLES3.functional.neg",
        "ative_api.state.is_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042216,
        "dEQP-GLES3.functional.negat",
        "ive_api.state.is_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042217,
        "dEQP-GLES3.functional.neg",
        "ative_api.state.is_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042218,
        "dEQP-GLES3.functional.negati",
        "ve_api.state.is_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042219,
        "dEQP-GLES3.functional.neg",
        "ative_api.state.is_shader");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042220,
        "dEQP-GLES3.functional.neg",
        "ative_api.state.is_texture");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042221,
        "dEQP-GLES3.functional.ne",
        "gative_api.state.is_query");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042222,
        "dEQP-GLES3.functional.neg",
        "ative_api.state.is_sampler");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042223,
        "dEQP-GLES3.functional.ne",
        "gative_api.state.is_sync");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042224,
        "dEQP-GLES3.functional.negative_",
        "api.state.is_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042225,
        "dEQP-GLES3.functional.negati",
        "ve_api.state.is_vertex_array");
