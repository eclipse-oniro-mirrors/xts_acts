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
#include "../ActsDeqpgles310023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022082,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022083,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_tess_eval.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022084,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_tess_eval.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022085,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_tess_eval.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022086,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_tess_eval.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022087,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_tess_eval.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022088,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022089,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022090,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022091,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022092,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022093,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022094,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_tess_eval.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022095,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022096,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022097,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022098,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_tess_eval.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022099,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022100,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022101,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_tess_eval.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022102,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_tess_eval.basic_type.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022717,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022718,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_tess_eval.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022719,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022720,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022721,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022722,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022723,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022724,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022725,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022726,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022727,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022728,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022729,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022730,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_eval.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022731,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_eval.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022732,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_eval.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022733,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022734,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_eval.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022735,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_eval.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022736,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_eval.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022737,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_eval.basic_type.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023335,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_tess_eval.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023336,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_tess_eval.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023337,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_tess_eval.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023338,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_tess_eval.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023339,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_tess_eval.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023340,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_tess_eval.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023341,
        "dEQP-GLES31.functional.program_interface_query.transform_f",
        "eedback_varying.type.separable_tess_eval.basic_type.mat3x4");
