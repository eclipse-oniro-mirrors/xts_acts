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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018581,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.callbacks.fragment.scissor");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018582,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.fragment.depth_func");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018583,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.fragment.viewport");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018584,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.fragment.stencil_func");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018585,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.fragment.stencil_func_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018586,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.fragment.stencil_op");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018587,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.fragment.stencil_op_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018588,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.fragment.stencil_mask_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018589,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.fragment.blend_equation");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018590,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.fragment.blend_equationi");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018591,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.fragment.blend_equation_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018592,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.fragment.blend_equation_separatei");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018593,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.fragment.blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018594,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.fragment.blend_funci");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018595,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.fragment.blend_func_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018596,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.fragment.blend_func_separatei");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018597,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.fragment.cull_face");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018598,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.fragment.front_face");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018599,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.fragment.line_width");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018600,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.fragment.gen_queries");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018601,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.fragment.begin_query");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018602,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.fragment.end_query");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018603,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.fragment.delete_queries");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018604,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.fragment.fence_sync");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018605,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.fragment.wait_sync");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018606,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.fragment.client_wait_sync");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018607,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.fragment.delete_sync");
