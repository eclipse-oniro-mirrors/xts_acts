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
#include "../Gl46masterBaseFunc.h"
#include "../ActsGl46master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007825,
    "KHR-GL46.sample_variables.mask.rgba8.samples_0.mask_zero");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007826,
    "KHR-GL46.sample_variables.mask.rgba8.samples_0.mask_0");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007827,
    "KHR-GL46.sample_variables.mask.rgba8.samples_0.mask_1");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007828,
    "KHR-GL46.sample_variables.mask.rgba8.samples_0.mask_2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007829,
    "KHR-GL46.sample_variables.mask.rgba8.samples_0.mask_3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007830,
    "KHR-GL46.sample_variables.mask.rgba8.samples_0.mask_4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007831,
    "KHR-GL46.sample_variables.mask.rgba8.samples_0.mask_5");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007832,
    "KHR-GL46.sample_variables.mask.rgba8.samples_0.mask_6");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007833,
    "KHR-GL46.sample_variables.mask.rgba8.samples_0.mask_7");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007870,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_0.mask_zero");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007871,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_0.mask_0");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007872,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_0.mask_1");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007873,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_0.mask_2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007874,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_0.mask_3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007875,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_0.mask_4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007876,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_0.mask_5");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007877,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_0.mask_6");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007878,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_0.mask_7");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007915,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_0.mask_zero");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007916,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_0.mask_0");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007917,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_0.mask_1");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007918,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_0.mask_2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007919,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_0.mask_3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007920,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_0.mask_4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007921,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_0.mask_5");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007922,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_0.mask_6");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007923,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_0.mask_7");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007960,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_0.mask_zero");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007961,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_0.mask_0");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007962,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_0.mask_1");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007963,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_0.mask_2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007964,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_0.mask_3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007965,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_0.mask_4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007966,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_0.mask_5");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007967,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_0.mask_6");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007968,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_0.mask_7");
