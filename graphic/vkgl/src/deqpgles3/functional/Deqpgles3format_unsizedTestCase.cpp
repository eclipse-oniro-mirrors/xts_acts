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
#include "../ActsDeqpgles30022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021823,
        "dEQP-GLES3.functional.textur",
        "e.format.unsized.alpha_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021824,
        "dEQP-GLES3.functional.texture",
        ".format.unsized.alpha_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021825,
        "dEQP-GLES3.functional.texture",
        ".format.unsized.alpha_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021826,
        "dEQP-GLES3.functional.texture.",
        "format.unsized.alpha_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021827,
        "dEQP-GLES3.functional.texture.f",
        "ormat.unsized.alpha_2d_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021828,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.unsized.alpha_2d_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021829,
        "dEQP-GLES3.functional.textur",
        "e.format.unsized.alpha_3d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021830,
        "dEQP-GLES3.functional.texture",
        ".format.unsized.alpha_3d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021831,
        "dEQP-GLES3.functional.texture.",
        "format.unsized.luminance_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021832,
        "dEQP-GLES3.functional.texture.f",
        "ormat.unsized.luminance_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021833,
        "dEQP-GLES3.functional.texture.f",
        "ormat.unsized.luminance_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021834,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.unsized.luminance_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021835,
        "dEQP-GLES3.functional.texture.for",
        "mat.unsized.luminance_2d_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021836,
        "dEQP-GLES3.functional.texture.form",
        "at.unsized.luminance_2d_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021837,
        "dEQP-GLES3.functional.texture.",
        "format.unsized.luminance_3d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021838,
        "dEQP-GLES3.functional.texture.f",
        "ormat.unsized.luminance_3d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021839,
        "dEQP-GLES3.functional.texture.for",
        "mat.unsized.luminance_alpha_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021840,
        "dEQP-GLES3.functional.texture.form",
        "at.unsized.luminance_alpha_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021841,
        "dEQP-GLES3.functional.texture.form",
        "at.unsized.luminance_alpha_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021842,
        "dEQP-GLES3.functional.texture.forma",
        "t.unsized.luminance_alpha_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021843,
        "dEQP-GLES3.functional.texture.format",
        ".unsized.luminance_alpha_2d_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021844,
        "dEQP-GLES3.functional.texture.format.",
        "unsized.luminance_alpha_2d_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021845,
        "dEQP-GLES3.functional.texture.for",
        "mat.unsized.luminance_alpha_3d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021846,
        "dEQP-GLES3.functional.texture.form",
        "at.unsized.luminance_alpha_3d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021847,
        "dEQP-GLES3.functional.texture.format.u",
        "nsized.rgb_unsigned_short_5_6_5_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021848,
        "dEQP-GLES3.functional.texture.format.u",
        "nsized.rgb_unsigned_short_5_6_5_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021849,
        "dEQP-GLES3.functional.texture.format.un",
        "sized.rgb_unsigned_short_5_6_5_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021850,
        "dEQP-GLES3.functional.texture.format.un",
        "sized.rgb_unsigned_short_5_6_5_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021851,
        "dEQP-GLES3.functional.texture.format.unsi",
        "zed.rgb_unsigned_short_5_6_5_2d_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021852,
        "dEQP-GLES3.functional.texture.format.unsi",
        "zed.rgb_unsigned_short_5_6_5_2d_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021853,
        "dEQP-GLES3.functional.texture.format.u",
        "nsized.rgb_unsigned_short_5_6_5_3d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021854,
        "dEQP-GLES3.functional.texture.format.u",
        "nsized.rgb_unsigned_short_5_6_5_3d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021855,
        "dEQP-GLES3.functional.texture.form",
        "at.unsized.rgb_unsigned_byte_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021856,
        "dEQP-GLES3.functional.texture.forma",
        "t.unsized.rgb_unsigned_byte_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021857,
        "dEQP-GLES3.functional.texture.forma",
        "t.unsized.rgb_unsigned_byte_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021858,
        "dEQP-GLES3.functional.texture.format",
        ".unsized.rgb_unsigned_byte_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021859,
        "dEQP-GLES3.functional.texture.format.",
        "unsized.rgb_unsigned_byte_2d_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021860,
        "dEQP-GLES3.functional.texture.format.u",
        "nsized.rgb_unsigned_byte_2d_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021861,
        "dEQP-GLES3.functional.texture.form",
        "at.unsized.rgb_unsigned_byte_3d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021862,
        "dEQP-GLES3.functional.texture.forma",
        "t.unsized.rgb_unsigned_byte_3d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021863,
        "dEQP-GLES3.functional.texture.format.un",
        "sized.rgba_unsigned_short_4_4_4_4_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021864,
        "dEQP-GLES3.functional.texture.format.uns",
        "ized.rgba_unsigned_short_4_4_4_4_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021865,
        "dEQP-GLES3.functional.texture.format.uns",
        "ized.rgba_unsigned_short_4_4_4_4_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021866,
        "dEQP-GLES3.functional.texture.format.unsi",
        "zed.rgba_unsigned_short_4_4_4_4_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021867,
        "dEQP-GLES3.functional.texture.format.unsiz",
        "ed.rgba_unsigned_short_4_4_4_4_2d_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021868,
        "dEQP-GLES3.functional.texture.format.unsize",
        "d.rgba_unsigned_short_4_4_4_4_2d_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021869,
        "dEQP-GLES3.functional.texture.format.un",
        "sized.rgba_unsigned_short_4_4_4_4_3d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021870,
        "dEQP-GLES3.functional.texture.format.uns",
        "ized.rgba_unsigned_short_4_4_4_4_3d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021871,
        "dEQP-GLES3.functional.texture.format.un",
        "sized.rgba_unsigned_short_5_5_5_1_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021872,
        "dEQP-GLES3.functional.texture.format.uns",
        "ized.rgba_unsigned_short_5_5_5_1_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021873,
        "dEQP-GLES3.functional.texture.format.uns",
        "ized.rgba_unsigned_short_5_5_5_1_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021874,
        "dEQP-GLES3.functional.texture.format.unsi",
        "zed.rgba_unsigned_short_5_5_5_1_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021875,
        "dEQP-GLES3.functional.texture.format.unsiz",
        "ed.rgba_unsigned_short_5_5_5_1_2d_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021876,
        "dEQP-GLES3.functional.texture.format.unsize",
        "d.rgba_unsigned_short_5_5_5_1_2d_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021877,
        "dEQP-GLES3.functional.texture.format.un",
        "sized.rgba_unsigned_short_5_5_5_1_3d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021878,
        "dEQP-GLES3.functional.texture.format.uns",
        "ized.rgba_unsigned_short_5_5_5_1_3d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021879,
        "dEQP-GLES3.functional.texture.forma",
        "t.unsized.rgba_unsigned_byte_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021880,
        "dEQP-GLES3.functional.texture.forma",
        "t.unsized.rgba_unsigned_byte_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021881,
        "dEQP-GLES3.functional.texture.format",
        ".unsized.rgba_unsigned_byte_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021882,
        "dEQP-GLES3.functional.texture.format",
        ".unsized.rgba_unsigned_byte_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021883,
        "dEQP-GLES3.functional.texture.format.u",
        "nsized.rgba_unsigned_byte_2d_array_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021884,
        "dEQP-GLES3.functional.texture.format.u",
        "nsized.rgba_unsigned_byte_2d_array_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021885,
        "dEQP-GLES3.functional.texture.forma",
        "t.unsized.rgba_unsigned_byte_3d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021886,
        "dEQP-GLES3.functional.texture.forma",
        "t.unsized.rgba_unsigned_byte_3d_npot");
