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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024807,
        "dEQP-GLES31.functional.layout_binding.",
        "sampler.sampler3d.vertex_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024808,
        "dEQP-GLES31.functional.layout_binding",
        ".sampler.sampler3d.vertex_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024809,
        "dEQP-GLES31.functional.layout_binding.s",
        "ampler.sampler3d.vertex_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024810,
        "dEQP-GLES31.functional.layout_binding.",
        "sampler.sampler3d.vertex_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024811,
        "dEQP-GLES31.functional.layout_binding.sa",
        "mpler.sampler3d.vertex_binding_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024812,
        "dEQP-GLES31.functional.layout_binding.s",
        "ampler.sampler3d.fragment_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024813,
        "dEQP-GLES31.functional.layout_binding.",
        "sampler.sampler3d.fragment_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024814,
        "dEQP-GLES31.functional.layout_binding.sa",
        "mpler.sampler3d.fragment_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024815,
        "dEQP-GLES31.functional.layout_binding.s",
        "ampler.sampler3d.fragment_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024816,
        "dEQP-GLES31.functional.layout_binding.sam",
        "pler.sampler3d.fragment_binding_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024875,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.sampler.sampler3d.vertex_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024876,
        "dEQP-GLES31.functional.layout_binding.negativ",
        "e.sampler.sampler3d.fragment_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024877,
        "dEQP-GLES31.functional.layout_binding.negative.",
        "sampler.sampler3d.tess_control_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024878,
        "dEQP-GLES31.functional.layout_binding.negative.s",
        "ampler.sampler3d.tess_evaluation_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024879,
        "dEQP-GLES31.functional.layout_binding.neg",
        "ative.sampler.sampler3d.vertex_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024880,
        "dEQP-GLES31.functional.layout_binding.nega",
        "tive.sampler.sampler3d.fragment_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024881,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.sampler.sampler3d.tess_control_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024882,
        "dEQP-GLES31.functional.layout_binding.negative",
        ".sampler.sampler3d.tess_evaluation_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024883,
        "dEQP-GLES31.functional.layout_binding.negative.",
        "sampler.sampler3d.vertex_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024884,
        "dEQP-GLES31.functional.layout_binding.negative.s",
        "ampler.sampler3d.fragment_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024885,
        "dEQP-GLES31.functional.layout_binding.negative.sam",
        "pler.sampler3d.tess_control_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024886,
        "dEQP-GLES31.functional.layout_binding.negative.samp",
        "ler.sampler3d.tess_evaluation_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024887,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.sampler.sampler3d.vertex_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024888,
        "dEQP-GLES31.functional.layout_binding.negativ",
        "e.sampler.sampler3d.fragment_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024889,
        "dEQP-GLES31.functional.layout_binding.negative.",
        "sampler.sampler3d.tess_control_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024890,
        "dEQP-GLES31.functional.layout_binding.negative.sa",
        "mpler.sampler3d.tess_evaluation_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024891,
        "dEQP-GLES31.functional.layout_binding.negat",
        "ive.sampler.sampler3d.binding_contradictory");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024892,
        "dEQP-GLES31.functional.layout_binding.negative",
        ".sampler.sampler3d.binding_contradictory_array");