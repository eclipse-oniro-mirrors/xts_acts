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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003469,
        "KHR-GLES31.shaders.lay",
        "out_location.sampler_2d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003470,
        "KHR-GLES31.shaders.lay",
        "out_location.sampler_3d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003471,
        "KHR-GLES31.shaders.layo",
        "ut_location.sampler_cube");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003472,
        "KHR-GLES31.shaders.layout_l",
        "ocation.sampler_cube_shadow");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003473,
        "KHR-GLES31.shaders.layout_",
        "location.sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003474,
        "KHR-GLES31.shaders.layout",
        "_location.sampler_2d_array");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003475,
        "KHR-GLES31.shaders.layout_loc",
        "ation.sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003476,
        "KHR-GLES31.shaders.layo",
        "ut_location.isampler_2d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003477,
        "KHR-GLES31.shaders.layo",
        "ut_location.isampler_3d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003478,
        "KHR-GLES31.shaders.layou",
        "t_location.isampler_cube");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003479,
        "KHR-GLES31.shaders.layout_",
        "location.isampler_2d_array");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003480,
        "KHR-GLES31.shaders.layo",
        "ut_location.usampler_2d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003481,
        "KHR-GLES31.shaders.layo",
        "ut_location.usampler_3d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003482,
        "KHR-GLES31.shaders.layou",
        "t_location.usampler_cube");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003483,
        "KHR-GLES31.shaders.layout_",
        "location.usampler_2d_array");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003484,
        "KHR-GLES31.shaders.la",
        "yout_location.image_2d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003485,
        "KHR-GLES31.shaders.lay",
        "out_location.iimage_2d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003486,
        "KHR-GLES31.shaders.lay",
        "out_location.uimage_2d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003487,
        "KHR-GLES31.shaders.la",
        "yout_location.image_3d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003488,
        "KHR-GLES31.shaders.lay",
        "out_location.iimage_3d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003489,
        "KHR-GLES31.shaders.lay",
        "out_location.uimage_3d");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003490,
        "KHR-GLES31.shaders.lay",
        "out_location.image_cube");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003491,
        "KHR-GLES31.shaders.layo",
        "ut_location.iimage_cube");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003492,
        "KHR-GLES31.shaders.layo",
        "ut_location.uimage_cube");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003493,
        "KHR-GLES31.shaders.layou",
        "t_location.image_2d_array");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003494,
        "KHR-GLES31.shaders.layout",
        "_location.iimage_2d_array");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003495,
        "KHR-GLES31.shaders.layout",
        "_location.uimage_2d_array");

static SHRINK_HWTEST_F(ActsKhrgles310004TestSuite, TestCase_003496,
        "KHR-GLES31.shaders.layou",
        "t_location.invalid_cases");
