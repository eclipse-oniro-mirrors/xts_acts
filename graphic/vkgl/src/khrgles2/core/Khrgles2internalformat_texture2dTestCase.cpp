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
#include "../Khrgles2BaseFunc.h"
#include "../ActsKhrgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000412,
        "KHR-GLES2.core.internalformat.t",
        "exture2d.rgba_unsigned_byte_rgba");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000413,
        "KHR-GLES2.core.internalformat.",
        "texture2d.rgb_unsigned_byte_rgb");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000414,
        "KHR-GLES2.core.internalformat.textur",
        "e2d.rgba_unsigned_short_4_4_4_4_rgba");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000415,
        "KHR-GLES2.core.internalformat.texture2d.lu",
        "minance_alpha_unsigned_byte_luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000416,
        "KHR-GLES2.core.internalformat.textur",
        "e2d.luminance_unsigned_byte_luminance");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000417,
        "KHR-GLES2.core.internalformat.te",
        "xture2d.alpha_unsigned_byte_alpha");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000418,
        "KHR-GLES2.core.internalformat.texture2",
        "d.rgba_unsigned_int_2_10_10_10_rev_rgba");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000419,
        "KHR-GLES2.core.internalformat.texture2d.",
        "rgba_unsigned_int_2_10_10_10_rev_rgb10_a2");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000420,
        "KHR-GLES2.core.internalformat.texture2d.",
        "rgba_unsigned_int_2_10_10_10_rev_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000421,
        "KHR-GLES2.core.internalformat.texture",
        "2d.rgb_unsigned_int_2_10_10_10_rev_rgb");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000422,
        "KHR-GLES2.core.internalformat.texture2d.dep",
        "th_component_unsigned_short_depth_component");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000423,
        "KHR-GLES2.core.internalformat.texture2d.de",
        "pth_component_unsigned_int_depth_component");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000424,
        "KHR-GLES2.core.internalformat.texture2d.de",
        "pth_stencil_unsigned_int_24_8_depth_stencil");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000425,
        "KHR-GLES2.core.internalformat.t",
        "exture2d.rgb_half_float_oes_rgb");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000426,
        "KHR-GLES2.core.internalformat.te",
        "xture2d.rgba_half_float_oes_rgba");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000427,
        "KHR-GLES2.core.internalformat.text",
        "ure2d.rgb_half_float_oes_rgb_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000428,
        "KHR-GLES2.core.internalformat.textu",
        "re2d.rgba_half_float_oes_rgba_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000429,
        "KHR-GLES2.core.internalforma",
        "t.texture2d.rgb_float_rgb32f");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000430,
        "KHR-GLES2.core.internalformat",
        ".texture2d.rgba_float_rgba32f");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000431,
        "KHR-GLES2.core.internalformat.t",
        "exture2d.rgb_float_rgb32f_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000432,
        "KHR-GLES2.core.internalformat.te",
        "xture2d.rgba_float_rgba32f_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000433,
        "KHR-GLES2.core.internalformat.tex",
        "ture2d.rgba_unsigned_byte_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000434,
        "KHR-GLES2.core.internalformat.te",
        "xture2d.rgba_unsigned_byte_rgba4");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000435,
        "KHR-GLES2.core.internalformat.te",
        "xture2d.rgb_unsigned_byte_rgb565");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000436,
        "KHR-GLES2.core.internalformat.textur",
        "e2d.rgba_unsigned_short_4_4_4_4_rgba4");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000437,
        "KHR-GLES2.core.internalformat.textur",
        "e2d.rgba_unsigned_short_5_5_5_1_rgba");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000438,
        "KHR-GLES2.core.internalformat.texture",
        "2d.rgba_unsigned_short_5_5_5_1_rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000439,
        "KHR-GLES2.core.internalformat.text",
        "ure2d.rgb_unsigned_short_5_6_5_rgb");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000440,
        "KHR-GLES2.core.internalformat.textu",
        "re2d.rgb_unsigned_short_5_6_5_rgb565");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000441,
        "KHR-GLES2.core.internalformat.texture2d.lumin",
        "ance_alpha_unsigned_byte_luminance8_alpha8_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000442,
        "KHR-GLES2.core.internalformat.texture2d.lumin",
        "ance_alpha_unsigned_byte_luminance4_alpha4_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000443,
        "KHR-GLES2.core.internalformat.texture2d",
        ".luminance_unsigned_byte_luminance8_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000444,
        "KHR-GLES2.core.internalformat.textu",
        "re2d.alpha_unsigned_byte_alpha8_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000445,
        "KHR-GLES2.core.internalformat.texture2d.dep",
        "th_component_unsigned_int_depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000446,
        "KHR-GLES2.core.internalformat.texture2d.dept",
        "h_component_unsigned_short_depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000447,
        "KHR-GLES2.core.internalformat.texture2d.dep",
        "th_component_unsigned_int_depth_component24");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000448,
        "KHR-GLES2.core.internalformat.texture2d.dep",
        "th_component_unsigned_int_depth_component32");
