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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013128,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d.depth32f.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013129,
        "dEQP-GLES31.functional.texture.gather.basic.2d.depth",
        "32f.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013130,
        "dEQP-GLES31.functional.texture.gather.basic.2d.depth",
        "32f.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013131,
        "dEQP-GLES31.functional.texture.gather.basic.2d.depth",
        "32f.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013132,
        "dEQP-GLES31.functional.texture.gather.basic.2d.dept",
        "h32f.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013197,
        "dEQP-GLES31.functional.texture.gather.basic.2d_",
        "array.depth32f.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013198,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.de",
        "pth32f.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013199,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.de",
        "pth32f.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013200,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.de",
        "pth32f.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013201,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.d",
        "epth32f.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013406,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d.depth32f.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013407,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offs",
        "et.2d.depth32f.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013408,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_off",
        "set.2d.depth32f.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013409,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_off",
        "set.2d.depth32f.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013410,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_off",
        "set.2d.depth32f.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013475,
        "dEQP-GLES31.functional.texture.gather.offset.implementation",
        "_offset.2d_array.depth32f.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013476,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset.",
        "2d_array.depth32f.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013477,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset",
        ".2d_array.depth32f.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013478,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset",
        ".2d_array.depth32f.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013479,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset",
        ".2d_array.depth32f.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013604,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d.depth32f.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013605,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_",
        "offset.2d.depth32f.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013606,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation",
        "_offset.2d.depth32f.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013607,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation",
        "_offset.2d.depth32f.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013608,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation",
        "_offset.2d.depth32f.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013673,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementa",
        "tion_offset.2d_array.depth32f.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013674,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_off",
        "set.2d_array.depth32f.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013675,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_of",
        "fset.2d_array.depth32f.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013676,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_of",
        "fset.2d_array.depth32f.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013677,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_of",
        "fset.2d_array.depth32f.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013802,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d.depth32f.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013803,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_off",
        "set.2d.depth32f.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013804,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_off",
        "set.2d.depth32f.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013805,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_off",
        "set.2d.depth32f.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013806,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_of",
        "fset.2d.depth32f.filter_mode.min_linear_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013871,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d_array.depth32f.filter_mode.min_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013872,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset",
        ".2d_array.depth32f.filter_mode.min_nearest_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013873,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset",
        ".2d_array.depth32f.filter_mode.min_nearest_mipmap_linear_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013874,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset",
        ".2d_array.depth32f.filter_mode.min_linear_mipmap_nearest_mag_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013875,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offse",
        "t.2d_array.depth32f.filter_mode.min_linear_mipmap_linear_mag_linear");
