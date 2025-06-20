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

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008024,
    "KHR-GL44.shader_multisample_interpolation.render.base.rgba32f.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008025,
    "KHR-GL44.shader_multisample_interpolation.render.base.rgba32f.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008026,
    "KHR-GL44.shader_multisample_interpolation.render.base.rgba32f.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008036,
    "KHR-GL44.shader_multisample_interpolation.render.sample.rgba32f.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008037,
    "KHR-GL44.shader_multisample_interpolation.render.sample.rgba32f.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008038,
    "KHR-GL44.shader_multisample_interpolation.render.sample.rgba32f.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008048,
    "KHR-GL44.shader_multisample_interpolation.render.centroid.rgba32f.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008049,
    "KHR-GL44.shader_multisample_interpolation.render.centroid.rgba32f.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008050,
    "KHR-GL44.shader_multisample_interpolation.render.centroid.rgba32f.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008060,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample.rgba32f.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008061,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample.rgba32f.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008062,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample.rgba32f.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008072,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba32f.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008073,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba32f.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008074,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba32f.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008084,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid.rgba32f.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008085,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid.rgba32f.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008086,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid.rgba32f.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008096,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba32f.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008097,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba32f.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008098,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba32f.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008108,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset.rgba32f.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008109,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset.rgba32f.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008110,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset.rgba32f.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008120,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba32f.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008121,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba32f.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008122,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba32f.samples_4");
