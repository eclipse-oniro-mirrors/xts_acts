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
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019576,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.get_error.fragment.scissor");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019577,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.fragment.depth_func");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019578,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.fragment.viewport");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019579,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.fragment.stencil_func");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019580,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.fragment.stencil_func_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019581,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.fragment.stencil_op");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019582,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.fragment.stencil_op_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019583,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.fragment.stencil_mask_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019584,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.fragment.blend_equation");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019585,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.fragment.blend_equationi");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019586,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.fragment.blend_equation_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019587,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.fragment.blend_equation_separatei");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019588,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.fragment.blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019589,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.fragment.blend_funci");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019590,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.fragment.blend_func_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019591,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.fragment.blend_func_separatei");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019592,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.fragment.cull_face");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019593,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.fragment.front_face");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019594,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.fragment.line_width");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019595,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.fragment.gen_queries");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019596,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.fragment.begin_query");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019597,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.fragment.end_query");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019598,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.fragment.delete_queries");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019599,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.fragment.fence_sync");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019600,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.fragment.wait_sync");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019601,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.fragment.client_wait_sync");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019602,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.fragment.delete_sync");
