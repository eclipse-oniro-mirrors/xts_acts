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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015727,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.poly_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015728,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.poly_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015729,
        "dEQP-GLES2.functional.cli",
        "pping.polygon.poly_z_clip");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015730,
        "dEQP-GLES2.functional.clipping.po",
        "lygon.poly_z_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015731,
        "dEQP-GLES2.functional.clipping.po",
        "lygon.poly_z_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015732,
        "dEQP-GLES2.functional.clipping.poly",
        "gon.large_poly_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015733,
        "dEQP-GLES2.functional.clipping.poly",
        "gon.large_poly_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015734,
        "dEQP-GLES2.functional.clippi",
        "ng.polygon.large_poly_z_clip");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015735,
        "dEQP-GLES2.functional.clipping.polyg",
        "on.large_poly_z_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015736,
        "dEQP-GLES2.functional.clipping.polyg",
        "on.large_poly_z_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015737,
        "dEQP-GLES2.functional.clipp",
        "ing.polygon.poly_attrib_clip");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015738,
        "dEQP-GLES2.functional.clipping.poly",
        "gon.poly_attrib_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015739,
        "dEQP-GLES2.functional.clipping.poly",
        "gon.poly_attrib_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015740,
        "dEQP-GLES2.functional.cl",
        "ipping.polygon.multiple_0");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015741,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_0_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015742,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_0_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015743,
        "dEQP-GLES2.functional.cl",
        "ipping.polygon.multiple_1");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015744,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_1_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015745,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_1_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015746,
        "dEQP-GLES2.functional.cl",
        "ipping.polygon.multiple_2");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015747,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_2_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015748,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_2_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015749,
        "dEQP-GLES2.functional.cl",
        "ipping.polygon.multiple_3");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015750,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_3_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015751,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_3_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015752,
        "dEQP-GLES2.functional.cl",
        "ipping.polygon.multiple_4");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015753,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_4_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015754,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_4_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015755,
        "dEQP-GLES2.functional.cl",
        "ipping.polygon.multiple_5");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015756,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_5_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015757,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_5_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015758,
        "dEQP-GLES2.functional.cl",
        "ipping.polygon.multiple_6");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015759,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_6_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015760,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_6_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015761,
        "dEQP-GLES2.functional.cl",
        "ipping.polygon.multiple_7");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015762,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_7_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015763,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_7_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015764,
        "dEQP-GLES2.functional.cl",
        "ipping.polygon.multiple_8");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015765,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_8_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015766,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_8_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015767,
        "dEQP-GLES2.functional.cl",
        "ipping.polygon.multiple_9");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015768,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_9_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015769,
        "dEQP-GLES2.functional.clipping.p",
        "olygon.multiple_9_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015770,
        "dEQP-GLES2.functional.cli",
        "pping.polygon.multiple_10");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015771,
        "dEQP-GLES2.functional.clipping.po",
        "lygon.multiple_10_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015772,
        "dEQP-GLES2.functional.clipping.po",
        "lygon.multiple_10_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015773,
        "dEQP-GLES2.functional.cli",
        "pping.polygon.multiple_11");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015774,
        "dEQP-GLES2.functional.clipping.po",
        "lygon.multiple_11_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015775,
        "dEQP-GLES2.functional.clipping.po",
        "lygon.multiple_11_viewport_corner");
