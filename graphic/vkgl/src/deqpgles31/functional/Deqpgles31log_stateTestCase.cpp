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
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019141,
        "dEQP-GLES31.functional.debug.ne",
        "gative_coverage.log.state.enable");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019142,
        "dEQP-GLES31.functional.debug.neg",
        "ative_coverage.log.state.disable");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019143,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.state.get_booleanv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019144,
        "dEQP-GLES31.functional.debug.nega",
        "tive_coverage.log.state.get_floatv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019145,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.state.get_integerv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019146,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.state.get_integer64v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019147,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.state.get_integeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019148,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.state.get_booleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019149,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.state.get_integer64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019150,
        "dEQP-GLES31.functional.debug.nega",
        "tive_coverage.log.state.get_string");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019151,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.state.get_stringi");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019152,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_attached_shaders");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019153,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.state.get_shaderiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019154,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_shader_info_log");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019155,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.state.get_shader_precision_format");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019156,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.state.get_shader_source");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019157,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.state.get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019158,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_program_info_log");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019159,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_tex_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019160,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_tex_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019161,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.state.get_uniformfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019162,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.state.get_uniformiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019163,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.state.get_uniformuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019164,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.state.get_active_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019165,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.state.get_active_uniformsiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019166,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.state.get_active_uniform_blockiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019167,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.state.get_active_uniform_block_name");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019168,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.state.get_active_attrib");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019169,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_uniform_indices");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019170,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_vertex_attribfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019171,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_vertex_attribiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019172,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.state.get_vertex_attribi_iv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019173,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.state.get_vertex_attribi_uiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019174,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.state.get_vertex_attrib_pointerv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019175,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.state.get_frag_data_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019176,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.state.get_buffer_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019177,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.state.get_buffer_parameteri64v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019178,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_buffer_pointerv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019179,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.state.get_framebuffer_attachment_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019180,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.state.get_renderbuffer_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019181,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_internalformativ");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019182,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.state.get_queryiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019183,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_query_objectuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019184,
        "dEQP-GLES31.functional.debug.nega",
        "tive_coverage.log.state.get_synciv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019185,
        "dEQP-GLES31.functional.debug.nega",
        "tive_coverage.log.state.is_enabled");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019186,
        "dEQP-GLES31.functional.debug.n",
        "egative_coverage.log.state.hint");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019187,
        "dEQP-GLES31.functional.debug.neg",
        "ative_coverage.log.state.enablei");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019188,
        "dEQP-GLES31.functional.debug.neg",
        "ative_coverage.log.state.disablei");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019189,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.state.get_tex_parameteriiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019190,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.state.get_tex_parameteriuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019191,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.state.get_nuniformfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019192,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.state.get_nuniformiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019193,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.state.get_nuniformuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019194,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.state.is_enabledi");
