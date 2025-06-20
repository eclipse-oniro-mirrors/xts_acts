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

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008018,
    "KHR-GL44.shader_multisample_interpolation.render.base.rgba8i.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008019,
    "KHR-GL44.shader_multisample_interpolation.render.base.rgba8i.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008020,
    "KHR-GL44.shader_multisample_interpolation.render.base.rgba8i.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008030,
    "KHR-GL44.shader_multisample_interpolation.render.sample.rgba8i.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008031,
    "KHR-GL44.shader_multisample_interpolation.render.sample.rgba8i.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008032,
    "KHR-GL44.shader_multisample_interpolation.render.sample.rgba8i.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008042,
    "KHR-GL44.shader_multisample_interpolation.render.centroid.rgba8i.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008043,
    "KHR-GL44.shader_multisample_interpolation.render.centroid.rgba8i.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008044,
    "KHR-GL44.shader_multisample_interpolation.render.centroid.rgba8i.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008054,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample.rgba8i.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008055,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample.rgba8i.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008056,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample.rgba8i.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008066,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba8i.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008067,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba8i.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008068,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba8i.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008078,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid.rgba8i.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008079,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid.rgba8i.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008080,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid.rgba8i.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008090,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba8i.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008091,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba8i.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008092,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba8i.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008102,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset.rgba8i.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008103,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset.rgba8i.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008104,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset.rgba8i.samples_4");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008114,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba8i.samples_1");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008115,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba8i.samples_2");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008116,
    "KHR-GL44.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba8i.samples_4");
