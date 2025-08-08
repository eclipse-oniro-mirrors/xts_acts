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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022576,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.vertex_fragment.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022577,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_output.type.vertex_fragment.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022578,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_output.type.vertex_fragment.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022579,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_output.type.vertex_fragment.array.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022580,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_output.type.vertex_fragment.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022581,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_output.type.vertex_fragment.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022582,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.vertex_fragment.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022583,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.vertex_fragment.array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022584,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.vertex_fragment.array.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022585,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.vertex_fragment.array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022586,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.vertex_fragment.array.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022587,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.vertex_fragment.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023099,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023100,
        "dEQP-GLES31.functional.program_interface_query.trans",
        "form_feedback_varying.type.vertex_fragment.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023101,
        "dEQP-GLES31.functional.program_interface_query.trans",
        "form_feedback_varying.type.vertex_fragment.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023102,
        "dEQP-GLES31.functional.program_interface_query.trans",
        "form_feedback_varying.type.vertex_fragment.array.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023103,
        "dEQP-GLES31.functional.program_interface_query.trans",
        "form_feedback_varying.type.vertex_fragment.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023104,
        "dEQP-GLES31.functional.program_interface_query.trans",
        "form_feedback_varying.type.vertex_fragment.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023105,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023106,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023107,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023108,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023109,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023110,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023111,
        "dEQP-GLES31.functional.program_interface_query.trans",
        "form_feedback_varying.type.vertex_fragment.array.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023112,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023113,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023114,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023115,
        "dEQP-GLES31.functional.program_interface_query.trans",
        "form_feedback_varying.type.vertex_fragment.array.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023116,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023117,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023118,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.array.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023119,
        "dEQP-GLES31.functional.program_interface_query.trans",
        "form_feedback_varying.type.vertex_fragment.array.mat4");
