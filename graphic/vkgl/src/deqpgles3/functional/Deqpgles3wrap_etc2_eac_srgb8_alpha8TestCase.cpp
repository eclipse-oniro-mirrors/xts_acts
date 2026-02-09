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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022843,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022844,
        "dEQP-GLES3.functional.texture.wrap.etc2",
        "_eac_srgb8_alpha8.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022845,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022846,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022847,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022848,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022849,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022850,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022851,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022852,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022853,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022854,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022855,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022856,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022857,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022858,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022859,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022860,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022861,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022862,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022863,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022864,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022865,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022866,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022867,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022868,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022869,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022870,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022871,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022872,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022873,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022874,
        "dEQP-GLES3.functional.texture.wrap.etc2_",
        "eac_srgb8_alpha8.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022875,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022876,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022877,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022878,
        "dEQP-GLES3.functional.texture.wrap.etc2_e",
        "ac_srgb8_alpha8.mirror_mirror_linear_npot");
