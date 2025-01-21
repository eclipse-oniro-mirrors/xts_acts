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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022630,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022631,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022632,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022633,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.struct.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022634,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022635,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022636,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022637,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022638,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022639,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022640,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022641,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022642,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.struct.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022643,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022644,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022645,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022646,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.struct.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022647,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022648,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022649,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_vertex.struct.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022650,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_vertex.struct.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023313,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023314,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023315,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023316,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.struct.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023317,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023318,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023319,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023320,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023321,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023322,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023323,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023324,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023325,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.struct.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023326,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023327,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023328,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023329,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.struct.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023330,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023331,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023332,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_vertex.struct.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023333,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_vertex.struct.mat4");
