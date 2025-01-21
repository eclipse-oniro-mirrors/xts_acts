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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022609,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022610,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_output.type.separable_vertex.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022611,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022612,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022613,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022614,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022615,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022616,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022617,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022618,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022619,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022620,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022621,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022622,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.array.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022623,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.array.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022624,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022625,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022626,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.array.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022627,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.array.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022628,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.array.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022629,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.array.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023271,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023272,
        "dEQP-GLES31.functional.program_interface_query.trans",
        "form_feedback_varying.type.separable_vertex.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023273,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023274,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023275,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023276,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023277,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023278,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023279,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023280,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023281,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023282,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023283,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023284,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.array.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023285,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.array.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023286,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023287,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023288,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.array.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023289,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.array.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023290,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.array.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023291,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.array.mat4");
