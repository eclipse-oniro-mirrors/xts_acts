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
#include "../ActsDeqpgles310016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015472,
        "dEQP-GLES31.functional.state_query.t",
        "exture.texture_cube_array.is_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015473,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_swizzle_r_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015474,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_swizzle_r_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015475,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_swizzle_r_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015476,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_swizzle_r_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015477,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_swizzle_g_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015478,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_swizzle_g_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015479,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_swizzle_g_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015480,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_swizzle_g_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015481,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_swizzle_b_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015482,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_swizzle_b_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015483,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_swizzle_b_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015484,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_swizzle_b_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015485,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_swizzle_a_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015486,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_swizzle_a_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015487,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_swizzle_a_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015488,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_swizzle_a_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015489,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_wrap_s_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015490,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_cube_array.texture_wrap_s_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015491,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_wrap_s_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015492,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_wrap_s_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015493,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_wrap_t_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015494,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_cube_array.texture_wrap_t_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015495,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_wrap_t_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015496,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_wrap_t_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015497,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_mag_filter_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015498,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_mag_filter_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015499,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_mag_filter_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015500,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_mag_filter_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015501,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_min_filter_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015502,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_min_filter_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015503,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_min_filter_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015504,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_min_filter_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015505,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_min_lod_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015506,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_cube_array.texture_min_lod_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015507,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_min_lod_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015508,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_min_lod_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015509,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_max_lod_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015510,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_cube_array.texture_max_lod_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015511,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_max_lod_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015512,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_max_lod_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015513,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_base_level_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015514,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_base_level_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015515,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_base_level_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015516,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_base_level_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015517,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_max_level_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015518,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_cube_array.texture_max_level_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015519,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_max_level_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015520,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_max_level_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015521,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_compare_mode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015522,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_compare_mode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015523,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_compare_mode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015524,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_cube_array.texture_compare_mode_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015525,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_compare_func_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015526,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_compare_func_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015527,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_compare_func_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015528,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_cube_array.texture_compare_func_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015529,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_cube_array.texture_immutable_levels_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015530,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_cube_array.texture_immutable_levels_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015531,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_cube_array.texture_immutable_levels_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015532,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_cube_array.texture_immutable_levels_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015533,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_cube_array.texture_immutable_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015534,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_cube_array.texture_immutable_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015535,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_cube_array.texture_immutable_format_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015536,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_cube_array.texture_immutable_format_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015537,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.depth_stencil_mode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015538,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.depth_stencil_mode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015539,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.depth_stencil_mode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015540,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.depth_stencil_mode_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015541,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_srgb_decode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015542,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_cube_array.texture_srgb_decode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015543,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_srgb_decode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015544,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_srgb_decode_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015545,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_border_color_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015546,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_cube_array.texture_border_color_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015547,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_cube_array.texture_border_color_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015548,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_cube_array.texture_border_color_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015549,
        "dEQP-GLES31.functional.state_query.texture.texture",
        "_cube_array.texture_wrap_s_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015550,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_cube_array.texture_wrap_s_clamp_to_border_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015551,
        "dEQP-GLES31.functional.state_query.texture.texture",
        "_cube_array.texture_wrap_t_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015552,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_cube_array.texture_wrap_t_clamp_to_border_float");
