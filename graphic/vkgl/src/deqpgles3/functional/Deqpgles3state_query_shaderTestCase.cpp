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
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043218,
        "dEQP-GLES3.functional.stat",
        "e_query.shader.shader_type");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043219,
        "dEQP-GLES3.functional.state_que",
        "ry.shader.shader_compile_status");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043220,
        "dEQP-GLES3.functional.state_que",
        "ry.shader.shader_info_log_length");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043221,
        "dEQP-GLES3.functional.state_qu",
        "ery.shader.shader_source_length");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043222,
        "dEQP-GLES3.functional.state",
        "_query.shader.delete_status");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043223,
        "dEQP-GLES3.functional.state_query.s",
        "hader.current_vertex_attrib_initial");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043224,
        "dEQP-GLES3.functional.state_query.",
        "shader.current_vertex_attrib_float");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043225,
        "dEQP-GLES3.functional.state_query",
        ".shader.current_vertex_attrib_int");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043226,
        "dEQP-GLES3.functional.state_query",
        ".shader.current_vertex_attrib_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043227,
        "dEQP-GLES3.functional.state_query.sha",
        "der.current_vertex_attrib_float_to_int");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043228,
        "dEQP-GLES3.functional.state_quer",
        "y.shader.program_info_log_length");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043229,
        "dEQP-GLES3.functional.state_query.sha",
        "der.program_info_log_length_link_error");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043230,
        "dEQP-GLES3.functional.state_quer",
        "y.shader.program_validate_status");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043231,
        "dEQP-GLES3.functional.state_quer",
        "y.shader.program_attached_shaders");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043232,
        "dEQP-GLES3.functional.state_query.",
        "shader.program_active_uniform_name");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043233,
        "dEQP-GLES3.functional.state_query.",
        "shader.program_active_uniform_types");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043234,
        "dEQP-GLES3.functional.state_query.s",
        "hader.program_active_uniform_blocks");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043235,
        "dEQP-GLES3.functional.state",
        "_query.shader.program_binary");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043236,
        "dEQP-GLES3.functional.state_q",
        "uery.shader.transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043237,
        "dEQP-GLES3.functional.state_q",
        "uery.shader.active_attributes");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043238,
        "dEQP-GLES3.functional.state_q",
        "uery.shader.vertex_attrib_size");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043239,
        "dEQP-GLES3.functional.state_q",
        "uery.shader.vertex_attrib_type");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043240,
        "dEQP-GLES3.functional.state_qu",
        "ery.shader.vertex_attrib_stride");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043241,
        "dEQP-GLES3.functional.state_quer",
        "y.shader.vertex_attrib_normalized");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043242,
        "dEQP-GLES3.functional.state_que",
        "ry.shader.vertex_attrib_integer");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043243,
        "dEQP-GLES3.functional.state_query.",
        "shader.vertex_attrib_array_enabled");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043244,
        "dEQP-GLES3.functional.state_query.",
        "shader.vertex_attrib_array_divisor");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043245,
        "dEQP-GLES3.functional.state_query.sha",
        "der.vertex_attrib_array_buffer_binding");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043246,
        "dEQP-GLES3.functional.state_que",
        "ry.shader.vertex_attrib_pointerv");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043247,
        "dEQP-GLES3.functional.state_qu",
        "ery.shader.uniform_value_float");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043248,
        "dEQP-GLES3.functional.state_q",
        "uery.shader.uniform_value_int");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043249,
        "dEQP-GLES3.functional.state_q",
        "uery.shader.uniform_value_uint");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043250,
        "dEQP-GLES3.functional.state_que",
        "ry.shader.uniform_value_boolean");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043251,
        "dEQP-GLES3.functional.state_que",
        "ry.shader.uniform_value_sampler");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043252,
        "dEQP-GLES3.functional.state_qu",
        "ery.shader.uniform_value_array");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043253,
        "dEQP-GLES3.functional.state_qu",
        "ery.shader.uniform_value_matrix");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043254,
        "dEQP-GLES3.functional.state_query.",
        "shader.precision_vertex_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043255,
        "dEQP-GLES3.functional.state_query.s",
        "hader.precision_vertex_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043256,
        "dEQP-GLES3.functional.state_query.",
        "shader.precision_vertex_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043257,
        "dEQP-GLES3.functional.state_query",
        ".shader.precision_vertex_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043258,
        "dEQP-GLES3.functional.state_query.",
        "shader.precision_vertex_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043259,
        "dEQP-GLES3.functional.state_query",
        ".shader.precision_vertex_highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043260,
        "dEQP-GLES3.functional.state_query.s",
        "hader.precision_fragment_lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043261,
        "dEQP-GLES3.functional.state_query.sh",
        "ader.precision_fragment_mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043262,
        "dEQP-GLES3.functional.state_query.s",
        "hader.precision_fragment_highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043263,
        "dEQP-GLES3.functional.state_query.",
        "shader.precision_fragment_lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043264,
        "dEQP-GLES3.functional.state_query.s",
        "hader.precision_fragment_mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043265,
        "dEQP-GLES3.functional.state_query.",
        "shader.precision_fragment_highp_int");
