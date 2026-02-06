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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024837,
        "dEQP-GLES31.functional.layout_bindin",
        "g.image.image2d.vertex_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024838,
        "dEQP-GLES31.functional.layout_bindi",
        "ng.image.image2d.vertex_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024839,
        "dEQP-GLES31.functional.layout_binding",
        ".image.image2d.vertex_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024840,
        "dEQP-GLES31.functional.layout_bindin",
        "g.image.image2d.vertex_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024841,
        "dEQP-GLES31.functional.layout_binding.",
        "image.image2d.vertex_binding_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024842,
        "dEQP-GLES31.functional.layout_binding",
        ".image.image2d.fragment_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024843,
        "dEQP-GLES31.functional.layout_bindin",
        "g.image.image2d.fragment_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024844,
        "dEQP-GLES31.functional.layout_binding.",
        "image.image2d.fragment_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024845,
        "dEQP-GLES31.functional.layout_binding",
        ".image.image2d.fragment_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024846,
        "dEQP-GLES31.functional.layout_binding.i",
        "mage.image2d.fragment_binding_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024929,
        "dEQP-GLES31.functional.layout_binding.nega",
        "tive.image.image2d.vertex_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024930,
        "dEQP-GLES31.functional.layout_binding.negat",
        "ive.image.image2d.fragment_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024931,
        "dEQP-GLES31.functional.layout_binding.negativ",
        "e.image.image2d.tess_control_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024932,
        "dEQP-GLES31.functional.layout_binding.negative",
        ".image.image2d.tess_evaluation_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024933,
        "dEQP-GLES31.functional.layout_binding.n",
        "egative.image.image2d.vertex_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024934,
        "dEQP-GLES31.functional.layout_binding.ne",
        "gative.image.image2d.fragment_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024935,
        "dEQP-GLES31.functional.layout_binding.nega",
        "tive.image.image2d.tess_control_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024936,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.image.image2d.tess_evaluation_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024937,
        "dEQP-GLES31.functional.layout_binding.negativ",
        "e.image.image2d.vertex_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024938,
        "dEQP-GLES31.functional.layout_binding.negative",
        ".image.image2d.fragment_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024939,
        "dEQP-GLES31.functional.layout_binding.negative.i",
        "mage.image2d.tess_control_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024940,
        "dEQP-GLES31.functional.layout_binding.negative.im",
        "age.image2d.tess_evaluation_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024941,
        "dEQP-GLES31.functional.layout_binding.nega",
        "tive.image.image2d.vertex_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024942,
        "dEQP-GLES31.functional.layout_binding.negat",
        "ive.image.image2d.fragment_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024943,
        "dEQP-GLES31.functional.layout_binding.negativ",
        "e.image.image2d.tess_control_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024944,
        "dEQP-GLES31.functional.layout_binding.negative.",
        "image.image2d.tess_evaluation_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024945,
        "dEQP-GLES31.functional.layout_binding.neg",
        "ative.image.image2d.binding_contradictory");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024946,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.image.image2d.binding_contradictory_array");
