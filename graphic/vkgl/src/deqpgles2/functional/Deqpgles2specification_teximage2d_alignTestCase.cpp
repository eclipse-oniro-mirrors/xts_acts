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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010725,
        "dEQP-GLES2.functional.texture.speci",
        "fication.teximage2d_align.2d_l8_4_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010726,
        "dEQP-GLES2.functional.texture.speci",
        "fication.teximage2d_align.2d_l8_63_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010727,
        "dEQP-GLES2.functional.texture.speci",
        "fication.teximage2d_align.2d_l8_63_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010728,
        "dEQP-GLES2.functional.texture.speci",
        "fication.teximage2d_align.2d_l8_63_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010729,
        "dEQP-GLES2.functional.texture.speci",
        "fication.teximage2d_align.2d_l8_63_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010730,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.2d_rgba4444_51_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010731,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.2d_rgba4444_51_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010732,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.2d_rgba4444_51_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010733,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.2d_rgba4444_51_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010734,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgb888_39_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010735,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgb888_39_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010736,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgb888_39_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010737,
        "dEQP-GLES2.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgb888_39_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010738,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.2d_rgba8888_47_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010739,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.2d_rgba8888_47_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010740,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.2d_rgba8888_47_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010741,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.2d_rgba8888_47_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010742,
        "dEQP-GLES2.functional.texture.specif",
        "ication.teximage2d_align.cube_l8_4_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010743,
        "dEQP-GLES2.functional.texture.specif",
        "ication.teximage2d_align.cube_l8_63_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010744,
        "dEQP-GLES2.functional.texture.specif",
        "ication.teximage2d_align.cube_l8_63_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010745,
        "dEQP-GLES2.functional.texture.specif",
        "ication.teximage2d_align.cube_l8_63_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010746,
        "dEQP-GLES2.functional.texture.specif",
        "ication.teximage2d_align.cube_l8_63_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010747,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.teximage2d_align.cube_rgba4444_51_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010748,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.teximage2d_align.cube_rgba4444_51_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010749,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.teximage2d_align.cube_rgba4444_51_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010750,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.teximage2d_align.cube_rgba4444_51_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010751,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.cube_rgb888_39_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010752,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.cube_rgb888_39_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010753,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.cube_rgb888_39_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010754,
        "dEQP-GLES2.functional.texture.specific",
        "ation.teximage2d_align.cube_rgb888_39_8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010755,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.teximage2d_align.cube_rgba8888_47_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010756,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.teximage2d_align.cube_rgba8888_47_2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010757,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.teximage2d_align.cube_rgba8888_47_4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010758,
        "dEQP-GLES2.functional.texture.specifica",
        "tion.teximage2d_align.cube_rgba8888_47_8");
