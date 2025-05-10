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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019503,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.shader.create_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019504,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.shader.shader_source");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019505,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.shader.compile_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019506,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.shader.delete_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019507,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.shader.shader_binary");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019508,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.shader.attach_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019509,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.shader.detach_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019510,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.shader.link_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019511,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.shader.use_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019512,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.shader.delete_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019513,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.shader.validate_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019514,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader.get_program_binary");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019515,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.shader.program_binary");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019516,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader.program_parameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019517,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.shader.gen_samplers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019518,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.shader.bind_sampler");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019519,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.shader.delete_samplers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019520,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader.get_sampler_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019521,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader.get_sampler_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019522,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.get_sampler_parameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019523,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.get_sampler_parameterIuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019524,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader.sampler_parameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019525,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader.sampler_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019526,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader.sampler_parameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019527,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader.sampler_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019528,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader.sampler_parameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019529,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader.sampler_parameterIuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019530,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader.get_attrib_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019531,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader.get_uniform_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019532,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader.bind_attrib_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019533,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader.uniform_block_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019534,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.uniformf_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019535,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.uniformf_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019536,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.uniformf_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019537,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.uniformfv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019538,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.uniformfv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019539,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.uniformfv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019540,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader.uniformfv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019541,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.uniformi_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019542,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.uniformi_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019543,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.uniformi_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019544,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.uniformiv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019545,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.uniformiv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019546,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.uniformiv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019547,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader.uniformiv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019548,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.uniformui_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019549,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.uniformui_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019550,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.uniformui_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019551,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.uniformuiv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019552,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.shader.uniformuiv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019553,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.uniformuiv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019554,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.uniformuiv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019555,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader.uniform_matrixfv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019556,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.shader.uniform_matrixfv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019557,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader.uniform_matrixfv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019558,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader.uniform_matrixfv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019559,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader.gen_transform_feedbacks");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019560,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader.bind_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019561,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.delete_transform_feedbacks");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019562,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.begin_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019563,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.pause_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019564,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.shader.resume_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019565,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader.end_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019566,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader.get_transform_feedback_varying");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019567,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.shader.transform_feedback_varyings");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019568,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader.compile_compute_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019569,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader.link_compute_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019570,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.shader.srgb_decode_samplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019571,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.shader.srgb_decode_samplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019572,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader.srgb_decode_samplerparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019573,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader.srgb_decode_samplerparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019574,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.shader.srgb_decode_samplerparameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019575,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.shader.srgb_decode_samplerparameterIuiv");
