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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022780,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_geometry.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022781,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_geometry.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022782,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_geometry.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022783,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_geometry.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022784,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_geometry.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022785,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_geometry.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022786,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_geometry.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023385,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_geometry.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023386,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_geometry.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023387,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_geometry.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023388,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_geometry.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023389,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_geometry.struct.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023390,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_geometry.struct.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023391,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_geometry.struct.mat3x4");
