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
#include "../Gl44masterBaseFunc.h"
#include "../ActsGl44master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007833,
    "KHR-GL44.sample_variables.mask.rgba8.samples_1.mask_zero");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007834,
    "KHR-GL44.sample_variables.mask.rgba8.samples_1.mask_0");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007835,
    "KHR-GL44.sample_variables.mask.rgba8.samples_1.mask_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007836,
    "KHR-GL44.sample_variables.mask.rgba8.samples_1.mask_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007837,
    "KHR-GL44.sample_variables.mask.rgba8.samples_1.mask_3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007838,
    "KHR-GL44.sample_variables.mask.rgba8.samples_1.mask_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007839,
    "KHR-GL44.sample_variables.mask.rgba8.samples_1.mask_5");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007840,
    "KHR-GL44.sample_variables.mask.rgba8.samples_1.mask_6");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007841,
    "KHR-GL44.sample_variables.mask.rgba8.samples_1.mask_7");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007878,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_1.mask_zero");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007879,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_1.mask_0");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007880,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_1.mask_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007881,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_1.mask_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007882,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_1.mask_3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007883,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_1.mask_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007884,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_1.mask_5");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007885,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_1.mask_6");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007886,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_1.mask_7");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007923,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_1.mask_zero");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007924,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_1.mask_0");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007925,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_1.mask_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007926,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_1.mask_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007927,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_1.mask_3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007928,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_1.mask_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007929,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_1.mask_5");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007930,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_1.mask_6");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007931,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_1.mask_7");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007968,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_1.mask_zero");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007969,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_1.mask_0");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007970,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_1.mask_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007971,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_1.mask_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007972,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_1.mask_3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007973,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_1.mask_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007974,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_1.mask_5");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007975,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_1.mask_6");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007976,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_1.mask_7");
