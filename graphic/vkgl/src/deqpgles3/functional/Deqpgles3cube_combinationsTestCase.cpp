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
#include "../ActsDeqpgles30025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024217,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024218,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024219,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024220,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024221,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024222,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024223,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024224,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024225,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024226,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024227,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024228,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024229,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024230,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024231,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024232,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024233,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024234,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024235,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024236,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024237,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024238,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024239,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024240,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024241,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024242,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024243,
        "dEQP-GLES3.functional.texture.filtering.cub",
        "e.combinations.linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024244,
        "dEQP-GLES3.functional.texture.filtering.c",
        "ube.combinations.linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024245,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024246,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024247,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024248,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024249,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024250,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024251,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024252,
        "dEQP-GLES3.functional.texture.filtering.cu",
        "be.combinations.linear_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024253,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024254,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024255,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024256,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024257,
        "dEQP-GLES3.functional.texture.filtering.cube.combin",
        "ations.nearest_mipmap_nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024258,
        "dEQP-GLES3.functional.texture.filtering.cube.combin",
        "ations.nearest_mipmap_nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024259,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024260,
        "dEQP-GLES3.functional.texture.filtering.cube.combin",
        "ations.nearest_mipmap_nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024261,
        "dEQP-GLES3.functional.texture.filtering.cube.combin",
        "ations.nearest_mipmap_nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024262,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.nearest_mipmap_nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024263,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024264,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024265,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024266,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024267,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024268,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024269,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024270,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024271,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024272,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024273,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024274,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024275,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024276,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024277,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024278,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024279,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024280,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024281,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024282,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024283,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024284,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024285,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024286,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024287,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024288,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024289,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.nearest_mipmap_linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024290,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024291,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024292,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024293,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024294,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024295,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024296,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024297,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024298,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.nearest_mipmap_linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024299,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.nearest_mipmap_linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024300,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.nearest_mipmap_linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024301,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.nearest_mipmap_linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024302,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024303,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024304,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.nearest_mipmap_linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024305,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024306,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.nearest_mipmap_linear_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024307,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024308,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024309,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024310,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024311,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024312,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024313,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024314,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024315,
        "dEQP-GLES3.functional.texture.filtering.cube.combi",
        "nations.linear_mipmap_linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024316,
        "dEQP-GLES3.functional.texture.filtering.cube.com",
        "binations.linear_mipmap_linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024317,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024318,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024319,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024320,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024321,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024322,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024323,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024324,
        "dEQP-GLES3.functional.texture.filtering.cube.comb",
        "inations.linear_mipmap_linear_linear_mirror_mirror");
