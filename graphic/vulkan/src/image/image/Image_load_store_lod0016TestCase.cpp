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

static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32b32a32sfloat, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32b32a32_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32b32a32sfloatsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32b32a32_sfloat_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16b16a16sfloat, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16b16a16sfloatsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16b16a16_sfloat_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32sfloat, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32sfloatsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32_sfloat_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32b32a32uint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32b32a32_uint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32b32a32uintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32b32a32_uint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16b16a16uint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16b16a16_uint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16b16a16uintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16b16a16_uint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8b8a8uint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8b8a8_uint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8b8a8uintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8b8a8_uint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32uint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32_uint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32uintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32_uint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32b32a32sint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32b32a32_sint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32b32a32sintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32b32a32_sint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16b16a16sint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16b16a16_sint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16b16a16sintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16b16a16_sint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8b8a8sint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8b8a8_sint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8b8a8sintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8b8a8_sint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32sint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32_sint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32sintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32_sint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8b8a8unorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8b8a8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8b8a8unormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8b8a8_unorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8b8a8snorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8b8a8_snorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8b8a8snormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8b8a8_snorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayB10g11r11ufloatpack32, "dEQP-VK.image.load_store_lod.with_format.1d_array.b10g11r11_ufloat_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayB10g11r11ufloatpack32singlelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.b10g11r11_ufloat_pack32_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32sfloat, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32sfloatsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32_sfloat_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16sfloat, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16sfloatsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16_sfloat_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16sfloat, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16sfloatsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16_sfloat_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayA2b10g10r10uintpack32, "dEQP-VK.image.load_store_lod.with_format.1d_array.a2b10g10r10_uint_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayA2b10g10r10uintpack32singlelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.a2b10g10r10_uint_pack32_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32uint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32_uint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32uintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32_uint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16uint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16_uint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16uintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16_uint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16uint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16_uint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16uintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16_uint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8uint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8_uint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8uintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8_uint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8uint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8_uint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8uintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8_uint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32sint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32_sint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR32g32sintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r32g32_sint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16sint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16_sint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16sintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16_sint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16sint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16_sint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16sintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16_sint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8sint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8_sint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8sintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8_sint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8sint, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8_sint*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8sintsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8_sint_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayA2b10g10r10unormpack32, "dEQP-VK.image.load_store_lod.with_format.1d_array.a2b10g10r10_unorm_pack32*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayA2b10g10r10unormpack32singlelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.a2b10g10r10_unorm_pack32_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16b16a16unorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16b16a16_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16b16a16unormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16b16a16_unorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16b16a16snorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16b16a16_snorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16b16a16snormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16b16a16_snorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16unorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16unormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16_unorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16unorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16unormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16_unorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8unorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8unormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8_unorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8unorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8_unorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8unormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8_unorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16snorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16_snorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16g16snormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16g16_snorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16snorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16_snorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR16snormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r16_snorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8snorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8_snorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8g8snormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8g8_snorm_single_layer*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8snorm, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8_snorm*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCWithformat1darrayR8snormsinglelayer, "dEQP-VK.image.load_store_lod.with_format.1d_array.r8_snorm_single_layer*");