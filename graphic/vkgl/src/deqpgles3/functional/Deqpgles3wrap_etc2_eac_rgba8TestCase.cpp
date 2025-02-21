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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022807,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_eac_rgba8.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022808,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_eac_rgba8.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022809,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022810,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_eac_rgba8.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022811,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022812,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_eac_rgba8.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022813,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022814,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_eac_rgba8.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022815,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022816,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022817,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022818,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022819,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022820,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_eac_rgba8.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022821,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022822,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022823,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022824,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022825,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022826,
        "dEQP-GLES3.functional.texture.wrap.e",
        "tc2_eac_rgba8.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022827,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022828,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022829,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022830,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022831,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022832,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022833,
        "dEQP-GLES3.functional.texture.wrap.etc",
        "2_eac_rgba8.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022834,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022835,
        "dEQP-GLES3.functional.texture.wrap.etc",
        "2_eac_rgba8.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022836,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022837,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022838,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022839,
        "dEQP-GLES3.functional.texture.wrap.etc",
        "2_eac_rgba8.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022840,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022841,
        "dEQP-GLES3.functional.texture.wrap.etc",
        "2_eac_rgba8.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022842,
        "dEQP-GLES3.functional.texture.wrap.et",
        "c2_eac_rgba8.mirror_mirror_linear_npot");
