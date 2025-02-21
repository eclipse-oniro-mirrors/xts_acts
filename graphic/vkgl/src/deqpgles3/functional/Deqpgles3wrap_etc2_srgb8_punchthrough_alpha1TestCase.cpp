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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022771,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb",
        "8_punchthrough_alpha1.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022772,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb",
        "8_punchthrough_alpha1.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022773,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022774,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb",
        "8_punchthrough_alpha1.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022775,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022776,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb",
        "8_punchthrough_alpha1.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022777,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022778,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb",
        "8_punchthrough_alpha1.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022779,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022780,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022781,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022782,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022783,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022784,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb",
        "8_punchthrough_alpha1.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022785,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022786,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022787,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022788,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022789,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022790,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb",
        "8_punchthrough_alpha1.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022791,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022792,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022793,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022794,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022795,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022796,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022797,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8_",
        "punchthrough_alpha1.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022798,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022799,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8_",
        "punchthrough_alpha1.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022800,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022801,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022802,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022803,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8_",
        "punchthrough_alpha1.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022804,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022805,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8_",
        "punchthrough_alpha1.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022806,
        "dEQP-GLES3.functional.texture.wrap.etc2_srgb8",
        "_punchthrough_alpha1.mirror_mirror_linear_npot");
