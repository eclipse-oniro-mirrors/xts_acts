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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023141,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023142,
        "dEQP-GLES31.functional.program_interface_query.trans",
        "form_feedback_varying.type.vertex_fragment.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023143,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023144,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023145,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023146,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023147,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023148,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023149,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023150,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023151,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023152,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023153,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023154,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.vertex_fragment.struct.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023155,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.vertex_fragment.struct.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023156,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.vertex_fragment.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023157,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023158,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.vertex_fragment.struct.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023159,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.vertex_fragment.struct.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023160,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.vertex_fragment.struct.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023161,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.vertex_fragment.struct.mat4");
