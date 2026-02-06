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
#include "../ActsDeqpgles310013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012788,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012789,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012790,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texsubimage3d_pbo.rgba32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012791,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012792,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012793,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texsubimage3d_pbo.rgba16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012794,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgba8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012795,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012796,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgba8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012797,
        "dEQP-GLES31.functional.texture.specificatio",
        "n.texsubimage3d_pbo.srgb8_alpha8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012798,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texsubimage3d_pbo.rgb10_a2_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012799,
        "dEQP-GLES31.functional.texture.specificati",
        "on.texsubimage3d_pbo.rgb10_a2ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012800,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgba4_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012801,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb5_a1_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012802,
        "dEQP-GLES31.functional.texture.specificati",
        "on.texsubimage3d_pbo.rgba8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012803,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgb8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012804,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb565_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012805,
        "dEQP-GLES31.functional.texture.specification",
        ".texsubimage3d_pbo.r11f_g11f_b10f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012806,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012807,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012808,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012809,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012810,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012811,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012812,
        "dEQP-GLES31.functional.texture.specificati",
        "on.texsubimage3d_pbo.rgb8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012813,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.rgb8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012814,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012815,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.srgb8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012816,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rgb9_e5_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012817,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012818,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012819,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rg32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012820,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012821,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012822,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texsubimage3d_pbo.rg16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012823,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.texsubimage3d_pbo.rg8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012824,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012825,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.rg8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012826,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texsubimage3d_pbo.rg8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012827,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.r32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012828,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.r32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012829,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.r32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012830,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.r16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012831,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.r16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012832,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.r16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012833,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.texsubimage3d_pbo.r8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012834,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.texsubimage3d_pbo.r8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012835,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texsubimage3d_pbo.r8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012836,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texsubimage3d_pbo.r8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012837,
        "dEQP-GLES31.functional.texture.specificati",
        "on.texsubimage3d_pbo.rgb8_offset_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012838,
        "dEQP-GLES31.functional.texture.specification.",
        "texsubimage3d_pbo.rgb8_image_height_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012839,
        "dEQP-GLES31.functional.texture.specification",
        ".texsubimage3d_pbo.rgb8_row_length_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012840,
        "dEQP-GLES31.functional.texture.specification.",
        "texsubimage3d_pbo.rgb8_skip_images_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012841,
        "dEQP-GLES31.functional.texture.specification",
        ".texsubimage3d_pbo.rgb8_skip_rows_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012842,
        "dEQP-GLES31.functional.texture.specification.",
        "texsubimage3d_pbo.rgb8_skip_pixels_cube_array");
