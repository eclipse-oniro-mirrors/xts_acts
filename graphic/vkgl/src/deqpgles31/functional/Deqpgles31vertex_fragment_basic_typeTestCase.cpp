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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022564,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022565,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.vertex_fragment.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022566,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022567,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022568,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022569,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022570,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022571,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022572,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022573,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022574,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022575,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.vertex_fragment.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023078,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023079,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.vertex_fragment.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023080,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023081,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023082,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023083,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023084,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023085,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023086,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023087,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023088,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023089,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023090,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023091,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023092,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023093,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023094,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023095,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023096,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023097,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023098,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.basic_type.mat4");
