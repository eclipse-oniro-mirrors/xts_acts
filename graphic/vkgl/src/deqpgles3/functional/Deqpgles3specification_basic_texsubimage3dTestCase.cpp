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
#include "../ActsDeqpgles30027TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026530,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgba32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026531,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgba32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026532,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgba32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026533,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgba16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026534,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgba16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026535,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgba16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026536,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rgba8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026537,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rgba8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026538,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgba8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026539,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_texsubimage3d.srgb8_alpha8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026540,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgb10_a2_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026541,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage3d.rgb10_a2ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026542,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rgba4_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026543,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgb5_a1_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026544,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.basic_texsubimage3d.rgba8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026545,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage3d.rgb8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026546,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rgb565_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026547,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.basic_texsubimage3d.r11f_g11f_b10f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026548,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rgb32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026549,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rgb32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026550,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgb32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026551,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rgb16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026552,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rgb16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026553,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgb16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026554,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage3d.rgb8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026555,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rgb8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026556,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rgb8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026557,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.srgb8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026558,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.rgb9_e5_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026559,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rg32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026560,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rg32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026561,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rg32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026562,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rg16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026563,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rg16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026564,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rg16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026565,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage3d.rg8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026566,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage3d.rg8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026567,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.rg8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026568,
        "dEQP-GLES3.functional.texture.specific",
        "ation.basic_texsubimage3d.rg8_snorm_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026569,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage3d.r32f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026570,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage3d.r32i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026571,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.r32ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026572,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage3d.r16f_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026573,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage3d.r16i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026574,
        "dEQP-GLES3.functional.texture.specif",
        "ication.basic_texsubimage3d.r16ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026575,
        "dEQP-GLES3.functional.texture.spec",
        "ification.basic_texsubimage3d.r8_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026576,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage3d.r8i_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026577,
        "dEQP-GLES3.functional.texture.speci",
        "fication.basic_texsubimage3d.r8ui_3d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026578,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.basic_texsubimage3d.r8_snorm_3d");
