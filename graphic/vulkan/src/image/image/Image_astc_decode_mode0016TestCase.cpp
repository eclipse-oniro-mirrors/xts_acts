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
#include "../ImageBaseFunc.h"
#include "../ActsImage0017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsImage0017TS, TC4x4unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.4x4_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC4x4unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.4x4_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC4x4unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.4x4_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC4x4srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.4x4_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC4x4srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.4x4_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC4x4srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.4x4_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x4unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.5x4_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x4unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.5x4_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x4unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.5x4_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x4srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.5x4_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x4srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.5x4_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x4srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.5x4_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x5unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.5x5_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x5unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.5x5_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x5unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.5x5_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x5srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.5x5_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x5srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.5x5_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC5x5srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.5x5_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x5unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.6x5_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x5unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.6x5_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x5unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.6x5_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x5srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.6x5_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x5srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.6x5_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x5srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.6x5_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x6unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.6x6_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x6unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.6x6_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x6unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.6x6_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x6srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.6x6_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x6srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.6x6_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC6x6srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.6x6_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x5unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.8x5_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x5unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.8x5_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x5unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.8x5_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x5srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.8x5_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x5srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.8x5_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x5srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.8x5_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x6unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.8x6_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x6unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.8x6_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x6unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.8x6_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x6srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.8x6_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x6srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.8x6_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x6srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.8x6_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x8unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.8x8_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x8unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.8x8_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x8unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.8x8_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x8srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.8x8_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x8srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.8x8_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC8x8srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.8x8_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x5unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.10x5_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x5unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.10x5_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x5unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.10x5_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x5srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.10x5_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x5srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.10x5_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x5srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.10x5_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x6unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.10x6_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x6unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.10x6_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x6unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.10x6_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x6srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.10x6_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x6srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.10x6_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x6srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.10x6_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x8unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.10x8_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x8unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.10x8_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x8unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.10x8_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x8srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.10x8_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x8srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.10x8_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x8srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.10x8_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x10unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.10x10_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x10unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.10x10_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x10unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.10x10_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x10srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.10x10_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x10srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.10x10_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC10x10srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.10x10_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x10unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.12x10_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x10unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.12x10_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x10unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.12x10_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x10srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.12x10_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x10srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.12x10_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x10srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.12x10_srgb_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x12unormtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.12x12_unorm_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x12unormtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.12x12_unorm_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x12unormtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.12x12_unorm_to_e5b9g9r9_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x12srgbtor16g16b16a16sfloat, "dEQP-VK.image.astc_decode_mode.12x12_srgb_to_r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x12srgbtor8g8b8a8unorm, "dEQP-VK.image.astc_decode_mode.12x12_srgb_to_r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TC12x12srgbtoe5b9g9r9ufloatpack32, "dEQP-VK.image.astc_decode_mode.12x12_srgb_to_e5b9g9r9_ufloat_pack32*");