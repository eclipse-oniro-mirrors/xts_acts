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
#include "../ActsDeqpgles30023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022325,
        "dEQP-GLES3.functional.texture",
        ".format.compressed.etc1_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022326,
        "dEQP-GLES3.functional.texture.",
        "format.compressed.etc1_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022327,
        "dEQP-GLES3.functional.texture.",
        "format.compressed.etc1_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022328,
        "dEQP-GLES3.functional.texture.f",
        "ormat.compressed.etc1_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022329,
        "dEQP-GLES3.functional.texture.f",
        "ormat.compressed.eac_r11_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022330,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.compressed.eac_r11_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022331,
        "dEQP-GLES3.functional.texture.f",
        "ormat.compressed.eac_r11_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022332,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.compressed.eac_r11_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022333,
        "dEQP-GLES3.functional.texture.form",
        "at.compressed.eac_signed_r11_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022334,
        "dEQP-GLES3.functional.texture.forma",
        "t.compressed.eac_signed_r11_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022335,
        "dEQP-GLES3.functional.texture.forma",
        "t.compressed.eac_signed_r11_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022336,
        "dEQP-GLES3.functional.texture.format",
        ".compressed.eac_signed_r11_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022337,
        "dEQP-GLES3.functional.texture.f",
        "ormat.compressed.eac_rg11_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022338,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.compressed.eac_rg11_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022339,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.compressed.eac_rg11_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022340,
        "dEQP-GLES3.functional.texture.for",
        "mat.compressed.eac_rg11_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022341,
        "dEQP-GLES3.functional.texture.forma",
        "t.compressed.eac_signed_rg11_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022342,
        "dEQP-GLES3.functional.texture.format",
        ".compressed.eac_signed_rg11_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022343,
        "dEQP-GLES3.functional.texture.forma",
        "t.compressed.eac_signed_rg11_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022344,
        "dEQP-GLES3.functional.texture.format",
        ".compressed.eac_signed_rg11_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022345,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.compressed.etc2_rgb8_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022346,
        "dEQP-GLES3.functional.texture.for",
        "mat.compressed.etc2_rgb8_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022347,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.compressed.etc2_rgb8_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022348,
        "dEQP-GLES3.functional.texture.for",
        "mat.compressed.etc2_rgb8_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022349,
        "dEQP-GLES3.functional.texture.fo",
        "rmat.compressed.etc2_srgb8_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022350,
        "dEQP-GLES3.functional.texture.for",
        "mat.compressed.etc2_srgb8_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022351,
        "dEQP-GLES3.functional.texture.for",
        "mat.compressed.etc2_srgb8_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022352,
        "dEQP-GLES3.functional.texture.form",
        "at.compressed.etc2_srgb8_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022353,
        "dEQP-GLES3.functional.texture.format.compr",
        "essed.etc2_rgb8_punchthrough_alpha1_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022354,
        "dEQP-GLES3.functional.texture.format.compre",
        "ssed.etc2_rgb8_punchthrough_alpha1_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022355,
        "dEQP-GLES3.functional.texture.format.compr",
        "essed.etc2_rgb8_punchthrough_alpha1_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022356,
        "dEQP-GLES3.functional.texture.format.compre",
        "ssed.etc2_rgb8_punchthrough_alpha1_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022357,
        "dEQP-GLES3.functional.texture.format.compr",
        "essed.etc2_srgb8_punchthrough_alpha1_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022358,
        "dEQP-GLES3.functional.texture.format.compre",
        "ssed.etc2_srgb8_punchthrough_alpha1_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022359,
        "dEQP-GLES3.functional.texture.format.compre",
        "ssed.etc2_srgb8_punchthrough_alpha1_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022360,
        "dEQP-GLES3.functional.texture.format.compres",
        "sed.etc2_srgb8_punchthrough_alpha1_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022361,
        "dEQP-GLES3.functional.texture.form",
        "at.compressed.etc2_eac_rgba8_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022362,
        "dEQP-GLES3.functional.texture.forma",
        "t.compressed.etc2_eac_rgba8_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022363,
        "dEQP-GLES3.functional.texture.forma",
        "t.compressed.etc2_eac_rgba8_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022364,
        "dEQP-GLES3.functional.texture.format",
        ".compressed.etc2_eac_rgba8_cube_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022365,
        "dEQP-GLES3.functional.texture.format.c",
        "ompressed.etc2_eac_srgb8_alpha8_2d_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022366,
        "dEQP-GLES3.functional.texture.format.co",
        "mpressed.etc2_eac_srgb8_alpha8_cube_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022367,
        "dEQP-GLES3.functional.texture.format.c",
        "ompressed.etc2_eac_srgb8_alpha8_2d_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022368,
        "dEQP-GLES3.functional.texture.format.co",
        "mpressed.etc2_eac_srgb8_alpha8_cube_npot");
