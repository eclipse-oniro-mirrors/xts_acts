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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043030,
        "dEQP-GLES3.functional.state_que",
        "ry.texture.texture_2d_is_texture");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043031,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_2d_texture_swizzle_r_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043032,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_2d_texture_swizzle_r_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043033,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_2d_texture_swizzle_g_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043034,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_2d_texture_swizzle_g_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043035,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_2d_texture_swizzle_b_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043036,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_2d_texture_swizzle_b_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043037,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_2d_texture_swizzle_a_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043038,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_2d_texture_swizzle_a_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043039,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_2d_texture_wrap_s_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043040,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_2d_texture_wrap_s_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043041,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_2d_texture_wrap_t_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043042,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_2d_texture_wrap_t_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043043,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_2d_texture_mag_filter_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043044,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_2d_texture_mag_filter_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043045,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_2d_texture_min_filter_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043046,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_2d_texture_min_filter_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043047,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_2d_texture_min_lod_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043048,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_2d_texture_min_lod_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043049,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_2d_texture_max_lod_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043050,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_2d_texture_max_lod_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043051,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_2d_texture_base_level_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043052,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_2d_texture_base_level_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043053,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_2d_texture_max_level_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043054,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_2d_texture_max_level_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043055,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_texture_compare_mode_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043056,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_texture_compare_mode_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043057,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_texture_compare_func_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043058,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_texture_compare_func_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043059,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_2d_texture_immutable_levels_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043060,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_2d_texture_immutable_levels_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043061,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_2d_texture_immutable_format_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043062,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_2d_texture_immutable_format_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043063,
        "dEQP-GLES3.functional.state_que",
        "ry.texture.texture_3d_is_texture");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043064,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_3d_texture_swizzle_r_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043065,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_3d_texture_swizzle_r_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043066,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_3d_texture_swizzle_g_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043067,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_3d_texture_swizzle_g_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043068,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_3d_texture_swizzle_b_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043069,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_3d_texture_swizzle_b_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043070,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_3d_texture_swizzle_a_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043071,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_3d_texture_swizzle_a_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043072,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_3d_texture_wrap_s_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043073,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_3d_texture_wrap_s_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043074,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_3d_texture_wrap_t_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043075,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_3d_texture_wrap_t_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043076,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_3d_texture_wrap_r_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043077,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_3d_texture_wrap_r_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043078,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_3d_texture_mag_filter_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043079,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_3d_texture_mag_filter_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043080,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_3d_texture_min_filter_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043081,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_3d_texture_min_filter_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043082,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_3d_texture_min_lod_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043083,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_3d_texture_min_lod_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043084,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_3d_texture_max_lod_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043085,
        "dEQP-GLES3.functional.state_query.texture.",
        "texture_3d_texture_max_lod_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043086,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_3d_texture_base_level_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043087,
        "dEQP-GLES3.functional.state_query.texture.te",
        "xture_3d_texture_base_level_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043088,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_3d_texture_max_level_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043089,
        "dEQP-GLES3.functional.state_query.texture.t",
        "exture_3d_texture_max_level_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043090,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_3d_texture_compare_mode_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043091,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_3d_texture_compare_mode_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043092,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_3d_texture_compare_func_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043093,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_3d_texture_compare_func_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043094,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_3d_texture_immutable_levels_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043095,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_3d_texture_immutable_levels_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043096,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_3d_texture_immutable_format_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043097,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_3d_texture_immutable_format_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043098,
        "dEQP-GLES3.functional.state_query.",
        "texture.texture_2d_array_is_texture");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043099,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_2d_array_texture_swizzle_r_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043100,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_2d_array_texture_swizzle_r_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043101,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_2d_array_texture_swizzle_g_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043102,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_2d_array_texture_swizzle_g_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043103,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_2d_array_texture_swizzle_b_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043104,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_2d_array_texture_swizzle_b_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043105,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_2d_array_texture_swizzle_a_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043106,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_2d_array_texture_swizzle_a_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043107,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_array_texture_wrap_s_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043108,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_array_texture_wrap_s_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043109,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_array_texture_wrap_t_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043110,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_array_texture_wrap_t_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043111,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_2d_array_texture_mag_filter_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043112,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_2d_array_texture_mag_filter_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043113,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_2d_array_texture_min_filter_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043114,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_2d_array_texture_min_filter_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043115,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_array_texture_min_lod_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043116,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_array_texture_min_lod_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043117,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_array_texture_max_lod_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043118,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_2d_array_texture_max_lod_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043119,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_2d_array_texture_base_level_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043120,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_2d_array_texture_base_level_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043121,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_2d_array_texture_max_level_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043122,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_2d_array_texture_max_level_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043123,
        "dEQP-GLES3.functional.state_query.texture.textur",
        "e_2d_array_texture_compare_mode_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043124,
        "dEQP-GLES3.functional.state_query.texture.textur",
        "e_2d_array_texture_compare_mode_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043125,
        "dEQP-GLES3.functional.state_query.texture.textur",
        "e_2d_array_texture_compare_func_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043126,
        "dEQP-GLES3.functional.state_query.texture.textur",
        "e_2d_array_texture_compare_func_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043127,
        "dEQP-GLES3.functional.state_query.texture.texture_",
        "2d_array_texture_immutable_levels_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043128,
        "dEQP-GLES3.functional.state_query.texture.texture_",
        "2d_array_texture_immutable_levels_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043129,
        "dEQP-GLES3.functional.state_query.texture.texture_",
        "2d_array_texture_immutable_format_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043130,
        "dEQP-GLES3.functional.state_query.texture.texture_",
        "2d_array_texture_immutable_format_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043131,
        "dEQP-GLES3.functional.state_query.",
        "texture.texture_cube_map_is_texture");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043132,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_cube_map_texture_swizzle_r_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043133,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_cube_map_texture_swizzle_r_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043134,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_cube_map_texture_swizzle_g_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043135,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_cube_map_texture_swizzle_g_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043136,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_cube_map_texture_swizzle_b_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043137,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_cube_map_texture_swizzle_b_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043138,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_cube_map_texture_swizzle_a_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043139,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_cube_map_texture_swizzle_a_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043140,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_cube_map_texture_wrap_s_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043141,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_cube_map_texture_wrap_s_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043142,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_cube_map_texture_wrap_t_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043143,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_cube_map_texture_wrap_t_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043144,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_cube_map_texture_mag_filter_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043145,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_cube_map_texture_mag_filter_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043146,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_cube_map_texture_min_filter_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043147,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_cube_map_texture_min_filter_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043148,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_cube_map_texture_min_lod_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043149,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_cube_map_texture_min_lod_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043150,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_cube_map_texture_max_lod_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043151,
        "dEQP-GLES3.functional.state_query.texture.tex",
        "ture_cube_map_texture_max_lod_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043152,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_cube_map_texture_base_level_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043153,
        "dEQP-GLES3.functional.state_query.texture.textu",
        "re_cube_map_texture_base_level_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043154,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_cube_map_texture_max_level_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043155,
        "dEQP-GLES3.functional.state_query.texture.text",
        "ure_cube_map_texture_max_level_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043156,
        "dEQP-GLES3.functional.state_query.texture.textur",
        "e_cube_map_texture_compare_mode_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043157,
        "dEQP-GLES3.functional.state_query.texture.textur",
        "e_cube_map_texture_compare_mode_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043158,
        "dEQP-GLES3.functional.state_query.texture.textur",
        "e_cube_map_texture_compare_func_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043159,
        "dEQP-GLES3.functional.state_query.texture.textur",
        "e_cube_map_texture_compare_func_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043160,
        "dEQP-GLES3.functional.state_query.texture.texture_",
        "cube_map_texture_immutable_levels_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043161,
        "dEQP-GLES3.functional.state_query.texture.texture_",
        "cube_map_texture_immutable_levels_gettexparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043162,
        "dEQP-GLES3.functional.state_query.texture.texture_",
        "cube_map_texture_immutable_format_gettexparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043163,
        "dEQP-GLES3.functional.state_query.texture.texture_",
        "cube_map_texture_immutable_format_gettexparameterf");
