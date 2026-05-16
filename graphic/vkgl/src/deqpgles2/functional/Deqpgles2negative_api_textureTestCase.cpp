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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013729,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.activetexture_invalid_texture");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013730,
        "dEQP-GLES2.functional.negative_api",
        ".texture.bindtexture_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013731,
        "dEQP-GLES2.functional.negative_api",
        ".texture.bindtexture_type_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013732,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.compressedteximage_2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013733,
        "dEQP-GLES2.functional.negative_api.texture",
        ".compressedteximage_2d_invalid_format_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013734,
        "dEQP-GLES2.functional.negative_api.texture",
        ".compressedteximage_2d_invalid_format_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013735,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.compressedteximage2d_neg_level_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013736,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.compressedteximage2d_neg_level_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013737,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.compressedteximage2d_level_max_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013738,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.compressedteximage2d_level_max_cube_pos");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013739,
        "dEQP-GLES2.functional.negative_api.texture.",
        "compressedteximage2d_neg_width_height_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013740,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_neg_width_height_cube_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013741,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_neg_width_height_cube_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013742,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_neg_width_height_cube_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013743,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_neg_width_height_cube_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013744,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_neg_width_height_cube_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013745,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_neg_width_height_cube_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013746,
        "dEQP-GLES2.functional.negative_api.texture.",
        "compressedteximage2d_width_height_max_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013747,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_width_height_max_cube_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013748,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_width_height_max_cube_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013749,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_width_height_max_cube_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013750,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_width_height_max_cube_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013751,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_width_height_max_cube_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013752,
        "dEQP-GLES2.functional.negative_api.texture.co",
        "mpressedteximage2d_width_height_max_cube_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013753,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.compressedteximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013754,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "ompressedteximage2d_invalid_border_cube_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013755,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "ompressedteximage2d_invalid_border_cube_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013756,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "ompressedteximage2d_invalid_border_cube_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013757,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "ompressedteximage2d_invalid_border_cube_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013758,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "ompressedteximage2d_invalid_border_cube_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013759,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "ompressedteximage2d_invalid_border_cube_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013760,
        "dEQP-GLES2.functional.negative_api.tex",
        "true.compressedteximage2d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013761,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.copyteximage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013762,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.copyteximage2d_invalid_format_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013763,
        "dEQP-GLES2.functional.negative_api.tex",
        "ture.copyteximage2d_invalid_format_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013764,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.copyteximage2d_inequal_width_height_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013765,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.copyteximage2d_neg_level_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013766,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.copyteximage2d_neg_level_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013767,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.copyteximage2d_level_max_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013768,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.copyteximage2d_level_max_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013769,
        "dEQP-GLES2.functional.negative_api.texture",
        ".copyteximage2d_invalid_width_height_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013770,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "opyteximage2d_invalid_width_height_cube_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013771,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "opyteximage2d_invalid_width_height_cube_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013772,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "opyteximage2d_invalid_width_height_cube_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013773,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "opyteximage2d_invalid_width_height_cube_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013774,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "opyteximage2d_invalid_width_height_cube_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013775,
        "dEQP-GLES2.functional.negative_api.texture.c",
        "opyteximage2d_invalid_width_height_cube_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013776,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.copyteximage2d_width_height_max_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013777,
        "dEQP-GLES2.functional.negative_api.texture",
        ".copyteximage2d_width_height_max_cube_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013778,
        "dEQP-GLES2.functional.negative_api.texture",
        ".copyteximage2d_width_height_max_cube_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013779,
        "dEQP-GLES2.functional.negative_api.texture",
        ".copyteximage2d_width_height_max_cube_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013780,
        "dEQP-GLES2.functional.negative_api.texture",
        ".copyteximage2d_width_height_max_cube_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013781,
        "dEQP-GLES2.functional.negative_api.texture",
        ".copyteximage2d_width_height_max_cube_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013782,
        "dEQP-GLES2.functional.negative_api.texture",
        ".copyteximage2d_width_height_max_cube_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013783,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.copyteximage2d_invalid_border_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013784,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.copyteximage2d_invalid_border_cube_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013785,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.copyteximage2d_invalid_border_cube_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013786,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.copyteximage2d_invalid_border_cube_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013787,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.copyteximage2d_invalid_border_cube_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013788,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.copyteximage2d_invalid_border_cube_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013789,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.copyteximage2d_invalid_border_cube_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013790,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.copyteximage2d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013791,
        "dEQP-GLES2.functional.negative_api.te",
        "xture.copytexsubimage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013792,
        "dEQP-GLES2.functional.negative_api.tex",
        "ture.copytexsubimage2d_neg_level_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013793,
        "dEQP-GLES2.functional.negative_api.te",
        "xture.copytexsubimage2d_neg_level_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013794,
        "dEQP-GLES2.functional.negative_api.tex",
        "ture.copytexsubimage2d_level_max_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013795,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.copytexsubimage2d_level_max_cube_pos");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013796,
        "dEQP-GLES2.functional.negative_api.",
        "texture.copytexsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013797,
        "dEQP-GLES2.functional.negative_api.te",
        "xture.copytexsubimage2d_offset_allowed");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013798,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.copytexsubimage2d_neg_wdt_hgt");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013799,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.copytexsubimage2d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013800,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.deletetextures_invalid_number");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013801,
        "dEQP-GLES2.functional.negative_api.tex",
        "ture.deletetextures_invalid_number_bind");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013802,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.generatemipmap_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013803,
        "dEQP-GLES2.functional.negative_api.",
        "texture.generatemipmap_npot_wdt_hgt");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013804,
        "dEQP-GLES2.functional.negative_api.texture",
        ".generatemipmap_zero_level_array_compressed");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013805,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.generatemipmap_incomplete_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013806,
        "dEQP-GLES2.functional.negative_ap",
        "i.texture.gentextures_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013807,
        "dEQP-GLES2.functional.negative_api",
        ".texture.pixelstorei_invalid_pname");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013808,
        "dEQP-GLES2.functional.negative_api",
        ".texture.pixelstorei_invalid_param");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013809,
        "dEQP-GLES2.functional.negative_api",
        ".texture.teximage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013810,
        "dEQP-GLES2.functional.negative_api",
        ".texture.teximage2d_invalid_format");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013811,
        "dEQP-GLES2.functional.negative_ap",
        "i.texture.teximage2d_invalid_type");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013812,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.teximage2d_inequal_width_height_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013813,
        "dEQP-GLES2.functional.negative_api",
        ".texture.teximage2d_neg_level_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013814,
        "dEQP-GLES2.functional.negative_api",
        ".texture.teximage2d_neg_level_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013815,
        "dEQP-GLES2.functional.negative_api",
        ".texture.teximage2d_level_max_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013816,
        "dEQP-GLES2.functional.negative_api",
        ".texture.teximage2d_level_max_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013817,
        "dEQP-GLES2.functional.negative_api.tex",
        "ture.teximage2d_invalid_internalformat");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013818,
        "dEQP-GLES2.functional.negative_api.tex",
        "ture.teximage2d_neg_width_height_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013819,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_neg_width_height_cube_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013820,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_neg_width_height_cube_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013821,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_neg_width_height_cube_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013822,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_neg_width_height_cube_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013823,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_neg_width_height_cube_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013824,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_neg_width_height_cube_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013825,
        "dEQP-GLES2.functional.negative_api.tex",
        "ture.teximage2d_width_height_max_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013826,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_width_height_max_cube_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013827,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_width_height_max_cube_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013828,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_width_height_max_cube_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013829,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_width_height_max_cube_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013830,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_width_height_max_cube_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013831,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.teximage2d_width_height_max_cube_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013832,
        "dEQP-GLES2.functional.negative_api",
        ".texture.teximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013833,
        "dEQP-GLES2.functional.negative_api",
        ".texture.teximage2d_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013834,
        "dEQP-GLES2.functional.negative_api.te",
        "xture.teximage2d_type_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013835,
        "dEQP-GLES2.functional.negative_api.",
        "texture.texsubimage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013836,
        "dEQP-GLES2.functional.negative_api.",
        "texture.texsubimage2d_invalid_format");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013837,
        "dEQP-GLES2.functional.negative_api",
        ".texture.texsubimage2d_invalid_type");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013838,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.texsubimage2d_neg_level_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013839,
        "dEQP-GLES2.functional.negative_api.",
        "texture.texsubimage2d_neg_level_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013840,
        "dEQP-GLES2.functional.negative_api.t",
        "exture.texsubimage2d_level_max_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013841,
        "dEQP-GLES2.functional.negative_api.",
        "texture.texsubimage2d_level_max_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013842,
        "dEQP-GLES2.functional.negative_ap",
        "i.texture.texsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013843,
        "dEQP-GLES2.functional.negative_api.",
        "texture.texsubimage2d_offset_allowed");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013844,
        "dEQP-GLES2.functional.negative_api",
        ".texture.texsubimage2d_neg_wdt_hgt");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013845,
        "dEQP-GLES2.functional.negative_api.tex",
        "ture.texsubimage2d_type_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013846,
        "dEQP-GLES2.functional.negati",
        "ve_api.texture.texparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013847,
        "dEQP-GLES2.functional.negative",
        "_api.texture.texparameteri_bind");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013848,
        "dEQP-GLES2.functional.negati",
        "ve_api.texture.texparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013849,
        "dEQP-GLES2.functional.negative",
        "_api.texture.texparameterf_bind");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013850,
        "dEQP-GLES2.functional.negati",
        "ve_api.texture.texparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013851,
        "dEQP-GLES2.functional.negative_",
        "api.texture.texparameteriv_bind");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013852,
        "dEQP-GLES2.functional.negati",
        "ve_api.texture.texparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013853,
        "dEQP-GLES2.functional.negative_",
        "api.texture.texparameterfv_bind");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013854,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.compressedtexsubimage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013855,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.compressedtexsubimage2d_neg_level_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013856,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.compressedtexsubimage2d_neg_level_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013857,
        "dEQP-GLES2.functional.negative_api.textur",
        "e.compressedtexsubimage2d_level_max_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013858,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.compressedtexsubimage2d_level_max_cube");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013859,
        "dEQP-GLES2.functional.negative_api.tex",
        "ture.compressedtexsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013860,
        "dEQP-GLES2.functional.negative_api.textu",
        "re.compressedtexsubimage2d_offset_allowed");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013861,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.compressedtexsubimage2d_neg_wdt_hgt");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013862,
        "dEQP-GLES2.functional.negative_api.text",
        "ure.compressedtexsubimage2d_invalid_size");
