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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013698,
        "dEQP-GLES2.functional.n",
        "egative_api.state.enable");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013699,
        "dEQP-GLES2.functional.ne",
        "gative_api.state.disable");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013700,
        "dEQP-GLES2.functional.nega",
        "tive_api.state.get_booleanv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013701,
        "dEQP-GLES2.functional.neg",
        "ative_api.state.get_floatv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013702,
        "dEQP-GLES2.functional.nega",
        "tive_api.state.get_integerv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013703,
        "dEQP-GLES2.functional.neg",
        "ative_api.state.get_string");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013704,
        "dEQP-GLES2.functional.negative",
        "_api.state.get_attached_shaders");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013705,
        "dEQP-GLES2.functional.nega",
        "tive_api.state.get_shaderiv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013706,
        "dEQP-GLES2.functional.negative",
        "_api.state.get_shader_info_log");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013707,
        "dEQP-GLES2.functional.negative_api",
        ".state.get_shader_precision_format");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013708,
        "dEQP-GLES2.functional.negativ",
        "e_api.state.get_shader_source");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013709,
        "dEQP-GLES2.functional.negat",
        "ive_api.state.get_programiv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013710,
        "dEQP-GLES2.functional.negative",
        "_api.state.get_program_info_log");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013711,
        "dEQP-GLES2.functional.negative",
        "_api.state.get_tex_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013712,
        "dEQP-GLES2.functional.negative",
        "_api.state.get_tex_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013713,
        "dEQP-GLES2.functional.negat",
        "ive_api.state.get_uniformfv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013714,
        "dEQP-GLES2.functional.negat",
        "ive_api.state.get_uniformiv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013715,
        "dEQP-GLES2.functional.negative",
        "_api.state.get_vertex_attribfv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013716,
        "dEQP-GLES2.functional.negative",
        "_api.state.get_vertex_attribiv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013717,
        "dEQP-GLES2.functional.negative_ap",
        "i.state.get_vertex_attrib_pointerv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013718,
        "dEQP-GLES2.functional.negative_",
        "api.state.get_buffer_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013719,
        "dEQP-GLES2.functional.negative_api.stat",
        "e.get_framebuffer_attachment_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013720,
        "dEQP-GLES2.functional.negative_api",
        ".state.get_renderbuffer_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013721,
        "dEQP-GLES2.functional.negat",
        "ive_api.state.get_is_enabled");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013722,
        "dEQP-GLES2.functional.",
        "negative_api.state.hint");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013723,
        "dEQP-GLES2.functional.neg",
        "ative_api.state.is_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013724,
        "dEQP-GLES2.functional.negat",
        "ive_api.state.is_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013725,
        "dEQP-GLES2.functional.neg",
        "ative_api.state.is_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013726,
        "dEQP-GLES2.functional.negati",
        "ve_api.state.is_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013727,
        "dEQP-GLES2.functional.neg",
        "ative_api.state.is_shader");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013728,
        "dEQP-GLES2.functional.neg",
        "ative_api.state.is_texture");
