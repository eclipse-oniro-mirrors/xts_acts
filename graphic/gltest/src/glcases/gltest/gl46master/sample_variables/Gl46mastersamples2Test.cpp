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

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007843,
    "KHR-GL46.sample_variables.mask.rgba8.samples_2.mask_zero");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007844,
    "KHR-GL46.sample_variables.mask.rgba8.samples_2.mask_0");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007845,
    "KHR-GL46.sample_variables.mask.rgba8.samples_2.mask_1");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007846,
    "KHR-GL46.sample_variables.mask.rgba8.samples_2.mask_2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007847,
    "KHR-GL46.sample_variables.mask.rgba8.samples_2.mask_3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007848,
    "KHR-GL46.sample_variables.mask.rgba8.samples_2.mask_4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007849,
    "KHR-GL46.sample_variables.mask.rgba8.samples_2.mask_5");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007850,
    "KHR-GL46.sample_variables.mask.rgba8.samples_2.mask_6");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007851,
    "KHR-GL46.sample_variables.mask.rgba8.samples_2.mask_7");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007888,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_2.mask_zero");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007889,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_2.mask_0");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007890,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_2.mask_1");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007891,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_2.mask_2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007892,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_2.mask_3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007893,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_2.mask_4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007894,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_2.mask_5");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007895,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_2.mask_6");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007896,
    "KHR-GL46.sample_variables.mask.rgba8i.samples_2.mask_7");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007933,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_2.mask_zero");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007934,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_2.mask_0");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007935,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_2.mask_1");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007936,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_2.mask_2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007937,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_2.mask_3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007938,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_2.mask_4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007939,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_2.mask_5");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007940,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_2.mask_6");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007941,
    "KHR-GL46.sample_variables.mask.rgba8ui.samples_2.mask_7");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007978,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_2.mask_zero");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007979,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_2.mask_0");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007980,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_2.mask_1");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007981,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_2.mask_2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007982,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_2.mask_3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007983,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_2.mask_4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007984,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_2.mask_5");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007985,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_2.mask_6");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007986,
    "KHR-GL46.sample_variables.mask.rgba32f.samples_2.mask_7");
