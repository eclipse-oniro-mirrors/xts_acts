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
#include "../TextureBaseFunc.h"
#include "../ActsTexture0009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformPackedA2b10g10r10_uint_pack32, "dEQP-VK.texture.texel_buffer.uniform.packed.a2b10g10r10-uint-pack32*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformPackedA2b10g10r10_unorm_pack32, "dEQP-VK.texture.texel_buffer.uniform.packed.a2b10g10r10-unorm-pack32*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformPackedA8b8g8r8_sint_pack32, "dEQP-VK.texture.texel_buffer.uniform.packed.a8b8g8r8-sint-pack32*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformPackedA8b8g8r8_snorm_pack32, "dEQP-VK.texture.texel_buffer.uniform.packed.a8b8g8r8-snorm-pack32*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformPackedA8b8g8r8_uint_pack32, "dEQP-VK.texture.texel_buffer.uniform.packed.a8b8g8r8-uint-pack32*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformPackedA8b8g8r8_unorm_pack32, "dEQP-VK.texture.texel_buffer.uniform.packed.a8b8g8r8-unorm-pack32*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformPackedB10g11r11_ufloat_pack32, "dEQP-VK.texture.texel_buffer.uniform.packed.b10g11r11-ufloat-pack32*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformSnormB8g8r8_snorm, "dEQP-VK.texture.texel_buffer.uniform.snorm.b8g8r8-snorm*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformSnormB8g8r8a8_snorm, "dEQP-VK.texture.texel_buffer.uniform.snorm.b8g8r8a8-snorm*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformSnormR16_snorm, "dEQP-VK.texture.texel_buffer.uniform.snorm.r16-snorm*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformSnormR16g16_snorm, "dEQP-VK.texture.texel_buffer.uniform.snorm.r16g16-snorm*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformSnormR16g16b16_snorm, "dEQP-VK.texture.texel_buffer.uniform.snorm.r16g16b16-snorm*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformSnormR16g16b16a16_snorm, "dEQP-VK.texture.texel_buffer.uniform.snorm.r16g16b16a16-snorm*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformSnormR8_snorm, "dEQP-VK.texture.texel_buffer.uniform.snorm.r8-snorm*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformSnormR8g8_snorm, "dEQP-VK.texture.texel_buffer.uniform.snorm.r8g8-snorm*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformSnormR8g8b8_snorm, "dEQP-VK.texture.texel_buffer.uniform.snorm.r8g8b8-snorm*");

static SHRINK_HWTEST_F(ActsTexture0009TS, TCUniformSnormR8g8b8a8_snorm, "dEQP-VK.texture.texel_buffer.uniform.snorm.r8g8b8a8-snorm*");
