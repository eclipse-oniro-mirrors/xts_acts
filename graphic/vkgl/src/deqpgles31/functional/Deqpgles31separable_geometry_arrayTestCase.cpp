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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022773,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_geometry.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022774,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_geometry.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022775,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_geometry.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022776,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_geometry.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022777,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_geometry.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022778,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_geometry.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022779,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_geometry.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023371,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_geometry.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023372,
        "dEQP-GLES31.functional.program_interface_query.transf",
        "orm_feedback_varying.type.separable_geometry.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023373,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_geometry.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023374,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_geometry.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023375,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_geometry.array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023376,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_geometry.array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023377,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_geometry.array.mat3x4");
