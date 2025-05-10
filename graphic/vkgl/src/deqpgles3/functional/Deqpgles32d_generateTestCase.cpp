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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025027,
        "dEQP-GLES3.functional.texture",
        ".mipmap.2d.generate.a8_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025028,
        "dEQP-GLES3.functional.texture",
        ".mipmap.2d.generate.a8_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025029,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.2d.generate.a8_npot_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025030,
        "dEQP-GLES3.functional.texture.m",
        "ipmap.2d.generate.a8_npot_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025031,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.generate.a8_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025032,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.generate.a8_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025033,
        "dEQP-GLES3.functional.texture",
        ".mipmap.2d.generate.l8_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025034,
        "dEQP-GLES3.functional.texture",
        ".mipmap.2d.generate.l8_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025035,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.2d.generate.l8_npot_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025036,
        "dEQP-GLES3.functional.texture.m",
        "ipmap.2d.generate.l8_npot_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025037,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.generate.l8_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025038,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.generate.l8_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025039,
        "dEQP-GLES3.functional.texture.",
        "mipmap.2d.generate.la88_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025040,
        "dEQP-GLES3.functional.texture.",
        "mipmap.2d.generate.la88_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025041,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.generate.la88_npot_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025042,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.2d.generate.la88_npot_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025043,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.generate.la88_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025044,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.generate.la88_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025045,
        "dEQP-GLES3.functional.texture.m",
        "ipmap.2d.generate.rgb565_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025046,
        "dEQP-GLES3.functional.texture.m",
        "ipmap.2d.generate.rgb565_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025047,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.generate.rgb565_npot_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025048,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.generate.rgb565_npot_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025049,
        "dEQP-GLES3.functional.texture.mipmap.",
        "2d.generate.rgb565_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025050,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.generate.rgb565_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025051,
        "dEQP-GLES3.functional.texture.m",
        "ipmap.2d.generate.rgb888_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025052,
        "dEQP-GLES3.functional.texture.m",
        "ipmap.2d.generate.rgb888_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025053,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.generate.rgb888_npot_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025054,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.generate.rgb888_npot_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025055,
        "dEQP-GLES3.functional.texture.mipmap.",
        "2d.generate.rgb888_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025056,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.generate.rgb888_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025057,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.2d.generate.rgba4444_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025058,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.2d.generate.rgba4444_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025059,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.generate.rgba4444_npot_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025060,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.generate.rgba4444_npot_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025061,
        "dEQP-GLES3.functional.texture.mipmap.2",
        "d.generate.rgba4444_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025062,
        "dEQP-GLES3.functional.texture.mipmap.",
        "2d.generate.rgba4444_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025063,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.2d.generate.rgba5551_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025064,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.2d.generate.rgba5551_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025065,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.generate.rgba5551_npot_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025066,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.generate.rgba5551_npot_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025067,
        "dEQP-GLES3.functional.texture.mipmap.2",
        "d.generate.rgba5551_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025068,
        "dEQP-GLES3.functional.texture.mipmap.",
        "2d.generate.rgba5551_non_square_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025069,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.2d.generate.rgba8888_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025070,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.2d.generate.rgba8888_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025071,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.generate.rgba8888_npot_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025072,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.generate.rgba8888_npot_nicest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025073,
        "dEQP-GLES3.functional.texture.mipmap.2",
        "d.generate.rgba8888_non_square_fastest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025074,
        "dEQP-GLES3.functional.texture.mipmap.",
        "2d.generate.rgba8888_non_square_nicest");
