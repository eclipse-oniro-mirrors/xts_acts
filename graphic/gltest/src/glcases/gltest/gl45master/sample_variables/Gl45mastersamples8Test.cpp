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
#include "../Gl45masterBaseFunc.h"
#include "../ActsGl45master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007861,
    "KHR-GL45.sample_variables.mask.rgba8.samples_8.mask_zero");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007862,
    "KHR-GL45.sample_variables.mask.rgba8.samples_8.mask_0");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007863,
    "KHR-GL45.sample_variables.mask.rgba8.samples_8.mask_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007864,
    "KHR-GL45.sample_variables.mask.rgba8.samples_8.mask_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007865,
    "KHR-GL45.sample_variables.mask.rgba8.samples_8.mask_3");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007866,
    "KHR-GL45.sample_variables.mask.rgba8.samples_8.mask_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007867,
    "KHR-GL45.sample_variables.mask.rgba8.samples_8.mask_5");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007868,
    "KHR-GL45.sample_variables.mask.rgba8.samples_8.mask_6");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007869,
    "KHR-GL45.sample_variables.mask.rgba8.samples_8.mask_7");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007906,
    "KHR-GL45.sample_variables.mask.rgba8i.samples_8.mask_zero");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007907,
    "KHR-GL45.sample_variables.mask.rgba8i.samples_8.mask_0");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007908,
    "KHR-GL45.sample_variables.mask.rgba8i.samples_8.mask_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007909,
    "KHR-GL45.sample_variables.mask.rgba8i.samples_8.mask_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007910,
    "KHR-GL45.sample_variables.mask.rgba8i.samples_8.mask_3");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007911,
    "KHR-GL45.sample_variables.mask.rgba8i.samples_8.mask_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007912,
    "KHR-GL45.sample_variables.mask.rgba8i.samples_8.mask_5");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007913,
    "KHR-GL45.sample_variables.mask.rgba8i.samples_8.mask_6");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007914,
    "KHR-GL45.sample_variables.mask.rgba8i.samples_8.mask_7");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007951,
    "KHR-GL45.sample_variables.mask.rgba8ui.samples_8.mask_zero");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007952,
    "KHR-GL45.sample_variables.mask.rgba8ui.samples_8.mask_0");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007953,
    "KHR-GL45.sample_variables.mask.rgba8ui.samples_8.mask_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007954,
    "KHR-GL45.sample_variables.mask.rgba8ui.samples_8.mask_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007955,
    "KHR-GL45.sample_variables.mask.rgba8ui.samples_8.mask_3");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007956,
    "KHR-GL45.sample_variables.mask.rgba8ui.samples_8.mask_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007957,
    "KHR-GL45.sample_variables.mask.rgba8ui.samples_8.mask_5");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007958,
    "KHR-GL45.sample_variables.mask.rgba8ui.samples_8.mask_6");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007959,
    "KHR-GL45.sample_variables.mask.rgba8ui.samples_8.mask_7");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007996,
    "KHR-GL45.sample_variables.mask.rgba32f.samples_8.mask_zero");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007997,
    "KHR-GL45.sample_variables.mask.rgba32f.samples_8.mask_0");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007998,
    "KHR-GL45.sample_variables.mask.rgba32f.samples_8.mask_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_007999,
    "KHR-GL45.sample_variables.mask.rgba32f.samples_8.mask_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008000,
    "KHR-GL45.sample_variables.mask.rgba32f.samples_8.mask_3");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008001,
    "KHR-GL45.sample_variables.mask.rgba32f.samples_8.mask_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008002,
    "KHR-GL45.sample_variables.mask.rgba32f.samples_8.mask_5");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008003,
    "KHR-GL45.sample_variables.mask.rgba32f.samples_8.mask_6");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008004,
    "KHR-GL45.sample_variables.mask.rgba32f.samples_8.mask_7");
