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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022738,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_tess_eval.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022739,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_tess_eval.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022740,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_tess_eval.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022741,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_tess_eval.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022742,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_tess_eval.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022743,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_tess_eval.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022744,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_tess_eval.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023342,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_tess_eval.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023343,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_tess_eval.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023344,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_tess_eval.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023345,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_tess_eval.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023346,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_tess_eval.array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023347,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_tess_eval.array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023348,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_tess_eval.array.mat3x4");
