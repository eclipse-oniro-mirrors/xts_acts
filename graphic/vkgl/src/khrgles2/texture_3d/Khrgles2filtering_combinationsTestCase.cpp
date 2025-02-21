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
#include "../Khrgles2BaseFunc.h"
#include "../ActsKhrgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000051,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.nearest_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000052,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000053,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000054,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000055,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000056,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000057,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000058,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000059,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000060,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000061,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000062,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000063,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000064,
        "KHR-GLES2.texture_3d.filtering.combinati",
        "ons.nearest_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000065,
        "KHR-GLES2.texture_3d.filtering.combinati",
        "ons.nearest_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000066,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000067,
        "KHR-GLES2.texture_3d.filtering.combinati",
        "ons.nearest_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000068,
        "KHR-GLES2.texture_3d.filtering.combinati",
        "ons.nearest_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000069,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000070,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000071,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000072,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000073,
        "KHR-GLES2.texture_3d.filtering.combinati",
        "ons.nearest_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000074,
        "KHR-GLES2.texture_3d.filtering.combinati",
        "ons.nearest_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000075,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000076,
        "KHR-GLES2.texture_3d.filtering.combinati",
        "ons.nearest_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000077,
        "KHR-GLES2.texture_3d.filtering.combinati",
        "ons.nearest_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000078,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.nearest_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000079,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.nearest_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000080,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.nearest_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000081,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.nearest_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000082,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000083,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000084,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.nearest_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000085,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000086,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000087,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.nearest_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000088,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000089,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000090,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000091,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000092,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000093,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000094,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000095,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000096,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.nearest_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000097,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000098,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000099,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000100,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000101,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000102,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000103,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000104,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.nearest_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000105,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000106,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000107,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000108,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000109,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000110,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000111,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000112,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000113,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000114,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000115,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000116,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000117,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000118,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000119,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000120,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000121,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000122,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000123,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000124,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000125,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000126,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000127,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000128,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000129,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000130,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000131,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000132,
        "KHR-GLES2.texture_3d.filtering.combin",
        "ations.linear_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000133,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000134,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000135,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000136,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000137,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000138,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000139,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000140,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000141,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000142,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000143,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000144,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000145,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000146,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000147,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000148,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000149,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000150,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000151,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000152,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000153,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000154,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000155,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000156,
        "KHR-GLES2.texture_3d.filtering.combina",
        "tions.linear_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000157,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000158,
        "KHR-GLES2.texture_3d.filtering.combinat",
        "ions.linear_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000159,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000160,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000161,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000162,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000163,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000164,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000165,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000166,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000167,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000168,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000169,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000170,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000171,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000172,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000173,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000174,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000175,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000176,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000177,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000178,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000179,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000180,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000181,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000182,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000183,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000184,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000185,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000186,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_nearest_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000187,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000188,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000189,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000190,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000191,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000192,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000193,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000194,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000195,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000196,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000197,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000198,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000199,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000200,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000201,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000202,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000203,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000204,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000205,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000206,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000207,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000208,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000209,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000210,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_nearest_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000211,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000212,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_nearest_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000213,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000214,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000215,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000216,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000217,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000218,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000219,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000220,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000221,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000222,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000223,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000224,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000225,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000226,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000227,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000228,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000229,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000230,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000231,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000232,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000233,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000234,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000235,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000236,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000237,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000238,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000239,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000240,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000241,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000242,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000243,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000244,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000245,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000246,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000247,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000248,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000249,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000250,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000251,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000252,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000253,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000254,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000255,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000256,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000257,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000258,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000259,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000260,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000261,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000262,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000263,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000264,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000265,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000266,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000267,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000268,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000269,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000270,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000271,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000272,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000273,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000274,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000275,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000276,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000277,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000278,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000279,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000280,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000281,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000282,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000283,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000284,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000285,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000286,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000287,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000288,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000289,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000290,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000291,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000292,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000293,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000294,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000295,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000296,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000297,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000298,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000299,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000300,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000301,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000302,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000303,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000304,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000305,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000306,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000307,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000308,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000309,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000310,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000311,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000312,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000313,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000314,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000315,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000316,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000317,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000318,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000319,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000320,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000321,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000322,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000323,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000324,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000325,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000326,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000327,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000328,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000329,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000330,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000331,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000332,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000333,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000334,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000335,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000336,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000337,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000338,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000339,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000340,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000341,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000342,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000343,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000344,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000345,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000346,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000347,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000348,
        "KHR-GLES2.texture_3d.filtering.combinations.",
        "linear_mipmap_linear_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000349,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000350,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000351,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000352,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000353,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000354,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000355,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000356,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000357,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000358,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000359,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000360,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000361,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000362,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000363,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000364,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000365,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000366,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000367,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000368,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000369,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000370,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000371,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000372,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000373,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000374,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000375,
        "KHR-GLES2.texture_3d.filte",
        "ring.combinations.negative");
