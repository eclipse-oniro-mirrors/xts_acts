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
#include "../ActsDeqpgles310014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013078,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".2d.rgba8.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013079,
        "dEQP-GLES31.functional.texture.gather.basic.2d.rgba",
        "8.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013080,
        "dEQP-GLES31.functional.texture.gather.basic.2d.rgb",
        "a8.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013081,
        "dEQP-GLES31.functional.texture.gather.basic.2d.rgb",
        "a8.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013082,
        "dEQP-GLES31.functional.texture.gather.basic.2d.rgb",
        "a8.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013147,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        "_array.rgba8.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013148,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.r",
        "gba8.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013149,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.",
        "rgba8.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013150,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.",
        "rgba8.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013151,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.",
        "rgba8.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013222,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "cube.rgba8.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013223,
        "dEQP-GLES31.functional.texture.gather.basic.cube.rgb",
        "a8.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013224,
        "dEQP-GLES31.functional.texture.gather.basic.cube.rg",
        "ba8.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013225,
        "dEQP-GLES31.functional.texture.gather.basic.cube.rg",
        "ba8.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013226,
        "dEQP-GLES31.functional.texture.gather.basic.cube.rg",
        "ba8.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013356,
        "dEQP-GLES31.functional.texture.gather.offset.implement",
        "ation_offset.2d.rgba8.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013357,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_of",
        "fset.2d.rgba8.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013358,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_of",
        "fset.2d.rgba8.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013359,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_of",
        "fset.2d.rgba8.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013360,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_o",
        "ffset.2d.rgba8.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013425,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d_array.rgba8.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013426,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offse",
        "t.2d_array.rgba8.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013427,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offse",
        "t.2d_array.rgba8.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013428,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offse",
        "t.2d_array.rgba8.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013429,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offs",
        "et.2d_array.rgba8.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013554,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.imple",
        "mentation_offset.2d.rgba8.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013555,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementatio",
        "n_offset.2d.rgba8.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013556,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementatio",
        "n_offset.2d.rgba8.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013557,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementatio",
        "n_offset.2d.rgba8.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013558,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementati",
        "on_offset.2d.rgba8.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013623,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d_array.rgba8.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013624,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_o",
        "ffset.2d_array.rgba8.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013625,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_o",
        "ffset.2d_array.rgba8.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013626,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_o",
        "ffset.2d_array.rgba8.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013627,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_",
        "offset.2d_array.rgba8.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013752,
        "dEQP-GLES31.functional.texture.gather.offsets.implement",
        "ation_offset.2d.rgba8.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013753,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_of",
        "fset.2d.rgba8.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013754,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_o",
        "ffset.2d.rgba8.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013755,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_o",
        "ffset.2d.rgba8.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013756,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_o",
        "ffset.2d.rgba8.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013821,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d_array.rgba8.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013822,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offse",
        "t.2d_array.rgba8.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013823,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offs",
        "et.2d_array.rgba8.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013824,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offs",
        "et.2d_array.rgba8.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013825,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offs",
        "et.2d_array.rgba8.filter_mode.min_linear_mipmap_linear_mag_linear");
