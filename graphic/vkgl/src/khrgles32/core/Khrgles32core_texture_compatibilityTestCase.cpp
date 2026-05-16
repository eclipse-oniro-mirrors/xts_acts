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

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001167,
        "KHR-GLES32.core.texture_compatibility.",
        "texsubimage_format_rgba4_unsigned_byte");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001168,
        "KHR-GLES32.core.texture_compatibility.t",
        "exsubimage_format_rgb5_a1_unsigned_byte");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001169,
        "KHR-GLES32.core.texture_compatibility.tex",
        "subimage_format_rgb5_a1_unsigned_int_10_a2");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001170,
        "KHR-GLES32.core.texture_compatibi",
        "lity.texsubimage_format_r16f_float");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001171,
        "KHR-GLES32.core.texture_compatibil",
        "ity.texsubimage_format_rg16f_float");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001172,
        "KHR-GLES32.core.texture_compatibil",
        "ity.texsubimage_format_rgb16f_float");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001173,
        "KHR-GLES32.core.texture_compatibili",
        "ty.texsubimage_format_rgba16f_float");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001174,
        "KHR-GLES32.core.texture_compatibility.tex",
        "subimage_format_r11f_g11f_b10f_half_float");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001175,
        "KHR-GLES32.core.texture_compatibility.",
        "texsubimage_format_r11f_g11f_b10f_float");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001176,
        "KHR-GLES32.core.texture_compatibility",
        ".texsubimage_format_rgb9_e5_half_float");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001177,
        "KHR-GLES32.core.texture_compatibili",
        "ty.texsubimage_format_rgb9_e5_float");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001178,
        "KHR-GLES32.core.texture_compatibility.",
        "texsubimage_format_rgb565_unsigned_byte");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001179,
        "KHR-GLES32.core.texture_compatibility.t",
        "exsubimage_format_depth_component16_uint");
