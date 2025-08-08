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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310035TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034395,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba_astc_10x5_khr_rgba32f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034396,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba_astc_10x5_khr_rgba32f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034397,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba_astc_10x5_khr_rgba32f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034398,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba_astc_10x5_khr_rgba32f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034399,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba_astc_10x5_khr_rgba32f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034400,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.rgba_astc_10x5_khr_rgba32f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034401,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba_astc_10x5_khr_rgba32f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034402,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba_astc_10x5_khr_rgba32f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034403,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba_astc_10x5_khr_rgba32f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034404,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.rgba_astc_10x5_khr_rgba32f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034405,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_b",
        "its_mixed.rgba_astc_10x5_khr_rgba32f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034406,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba_astc_10x5_khr_rgba32f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034407,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba_astc_10x5_khr_rgba32f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034408,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_m",
        "ixed.rgba_astc_10x5_khr_rgba32f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034409,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_",
        "mixed.rgba_astc_10x5_khr_rgba32f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034410,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits_mixe",
        "d.rgba_astc_10x5_khr_rgba32f.texture2d_array_to_texture2d_array");
