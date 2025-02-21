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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022588,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022589,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_vertex.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022590,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_vertex.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022591,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_vertex.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022592,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_vertex.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022593,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_vertex.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022594,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022595,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022596,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022597,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022598,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022599,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022600,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_vertex.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022601,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022602,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022603,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022604,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_vertex.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022605,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022606,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022607,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_vertex.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022608,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_vertex.basic_type.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023250,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023251,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_vertex.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023252,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_vertex.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023253,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_vertex.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023254,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_vertex.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023255,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_vertex.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023256,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023257,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023258,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023259,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023260,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023261,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023262,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_vertex.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023263,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023264,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023265,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023266,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_vertex.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023267,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023268,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023269,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023270,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_vertex.basic_type.mat4");
