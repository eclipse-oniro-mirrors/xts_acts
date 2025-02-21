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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010340,
        "dEQP-GLES2.functional.texture.wra",
        "p.clamp_clamp_nearest_npot_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010341,
        "dEQP-GLES2.functional.texture.w",
        "rap.clamp_clamp_nearest_npot_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010342,
        "dEQP-GLES2.functional.texture.wra",
        "p.clamp_clamp_linear_pot_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010343,
        "dEQP-GLES2.functional.texture.wr",
        "ap.clamp_clamp_linear_pot_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010344,
        "dEQP-GLES2.functional.texture.wra",
        "p.clamp_clamp_linear_pot_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010345,
        "dEQP-GLES2.functional.texture.",
        "wrap.clamp_clamp_linear_pot_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010346,
        "dEQP-GLES2.functional.texture.wra",
        "p.clamp_clamp_linear_npot_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010347,
        "dEQP-GLES2.functional.texture.wr",
        "ap.clamp_clamp_linear_npot_rgb888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010348,
        "dEQP-GLES2.functional.texture.wra",
        "p.clamp_clamp_linear_npot_rgba4444");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010349,
        "dEQP-GLES2.functional.texture.",
        "wrap.clamp_clamp_linear_npot_l8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010350,
        "dEQP-GLES2.functional.texture.wra",
        "p.clamp_mirror_linear_pot_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010351,
        "dEQP-GLES2.functional.texture.wra",
        "p.mirror_clamp_linear_pot_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010352,
        "dEQP-GLES2.functional.texture.wrap",
        ".mirror_mirror_linear_pot_rgba8888");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010353,
        "dEQP-GLES2.functional.texture.wr",
        "ap.clamp_clamp_nearest_npot_etc1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010354,
        "dEQP-GLES2.functional.texture.w",
        "rap.clamp_clamp_linear_npot_etc1");
