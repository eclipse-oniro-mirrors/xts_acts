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

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009006,
    "KHR-GL46.layout_location.sampler_2d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009007,
    "KHR-GL46.layout_location.sampler_3d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009008,
    "KHR-GL46.layout_location.sampler_cube");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009009,
    "KHR-GL46.layout_location.sampler_cube_shadow");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009010,
    "KHR-GL46.layout_location.sampler_2d_shadow");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009011,
    "KHR-GL46.layout_location.sampler_2d_array");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009012,
    "KHR-GL46.layout_location.sampler_2d_array_shadow");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009013,
    "KHR-GL46.layout_location.isampler_2d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009014,
    "KHR-GL46.layout_location.isampler_3d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009015,
    "KHR-GL46.layout_location.isampler_cube");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009016,
    "KHR-GL46.layout_location.isampler_2d_array");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009017,
    "KHR-GL46.layout_location.usampler_2d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009018,
    "KHR-GL46.layout_location.usampler_3d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009019,
    "KHR-GL46.layout_location.usampler_cube");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009020,
    "KHR-GL46.layout_location.usampler_2d_array");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009021,
    "KHR-GL46.layout_location.image_2d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009022,
    "KHR-GL46.layout_location.iimage_2d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009023,
    "KHR-GL46.layout_location.uimage_2d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009024,
    "KHR-GL46.layout_location.image_3d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009025,
    "KHR-GL46.layout_location.iimage_3d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009026,
    "KHR-GL46.layout_location.uimage_3d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009027,
    "KHR-GL46.layout_location.image_cube");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009028,
    "KHR-GL46.layout_location.iimage_cube");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009029,
    "KHR-GL46.layout_location.uimage_cube");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009030,
    "KHR-GL46.layout_location.image_2d_array");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009031,
    "KHR-GL46.layout_location.iimage_2d_array");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009032,
    "KHR-GL46.layout_location.uimage_2d_array");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009033,
    "KHR-GL46.layout_location.sampler_buffer");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009034,
    "KHR-GL46.layout_location.isampler_buffer");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009035,
    "KHR-GL46.layout_location.usampler_buffer");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009036,
    "KHR-GL46.layout_location.sampler_1d");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009037,
    "KHR-GL46.layout_location.sampler_1d_shadow");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009038,
    "KHR-GL46.layout_location.sampler_1d_array");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009039,
    "KHR-GL46.layout_location.sampler_1d_array_shadow");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_009040,
    "KHR-GL46.layout_location.invalid_cases");
