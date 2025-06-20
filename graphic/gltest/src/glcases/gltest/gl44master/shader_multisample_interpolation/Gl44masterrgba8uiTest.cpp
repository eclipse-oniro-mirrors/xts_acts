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

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008021,
    "KHR-GL44.shader_multisample_interpolation.render.base.rgba8ui.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008022,
    "KHR-GL44.shader_multisample_interpolation.render.base.rgba8ui.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008023,
    "KHR-GL44.shader_multisample_interpolation.render.base.rgba8ui.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008033,
    "KHR-GL44.shader_multisample_interpolation.render.sample.rgba8ui.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008034,
    "KHR-GL44.shader_multisample_interpolation.render.sample.rgba8ui.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008035,
    "KHR-GL44.shader_multisample_interpolation.render.sample.rgba8ui.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008045,
    "KHR-GL44.shader_multisample_interpolation.render.centroid.rgba8ui.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008046,
    "KHR-GL44.shader_multisample_interpolation.render.centroid.rgba8ui.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008047,
    "KHR-GL44.shader_multisample_interpolation.render.centroid.rgba8ui.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008057,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample.rgba8ui.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008058,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample.rgba8ui.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008059,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample.rgba8ui.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008069,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba8ui.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008070,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba8ui.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008071,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba8ui.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008081,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid.rgba8ui.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008082,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid.rgba8ui.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008083,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid.rgba8ui.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008093,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba8ui.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008094,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba8ui.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008095,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba8ui.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008105,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset.rgba8ui.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008106,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset.rgba8ui.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008107,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset.rgba8ui.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008117,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba8ui.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008118,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba8ui.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008119,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba8ui.samples_4");
