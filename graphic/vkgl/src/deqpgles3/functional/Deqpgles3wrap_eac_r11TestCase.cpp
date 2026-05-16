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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022519,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022520,
        "dEQP-GLES3.functional.texture.wr",
        "ap.eac_r11.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022521,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022522,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022523,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022524,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022525,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022526,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022527,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022528,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022529,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022530,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022531,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022532,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022533,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022534,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022535,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022536,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022537,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022538,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022539,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022540,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022541,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022542,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022543,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022544,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022545,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022546,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022547,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022548,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022549,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022550,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_r11.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022551,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022552,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022553,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022554,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_r11.mirror_mirror_linear_npot");
