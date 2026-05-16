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

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018508,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.shader.create_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018509,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.shader.shader_source");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018510,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.shader.compile_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018511,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.shader.delete_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018512,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.shader.shader_binary");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018513,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.shader.attach_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018514,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.shader.detach_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018515,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.shader.link_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018516,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.shader.use_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018517,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.shader.delete_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018518,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.shader.validate_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018519,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader.get_program_binary");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018520,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.shader.program_binary");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018521,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader.program_parameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018522,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.shader.gen_samplers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018523,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.shader.bind_sampler");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018524,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.shader.delete_samplers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018525,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader.get_sampler_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018526,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader.get_sampler_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018527,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.get_sampler_parameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018528,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.get_sampler_parameterIuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018529,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader.sampler_parameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018530,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader.sampler_parameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018531,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader.sampler_parameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018532,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader.sampler_parameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018533,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader.sampler_parameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018534,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader.sampler_parameterIuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018535,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader.get_attrib_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018536,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader.get_uniform_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018537,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader.bind_attrib_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018538,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader.uniform_block_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018539,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.uniformf_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018540,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.uniformf_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018541,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.uniformf_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018542,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.uniformfv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018543,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.uniformfv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018544,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.uniformfv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018545,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader.uniformfv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018546,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.uniformi_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018547,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.uniformi_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018548,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.uniformi_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018549,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.uniformiv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018550,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.uniformiv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018551,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.uniformiv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018552,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader.uniformiv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018553,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.uniformui_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018554,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.uniformui_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018555,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.uniformui_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018556,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.uniformuiv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018557,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.shader.uniformuiv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018558,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.uniformuiv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018559,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.uniformuiv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018560,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader.uniform_matrixfv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018561,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.shader.uniform_matrixfv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018562,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader.uniform_matrixfv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018563,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader.uniform_matrixfv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018564,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader.gen_transform_feedbacks");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018565,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader.bind_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018566,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.delete_transform_feedbacks");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018567,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.begin_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018568,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.pause_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018569,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader.resume_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018570,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader.end_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018571,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader.get_transform_feedback_varying");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018572,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.shader.transform_feedback_varyings");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018573,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader.compile_compute_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018574,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader.link_compute_shader");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018575,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.shader.srgb_decode_samplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018576,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.shader.srgb_decode_samplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018577,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader.srgb_decode_samplerparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018578,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader.srgb_decode_samplerparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018579,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.shader.srgb_decode_samplerparameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018580,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.shader.srgb_decode_samplerparameterIuiv");
