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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024847,
        "dEQP-GLES31.functional.layout_bindin",
        "g.image.image3d.vertex_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024848,
        "dEQP-GLES31.functional.layout_bindi",
        "ng.image.image3d.vertex_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024849,
        "dEQP-GLES31.functional.layout_binding",
        ".image.image3d.vertex_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024850,
        "dEQP-GLES31.functional.layout_bindin",
        "g.image.image3d.vertex_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024851,
        "dEQP-GLES31.functional.layout_binding.",
        "image.image3d.vertex_binding_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024852,
        "dEQP-GLES31.functional.layout_binding",
        ".image.image3d.fragment_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024853,
        "dEQP-GLES31.functional.layout_bindin",
        "g.image.image3d.fragment_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024854,
        "dEQP-GLES31.functional.layout_binding.",
        "image.image3d.fragment_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024855,
        "dEQP-GLES31.functional.layout_binding",
        ".image.image3d.fragment_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024856,
        "dEQP-GLES31.functional.layout_binding.i",
        "mage.image3d.fragment_binding_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024947,
        "dEQP-GLES31.functional.layout_binding.nega",
        "tive.image.image3d.vertex_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024948,
        "dEQP-GLES31.functional.layout_binding.negat",
        "ive.image.image3d.fragment_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024949,
        "dEQP-GLES31.functional.layout_binding.negativ",
        "e.image.image3d.tess_control_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024950,
        "dEQP-GLES31.functional.layout_binding.negative",
        ".image.image3d.tess_evaluation_binding_over_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024951,
        "dEQP-GLES31.functional.layout_binding.n",
        "egative.image.image3d.vertex_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024952,
        "dEQP-GLES31.functional.layout_binding.ne",
        "gative.image.image3d.fragment_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024953,
        "dEQP-GLES31.functional.layout_binding.nega",
        "tive.image.image3d.tess_control_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024954,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.image.image3d.tess_evaluation_binding_neg");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024955,
        "dEQP-GLES31.functional.layout_binding.negativ",
        "e.image.image3d.vertex_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024956,
        "dEQP-GLES31.functional.layout_binding.negative",
        ".image.image3d.fragment_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024957,
        "dEQP-GLES31.functional.layout_binding.negative.i",
        "mage.image3d.tess_control_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024958,
        "dEQP-GLES31.functional.layout_binding.negative.im",
        "age.image3d.tess_evaluation_binding_over_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024959,
        "dEQP-GLES31.functional.layout_binding.nega",
        "tive.image.image3d.vertex_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024960,
        "dEQP-GLES31.functional.layout_binding.negat",
        "ive.image.image3d.fragment_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024961,
        "dEQP-GLES31.functional.layout_binding.negativ",
        "e.image.image3d.tess_control_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024962,
        "dEQP-GLES31.functional.layout_binding.negative.",
        "image.image3d.tess_evaluation_binding_neg_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024963,
        "dEQP-GLES31.functional.layout_binding.neg",
        "ative.image.image3d.binding_contradictory");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024964,
        "dEQP-GLES31.functional.layout_binding.negati",
        "ve.image.image3d.binding_contradictory_array");
