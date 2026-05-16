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
#include "../KhrglesextBaseFunc.h"
#include "../ActsKhrglesext0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000242,
        "KHR-GLESEXT.texture_border",
        "_clamp.border_color_errors");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000243,
        "KHR-GLESEXT.texture_border",
        "_clamp.texparameteri_errors");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000244,
        "KHR-GLESEXT.texture_border_c",
        "lamp.gettexparameteri_errors");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000245,
        "KHR-GLESEXT.texture_border_clamp.sam",
        "plerparameteri_non_gen_sampler_error");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000246,
        "KHR-GLESEXT.texture_border_clamp.",
        "samplerparameteri_with_wrong_pname");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000247,
        "KHR-GLESEXT.texture_border_clam",
        "p.samplerparameteri_border_color");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000248,
        "KHR-GLESEXT.texture_bord",
        "er_clamp.Texture2DRGBA32F");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000249,
        "KHR-GLESEXT.texture_bor",
        "der_clamp.Texture2DR32I");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000250,
        "KHR-GLESEXT.texture_bor",
        "der_clamp.Texture2DR32UI");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000251,
        "KHR-GLESEXT.texture_bor",
        "der_clamp.Texture2DRGBA8");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000252,
        "KHR-GLESEXT.texture_bor",
        "der_clamp.Texture2DDC32F");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000253,
        "KHR-GLESEXT.texture_bor",
        "der_clamp.Texture2DDC16");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000254,
        "KHR-GLESEXT.texture_border",
        "_clamp.Texture2DCompressed");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000255,
        "KHR-GLESEXT.texture_border_",
        "clamp.Texture2DArrayRGBA32F");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000256,
        "KHR-GLESEXT.texture_borde",
        "r_clamp.Texture2DArrayR32I");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000257,
        "KHR-GLESEXT.texture_border",
        "_clamp.Texture2DArrayR32UI");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000258,
        "KHR-GLESEXT.texture_border",
        "_clamp.Texture2DArrayRGBA8");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000259,
        "KHR-GLESEXT.texture_border_c",
        "lamp.Texture2DArrayCompressed");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000260,
        "KHR-GLESEXT.texture_bord",
        "er_clamp.Texture3DRGBA32F");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000261,
        "KHR-GLESEXT.texture_bor",
        "der_clamp.Texture3DR32I");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000262,
        "KHR-GLESEXT.texture_bor",
        "der_clamp.Texture3DR32UI");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000263,
        "KHR-GLESEXT.texture_bor",
        "der_clamp.Texture3DRGBA8");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000264,
        "KHR-GLESEXT.texture_border_",
        "clamp.Texture2DRGBA32FLinear");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000265,
        "KHR-GLESEXT.texture_border",
        "_clamp.Texture2DRGBA8Linear");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000266,
        "KHR-GLESEXT.texture_border",
        "_clamp.Texture2DDC32FLinear");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000267,
        "KHR-GLESEXT.texture_border",
        "_clamp.Texture2DDC16Linear");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000268,
        "KHR-GLESEXT.texture_border_cl",
        "amp.Texture2DCompressedLinear");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000269,
        "KHR-GLESEXT.texture_border_cla",
        "mp.Texture2DArrayRGBA32FLinear");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000270,
        "KHR-GLESEXT.texture_border_cl",
        "amp.Texture2DArrayRGBA8Linear");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000271,
        "KHR-GLESEXT.texture_border_clam",
        "p.Texture2DArrayCompressedLinear");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000272,
        "KHR-GLESEXT.texture_border_",
        "clamp.Texture3DRGBA32FLinear");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000273,
        "KHR-GLESEXT.texture_border",
        "_clamp.Texture3DRGBA8Linear");
