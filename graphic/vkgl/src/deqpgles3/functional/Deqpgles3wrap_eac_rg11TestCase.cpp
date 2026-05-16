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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022591,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_rg11.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022592,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_rg11.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022593,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022594,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_rg11.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022595,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022596,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_rg11.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022597,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022598,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_rg11.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022599,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022600,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022601,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022602,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022603,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022604,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_rg11.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022605,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022606,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022607,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022608,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022609,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022610,
        "dEQP-GLES3.functional.texture.wra",
        "p.eac_rg11.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022611,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022612,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022613,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022614,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022615,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022616,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022617,
        "dEQP-GLES3.functional.texture.wrap.",
        "eac_rg11.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022618,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022619,
        "dEQP-GLES3.functional.texture.wrap.",
        "eac_rg11.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022620,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022621,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022622,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022623,
        "dEQP-GLES3.functional.texture.wrap.",
        "eac_rg11.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022624,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022625,
        "dEQP-GLES3.functional.texture.wrap.",
        "eac_rg11.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022626,
        "dEQP-GLES3.functional.texture.wrap",
        ".eac_rg11.mirror_mirror_linear_npot");
