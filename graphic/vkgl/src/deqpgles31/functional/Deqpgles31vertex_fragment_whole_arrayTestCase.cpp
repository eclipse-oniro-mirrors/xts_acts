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
#include "../ActsDeqpgles310024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023120,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023121,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.whole_array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023122,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.whole_array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023123,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.whole_array.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023124,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.whole_array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023125,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.whole_array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023126,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023127,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023128,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023129,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023130,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023131,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023132,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.whole_array.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023133,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023134,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023135,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023136,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.whole_array.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023137,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023138,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023139,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.vertex_fragment.whole_array.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023140,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_fragment.whole_array.mat4");
