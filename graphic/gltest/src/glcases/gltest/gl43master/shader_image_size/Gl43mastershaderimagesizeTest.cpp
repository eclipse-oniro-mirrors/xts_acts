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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005789,
    "KHR-GL43.shader_image_size.basic-nonMS-vs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005790,
    "KHR-GL43.shader_image_size.basic-nonMS-vs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005791,
    "KHR-GL43.shader_image_size.basic-nonMS-vs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005792,
    "KHR-GL43.shader_image_size.basic-nonMS-tcs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005793,
    "KHR-GL43.shader_image_size.basic-nonMS-tcs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005794,
    "KHR-GL43.shader_image_size.basic-nonMS-tcs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005795,
    "KHR-GL43.shader_image_size.basic-nonMS-tes-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005796,
    "KHR-GL43.shader_image_size.basic-nonMS-tes-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005797,
    "KHR-GL43.shader_image_size.basic-nonMS-tes-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005798,
    "KHR-GL43.shader_image_size.basic-nonMS-gs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005799,
    "KHR-GL43.shader_image_size.basic-nonMS-gs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005800,
    "KHR-GL43.shader_image_size.basic-nonMS-gs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005801,
    "KHR-GL43.shader_image_size.basic-nonMS-fs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005802,
    "KHR-GL43.shader_image_size.basic-nonMS-fs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005803,
    "KHR-GL43.shader_image_size.basic-nonMS-fs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005804,
    "KHR-GL43.shader_image_size.basic-nonMS-cs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005805,
    "KHR-GL43.shader_image_size.basic-nonMS-cs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005806,
    "KHR-GL43.shader_image_size.basic-nonMS-cs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005807,
    "KHR-GL43.shader_image_size.basic-ms-vs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005808,
    "KHR-GL43.shader_image_size.basic-ms-vs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005809,
    "KHR-GL43.shader_image_size.basic-ms-vs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005810,
    "KHR-GL43.shader_image_size.basic-ms-tcs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005811,
    "KHR-GL43.shader_image_size.basic-ms-tcs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005812,
    "KHR-GL43.shader_image_size.basic-ms-tcs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005813,
    "KHR-GL43.shader_image_size.basic-ms-tes-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005814,
    "KHR-GL43.shader_image_size.basic-ms-tes-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005815,
    "KHR-GL43.shader_image_size.basic-ms-tes-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005816,
    "KHR-GL43.shader_image_size.basic-ms-gs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005817,
    "KHR-GL43.shader_image_size.basic-ms-gs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005818,
    "KHR-GL43.shader_image_size.basic-ms-gs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005819,
    "KHR-GL43.shader_image_size.basic-ms-fs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005820,
    "KHR-GL43.shader_image_size.basic-ms-fs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005821,
    "KHR-GL43.shader_image_size.basic-ms-fs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005822,
    "KHR-GL43.shader_image_size.basic-ms-cs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005823,
    "KHR-GL43.shader_image_size.basic-ms-cs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005824,
    "KHR-GL43.shader_image_size.basic-ms-cs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005825,
    "KHR-GL43.shader_image_size.advanced-changeSize");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005826,
    "KHR-GL43.shader_image_size.advanced-nonMS-vs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005827,
    "KHR-GL43.shader_image_size.advanced-nonMS-vs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005828,
    "KHR-GL43.shader_image_size.advanced-nonMS-vs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005829,
    "KHR-GL43.shader_image_size.advanced-nonMS-tcs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005830,
    "KHR-GL43.shader_image_size.advanced-nonMS-tcs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005831,
    "KHR-GL43.shader_image_size.advanced-nonMS-tcs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005832,
    "KHR-GL43.shader_image_size.advanced-nonMS-tes-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005833,
    "KHR-GL43.shader_image_size.advanced-nonMS-tes-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005834,
    "KHR-GL43.shader_image_size.advanced-nonMS-tes-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005835,
    "KHR-GL43.shader_image_size.advanced-nonMS-gs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005836,
    "KHR-GL43.shader_image_size.advanced-nonMS-gs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005837,
    "KHR-GL43.shader_image_size.advanced-nonMS-gs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005838,
    "KHR-GL43.shader_image_size.advanced-nonMS-fs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005839,
    "KHR-GL43.shader_image_size.advanced-nonMS-fs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005840,
    "KHR-GL43.shader_image_size.advanced-nonMS-fs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005841,
    "KHR-GL43.shader_image_size.advanced-nonMS-cs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005842,
    "KHR-GL43.shader_image_size.advanced-nonMS-cs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005843,
    "KHR-GL43.shader_image_size.advanced-nonMS-cs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005844,
    "KHR-GL43.shader_image_size.advanced-ms-vs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005845,
    "KHR-GL43.shader_image_size.advanced-ms-vs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005846,
    "KHR-GL43.shader_image_size.advanced-ms-vs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005847,
    "KHR-GL43.shader_image_size.advanced-ms-tcs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005848,
    "KHR-GL43.shader_image_size.advanced-ms-tcs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005849,
    "KHR-GL43.shader_image_size.advanced-ms-tcs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005850,
    "KHR-GL43.shader_image_size.advanced-ms-tes-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005851,
    "KHR-GL43.shader_image_size.advanced-ms-tes-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005852,
    "KHR-GL43.shader_image_size.advanced-ms-tes-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005853,
    "KHR-GL43.shader_image_size.advanced-ms-gs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005854,
    "KHR-GL43.shader_image_size.advanced-ms-gs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005855,
    "KHR-GL43.shader_image_size.advanced-ms-gs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005856,
    "KHR-GL43.shader_image_size.advanced-ms-fs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005857,
    "KHR-GL43.shader_image_size.advanced-ms-fs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005858,
    "KHR-GL43.shader_image_size.advanced-ms-fs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005859,
    "KHR-GL43.shader_image_size.advanced-ms-cs-float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005860,
    "KHR-GL43.shader_image_size.advanced-ms-cs-int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005861,
    "KHR-GL43.shader_image_size.advanced-ms-cs-uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_005862,
    "KHR-GL43.shader_image_size.negative-compileTime");
