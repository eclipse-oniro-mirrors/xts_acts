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
#include "../ActsGles31MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000012,
        "dEQP-GLES31.functional.texture.borde",
        "r_clamp.formats.r32f.linear_size_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000013,
        "dEQP-GLES31.functional.texture.borde",
        "r_clamp.formats.r32f.linear_size_npot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000014,
        "dEQP-GLES31.functional.texture.borde",
        "r_clamp.formats.rg32f.linear_size_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000015,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.formats.rg32f.linear_size_npot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000016,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.formats.rgb32f.linear_size_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000017,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.formats.rgb32f.linear_size_npot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000018,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.formats.rgba32f.linear_size_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000019,
        "dEQP-GLES31.functional.texture.border_",
        "clamp.formats.rgba32f.linear_size_npot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000020,
        "dEQP-GLES31.functional.texture.border",
        "_clamp.range_clamp.linear_float_color");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000021,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.te",
        "xture_2d.float_color.linear.s_clamp_to_edge_t_clamp_to_border_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000022,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.te",
        "xture_2d.float_color.linear.s_clamp_to_edge_t_clamp_to_border_npot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000023,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mod",
        "e.texture_2d.float_color.linear.s_repeat_t_clamp_to_border_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000024,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode",
        ".texture_2d.float_color.linear.s_repeat_t_clamp_to_border_npot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000025,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.tex",
        "ture_2d.float_color.linear.s_mirrored_repeat_t_clamp_to_border_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000026,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.tex",
        "ture_2d.float_color.linear.s_mirrored_repeat_t_clamp_to_border_npot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000027,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.texture_3d.f",
        "loat_color.linear.s_clamp_to_border_t_clamp_to_border_r_clamp_to_border_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000028,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.texture_3d.f",
        "loat_color.linear.s_clamp_to_border_t_clamp_to_border_r_clamp_to_border_npot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000029,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.texture",
        "_3d.float_color.linear.s_clamp_to_border_t_clamp_to_border_r_repeat_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000030,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.texture_",
        "3d.float_color.linear.s_clamp_to_border_t_clamp_to_border_r_repeat_npot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000031,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.texture",
        "_3d.float_color.linear.s_mirrored_repeat_t_clamp_to_border_r_repeat_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000032,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.texture_",
        "3d.float_color.linear.s_mirrored_repeat_t_clamp_to_border_r_repeat_npot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000033,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.texture",
        "_3d.float_color.linear.s_repeat_t_mirrored_repeat_r_clamp_to_border_pot");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000034,
        "dEQP-GLES31.functional.texture.border_clamp.per_axis_wrap_mode.texture_",
        "3d.float_color.linear.s_repeat_t_mirrored_repeat_r_clamp_to_border_npot");
