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

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001030,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgba_unsigned_byte_rgba");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001031,
        "KHR-GLES32.core.internalformat.",
        "texture2d.rgb_unsigned_byte_rgb");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001032,
        "KHR-GLES32.core.internalformat.textu",
        "re2d.rgba_unsigned_short_4_4_4_4_rgba");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001033,
        "KHR-GLES32.core.internalformat.texture2d.lu",
        "minance_alpha_unsigned_byte_luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001034,
        "KHR-GLES32.core.internalformat.textur",
        "e2d.luminance_unsigned_byte_luminance");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001035,
        "KHR-GLES32.core.internalformat.te",
        "xture2d.alpha_unsigned_byte_alpha");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001036,
        "KHR-GLES32.core.internalformat.texture2",
        "d.rgba_unsigned_int_2_10_10_10_rev_rgba");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001037,
        "KHR-GLES32.core.internalformat.texture2d.",
        "rgba_unsigned_int_2_10_10_10_rev_rgb10_a2");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001038,
        "KHR-GLES32.core.internalformat.texture2d",
        ".rgba_unsigned_int_2_10_10_10_rev_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001039,
        "KHR-GLES32.core.internalformat.texture",
        "2d.rgb_unsigned_int_2_10_10_10_rev_rgb");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001040,
        "KHR-GLES32.core.internalformat.texture2d.de",
        "pth_component_unsigned_short_depth_component");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001041,
        "KHR-GLES32.core.internalformat.texture2d.d",
        "epth_component_unsigned_int_depth_component");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001042,
        "KHR-GLES32.core.internalformat.texture2d.de",
        "pth_stencil_unsigned_int_24_8_depth_stencil");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001043,
        "KHR-GLES32.core.internalformat.",
        "texture2d.rgb_half_float_oes_rgb");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001044,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgba_half_float_oes_rgba");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001045,
        "KHR-GLES32.core.internalformat.text",
        "ure2d.rgb_half_float_oes_rgb_linear");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001046,
        "KHR-GLES32.core.internalformat.textu",
        "re2d.rgba_half_float_oes_rgba_linear");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001047,
        "KHR-GLES32.core.internalform",
        "at.texture2d.rgb_float_rgb32f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001048,
        "KHR-GLES32.core.internalforma",
        "t.texture2d.rgba_float_rgba32f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001049,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgb_float_rgb32f_linear");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001050,
        "KHR-GLES32.core.internalformat.te",
        "xture2d.rgba_float_rgba32f_linear");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001051,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgba_unsigned_byte_rgba8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001052,
        "KHR-GLES32.core.internalformat.te",
        "xture2d.rgba_unsigned_byte_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001053,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgba_unsigned_byte_rgba4");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001054,
        "KHR-GLES32.core.internalformat.textu",
        "re2d.rgba_unsigned_byte_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001055,
        "KHR-GLES32.core.internalformat.",
        "texture2d.rgba_byte_rgba8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001056,
        "KHR-GLES32.core.internalformat.textur",
        "e2d.rgba_unsigned_short_4_4_4_4_rgba4");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001057,
        "KHR-GLES32.core.internalformat.texture",
        "2d.rgba_unsigned_short_5_5_5_1_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001058,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgba_half_float_rgba16f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001059,
        "KHR-GLES32.core.internalforma",
        "t.texture2d.rgba_float_rgba16f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001060,
        "KHR-GLES32.core.internalformat.textur",
        "e2d.rgba_integer_unsigned_byte_rgba8ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001061,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgba_integer_byte_rgba8i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001062,
        "KHR-GLES32.core.internalformat.texture",
        "2d.rgba_integer_unsigned_short_rgba16ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001063,
        "KHR-GLES32.core.internalformat.te",
        "xture2d.rgba_integer_short_rgba16i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001064,
        "KHR-GLES32.core.internalformat.textur",
        "e2d.rgba_integer_unsigned_int_rgba32ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001065,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgba_integer_int_rgba32i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001066,
        "KHR-GLES32.core.internalformat.texture2d.rgba_",
        "integer_unsigned_int_2_10_10_10_rev_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001067,
        "KHR-GLES32.core.internalformat.",
        "texture2d.rgb_unsigned_byte_rgb8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001068,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgb_unsigned_byte_rgb565");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001069,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgb_unsigned_byte_srgb8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001070,
        "KHR-GLES32.core.internalformat.textu",
        "re2d.rgb_unsigned_short_5_6_5_rgb565");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001071,
        "KHR-GLES32.core.internalformat.texture2d.rgb",
        "_unsigned_int_10f_11f_11f_rev_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001072,
        "KHR-GLES32.core.internalformat.texture",
        "2d.rgb_unsigned_int_5_9_9_9_rev_rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001073,
        "KHR-GLES32.core.internalformat.",
        "texture2d.rgb_half_float_rgb16f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001074,
        "KHR-GLES32.core.internalformat.text",
        "ure2d.rgb_half_float_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001075,
        "KHR-GLES32.core.internalformat.",
        "texture2d.rgb_half_float_rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001076,
        "KHR-GLES32.core.internalform",
        "at.texture2d.rgb_float_rgb16f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001077,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgb_float_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001078,
        "KHR-GLES32.core.internalforma",
        "t.texture2d.rgb_float_rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001079,
        "KHR-GLES32.core.internalformat.textu",
        "re2d.rgb_integer_unsigned_byte_rgb8ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001080,
        "KHR-GLES32.core.internalformat.",
        "texture2d.rgb_integer_byte_rgb8i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001081,
        "KHR-GLES32.core.internalformat.textur",
        "e2d.rgb_integer_unsigned_short_rgb16ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001082,
        "KHR-GLES32.core.internalformat.t",
        "exture2d.rgb_integer_short_rgb16i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001083,
        "KHR-GLES32.core.internalformat.textu",
        "re2d.rgb_integer_unsigned_int_rgb32ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001084,
        "KHR-GLES32.core.internalformat.",
        "texture2d.rgb_integer_int_rgb32i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001085,
        "KHR-GLES32.core.internalformat",
        ".texture2d.rg_unsigned_byte_rg8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001086,
        "KHR-GLES32.core.internalformat",
        ".texture2d.rg_half_float_rg16f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001087,
        "KHR-GLES32.core.internalfor",
        "mat.texture2d.rg_float_rg32f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001088,
        "KHR-GLES32.core.internalfor",
        "mat.texture2d.rg_float_rg16f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001089,
        "KHR-GLES32.core.internalformat.text",
        "ure2d.rg_integer_unsigned_byte_rg8ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001090,
        "KHR-GLES32.core.internalformat",
        ".texture2d.rg_integer_byte_rg8i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001091,
        "KHR-GLES32.core.internalformat.textu",
        "re2d.rg_integer_unsigned_short_rg16ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001092,
        "KHR-GLES32.core.internalformat.",
        "texture2d.rg_integer_short_rg16i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001093,
        "KHR-GLES32.core.internalformat.text",
        "ure2d.rg_integer_unsigned_int_rg32ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001094,
        "KHR-GLES32.core.internalformat",
        ".texture2d.rg_integer_int_rg32i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001095,
        "KHR-GLES32.core.internalformat",
        ".texture2d.red_unsigned_byte_r8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001096,
        "KHR-GLES32.core.internalformat",
        ".texture2d.red_half_float_r16f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001097,
        "KHR-GLES32.core.internalfor",
        "mat.texture2d.red_float_r32f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001098,
        "KHR-GLES32.core.internalfor",
        "mat.texture2d.red_float_r16f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001099,
        "KHR-GLES32.core.internalformat.text",
        "ure2d.red_integer_unsigned_byte_r8ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001100,
        "KHR-GLES32.core.internalformat",
        ".texture2d.red_integer_byte_r8i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001101,
        "KHR-GLES32.core.internalformat.textu",
        "re2d.red_integer_unsigned_short_r16ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001102,
        "KHR-GLES32.core.internalformat.",
        "texture2d.red_integer_short_r16i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001103,
        "KHR-GLES32.core.internalformat.text",
        "ure2d.red_integer_unsigned_int_r32ui");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001104,
        "KHR-GLES32.core.internalformat",
        ".texture2d.red_integer_int_r32i");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001105,
        "KHR-GLES32.core.internalformat.texture2d.dep",
        "th_component_unsigned_short_depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001106,
        "KHR-GLES32.core.internalformat.texture2d.de",
        "pth_component_unsigned_int_depth_component24");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001107,
        "KHR-GLES32.core.internalformat.texture2d.de",
        "pth_component_unsigned_int_depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001108,
        "KHR-GLES32.core.internalformat.texture2d",
        ".depth_component_float_depth_component32f");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001109,
        "KHR-GLES32.core.internalformat.texture2d.dep",
        "th_stencil_unsigned_int_24_8_depth24_stencil8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001110,
        "KHR-GLES32.core.internalformat.texture2d.depth_sten",
        "cil_float_32_unsigned_int_24_8_rev_depth32f_stencil8");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001111,
        "KHR-GLES32.core.internalformat.textu",
        "re2d.rgba_unsigned_short_5_5_5_1_rgba");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001112,
        "KHR-GLES32.core.internalformat.tex",
        "ture2d.rgb_unsigned_short_5_6_5_rgb");
