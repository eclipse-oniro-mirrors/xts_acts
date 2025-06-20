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
#include "../Gl45masterBaseFunc.h"
#include "../ActsGl45master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008373,
    "KHR-GL45.texture_border_clamp.border_color_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008374,
    "KHR-GL45.texture_border_clamp.texparameteri_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008375,
    "KHR-GL45.texture_border_clamp.gettexparameteri_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008376,
    "KHR-GL45.texture_border_clamp.samplerparameteri_non_gen_sampler_error");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008377,
    "KHR-GL45.texture_border_clamp.samplerparameteri_with_wrong_pname");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008378,
    "KHR-GL45.texture_border_clamp.samplerparameteri_border_color");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008379,
    "KHR-GL45.texture_border_clamp.Texture2DRGBA32F");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008380,
    "KHR-GL45.texture_border_clamp.Texture2DR32I");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008381,
    "KHR-GL45.texture_border_clamp.Texture2DR32UI");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008382,
    "KHR-GL45.texture_border_clamp.Texture2DRGBA8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008383,
    "KHR-GL45.texture_border_clamp.Texture2DDC32F");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008384,
    "KHR-GL45.texture_border_clamp.Texture2DDC16");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008385,
    "KHR-GL45.texture_border_clamp.Texture2DCompressed");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008386,
    "KHR-GL45.texture_border_clamp.Texture2DArrayRGBA32F");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008387,
    "KHR-GL45.texture_border_clamp.Texture2DArrayR32I");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008388,
    "KHR-GL45.texture_border_clamp.Texture2DArrayR32UI");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008389,
    "KHR-GL45.texture_border_clamp.Texture2DArrayRGBA8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008390,
    "KHR-GL45.texture_border_clamp.Texture2DArrayCompressed");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008391,
    "KHR-GL45.texture_border_clamp.Texture3DRGBA32F");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008392,
    "KHR-GL45.texture_border_clamp.Texture3DR32I");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008393,
    "KHR-GL45.texture_border_clamp.Texture3DR32UI");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008394,
    "KHR-GL45.texture_border_clamp.Texture3DRGBA8");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008395,
    "KHR-GL45.texture_border_clamp.Texture2DRGBA32FLinear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008396,
    "KHR-GL45.texture_border_clamp.Texture2DRGBA8Linear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008397,
    "KHR-GL45.texture_border_clamp.Texture2DDC32FLinear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008398,
    "KHR-GL45.texture_border_clamp.Texture2DDC16Linear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008399,
    "KHR-GL45.texture_border_clamp.Texture2DCompressedLinear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008400,
    "KHR-GL45.texture_border_clamp.Texture2DArrayRGBA32FLinear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008401,
    "KHR-GL45.texture_border_clamp.Texture2DArrayRGBA8Linear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008402,
    "KHR-GL45.texture_border_clamp.Texture2DArrayCompressedLinear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008403,
    "KHR-GL45.texture_border_clamp.Texture3DRGBA32FLinear");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008404,
    "KHR-GL45.texture_border_clamp.Texture3DRGBA8Linear");
