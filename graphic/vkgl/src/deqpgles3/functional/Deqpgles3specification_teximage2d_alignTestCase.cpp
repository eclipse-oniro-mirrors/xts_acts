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
#include "../ActsDeqpgles30026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025830,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_align.2d_r8_4_8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025831,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_align.2d_r8_63_1");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025832,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_align.2d_r8_63_2");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025833,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_align.2d_r8_63_4");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025834,
        "dEQP-GLES3.functional.texture.speci",
        "fication.teximage2d_align.2d_r8_63_8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025835,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgba4_51_1");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025836,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgba4_51_2");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025837,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgba4_51_4");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025838,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgba4_51_8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025839,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_align.2d_rgb8_39_1");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025840,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_align.2d_rgb8_39_2");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025841,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_align.2d_rgb8_39_4");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025842,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_align.2d_rgb8_39_8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025843,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgba8_47_1");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025844,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgba8_47_2");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025845,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgba8_47_4");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025846,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.2d_rgba8_47_8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025847,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_align.cube_r8_4_8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025848,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_align.cube_r8_63_1");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025849,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_align.cube_r8_63_2");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025850,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_align.cube_r8_63_4");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025851,
        "dEQP-GLES3.functional.texture.specif",
        "ication.teximage2d_align.cube_r8_63_8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025852,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_align.cube_rgba4_51_1");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025853,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_align.cube_rgba4_51_2");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025854,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_align.cube_rgba4_51_4");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025855,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_align.cube_rgba4_51_8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025856,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.cube_rgb8_39_1");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025857,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.cube_rgb8_39_2");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025858,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.cube_rgb8_39_4");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025859,
        "dEQP-GLES3.functional.texture.specifi",
        "cation.teximage2d_align.cube_rgb8_39_8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025860,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_align.cube_rgba8_47_1");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025861,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_align.cube_rgba8_47_2");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025862,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_align.cube_rgba8_47_4");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025863,
        "dEQP-GLES3.functional.texture.specific",
        "ation.teximage2d_align.cube_rgba8_47_8");
