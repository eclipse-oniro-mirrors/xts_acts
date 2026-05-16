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
#include "../ActsDeqpgles310025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024893,
        "dEQP-GLES31.functional.layout_binding",
        ".negative.ubo.vertex_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024894,
        "dEQP-GLES31.functional.layout_binding.",
        "negative.ubo.fragment_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024895,
        "dEQP-GLES31.functional.layout_binding.ne",
        "gative.ubo.tess_control_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024896,
        "dEQP-GLES31.functional.layout_binding.neg",
        "ative.ubo.tess_evaluation_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024897,
        "dEQP-GLES31.functional.layout_bind",
        "ing.negative.ubo.vertex_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024898,
        "dEQP-GLES31.functional.layout_bindi",
        "ng.negative.ubo.fragment_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024899,
        "dEQP-GLES31.functional.layout_binding",
        ".negative.ubo.tess_control_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024900,
        "dEQP-GLES31.functional.layout_binding.n",
        "egative.ubo.tess_evaluation_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024901,
        "dEQP-GLES31.functional.layout_binding.ne",
        "gative.ubo.vertex_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024902,
        "dEQP-GLES31.functional.layout_binding.neg",
        "ative.ubo.fragment_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024903,
        "dEQP-GLES31.functional.layout_binding.negat",
        "ive.ubo.tess_control_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024904,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.ubo.tess_evaluation_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024905,
        "dEQP-GLES31.functional.layout_binding",
        ".negative.ubo.vertex_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024906,
        "dEQP-GLES31.functional.layout_binding.",
        "negative.ubo.fragment_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024907,
        "dEQP-GLES31.functional.layout_binding.ne",
        "gative.ubo.tess_control_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024908,
        "dEQP-GLES31.functional.layout_binding.nega",
        "tive.ubo.tess_evaluation_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024909,
        "dEQP-GLES31.functional.layout_bindin",
        "g.negative.ubo.binding_contradictory");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024910,
        "dEQP-GLES31.functional.layout_binding.n",
        "egative.ubo.binding_contradictory_array");
