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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019638,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.get_error.state.enable");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019639,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.get_error.state.disable");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019640,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.state.get_booleanv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019641,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.get_error.state.get_floatv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019642,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.state.get_integerv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019643,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.state.get_integer64v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019644,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.state.get_integeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019645,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.state.get_booleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019646,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.state.get_integer64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019647,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.get_error.state.get_string");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019648,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.state.get_stringi");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019649,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_attached_shaders");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019650,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.state.get_shaderiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019651,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_shader_info_log");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019652,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.state.get_shader_precision_format");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019653,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.state.get_shader_source");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019654,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.state.get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019655,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_program_info_log");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019656,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_tex_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019657,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_tex_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019658,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.state.get_uniformfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019659,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.state.get_uniformiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019660,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.state.get_uniformuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019661,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.state.get_active_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019662,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.state.get_active_uniformsiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019663,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.state.get_active_uniform_blockiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019664,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.state.get_active_uniform_block_name");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019665,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.state.get_active_attrib");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019666,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_uniform_indices");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019667,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_vertex_attribfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019668,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_vertex_attribiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019669,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.state.get_vertex_attribi_iv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019670,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.state.get_vertex_attribi_uiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019671,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.state.get_vertex_attrib_pointerv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019672,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.state.get_frag_data_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019673,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.state.get_buffer_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019674,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.state.get_buffer_parameteri64v");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019675,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_buffer_pointerv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019676,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.state.get_renderbuffer_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019677,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_internalformativ");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019678,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.state.get_queryiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019679,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_query_objectuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019680,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.get_error.state.get_synciv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019681,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.get_error.state.is_enabled");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019682,
        "dEQP-GLES31.functional.debug.nega",
        "tive_coverage.get_error.state.hint");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019683,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.get_error.state.enablei");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019684,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.get_error.state.disablei");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019685,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.state.get_tex_parameteriiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019686,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.state.get_tex_parameteriuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019687,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.state.get_nuniformfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019688,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.state.get_nuniformiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019689,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.state.get_nuniformuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019690,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.state.is_enabledi");
