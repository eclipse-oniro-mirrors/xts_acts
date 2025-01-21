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

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024001,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024002,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024003,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024004,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024005,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024006,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024007,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024008,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024009,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024010,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024011,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024012,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024013,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024014,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024015,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024016,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024017,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024018,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024019,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024020,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024021,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024022,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024023,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024024,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024025,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024026,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024027,
        "dEQP-GLES3.functional.texture.filtering.2d",
        ".combinations.linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024028,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d.combinations.linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024029,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024030,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024031,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024032,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024033,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024034,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024035,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024036,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d.combinations.linear_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024037,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024038,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024039,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024040,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024041,
        "dEQP-GLES3.functional.texture.filtering.2d.combina",
        "tions.nearest_mipmap_nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024042,
        "dEQP-GLES3.functional.texture.filtering.2d.combina",
        "tions.nearest_mipmap_nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024043,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024044,
        "dEQP-GLES3.functional.texture.filtering.2d.combina",
        "tions.nearest_mipmap_nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024045,
        "dEQP-GLES3.functional.texture.filtering.2d.combina",
        "tions.nearest_mipmap_nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024046,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.nearest_mipmap_nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024047,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024048,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024049,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024050,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024051,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024052,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024053,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024054,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024055,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_nearest_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024056,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024057,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024058,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024059,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024060,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024061,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024062,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024063,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024064,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_nearest_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024065,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_nearest_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024066,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_nearest_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024067,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_nearest_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024068,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024069,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024070,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_nearest_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024071,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024072,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_nearest_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024073,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.nearest_mipmap_linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024074,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024075,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024076,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024077,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024078,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024079,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024080,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024081,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024082,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.nearest_mipmap_linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024083,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.nearest_mipmap_linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024084,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.nearest_mipmap_linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024085,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.nearest_mipmap_linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024086,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024087,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024088,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.nearest_mipmap_linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024089,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024090,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.nearest_mipmap_linear_linear_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024091,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_nearest_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024092,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_nearest_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024093,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_nearest_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024094,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_nearest_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024095,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_linear_nearest_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024096,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_linear_nearest_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024097,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_nearest_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024098,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_linear_nearest_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024099,
        "dEQP-GLES3.functional.texture.filtering.2d.combin",
        "ations.linear_mipmap_linear_nearest_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024100,
        "dEQP-GLES3.functional.texture.filtering.2d.comb",
        "inations.linear_mipmap_linear_linear_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024101,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_linear_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024102,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_linear_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024103,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_linear_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024104,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_linear_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024105,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_linear_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024106,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_linear_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024107,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_linear_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024108,
        "dEQP-GLES3.functional.texture.filtering.2d.combi",
        "nations.linear_mipmap_linear_linear_mirror_mirror");
