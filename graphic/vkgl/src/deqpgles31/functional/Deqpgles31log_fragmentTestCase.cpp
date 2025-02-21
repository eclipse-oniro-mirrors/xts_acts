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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019079,
        "dEQP-GLES31.functional.debug.nega",
        "tive_coverage.log.fragment.scissor");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019080,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.fragment.depth_func");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019081,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.fragment.viewport");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019082,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.fragment.stencil_func");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019083,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.fragment.stencil_func_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019084,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.fragment.stencil_op");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019085,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.fragment.stencil_op_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019086,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.fragment.stencil_mask_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019087,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.fragment.blend_equation");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019088,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.fragment.blend_equationi");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019089,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.fragment.blend_equation_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019090,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.fragment.blend_equation_separatei");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019091,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.fragment.blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019092,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.fragment.blend_funci");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019093,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.fragment.blend_func_separate");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019094,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.fragment.blend_func_separatei");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019095,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.fragment.cull_face");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019096,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.fragment.front_face");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019097,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.fragment.line_width");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019098,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.fragment.gen_queries");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019099,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.fragment.begin_query");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019100,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.fragment.end_query");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019101,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.fragment.delete_queries");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019102,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.fragment.fence_sync");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019103,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.fragment.wait_sync");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019104,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.fragment.client_wait_sync");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019105,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.fragment.delete_sync");
