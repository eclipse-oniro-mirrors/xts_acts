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
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043327,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.poly_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043328,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.poly_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043329,
        "dEQP-GLES3.functional.cli",
        "pping.polygon.poly_z_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043330,
        "dEQP-GLES3.functional.clipping.po",
        "lygon.poly_z_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043331,
        "dEQP-GLES3.functional.clipping.po",
        "lygon.poly_z_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043332,
        "dEQP-GLES3.functional.clipping.poly",
        "gon.large_poly_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043333,
        "dEQP-GLES3.functional.clipping.poly",
        "gon.large_poly_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043334,
        "dEQP-GLES3.functional.clippi",
        "ng.polygon.large_poly_z_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043335,
        "dEQP-GLES3.functional.clipping.polyg",
        "on.large_poly_z_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043336,
        "dEQP-GLES3.functional.clipping.polyg",
        "on.large_poly_z_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043337,
        "dEQP-GLES3.functional.clipp",
        "ing.polygon.poly_attrib_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043338,
        "dEQP-GLES3.functional.clipping.poly",
        "gon.poly_attrib_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043339,
        "dEQP-GLES3.functional.clipping.poly",
        "gon.poly_attrib_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043340,
        "dEQP-GLES3.functional.cl",
        "ipping.polygon.multiple_0");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043341,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_0_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043342,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_0_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043343,
        "dEQP-GLES3.functional.cl",
        "ipping.polygon.multiple_1");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043344,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_1_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043345,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_1_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043346,
        "dEQP-GLES3.functional.cl",
        "ipping.polygon.multiple_2");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043347,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_2_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043348,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_2_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043349,
        "dEQP-GLES3.functional.cl",
        "ipping.polygon.multiple_3");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043350,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_3_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043351,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_3_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043352,
        "dEQP-GLES3.functional.cl",
        "ipping.polygon.multiple_4");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043353,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_4_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043354,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_4_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043355,
        "dEQP-GLES3.functional.cl",
        "ipping.polygon.multiple_5");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043356,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_5_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043357,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_5_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043358,
        "dEQP-GLES3.functional.cl",
        "ipping.polygon.multiple_6");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043359,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_6_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043360,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_6_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043361,
        "dEQP-GLES3.functional.cl",
        "ipping.polygon.multiple_7");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043362,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_7_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043363,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_7_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043364,
        "dEQP-GLES3.functional.cl",
        "ipping.polygon.multiple_8");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043365,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_8_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043366,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_8_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043367,
        "dEQP-GLES3.functional.cl",
        "ipping.polygon.multiple_9");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043368,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_9_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043369,
        "dEQP-GLES3.functional.clipping.p",
        "olygon.multiple_9_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043370,
        "dEQP-GLES3.functional.cli",
        "pping.polygon.multiple_10");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043371,
        "dEQP-GLES3.functional.clipping.po",
        "lygon.multiple_10_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043372,
        "dEQP-GLES3.functional.clipping.po",
        "lygon.multiple_10_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043373,
        "dEQP-GLES3.functional.cli",
        "pping.polygon.multiple_11");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043374,
        "dEQP-GLES3.functional.clipping.po",
        "lygon.multiple_11_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043375,
        "dEQP-GLES3.functional.clipping.po",
        "lygon.multiple_11_viewport_corner");
