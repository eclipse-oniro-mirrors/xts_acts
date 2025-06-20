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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30043TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042120,
        "dEQP-GLES3.functional.neg",
        "ative_api.fragment.scissor");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042121,
        "dEQP-GLES3.functional.negat",
        "ive_api.fragment.depth_func");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042122,
        "dEQP-GLES3.functional.nega",
        "tive_api.fragment.viewport");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042123,
        "dEQP-GLES3.functional.negati",
        "ve_api.fragment.stencil_func");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042124,
        "dEQP-GLES3.functional.negative_a",
        "pi.fragment.stencil_func_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042125,
        "dEQP-GLES3.functional.negat",
        "ive_api.fragment.stencil_op");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042126,
        "dEQP-GLES3.functional.negative_",
        "api.fragment.stencil_op_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042127,
        "dEQP-GLES3.functional.negative_a",
        "pi.fragment.stencil_mask_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042128,
        "dEQP-GLES3.functional.negativ",
        "e_api.fragment.blend_equation");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042129,
        "dEQP-GLES3.functional.negative_ap",
        "i.fragment.blend_equation_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042130,
        "dEQP-GLES3.functional.negat",
        "ive_api.fragment.blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042131,
        "dEQP-GLES3.functional.negative_",
        "api.fragment.blend_func_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042132,
        "dEQP-GLES3.functional.nega",
        "tive_api.fragment.cull_face");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042133,
        "dEQP-GLES3.functional.negat",
        "ive_api.fragment.front_face");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042134,
        "dEQP-GLES3.functional.negat",
        "ive_api.fragment.line_width");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042135,
        "dEQP-GLES3.functional.negat",
        "ive_api.fragment.gen_queries");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042136,
        "dEQP-GLES3.functional.negat",
        "ive_api.fragment.begin_query");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042137,
        "dEQP-GLES3.functional.nega",
        "tive_api.fragment.end_query");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042138,
        "dEQP-GLES3.functional.negativ",
        "e_api.fragment.delete_queries");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042139,
        "dEQP-GLES3.functional.negat",
        "ive_api.fragment.fence_sync");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042140,
        "dEQP-GLES3.functional.nega",
        "tive_api.fragment.wait_sync");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042141,
        "dEQP-GLES3.functional.negative",
        "_api.fragment.client_wait_sync");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042142,
        "dEQP-GLES3.functional.negat",
        "ive_api.fragment.delete_sync");
