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

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022627,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.clamp_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022628,
        "dEQP-GLES3.functional.texture.wrap.e",
        "ac_signed_rg11.clamp_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022629,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.clamp_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022630,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.clamp_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022631,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.clamp_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022632,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.clamp_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022633,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.repeat_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022634,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.repeat_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022635,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.repeat_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022636,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.repeat_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022637,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.repeat_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022638,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.repeat_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022639,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.mirror_clamp_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022640,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.mirror_clamp_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022641,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.mirror_repeat_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022642,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.mirror_repeat_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022643,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.mirror_mirror_nearest_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022644,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.mirror_mirror_linear_pot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022645,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.clamp_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022646,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.clamp_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022647,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.clamp_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022648,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.clamp_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022649,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.clamp_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022650,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.clamp_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022651,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.repeat_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022652,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.repeat_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022653,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.repeat_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022654,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.repeat_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022655,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.repeat_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022656,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.repeat_mirror_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022657,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.mirror_clamp_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022658,
        "dEQP-GLES3.functional.texture.wrap.ea",
        "c_signed_rg11.mirror_clamp_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022659,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.mirror_repeat_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022660,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.mirror_repeat_linear_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022661,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.mirror_mirror_nearest_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30023TestSuite, TestCase_022662,
        "dEQP-GLES3.functional.texture.wrap.eac",
        "_signed_rg11.mirror_mirror_linear_npot");
