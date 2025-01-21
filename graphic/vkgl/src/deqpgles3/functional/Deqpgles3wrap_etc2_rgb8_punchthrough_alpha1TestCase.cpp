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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022735,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022736,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb",
        "8_punchthrough_alpha1.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022737,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022738,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022739,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022740,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022741,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022742,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022743,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022744,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022745,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022746,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022747,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022748,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022749,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022750,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022751,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022752,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022753,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022754,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022755,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022756,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022757,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022758,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022759,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022760,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022761,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022762,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022763,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022764,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022765,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022766,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8",
        "_punchthrough_alpha1.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022767,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022768,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022769,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022770,
        "dEQP-GLES3.functional.texture.wrap.etc2_rgb8_",
        "punchthrough_alpha1.mirror_mirror_linear_npot");
