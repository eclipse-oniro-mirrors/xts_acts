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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022745,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_tess_eval.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022746,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_tess_eval.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022747,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_tess_eval.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022748,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_tess_eval.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022749,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_tess_eval.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022750,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.type.separable_tess_eval.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022751,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_tess_eval.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023356,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_tess_eval.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023357,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.separable_tess_eval.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023358,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_tess_eval.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023359,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_tess_eval.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023360,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_tess_eval.struct.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023361,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_tess_eval.struct.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023362,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_tess_eval.struct.mat3x4");
