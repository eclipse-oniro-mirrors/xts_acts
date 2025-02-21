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
#include "../ActsImage0003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32g32b32a32sintsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32g32b32a32_sint_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR16g16b16a16sintsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r16g16b16a16_sint_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8sintsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_sint_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR32sintsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r32_sint_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8unormsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_unorm_single_layer.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm.samples_64*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormsinglelayerSamples2, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm_single_layer.samples_2*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormsinglelayerSamples4, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm_single_layer.samples_4*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormsinglelayerSamples8, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm_single_layer.samples_8*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormsinglelayerSamples16, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm_single_layer.samples_16*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormsinglelayerSamples32, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm_single_layer.samples_32*");
static SHRINK_HWTEST_F(ActsImage0003TS, TC2darrayR8g8b8a8snormsinglelayerSamples64, "dEQP-VK.image.load_store_multisample.2d_array.r8g8b8a8_snorm_single_layer.samples_64*");