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
#include "../ActsImage0002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sfloatSamples2, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sfloat.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sfloatSamples4, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sfloat.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sfloatSamples8, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sfloat.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sfloatSamples16, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sfloat.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sfloatSamples32, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sfloat.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sfloatSamples64, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sfloat.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sfloatSamples2, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sfloat.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sfloatSamples4, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sfloat.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sfloatSamples8, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sfloat.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sfloatSamples16, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sfloat.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sfloatSamples32, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sfloat.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sfloatSamples64, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sfloat.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sfloatSamples2, "dEQP-VK.image.load_store_multisample.2d.r32_sfloat.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sfloatSamples4, "dEQP-VK.image.load_store_multisample.2d.r32_sfloat.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sfloatSamples8, "dEQP-VK.image.load_store_multisample.2d.r32_sfloat.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sfloatSamples16, "dEQP-VK.image.load_store_multisample.2d.r32_sfloat.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sfloatSamples32, "dEQP-VK.image.load_store_multisample.2d.r32_sfloat.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sfloatSamples64, "dEQP-VK.image.load_store_multisample.2d.r32_sfloat.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32uintSamples2, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_uint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32uintSamples4, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_uint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32uintSamples8, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_uint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32uintSamples16, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_uint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32uintSamples32, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_uint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32uintSamples64, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_uint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16uintSamples2, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_uint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16uintSamples4, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_uint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16uintSamples8, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_uint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16uintSamples16, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_uint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16uintSamples32, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_uint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16uintSamples64, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_uint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8uintSamples2, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_uint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8uintSamples4, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_uint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8uintSamples8, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_uint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8uintSamples16, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_uint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8uintSamples32, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_uint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8uintSamples64, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_uint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32uintSamples2, "dEQP-VK.image.load_store_multisample.2d.r32_uint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32uintSamples4, "dEQP-VK.image.load_store_multisample.2d.r32_uint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32uintSamples8, "dEQP-VK.image.load_store_multisample.2d.r32_uint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32uintSamples16, "dEQP-VK.image.load_store_multisample.2d.r32_uint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32uintSamples32, "dEQP-VK.image.load_store_multisample.2d.r32_uint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32uintSamples64, "dEQP-VK.image.load_store_multisample.2d.r32_uint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sintSamples2, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sintSamples4, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sintSamples8, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sintSamples16, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sintSamples32, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32g32b32a32sintSamples64, "dEQP-VK.image.load_store_multisample.2d.r32g32b32a32_sint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sintSamples2, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sintSamples4, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sintSamples8, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sintSamples16, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sintSamples32, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR16g16b16a16sintSamples64, "dEQP-VK.image.load_store_multisample.2d.r16g16b16a16_sint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8sintSamples2, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_sint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8sintSamples4, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_sint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8sintSamples8, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_sint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8sintSamples16, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_sint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8sintSamples32, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_sint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8sintSamples64, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_sint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sintSamples2, "dEQP-VK.image.load_store_multisample.2d.r32_sint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sintSamples4, "dEQP-VK.image.load_store_multisample.2d.r32_sint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sintSamples8, "dEQP-VK.image.load_store_multisample.2d.r32_sint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sintSamples16, "dEQP-VK.image.load_store_multisample.2d.r32_sint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sintSamples32, "dEQP-VK.image.load_store_multisample.2d.r32_sint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR32sintSamples64, "dEQP-VK.image.load_store_multisample.2d.r32_sint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8unormSamples2, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_unorm.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8unormSamples4, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_unorm.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8unormSamples8, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_unorm.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8unormSamples16, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_unorm.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8unormSamples32, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_unorm.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8unormSamples64, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_unorm.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8snormSamples2, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_snorm.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8snormSamples4, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_snorm.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8snormSamples8, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_snorm.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8snormSamples16, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_snorm.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8snormSamples32, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_snorm.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2dR8g8b8a8snormSamples64, "dEQP-VK.image.load_store_multisample.2d.r8g8b8a8_snorm.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sfloatsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sfloat_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16sfloatsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sfloat_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32sfloatsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32_sfloat_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32uintsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_uint_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR16g16b16a16uintsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_uint_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR8g8b8a8uintsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_uint_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32uintsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32_uint_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0002TS, TC2darrayR32g32b32a32sintSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint.samples_2*");