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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002648,
        "KHR-GLES31.core.texture_bord",
        "er_clamp.border_color_errors");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002649,
        "KHR-GLES31.core.texture_bord",
        "er_clamp.texparameteri_errors");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002650,
        "KHR-GLES31.core.texture_border",
        "_clamp.gettexparameteri_errors");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002651,
        "KHR-GLES31.core.texture_border_clamp.s",
        "amplerparameteri_non_gen_sampler_error");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002652,
        "KHR-GLES31.core.texture_border_clam",
        "p.samplerparameteri_with_wrong_pname");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002653,
        "KHR-GLES31.core.texture_border_cl",
        "amp.samplerparameteri_border_color");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002654,
        "KHR-GLES31.core.texture_bo",
        "rder_clamp.Texture2DRGBA32F");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002655,
        "KHR-GLES31.core.texture_b",
        "order_clamp.Texture2DR32I");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002656,
        "KHR-GLES31.core.texture_b",
        "order_clamp.Texture2DR32UI");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002657,
        "KHR-GLES31.core.texture_b",
        "order_clamp.Texture2DRGBA8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002658,
        "KHR-GLES31.core.texture_b",
        "order_clamp.Texture2DDC32F");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002659,
        "KHR-GLES31.core.texture_b",
        "order_clamp.Texture2DDC16");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002660,
        "KHR-GLES31.core.texture_bord",
        "er_clamp.Texture2DCompressed");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002661,
        "KHR-GLES31.core.texture_borde",
        "r_clamp.Texture2DArrayRGBA32F");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002662,
        "KHR-GLES31.core.texture_bor",
        "der_clamp.Texture2DArrayR32I");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002663,
        "KHR-GLES31.core.texture_bord",
        "er_clamp.Texture2DArrayR32UI");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002664,
        "KHR-GLES31.core.texture_bord",
        "er_clamp.Texture2DArrayRGBA8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002665,
        "KHR-GLES31.core.texture_border",
        "_clamp.Texture2DArrayCompressed");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002666,
        "KHR-GLES31.core.texture_bo",
        "rder_clamp.Texture3DRGBA32F");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002667,
        "KHR-GLES31.core.texture_b",
        "order_clamp.Texture3DR32I");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002668,
        "KHR-GLES31.core.texture_b",
        "order_clamp.Texture3DR32UI");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002669,
        "KHR-GLES31.core.texture_b",
        "order_clamp.Texture3DRGBA8");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002670,
        "KHR-GLES31.core.texture_borde",
        "r_clamp.Texture2DRGBA32FLinear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002671,
        "KHR-GLES31.core.texture_bord",
        "er_clamp.Texture2DRGBA8Linear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002672,
        "KHR-GLES31.core.texture_bord",
        "er_clamp.Texture2DDC32FLinear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002673,
        "KHR-GLES31.core.texture_bord",
        "er_clamp.Texture2DDC16Linear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002674,
        "KHR-GLES31.core.texture_border_",
        "clamp.Texture2DCompressedLinear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002675,
        "KHR-GLES31.core.texture_border_c",
        "lamp.Texture2DArrayRGBA32FLinear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002676,
        "KHR-GLES31.core.texture_border_",
        "clamp.Texture2DArrayRGBA8Linear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002677,
        "KHR-GLES31.core.texture_border_cl",
        "amp.Texture2DArrayCompressedLinear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002678,
        "KHR-GLES31.core.texture_borde",
        "r_clamp.Texture3DRGBA32FLinear");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002679,
        "KHR-GLES31.core.texture_bord",
        "er_clamp.Texture3DRGBA8Linear");
