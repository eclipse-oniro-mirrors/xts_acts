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
#include "../ActsDeqpgles20011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010811,
        "dEQP-GLES2.functional.texture.specif",
        "ication.texsubimage2d_align.2d_l8_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010812,
        "dEQP-GLES2.functional.texture.specif",
        "ication.texsubimage2d_align.2d_l8_1_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010813,
        "dEQP-GLES2.functional.texture.specif",
        "ication.texsubimage2d_align.2d_l8_1_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010814,
        "dEQP-GLES2.functional.texture.specif",
        "ication.texsubimage2d_align.2d_l8_1_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010815,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_align.2d_l8_63_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010816,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_align.2d_l8_63_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010817,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_align.2d_l8_63_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010818,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_align.2d_l8_63_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010819,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.2d_rgba4444_51_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010820,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.2d_rgba4444_51_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010821,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.2d_rgba4444_51_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010822,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.2d_rgba4444_51_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010823,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_align.2d_rgb888_39_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010824,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_align.2d_rgb888_39_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010825,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_align.2d_rgb888_39_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010826,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.texsubimage2d_align.2d_rgb888_39_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010827,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.2d_rgba8888_47_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010828,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.2d_rgba8888_47_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010829,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.2d_rgba8888_47_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010830,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.2d_rgba8888_47_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010831,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_align.cube_l8_1_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010832,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_align.cube_l8_1_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010833,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_align.cube_l8_1_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010834,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.texsubimage2d_align.cube_l8_1_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010835,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_align.cube_l8_63_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010836,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_align.cube_l8_63_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010837,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_align.cube_l8_63_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010838,
        "dEQP-GLES2.functional.texture.specific",
        "ation.texsubimage2d_align.cube_l8_63_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010839,
        "dEQP-GLES2.functional.texture.specificati",
        "on.texsubimage2d_align.cube_rgba4444_51_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010840,
        "dEQP-GLES2.functional.texture.specificati",
        "on.texsubimage2d_align.cube_rgba4444_51_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010841,
        "dEQP-GLES2.functional.texture.specificati",
        "on.texsubimage2d_align.cube_rgba4444_51_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010842,
        "dEQP-GLES2.functional.texture.specificati",
        "on.texsubimage2d_align.cube_rgba4444_51_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010843,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.cube_rgb888_39_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010844,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.cube_rgb888_39_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010845,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.cube_rgb888_39_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010846,
        "dEQP-GLES2.functional.texture.specificat",
        "ion.texsubimage2d_align.cube_rgb888_39_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010847,
        "dEQP-GLES2.functional.texture.specificati",
        "on.texsubimage2d_align.cube_rgba8888_47_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010848,
        "dEQP-GLES2.functional.texture.specificati",
        "on.texsubimage2d_align.cube_rgba8888_47_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010849,
        "dEQP-GLES2.functional.texture.specificati",
        "on.texsubimage2d_align.cube_rgba8888_47_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010850,
        "dEQP-GLES2.functional.texture.specificati",
        "on.texsubimage2d_align.cube_rgba8888_47_8");
