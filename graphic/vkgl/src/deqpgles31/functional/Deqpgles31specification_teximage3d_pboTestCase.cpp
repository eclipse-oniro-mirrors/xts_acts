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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012722,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgba32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012723,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgba32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012724,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgba32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012725,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgba16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012726,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgba16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012727,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgba16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012728,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rgba8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012729,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rgba8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012730,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgba8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012731,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.teximage3d_pbo.srgb8_alpha8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012732,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgb10_a2_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012733,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.teximage3d_pbo.rgb10_a2ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012734,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rgba4_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012735,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgb5_a1_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012736,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.teximage3d_pbo.rgba8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012737,
        "dEQP-GLES31.functional.texture.specif",
        "ication.teximage3d_pbo.rgb8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012738,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb565_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012739,
        "dEQP-GLES31.functional.texture.specificati",
        "on.teximage3d_pbo.r11f_g11f_b10f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012740,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012741,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012742,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgb32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012743,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012744,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012745,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgb16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012746,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.teximage3d_pbo.rgb8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012747,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012748,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rgb8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012749,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.srgb8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012750,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.rgb9_e5_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012751,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rg32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012752,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rg32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012753,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rg32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012754,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rg16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012755,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rg16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012756,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rg16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012757,
        "dEQP-GLES31.functional.texture.specif",
        "ication.teximage3d_pbo.rg8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012758,
        "dEQP-GLES31.functional.texture.specif",
        "ication.teximage3d_pbo.rg8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012759,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.rg8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012760,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.teximage3d_pbo.rg8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012761,
        "dEQP-GLES31.functional.texture.specif",
        "ication.teximage3d_pbo.r32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012762,
        "dEQP-GLES31.functional.texture.specif",
        "ication.teximage3d_pbo.r32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012763,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.r32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012764,
        "dEQP-GLES31.functional.texture.specif",
        "ication.teximage3d_pbo.r16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012765,
        "dEQP-GLES31.functional.texture.specif",
        "ication.teximage3d_pbo.r16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012766,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.teximage3d_pbo.r16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012767,
        "dEQP-GLES31.functional.texture.speci",
        "fication.teximage3d_pbo.r8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012768,
        "dEQP-GLES31.functional.texture.specif",
        "ication.teximage3d_pbo.r8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012769,
        "dEQP-GLES31.functional.texture.specif",
        "ication.teximage3d_pbo.r8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012770,
        "dEQP-GLES31.functional.texture.specific",
        "ation.teximage3d_pbo.r8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012771,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.teximage3d_pbo.rgb8_offset_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012772,
        "dEQP-GLES31.functional.texture.specificati",
        "on.teximage3d_pbo.rgb8_alignment_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012773,
        "dEQP-GLES31.functional.texture.specification",
        ".teximage3d_pbo.rgb8_image_height_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012774,
        "dEQP-GLES31.functional.texture.specificatio",
        "n.teximage3d_pbo.rgb8_row_length_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012775,
        "dEQP-GLES31.functional.texture.specificatio",
        "n.teximage3d_pbo.rgb8_skip_images_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012776,
        "dEQP-GLES31.functional.texture.specificati",
        "on.teximage3d_pbo.rgb8_skip_rows_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012777,
        "dEQP-GLES31.functional.texture.specificatio",
        "n.teximage3d_pbo.rgb8_skip_pixels_cube_array");
