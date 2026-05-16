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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018643,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.callbacks.state.enable");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018644,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.callbacks.state.disable");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018645,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.state.get_booleanv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018646,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.callbacks.state.get_floatv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018647,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.state.get_integerv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018648,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.state.get_integer64v");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018649,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.state.get_integeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018650,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.state.get_booleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018651,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.state.get_integer64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018652,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.callbacks.state.get_string");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018653,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.state.get_stringi");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018654,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_attached_shaders");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018655,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.state.get_shaderiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018656,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_shader_info_log");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018657,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.state.get_shader_precision_format");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018658,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.state.get_shader_source");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018659,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.state.get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018660,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_program_info_log");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018661,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_tex_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018662,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_tex_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018663,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.state.get_uniformfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018664,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.state.get_uniformiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018665,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.state.get_uniformuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018666,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.state.get_active_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018667,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.state.get_active_uniformsiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018668,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.state.get_active_uniform_blockiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018669,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.state.get_active_uniform_block_name");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018670,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.state.get_active_attrib");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018671,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_uniform_indices");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018672,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_vertex_attribfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018673,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_vertex_attribiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018674,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.state.get_vertex_attribi_iv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018675,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.state.get_vertex_attribi_uiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018676,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.state.get_vertex_attrib_pointerv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018677,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.state.get_frag_data_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018678,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.state.get_buffer_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018679,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.state.get_buffer_parameteri64v");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018680,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_buffer_pointerv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018681,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.state.get_framebuffer_attachment_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018682,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.state.get_renderbuffer_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018683,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_internalformativ");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018684,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.state.get_queryiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018685,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_query_objectuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018686,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.callbacks.state.get_synciv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018687,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.callbacks.state.is_enabled");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018688,
        "dEQP-GLES31.functional.debug.nega",
        "tive_coverage.callbacks.state.hint");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018689,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.callbacks.state.enablei");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018690,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.callbacks.state.disablei");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018691,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.state.get_tex_parameteriiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018692,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.state.get_tex_parameteriuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018693,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.state.get_nuniformfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018694,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.state.get_nuniformiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018695,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.state.get_nuniformuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018696,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.state.is_enabledi");
