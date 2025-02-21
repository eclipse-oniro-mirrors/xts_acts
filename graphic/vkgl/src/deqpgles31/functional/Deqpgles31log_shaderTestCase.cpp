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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019006,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.shader.create_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019007,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.shader.shader_source");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019008,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.shader.compile_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019009,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.shader.delete_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019010,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.shader.shader_binary");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019011,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.shader.attach_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019012,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.shader.detach_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019013,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.shader.link_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019014,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.shader.use_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019015,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.shader.delete_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019016,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.shader.validate_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019017,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader.get_program_binary");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019018,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.shader.program_binary");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019019,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader.program_parameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019020,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.shader.gen_samplers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019021,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.shader.bind_sampler");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019022,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.shader.delete_samplers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019023,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader.get_sampler_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019024,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader.get_sampler_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019025,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.get_sampler_parameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019026,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.get_sampler_parameterIuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019027,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader.sampler_parameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019028,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader.sampler_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019029,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader.sampler_parameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019030,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader.sampler_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019031,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.shader.sampler_parameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019032,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.shader.sampler_parameterIuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019033,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader.get_attrib_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019034,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.shader.get_uniform_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019035,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.shader.bind_attrib_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019036,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.shader.uniform_block_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019037,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.uniformf_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019038,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.uniformf_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019039,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.uniformf_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019040,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.uniformfv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019041,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.uniformfv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019042,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.uniformfv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019043,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader.uniformfv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019044,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.uniformi_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019045,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.uniformi_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019046,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.uniformi_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019047,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.uniformiv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019048,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.uniformiv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019049,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.uniformiv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019050,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader.uniformiv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019051,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.uniformui_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019052,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.uniformui_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019053,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.uniformui_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019054,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.uniformuiv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019055,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.shader.uniformuiv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019056,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.uniformuiv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019057,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.uniformuiv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019058,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader.uniform_matrixfv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019059,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.shader.uniform_matrixfv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019060,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader.uniform_matrixfv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019061,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader.uniform_matrixfv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019062,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader.gen_transform_feedbacks");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019063,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader.bind_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019064,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.delete_transform_feedbacks");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019065,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.begin_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019066,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.pause_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019067,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader.resume_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019068,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader.end_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019069,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader.get_transform_feedback_varying");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019070,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.shader.transform_feedback_varyings");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019071,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader.compile_compute_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019072,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader.link_compute_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019073,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.shader.srgb_decode_samplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019074,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.shader.srgb_decode_samplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019075,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader.srgb_decode_samplerparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019076,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader.srgb_decode_samplerparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019077,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.shader.srgb_decode_samplerparameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019078,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.shader.srgb_decode_samplerparameterIuiv");
