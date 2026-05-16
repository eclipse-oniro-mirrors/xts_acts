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

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024325,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.no_edges_visible.nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024326,
        "dEQP-GLES3.functional.texture.filt",
        "ering.cube.no_edges_visible.linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024811,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024812,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024813,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024814,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.linear_mipmap_nearest_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024815,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.linear_mipmap_nearest_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024816,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024817,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.linear_mipmap_nearest_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024818,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.linear_mipmap_nearest_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024819,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024820,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024821,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024822,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024823,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.linear_mipmap_nearest_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024824,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.linear_mipmap_nearest_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024825,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024826,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.linear_mipmap_nearest_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024827,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.linear_mipmap_nearest_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024828,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_nearest_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024829,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_nearest_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024830,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_nearest_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024831,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_nearest_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024832,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024833,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024834,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_nearest_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024835,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024836,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024837,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_nearest_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024838,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024839,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024840,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024841,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024842,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024843,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024844,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024845,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024846,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_nearest_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024847,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024848,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024849,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024850,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024851,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024852,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024853,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024854,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_nearest_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024855,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.nearest_mipmap_linear_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024856,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024857,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024858,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024859,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024860,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024861,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024862,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024863,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024864,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024865,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024866,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024867,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024868,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_linear_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024869,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_linear_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024870,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024871,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_linear_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024872,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_linear_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024873,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024874,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024875,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024876,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024877,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_linear_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024878,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_linear_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024879,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024880,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_linear_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024881,
        "dEQP-GLES3.functional.texture.filtering.3d.combinatio",
        "ns.nearest_mipmap_linear_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024882,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.nearest_mipmap_linear_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024883,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.nearest_mipmap_linear_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024884,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.nearest_mipmap_linear_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024885,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.nearest_mipmap_linear_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024886,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024887,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024888,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.nearest_mipmap_linear_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024889,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024890,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024891,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.nearest_mipmap_linear_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024892,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024893,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024894,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024895,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024896,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024897,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024898,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024899,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024900,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.nearest_mipmap_linear_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024901,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024902,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024903,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024904,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024905,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024906,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024907,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024908,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.nearest_mipmap_linear_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024909,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024910,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024911,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024912,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024913,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024914,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024915,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024916,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024917,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024918,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024919,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024920,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024921,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024922,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024923,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024924,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024925,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024926,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024927,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024928,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024929,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024930,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024931,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024932,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024933,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024934,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024935,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024936,
        "dEQP-GLES3.functional.texture.filtering.3d.combina",
        "tions.linear_mipmap_linear_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024937,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024938,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024939,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024940,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024941,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024942,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024943,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024944,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024945,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024946,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024947,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024948,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024949,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024950,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024951,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024952,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024953,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024954,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024955,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024956,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024957,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024958,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024959,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024960,
        "dEQP-GLES3.functional.texture.filtering.3d.combinat",
        "ions.linear_mipmap_linear_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024961,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024962,
        "dEQP-GLES3.functional.texture.filtering.3d.combinati",
        "ons.linear_mipmap_linear_linear_mirror_mirror_mirror");
