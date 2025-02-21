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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024797,
        "dEQP-GLES31.functional.layout_binding.",
        "sampler.sampler2d.vertex_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024798,
        "dEQP-GLES31.functional.layout_binding",
        ".sampler.sampler2d.vertex_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024799,
        "dEQP-GLES31.functional.layout_binding.s",
        "ampler.sampler2d.vertex_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024800,
        "dEQP-GLES31.functional.layout_binding.",
        "sampler.sampler2d.vertex_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024801,
        "dEQP-GLES31.functional.layout_binding.sa",
        "mpler.sampler2d.vertex_binding_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024802,
        "dEQP-GLES31.functional.layout_binding.s",
        "ampler.sampler2d.fragment_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024803,
        "dEQP-GLES31.functional.layout_binding.",
        "sampler.sampler2d.fragment_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024804,
        "dEQP-GLES31.functional.layout_binding.sa",
        "mpler.sampler2d.fragment_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024805,
        "dEQP-GLES31.functional.layout_binding.s",
        "ampler.sampler2d.fragment_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024806,
        "dEQP-GLES31.functional.layout_binding.sam",
        "pler.sampler2d.fragment_binding_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024857,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.sampler.sampler2d.vertex_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024858,
        "dEQP-GLES31.functional.layout_binding.negativ",
        "e.sampler.sampler2d.fragment_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024859,
        "dEQP-GLES31.functional.layout_binding.negative.",
        "sampler.sampler2d.tess_control_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024860,
        "dEQP-GLES31.functional.layout_binding.negative.s",
        "ampler.sampler2d.tess_evaluation_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024861,
        "dEQP-GLES31.functional.layout_binding.neg",
        "ative.sampler.sampler2d.vertex_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024862,
        "dEQP-GLES31.functional.layout_binding.nega",
        "tive.sampler.sampler2d.fragment_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024863,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.sampler.sampler2d.tess_control_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024864,
        "dEQP-GLES31.functional.layout_binding.negative",
        ".sampler.sampler2d.tess_evaluation_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024865,
        "dEQP-GLES31.functional.layout_binding.negative.",
        "sampler.sampler2d.vertex_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024866,
        "dEQP-GLES31.functional.layout_binding.negative.s",
        "ampler.sampler2d.fragment_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024867,
        "dEQP-GLES31.functional.layout_binding.negative.sam",
        "pler.sampler2d.tess_control_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024868,
        "dEQP-GLES31.functional.layout_binding.negative.samp",
        "ler.sampler2d.tess_evaluation_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024869,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.sampler.sampler2d.vertex_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024870,
        "dEQP-GLES31.functional.layout_binding.negativ",
        "e.sampler.sampler2d.fragment_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024871,
        "dEQP-GLES31.functional.layout_binding.negative.",
        "sampler.sampler2d.tess_control_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024872,
        "dEQP-GLES31.functional.layout_binding.negative.sa",
        "mpler.sampler2d.tess_evaluation_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024873,
        "dEQP-GLES31.functional.layout_binding.negat",
        "ive.sampler.sampler2d.binding_contradictory");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024874,
        "dEQP-GLES31.functional.layout_binding.negative",
        ".sampler.sampler2d.binding_contradictory_array");
