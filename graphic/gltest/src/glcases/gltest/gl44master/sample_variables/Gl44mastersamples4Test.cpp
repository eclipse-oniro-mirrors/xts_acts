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

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007851,
    "KHR-GL44.sample_variables.mask.rgba8.samples_4.mask_zero");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007852,
    "KHR-GL44.sample_variables.mask.rgba8.samples_4.mask_0");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007853,
    "KHR-GL44.sample_variables.mask.rgba8.samples_4.mask_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007854,
    "KHR-GL44.sample_variables.mask.rgba8.samples_4.mask_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007855,
    "KHR-GL44.sample_variables.mask.rgba8.samples_4.mask_3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007856,
    "KHR-GL44.sample_variables.mask.rgba8.samples_4.mask_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007857,
    "KHR-GL44.sample_variables.mask.rgba8.samples_4.mask_5");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007858,
    "KHR-GL44.sample_variables.mask.rgba8.samples_4.mask_6");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007859,
    "KHR-GL44.sample_variables.mask.rgba8.samples_4.mask_7");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007896,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_4.mask_zero");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007897,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_4.mask_0");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007898,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_4.mask_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007899,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_4.mask_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007900,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_4.mask_3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007901,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_4.mask_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007902,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_4.mask_5");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007903,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_4.mask_6");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007904,
    "KHR-GL44.sample_variables.mask.rgba8i.samples_4.mask_7");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007941,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_4.mask_zero");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007942,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_4.mask_0");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007943,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_4.mask_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007944,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_4.mask_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007945,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_4.mask_3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007946,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_4.mask_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007947,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_4.mask_5");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007948,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_4.mask_6");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007949,
    "KHR-GL44.sample_variables.mask.rgba8ui.samples_4.mask_7");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007986,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_4.mask_zero");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007987,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_4.mask_0");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007988,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_4.mask_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007989,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_4.mask_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007990,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_4.mask_3");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007991,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_4.mask_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007992,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_4.mask_5");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007993,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_4.mask_6");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_007994,
    "KHR-GL44.sample_variables.mask.rgba32f.samples_4.mask_7");
