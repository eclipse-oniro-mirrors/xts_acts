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

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042059,
        "dEQP-GLES3.functional.negat",
        "ive_api.shader.create_shader");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042060,
        "dEQP-GLES3.functional.negat",
        "ive_api.shader.shader_source");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042061,
        "dEQP-GLES3.functional.negati",
        "ve_api.shader.compile_shader");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042062,
        "dEQP-GLES3.functional.negat",
        "ive_api.shader.delete_shader");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042063,
        "dEQP-GLES3.functional.negat",
        "ive_api.shader.shader_binary");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042064,
        "dEQP-GLES3.functional.negat",
        "ive_api.shader.attach_shader");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042065,
        "dEQP-GLES3.functional.negat",
        "ive_api.shader.detach_shader");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042066,
        "dEQP-GLES3.functional.negat",
        "ive_api.shader.link_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042067,
        "dEQP-GLES3.functional.nega",
        "tive_api.shader.use_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042068,
        "dEQP-GLES3.functional.negati",
        "ve_api.shader.delete_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042069,
        "dEQP-GLES3.functional.negativ",
        "e_api.shader.validate_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042070,
        "dEQP-GLES3.functional.negative",
        "_api.shader.get_program_binary");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042071,
        "dEQP-GLES3.functional.negati",
        "ve_api.shader.program_binary");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042072,
        "dEQP-GLES3.functional.negative",
        "_api.shader.program_parameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042073,
        "dEQP-GLES3.functional.negat",
        "ive_api.shader.gen_samplers");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042074,
        "dEQP-GLES3.functional.negat",
        "ive_api.shader.bind_sampler");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042075,
        "dEQP-GLES3.functional.negati",
        "ve_api.shader.delete_samplers");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042076,
        "dEQP-GLES3.functional.negative_a",
        "pi.shader.get_sampler_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042077,
        "dEQP-GLES3.functional.negative_a",
        "pi.shader.get_sampler_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042078,
        "dEQP-GLES3.functional.negative",
        "_api.shader.sampler_parameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042079,
        "dEQP-GLES3.functional.negative",
        "_api.shader.sampler_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042080,
        "dEQP-GLES3.functional.negative",
        "_api.shader.sampler_parameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042081,
        "dEQP-GLES3.functional.negative",
        "_api.shader.sampler_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042082,
        "dEQP-GLES3.functional.negative",
        "_api.shader.get_attrib_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042083,
        "dEQP-GLES3.functional.negative_",
        "api.shader.get_uniform_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042084,
        "dEQP-GLES3.functional.negative_",
        "api.shader.bind_attrib_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042085,
        "dEQP-GLES3.functional.negative_",
        "api.shader.uniform_block_binding");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042086,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.uniformf_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042087,
        "dEQP-GLES3.functional.negative_api",
        ".shader.uniformf_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042088,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.uniformf_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042089,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.uniformfv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042090,
        "dEQP-GLES3.functional.negative_api",
        ".shader.uniformfv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042091,
        "dEQP-GLES3.functional.negative_api",
        ".shader.uniformfv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042092,
        "dEQP-GLES3.functional.negative_a",
        "pi.shader.uniformfv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042093,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.uniformi_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042094,
        "dEQP-GLES3.functional.negative_api",
        ".shader.uniformi_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042095,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.uniformi_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042096,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.uniformiv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042097,
        "dEQP-GLES3.functional.negative_api",
        ".shader.uniformiv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042098,
        "dEQP-GLES3.functional.negative_api",
        ".shader.uniformiv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042099,
        "dEQP-GLES3.functional.negative_a",
        "pi.shader.uniformiv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042100,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.uniformui_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042101,
        "dEQP-GLES3.functional.negative_api",
        ".shader.uniformui_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042102,
        "dEQP-GLES3.functional.negative_api",
        ".shader.uniformui_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042103,
        "dEQP-GLES3.functional.negative_api",
        ".shader.uniformuiv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042104,
        "dEQP-GLES3.functional.negative_api.",
        "shader.uniformuiv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042105,
        "dEQP-GLES3.functional.negative_api",
        ".shader.uniformuiv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042106,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.uniformuiv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042107,
        "dEQP-GLES3.functional.negative_api.sh",
        "ader.uniform_matrixfv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042108,
        "dEQP-GLES3.functional.negative_api.sha",
        "der.uniform_matrixfv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042109,
        "dEQP-GLES3.functional.negative_api.sh",
        "ader.uniform_matrixfv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042110,
        "dEQP-GLES3.functional.negative_api.s",
        "hader.uniform_matrixfv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042111,
        "dEQP-GLES3.functional.negative_a",
        "pi.shader.gen_transform_feedbacks");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042112,
        "dEQP-GLES3.functional.negative_a",
        "pi.shader.bind_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042113,
        "dEQP-GLES3.functional.negative_api",
        ".shader.delete_transform_feedbacks");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042114,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.begin_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042115,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.pause_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042116,
        "dEQP-GLES3.functional.negative_ap",
        "i.shader.resume_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042117,
        "dEQP-GLES3.functional.negative_a",
        "pi.shader.end_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042118,
        "dEQP-GLES3.functional.negative_api.s",
        "hader.get_transform_feedback_varying");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042119,
        "dEQP-GLES3.functional.negative_api",
        ".shader.transform_feedback_varyings");
