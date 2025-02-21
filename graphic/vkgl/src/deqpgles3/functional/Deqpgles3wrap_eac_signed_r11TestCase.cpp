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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022555,
        "dEQP-GLES3.functional.texture.wrap.e",
        "ac_signed_r11.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022556,
        "dEQP-GLES3.functional.texture.wrap.e",
        "ac_signed_r11.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022557,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022558,
        "dEQP-GLES3.functional.texture.wrap.e",
        "ac_signed_r11.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022559,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022560,
        "dEQP-GLES3.functional.texture.wrap.e",
        "ac_signed_r11.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022561,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022562,
        "dEQP-GLES3.functional.texture.wrap.e",
        "ac_signed_r11.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022563,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022564,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022565,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022566,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022567,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022568,
        "dEQP-GLES3.functional.texture.wrap.e",
        "ac_signed_r11.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022569,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022570,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022571,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022572,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022573,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022574,
        "dEQP-GLES3.functional.texture.wrap.e",
        "ac_signed_r11.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022575,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022576,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022577,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022578,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022579,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022580,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022581,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_r11.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022582,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022583,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_r11.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022584,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022585,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022586,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022587,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_r11.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022588,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022589,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_r11.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022590,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_r11.mirror_mirror_linear_npot");
