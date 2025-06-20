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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012673,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgba32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012674,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgba32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012675,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgba32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012676,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgba16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012677,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgba16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012678,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgba16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012679,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rgba8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012680,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rgba8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012681,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgba8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012682,
        "dEQP-GLES31.functional.texture.specificati",
        "on.basic_teximage3d.srgb8_alpha8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012683,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgb10_a2_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012684,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.basic_teximage3d.rgb10_a2ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012685,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rgba4_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012686,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgb5_a1_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012687,
        "dEQP-GLES31.functional.texture.specificati",
        "on.basic_teximage3d.rgba8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012688,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.basic_teximage3d.rgb8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012689,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rgb565_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012690,
        "dEQP-GLES31.functional.texture.specificatio",
        "n.basic_teximage3d.r11f_g11f_b10f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012691,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rgb32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012692,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rgb32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012693,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgb32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012694,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rgb16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012695,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rgb16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012696,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgb16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012697,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.basic_teximage3d.rgb8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012698,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rgb8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012699,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rgb8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012700,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.srgb8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012701,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.rgb9_e5_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012702,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rg32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012703,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rg32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012704,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rg32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012705,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rg16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012706,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rg16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012707,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rg16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012708,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.basic_teximage3d.rg8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012709,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.basic_teximage3d.rg8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012710,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.rg8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012711,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.basic_teximage3d.rg8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012712,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.basic_teximage3d.r32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012713,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.basic_teximage3d.r32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012714,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.r32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012715,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.basic_teximage3d.r16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012716,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.basic_teximage3d.r16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012717,
        "dEQP-GLES31.functional.texture.specific",
        "ation.basic_teximage3d.r16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012718,
        "dEQP-GLES31.functional.texture.specif",
        "ication.basic_teximage3d.r8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012719,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.basic_teximage3d.r8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012720,
        "dEQP-GLES31.functional.texture.specifi",
        "cation.basic_teximage3d.r8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012721,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.basic_teximage3d.r8_snorm_cube_array");
