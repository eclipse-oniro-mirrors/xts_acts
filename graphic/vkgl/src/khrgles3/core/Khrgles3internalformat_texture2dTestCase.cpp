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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003605,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.rgba_unsigned_byte_rgba");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003606,
        "KHR-GLES3.core.internalformat.",
        "texture2d.rgb_unsigned_byte_rgb");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003607,
        "KHR-GLES3.core.internalformat.textur",
        "e2d.rgba_unsigned_short_4_4_4_4_rgba");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003608,
        "KHR-GLES3.core.internalformat.texture2d.lu",
        "minance_alpha_unsigned_byte_luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003609,
        "KHR-GLES3.core.internalformat.textur",
        "e2d.luminance_unsigned_byte_luminance");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003610,
        "KHR-GLES3.core.internalformat.te",
        "xture2d.alpha_unsigned_byte_alpha");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003611,
        "KHR-GLES3.core.internalformat.texture2",
        "d.rgba_unsigned_int_2_10_10_10_rev_rgba");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003612,
        "KHR-GLES3.core.internalformat.texture2d.",
        "rgba_unsigned_int_2_10_10_10_rev_rgb10_a2");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003613,
        "KHR-GLES3.core.internalformat.texture2d.",
        "rgba_unsigned_int_2_10_10_10_rev_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003614,
        "KHR-GLES3.core.internalformat.texture",
        "2d.rgb_unsigned_int_2_10_10_10_rev_rgb");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003615,
        "KHR-GLES3.core.internalformat.texture2d.dep",
        "th_component_unsigned_short_depth_component");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003616,
        "KHR-GLES3.core.internalformat.texture2d.de",
        "pth_component_unsigned_int_depth_component");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003617,
        "KHR-GLES3.core.internalformat.texture2d.de",
        "pth_stencil_unsigned_int_24_8_depth_stencil");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003618,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.rgb_half_float_oes_rgb");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003619,
        "KHR-GLES3.core.internalformat.te",
        "xture2d.rgba_half_float_oes_rgba");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003620,
        "KHR-GLES3.core.internalformat.text",
        "ure2d.rgb_half_float_oes_rgb_linear");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003621,
        "KHR-GLES3.core.internalformat.textu",
        "re2d.rgba_half_float_oes_rgba_linear");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003622,
        "KHR-GLES3.core.internalforma",
        "t.texture2d.rgb_float_rgb32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003623,
        "KHR-GLES3.core.internalformat",
        ".texture2d.rgba_float_rgba32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003624,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.rgb_float_rgb32f_linear");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003625,
        "KHR-GLES3.core.internalformat.te",
        "xture2d.rgba_float_rgba32f_linear");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003626,
        "KHR-GLES3.core.internalformat.te",
        "xture2d.rgba_unsigned_byte_rgba8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003627,
        "KHR-GLES3.core.internalformat.tex",
        "ture2d.rgba_unsigned_byte_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003628,
        "KHR-GLES3.core.internalformat.te",
        "xture2d.rgba_unsigned_byte_rgba4");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003629,
        "KHR-GLES3.core.internalformat.textu",
        "re2d.rgba_unsigned_byte_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003630,
        "KHR-GLES3.core.internalformat.",
        "texture2d.rgba_byte_rgba8_snorm");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003631,
        "KHR-GLES3.core.internalformat.textur",
        "e2d.rgba_unsigned_short_4_4_4_4_rgba4");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003632,
        "KHR-GLES3.core.internalformat.texture",
        "2d.rgba_unsigned_short_5_5_5_1_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003633,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.rgba_half_float_rgba16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003634,
        "KHR-GLES3.core.internalformat",
        ".texture2d.rgba_float_rgba16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003635,
        "KHR-GLES3.core.internalformat.texture",
        "2d.rgba_integer_unsigned_byte_rgba8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003636,
        "KHR-GLES3.core.internalformat.te",
        "xture2d.rgba_integer_byte_rgba8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003637,
        "KHR-GLES3.core.internalformat.texture2",
        "d.rgba_integer_unsigned_short_rgba16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003638,
        "KHR-GLES3.core.internalformat.tex",
        "ture2d.rgba_integer_short_rgba16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003639,
        "KHR-GLES3.core.internalformat.texture",
        "2d.rgba_integer_unsigned_int_rgba32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003640,
        "KHR-GLES3.core.internalformat.te",
        "xture2d.rgba_integer_int_rgba32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003641,
        "KHR-GLES3.core.internalformat.texture2d.rgba_",
        "integer_unsigned_int_2_10_10_10_rev_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003642,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.rgb_unsigned_byte_rgb8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003643,
        "KHR-GLES3.core.internalformat.te",
        "xture2d.rgb_unsigned_byte_rgb565");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003644,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.rgb_unsigned_byte_srgb8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003645,
        "KHR-GLES3.core.internalformat.textu",
        "re2d.rgb_unsigned_short_5_6_5_rgb565");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003646,
        "KHR-GLES3.core.internalformat.texture2d.rgb",
        "_unsigned_int_10f_11f_11f_rev_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003647,
        "KHR-GLES3.core.internalformat.texture2",
        "d.rgb_unsigned_int_5_9_9_9_rev_rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003648,
        "KHR-GLES3.core.internalformat.",
        "texture2d.rgb_half_float_rgb16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003649,
        "KHR-GLES3.core.internalformat.text",
        "ure2d.rgb_half_float_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003650,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.rgb_half_float_rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003651,
        "KHR-GLES3.core.internalforma",
        "t.texture2d.rgb_float_rgb16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003652,
        "KHR-GLES3.core.internalformat.te",
        "xture2d.rgb_float_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003653,
        "KHR-GLES3.core.internalforma",
        "t.texture2d.rgb_float_rgb9_e5");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003654,
        "KHR-GLES3.core.internalformat.textur",
        "e2d.rgb_integer_unsigned_byte_rgb8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003655,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.rgb_integer_byte_rgb8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003656,
        "KHR-GLES3.core.internalformat.texture",
        "2d.rgb_integer_unsigned_short_rgb16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003657,
        "KHR-GLES3.core.internalformat.te",
        "xture2d.rgb_integer_short_rgb16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003658,
        "KHR-GLES3.core.internalformat.textur",
        "e2d.rgb_integer_unsigned_int_rgb32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003659,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.rgb_integer_int_rgb32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003660,
        "KHR-GLES3.core.internalformat.",
        "texture2d.rg_unsigned_byte_rg8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003661,
        "KHR-GLES3.core.internalformat",
        ".texture2d.rg_half_float_rg16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003662,
        "KHR-GLES3.core.internalform",
        "at.texture2d.rg_float_rg32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003663,
        "KHR-GLES3.core.internalform",
        "at.texture2d.rg_float_rg16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003664,
        "KHR-GLES3.core.internalformat.textu",
        "re2d.rg_integer_unsigned_byte_rg8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003665,
        "KHR-GLES3.core.internalformat.",
        "texture2d.rg_integer_byte_rg8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003666,
        "KHR-GLES3.core.internalformat.textur",
        "e2d.rg_integer_unsigned_short_rg16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003667,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.rg_integer_short_rg16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003668,
        "KHR-GLES3.core.internalformat.textu",
        "re2d.rg_integer_unsigned_int_rg32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003669,
        "KHR-GLES3.core.internalformat.",
        "texture2d.rg_integer_int_rg32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003670,
        "KHR-GLES3.core.internalformat.",
        "texture2d.red_unsigned_byte_r8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003671,
        "KHR-GLES3.core.internalformat",
        ".texture2d.red_half_float_r16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003672,
        "KHR-GLES3.core.internalform",
        "at.texture2d.red_float_r32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003673,
        "KHR-GLES3.core.internalform",
        "at.texture2d.red_float_r16f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003674,
        "KHR-GLES3.core.internalformat.textu",
        "re2d.red_integer_unsigned_byte_r8ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003675,
        "KHR-GLES3.core.internalformat.",
        "texture2d.red_integer_byte_r8i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003676,
        "KHR-GLES3.core.internalformat.textur",
        "e2d.red_integer_unsigned_short_r16ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003677,
        "KHR-GLES3.core.internalformat.t",
        "exture2d.red_integer_short_r16i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003678,
        "KHR-GLES3.core.internalformat.textu",
        "re2d.red_integer_unsigned_int_r32ui");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003679,
        "KHR-GLES3.core.internalformat.",
        "texture2d.red_integer_int_r32i");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003680,
        "KHR-GLES3.core.internalformat.texture2d.dept",
        "h_component_unsigned_short_depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003681,
        "KHR-GLES3.core.internalformat.texture2d.dep",
        "th_component_unsigned_int_depth_component24");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003682,
        "KHR-GLES3.core.internalformat.texture2d.dep",
        "th_component_unsigned_int_depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003683,
        "KHR-GLES3.core.internalformat.texture2d.",
        "depth_component_float_depth_component32f");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003684,
        "KHR-GLES3.core.internalformat.texture2d.dept",
        "h_stencil_unsigned_int_24_8_depth24_stencil8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003685,
        "KHR-GLES3.core.internalformat.texture2d.depth_stenc",
        "il_float_32_unsigned_int_24_8_rev_depth32f_stencil8");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003686,
        "KHR-GLES3.core.internalformat.textur",
        "e2d.rgba_unsigned_short_5_5_5_1_rgba");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003687,
        "KHR-GLES3.core.internalformat.text",
        "ure2d.rgb_unsigned_short_5_6_5_rgb");
