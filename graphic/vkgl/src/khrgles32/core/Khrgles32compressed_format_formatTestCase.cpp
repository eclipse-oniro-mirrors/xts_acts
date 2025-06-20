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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001199,
        "KHR-GLES32.core.compress",
        "ed_format.format.r11_eac");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001200,
        "KHR-GLES32.core.compressed_",
        "format.format.signed_r11_eac");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001201,
        "KHR-GLES32.core.compress",
        "ed_format.format.rg11_eac");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001202,
        "KHR-GLES32.core.compressed_f",
        "ormat.format.signed_rg11_eac");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001203,
        "KHR-GLES32.core.compresse",
        "d_format.format.rgb8_etc2");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001204,
        "KHR-GLES32.core.compresse",
        "d_format.format.srgb8_etc2");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001205,
        "KHR-GLES32.core.compressed_format.f",
        "ormat.rgb8_punchthrough_alpha1_etc2");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001206,
        "KHR-GLES32.core.compressed_format.f",
        "ormat.srgb8_punchthrough_alpha1_etc2");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001207,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba8_etc2_eac");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001208,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_etc2_eac");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001209,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_4x4");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001210,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_5x4");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001211,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_5x5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001212,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_6x5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001213,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_6x6");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001214,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_8x5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001215,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_8x6");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001216,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_8x8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001217,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_10x5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001218,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_10x6");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001219,
        "KHR-GLES32.core.compressed_",
        "format.format.rgba_astc_10x8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001220,
        "KHR-GLES32.core.compressed_f",
        "ormat.format.rgba_astc_10x10");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001221,
        "KHR-GLES32.core.compressed_f",
        "ormat.format.rgba_astc_12x10");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001222,
        "KHR-GLES32.core.compressed_f",
        "ormat.format.rgba_astc_12x12");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001223,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_4x4");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001224,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_5x4");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001225,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_5x5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001226,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_6x5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001227,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_6x6");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001228,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_8x5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001229,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_8x6");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001230,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_8x8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001231,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_10x5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001232,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_10x6");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001233,
        "KHR-GLES32.core.compressed_form",
        "at.format.srgb8_alpha8_astc_10x8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001234,
        "KHR-GLES32.core.compressed_forma",
        "t.format.srgb8_alpha8_astc_10x10");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001235,
        "KHR-GLES32.core.compressed_forma",
        "t.format.srgb8_alpha8_astc_12x10");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001236,
        "KHR-GLES32.core.compressed_forma",
        "t.format.srgb8_alpha8_astc_12x12");
