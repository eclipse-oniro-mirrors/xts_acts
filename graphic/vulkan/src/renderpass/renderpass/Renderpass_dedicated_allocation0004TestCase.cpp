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
#include "../RenderpassBaseFunc.h"
#include "../ActsRenderpass0005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCSimpleColor, "dEQP-VK.renderpass.dedicated_allocation.simple.color*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCSimpleDepth, "dEQP-VK.renderpass.dedicated_allocation.simple.depth*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCSimpleStencil, "dEQP-VK.renderpass.dedicated_allocation.simple.stencil*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCSimpleDepthstencil, "dEQP-VK.renderpass.dedicated_allocation.simple.depth_stencil*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCSimpleColordepth, "dEQP-VK.renderpass.dedicated_allocation.simple.color_depth*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCSimpleColorstencil, "dEQP-VK.renderpass.dedicated_allocation.simple.color_stencil*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCSimpleColordepthstencil, "dEQP-VK.renderpass.dedicated_allocation.simple.color_depth_stencil*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCSimpleNoattachments, "dEQP-VK.renderpass.dedicated_allocation.simple.no_attachments*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCSimpleColorunusedomitblendstate, "dEQP-VK.renderpass.dedicated_allocation.simple.color_unused_omit_blend_state*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16ClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16ClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16ClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16LoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16LoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16LoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16DontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16DontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16DontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16InputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16InputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR5g6b5unormpack16InputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r5g6b5_unorm_pack16.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormLoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormDontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormDontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormDontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormInputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormInputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8unormInputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_unorm.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormLoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormDontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormDontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormDontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormInputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormInputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8snormInputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_snorm.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintLoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintDontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintDontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintDontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintInputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintInputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8uintInputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_uint.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintLoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintDontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintDontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintDontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintInputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintInputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8sintInputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r8_sint.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormLoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormDontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormDontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormDontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormInputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormInputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8unormInputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_unorm.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormLoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormDontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormDontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormDontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormInputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormInputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8snormInputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_snorm.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintLoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintDontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintDontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintDontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintInputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintInputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8uintInputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_uint.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintLoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintDontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintDontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintDontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintInputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintInputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8sintInputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8_sint.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormLoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormDontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormDontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormDontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormInputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormInputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8unormInputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_unorm.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.load.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormLoadCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.load.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormDontcareClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.dont_care.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormDontcareDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.dont_care.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormDontcareCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.dont_care.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormInputClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.input.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormInputLoad, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.input.load*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8snormInputDontcare, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_snorm.input.dont_care*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8uintClearClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_uint.clear.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8uintClearDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_uint.clear.draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8uintClearCleardraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_uint.clear.clear_draw*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8uintLoadClear, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_uint.load.clear*");
static SHRINK_HWTEST_F(ActsRenderpass0005TS, TCFormatsR8g8b8a8uintLoadDraw, "dEQP-VK.renderpass.dedicated_allocation.formats.r8g8b8a8_uint.load.draw*");