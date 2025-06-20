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

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008016,
    "KHR-GL45.shader_multisample_interpolation.render.base.rgba8.samples_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008017,
    "KHR-GL45.shader_multisample_interpolation.render.base.rgba8.samples_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008018,
    "KHR-GL45.shader_multisample_interpolation.render.base.rgba8.samples_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008028,
    "KHR-GL45.shader_multisample_interpolation.render.sample.rgba8.samples_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008029,
    "KHR-GL45.shader_multisample_interpolation.render.sample.rgba8.samples_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008030,
    "KHR-GL45.shader_multisample_interpolation.render.sample.rgba8.samples_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008040,
    "KHR-GL45.shader_multisample_interpolation.render.centroid.rgba8.samples_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008041,
    "KHR-GL45.shader_multisample_interpolation.render.centroid.rgba8.samples_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008042,
    "KHR-GL45.shader_multisample_interpolation.render.centroid.rgba8.samples_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008052,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_sample.rgba8.samples_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008053,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_sample.rgba8.samples_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008054,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_sample.rgba8.samples_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008064,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba8.samples_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008065,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba8.samples_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008066,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_sample_check.rgba8.samples_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008076,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_centroid.rgba8.samples_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008077,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_centroid.rgba8.samples_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008078,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_centroid.rgba8.samples_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008088,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba8.samples_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008089,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba8.samples_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008090,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_centroid_check.rgba8.samples_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008100,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_offset.rgba8.samples_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008101,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_offset.rgba8.samples_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008102,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_offset.rgba8.samples_4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008112,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba8.samples_1");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008113,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba8.samples_2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008114,
    "KHR-GL45.shader_multisample_interpolation.render.interpolate_at_offset_check.rgba8.samples_4");
