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

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026109,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage2d_align.2d_r8_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026110,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage2d_align.2d_r8_1_2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026111,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage2d_align.2d_r8_1_4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026112,
        "dEQP-GLES3.functional.texture.specif",
        "ication.texsubimage2d_align.2d_r8_1_8");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026113,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage2d_align.2d_r8_63_1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026114,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage2d_align.2d_r8_63_2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026115,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage2d_align.2d_r8_63_4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026116,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage2d_align.2d_r8_63_8");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026117,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgba4_51_1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026118,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgba4_51_2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026119,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgba4_51_4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026120,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgba4_51_8");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026121,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgb8_39_1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026122,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgb8_39_2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026123,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgb8_39_4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026124,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgb8_39_8");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026125,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgba8_47_1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026126,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgba8_47_2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026127,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgba8_47_4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026128,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.2d_rgba8_47_8");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026129,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage2d_align.cube_r8_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026130,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage2d_align.cube_r8_1_2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026131,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage2d_align.cube_r8_1_4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026132,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.texsubimage2d_align.cube_r8_1_8");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026133,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.cube_r8_63_1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026134,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.cube_r8_63_2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026135,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.cube_r8_63_4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026136,
        "dEQP-GLES3.functional.texture.specific",
        "ation.texsubimage2d_align.cube_r8_63_8");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026137,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgba4_51_1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026138,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgba4_51_2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026139,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgba4_51_4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026140,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgba4_51_8");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026141,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgb8_39_1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026142,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgb8_39_2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026143,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgb8_39_4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026144,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgb8_39_8");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026145,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgba8_47_1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026146,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgba8_47_2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026147,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgba8_47_4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026148,
        "dEQP-GLES3.functional.texture.specifica",
        "tion.texsubimage2d_align.cube_rgba8_47_8");
