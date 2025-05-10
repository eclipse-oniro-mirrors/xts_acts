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
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002266,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgba_unsigned_byte_rgba");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002267,
        "KHR-GLES31.core.internalformat.",
        "texture2d.rgb_unsigned_byte_rgb");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002268,
        "KHR-GLES31.core.internalformat.textu",
        "re2d.rgba_unsigned_short_4_4_4_4_rgba");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002269,
        "KHR-GLES31.core.internalformat.texture2d.lu",
        "minance_alpha_unsigned_byte_luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002270,
        "KHR-GLES31.core.internalformat.textur",
        "e2d.luminance_unsigned_byte_luminance");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002271,
        "KHR-GLES31.core.internalformat.te",
        "xture2d.alpha_unsigned_byte_alpha");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002272,
        "KHR-GLES31.core.internalformat.texture2",
        "d.rgba_unsigned_int_2_10_10_10_rev_rgba");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002273,
        "KHR-GLES31.core.internalformat.texture2d.",
        "rgba_unsigned_int_2_10_10_10_rev_rgb10_a2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002274,
        "KHR-GLES31.core.internalformat.texture2d",
        ".rgba_unsigned_int_2_10_10_10_rev_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002275,
        "KHR-GLES31.core.internalformat.texture",
        "2d.rgb_unsigned_int_2_10_10_10_rev_rgb");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002276,
        "KHR-GLES31.core.internalformat.texture2d.de",
        "pth_component_unsigned_short_depth_component");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002277,
        "KHR-GLES31.core.internalformat.texture2d.d",
        "epth_component_unsigned_int_depth_component");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002278,
        "KHR-GLES31.core.internalformat.texture2d.de",
        "pth_stencil_unsigned_int_24_8_depth_stencil");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002279,
        "KHR-GLES31.core.internalformat.",
        "texture2d.rgb_half_float_oes_rgb");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002280,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgba_half_float_oes_rgba");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002281,
        "KHR-GLES31.core.internalformat.text",
        "ure2d.rgb_half_float_oes_rgb_linear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002282,
        "KHR-GLES31.core.internalformat.textu",
        "re2d.rgba_half_float_oes_rgba_linear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002283,
        "KHR-GLES31.core.internalform",
        "at.texture2d.rgb_float_rgb32f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002284,
        "KHR-GLES31.core.internalforma",
        "t.texture2d.rgba_float_rgba32f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002285,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgb_float_rgb32f_linear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002286,
        "KHR-GLES31.core.internalformat.te",
        "xture2d.rgba_float_rgba32f_linear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002287,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgba_unsigned_byte_rgba8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002288,
        "KHR-GLES31.core.internalformat.te",
        "xture2d.rgba_unsigned_byte_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002289,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgba_unsigned_byte_rgba4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002290,
        "KHR-GLES31.core.internalformat.textu",
        "re2d.rgba_unsigned_byte_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002291,
        "KHR-GLES31.core.internalformat.",
        "texture2d.rgba_byte_rgba8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002292,
        "KHR-GLES31.core.internalformat.textur",
        "e2d.rgba_unsigned_short_4_4_4_4_rgba4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002293,
        "KHR-GLES31.core.internalformat.texture",
        "2d.rgba_unsigned_short_5_5_5_1_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002294,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgba_half_float_rgba16f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002295,
        "KHR-GLES31.core.internalforma",
        "t.texture2d.rgba_float_rgba16f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002296,
        "KHR-GLES31.core.internalformat.textur",
        "e2d.rgba_integer_unsigned_byte_rgba8ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002297,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgba_integer_byte_rgba8i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002298,
        "KHR-GLES31.core.internalformat.texture",
        "2d.rgba_integer_unsigned_short_rgba16ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002299,
        "KHR-GLES31.core.internalformat.te",
        "xture2d.rgba_integer_short_rgba16i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002300,
        "KHR-GLES31.core.internalformat.textur",
        "e2d.rgba_integer_unsigned_int_rgba32ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002301,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgba_integer_int_rgba32i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002302,
        "KHR-GLES31.core.internalformat.texture2d.rgba_",
        "integer_unsigned_int_2_10_10_10_rev_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002303,
        "KHR-GLES31.core.internalformat.",
        "texture2d.rgb_unsigned_byte_rgb8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002304,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgb_unsigned_byte_rgb565");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002305,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgb_unsigned_byte_srgb8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002306,
        "KHR-GLES31.core.internalformat.textu",
        "re2d.rgb_unsigned_short_5_6_5_rgb565");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002307,
        "KHR-GLES31.core.internalformat.texture2d.rgb",
        "_unsigned_int_10f_11f_11f_rev_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002308,
        "KHR-GLES31.core.internalformat.texture",
        "2d.rgb_unsigned_int_5_9_9_9_rev_rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002309,
        "KHR-GLES31.core.internalformat.",
        "texture2d.rgb_half_float_rgb16f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002310,
        "KHR-GLES31.core.internalformat.text",
        "ure2d.rgb_half_float_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002311,
        "KHR-GLES31.core.internalformat.",
        "texture2d.rgb_half_float_rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002312,
        "KHR-GLES31.core.internalform",
        "at.texture2d.rgb_float_rgb16f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002313,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgb_float_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002314,
        "KHR-GLES31.core.internalforma",
        "t.texture2d.rgb_float_rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002315,
        "KHR-GLES31.core.internalformat.textu",
        "re2d.rgb_integer_unsigned_byte_rgb8ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002316,
        "KHR-GLES31.core.internalformat.",
        "texture2d.rgb_integer_byte_rgb8i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002317,
        "KHR-GLES31.core.internalformat.textur",
        "e2d.rgb_integer_unsigned_short_rgb16ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002318,
        "KHR-GLES31.core.internalformat.t",
        "exture2d.rgb_integer_short_rgb16i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002319,
        "KHR-GLES31.core.internalformat.textu",
        "re2d.rgb_integer_unsigned_int_rgb32ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002320,
        "KHR-GLES31.core.internalformat.",
        "texture2d.rgb_integer_int_rgb32i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002321,
        "KHR-GLES31.core.internalformat",
        ".texture2d.rg_unsigned_byte_rg8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002322,
        "KHR-GLES31.core.internalformat",
        ".texture2d.rg_half_float_rg16f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002323,
        "KHR-GLES31.core.internalfor",
        "mat.texture2d.rg_float_rg32f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002324,
        "KHR-GLES31.core.internalfor",
        "mat.texture2d.rg_float_rg16f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002325,
        "KHR-GLES31.core.internalformat.text",
        "ure2d.rg_integer_unsigned_byte_rg8ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002326,
        "KHR-GLES31.core.internalformat",
        ".texture2d.rg_integer_byte_rg8i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002327,
        "KHR-GLES31.core.internalformat.textu",
        "re2d.rg_integer_unsigned_short_rg16ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002328,
        "KHR-GLES31.core.internalformat.",
        "texture2d.rg_integer_short_rg16i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002329,
        "KHR-GLES31.core.internalformat.text",
        "ure2d.rg_integer_unsigned_int_rg32ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002330,
        "KHR-GLES31.core.internalformat",
        ".texture2d.rg_integer_int_rg32i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002331,
        "KHR-GLES31.core.internalformat",
        ".texture2d.red_unsigned_byte_r8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002332,
        "KHR-GLES31.core.internalformat",
        ".texture2d.red_half_float_r16f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002333,
        "KHR-GLES31.core.internalfor",
        "mat.texture2d.red_float_r32f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002334,
        "KHR-GLES31.core.internalfor",
        "mat.texture2d.red_float_r16f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002335,
        "KHR-GLES31.core.internalformat.text",
        "ure2d.red_integer_unsigned_byte_r8ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002336,
        "KHR-GLES31.core.internalformat",
        ".texture2d.red_integer_byte_r8i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002337,
        "KHR-GLES31.core.internalformat.textu",
        "re2d.red_integer_unsigned_short_r16ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002338,
        "KHR-GLES31.core.internalformat.",
        "texture2d.red_integer_short_r16i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002339,
        "KHR-GLES31.core.internalformat.text",
        "ure2d.red_integer_unsigned_int_r32ui");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002340,
        "KHR-GLES31.core.internalformat",
        ".texture2d.red_integer_int_r32i");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002341,
        "KHR-GLES31.core.internalformat.texture2d.dep",
        "th_component_unsigned_short_depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002342,
        "KHR-GLES31.core.internalformat.texture2d.de",
        "pth_component_unsigned_int_depth_component24");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002343,
        "KHR-GLES31.core.internalformat.texture2d.de",
        "pth_component_unsigned_int_depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002344,
        "KHR-GLES31.core.internalformat.texture2d",
        ".depth_component_float_depth_component32f");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002345,
        "KHR-GLES31.core.internalformat.texture2d.dep",
        "th_stencil_unsigned_int_24_8_depth24_stencil8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002346,
        "KHR-GLES31.core.internalformat.texture2d.depth_sten",
        "cil_float_32_unsigned_int_24_8_rev_depth32f_stencil8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002347,
        "KHR-GLES31.core.internalformat.textu",
        "re2d.rgba_unsigned_short_5_5_5_1_rgba");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002348,
        "KHR-GLES31.core.internalformat.tex",
        "ture2d.rgb_unsigned_short_5_6_5_rgb");
