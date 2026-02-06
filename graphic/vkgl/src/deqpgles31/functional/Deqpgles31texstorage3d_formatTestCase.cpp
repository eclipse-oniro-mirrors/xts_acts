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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012848,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgba32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012849,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgba32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012850,
        "dEQP-GLES31.functional.texture.specificati",
        "on.texstorage3d.format.rgba32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012851,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgba16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012852,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgba16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012853,
        "dEQP-GLES31.functional.texture.specificati",
        "on.texstorage3d.format.rgba16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012854,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.rgba8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012855,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgba8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012856,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgba8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012857,
        "dEQP-GLES31.functional.texture.specification",
        ".texstorage3d.format.srgb8_alpha8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012858,
        "dEQP-GLES31.functional.texture.specificati",
        "on.texstorage3d.format.rgb10_a2_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012859,
        "dEQP-GLES31.functional.texture.specificatio",
        "n.texstorage3d.format.rgb10_a2ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012860,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.rgba4_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012861,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgb5_a1_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012862,
        "dEQP-GLES31.functional.texture.specificatio",
        "n.texstorage3d.format.rgba8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012863,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.rgb8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012864,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgb565_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012865,
        "dEQP-GLES31.functional.texture.specification.",
        "texstorage3d.format.r11f_g11f_b10f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012866,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgb32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012867,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgb32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012868,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgb32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012869,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgb16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012870,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgb16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012871,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgb16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012872,
        "dEQP-GLES31.functional.texture.specificatio",
        "n.texstorage3d.format.rgb8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012873,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.rgb8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012874,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgb8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012875,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.srgb8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012876,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rgb9_e5_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012877,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.rg32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012878,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.rg32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012879,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rg32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012880,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.rg16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012881,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.rg16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012882,
        "dEQP-GLES31.functional.texture.specificat",
        "ion.texstorage3d.format.rg16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012883,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texstorage3d.format.rg8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012884,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.rg8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012885,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.rg8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012886,
        "dEQP-GLES31.functional.texture.specificati",
        "on.texstorage3d.format.rg8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012887,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.r32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012888,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.r32i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012889,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.r32ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012890,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.r16f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012891,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.r16i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012892,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.r16ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012893,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texstorage3d.format.r8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012894,
        "dEQP-GLES31.functional.texture.specific",
        "ation.texstorage3d.format.r8i_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012895,
        "dEQP-GLES31.functional.texture.specifica",
        "tion.texstorage3d.format.r8ui_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012896,
        "dEQP-GLES31.functional.texture.specificati",
        "on.texstorage3d.format.r8_snorm_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012897,
        "dEQP-GLES31.functional.texture.specification.te",
        "xstorage3d.format.depth_component32f_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012898,
        "dEQP-GLES31.functional.texture.specification.t",
        "exstorage3d.format.depth_component24_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012899,
        "dEQP-GLES31.functional.texture.specification.t",
        "exstorage3d.format.depth_component16_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012900,
        "dEQP-GLES31.functional.texture.specification.t",
        "exstorage3d.format.depth32f_stencil8_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012901,
        "dEQP-GLES31.functional.texture.specification.t",
        "exstorage3d.format.depth24_stencil8_cube_array");
