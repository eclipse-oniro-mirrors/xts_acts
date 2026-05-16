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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000271,
        "KHR-GLES32.core.texture_bord",
        "er_clamp.border_color_errors");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000272,
        "KHR-GLES32.core.texture_bord",
        "er_clamp.texparameteri_errors");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000273,
        "KHR-GLES32.core.texture_border",
        "_clamp.gettexparameteri_errors");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000274,
        "KHR-GLES32.core.texture_border_clamp.s",
        "amplerparameteri_non_gen_sampler_error");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000275,
        "KHR-GLES32.core.texture_border_clam",
        "p.samplerparameteri_with_wrong_pname");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000276,
        "KHR-GLES32.core.texture_border_cl",
        "amp.samplerparameteri_border_color");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000277,
        "KHR-GLES32.core.texture_bo",
        "rder_clamp.Texture2DRGBA32F");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000278,
        "KHR-GLES32.core.texture_b",
        "order_clamp.Texture2DR32I");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000279,
        "KHR-GLES32.core.texture_b",
        "order_clamp.Texture2DR32UI");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000280,
        "KHR-GLES32.core.texture_b",
        "order_clamp.Texture2DRGBA8");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000281,
        "KHR-GLES32.core.texture_b",
        "order_clamp.Texture2DDC32F");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000282,
        "KHR-GLES32.core.texture_b",
        "order_clamp.Texture2DDC16");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000283,
        "KHR-GLES32.core.texture_bord",
        "er_clamp.Texture2DCompressed");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000284,
        "KHR-GLES32.core.texture_borde",
        "r_clamp.Texture2DArrayRGBA32F");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000285,
        "KHR-GLES32.core.texture_bor",
        "der_clamp.Texture2DArrayR32I");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000286,
        "KHR-GLES32.core.texture_bord",
        "er_clamp.Texture2DArrayR32UI");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000287,
        "KHR-GLES32.core.texture_bord",
        "er_clamp.Texture2DArrayRGBA8");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000288,
        "KHR-GLES32.core.texture_border",
        "_clamp.Texture2DArrayCompressed");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000289,
        "KHR-GLES32.core.texture_bo",
        "rder_clamp.Texture3DRGBA32F");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000290,
        "KHR-GLES32.core.texture_b",
        "order_clamp.Texture3DR32I");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000291,
        "KHR-GLES32.core.texture_b",
        "order_clamp.Texture3DR32UI");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000292,
        "KHR-GLES32.core.texture_b",
        "order_clamp.Texture3DRGBA8");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000293,
        "KHR-GLES32.core.texture_borde",
        "r_clamp.Texture2DRGBA32FLinear");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000294,
        "KHR-GLES32.core.texture_bord",
        "er_clamp.Texture2DRGBA8Linear");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000295,
        "KHR-GLES32.core.texture_bord",
        "er_clamp.Texture2DDC32FLinear");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000296,
        "KHR-GLES32.core.texture_bord",
        "er_clamp.Texture2DDC16Linear");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000297,
        "KHR-GLES32.core.texture_border_",
        "clamp.Texture2DCompressedLinear");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000298,
        "KHR-GLES32.core.texture_border_c",
        "lamp.Texture2DArrayRGBA32FLinear");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000299,
        "KHR-GLES32.core.texture_border_",
        "clamp.Texture2DArrayRGBA8Linear");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000300,
        "KHR-GLES32.core.texture_border_cl",
        "amp.Texture2DArrayCompressedLinear");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000301,
        "KHR-GLES32.core.texture_borde",
        "r_clamp.Texture3DRGBA32FLinear");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000302,
        "KHR-GLES32.core.texture_bord",
        "er_clamp.Texture3DRGBA8Linear");
