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

static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic1dimageImageload, "dEQP-VK.image.texel_view_compatible.compute.basic.1d_image.image_load*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic1dimageTexelfetch, "dEQP-VK.image.texel_view_compatible.compute.basic.1d_image.texel_fetch*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic1dimageTexture, "dEQP-VK.image.texel_view_compatible.compute.basic.1d_image.texture*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic1dimageImagestore, "dEQP-VK.image.texel_view_compatible.compute.basic.1d_image.image_store*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic2dimageImageload, "dEQP-VK.image.texel_view_compatible.compute.basic.2d_image.image_load*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic2dimageTexelfetch, "dEQP-VK.image.texel_view_compatible.compute.basic.2d_image.texel_fetch*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic2dimageTexture, "dEQP-VK.image.texel_view_compatible.compute.basic.2d_image.texture*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic2dimageImagestore, "dEQP-VK.image.texel_view_compatible.compute.basic.2d_image.image_store*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic3dimageImageload, "dEQP-VK.image.texel_view_compatible.compute.basic.3d_image.image_load*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic3dimageTexelfetch, "dEQP-VK.image.texel_view_compatible.compute.basic.3d_image.texel_fetch*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic3dimageTexture, "dEQP-VK.image.texel_view_compatible.compute.basic.3d_image.texture*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeBasic3dimageImagestore, "dEQP-VK.image.texel_view_compatible.compute.basic.3d_image.image_store*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended1dimageImageload, "dEQP-VK.image.texel_view_compatible.compute.extended.1d_image.image_load*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended1dimageTexelfetch, "dEQP-VK.image.texel_view_compatible.compute.extended.1d_image.texel_fetch*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended1dimageTexture, "dEQP-VK.image.texel_view_compatible.compute.extended.1d_image.texture*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended1dimageImagestore, "dEQP-VK.image.texel_view_compatible.compute.extended.1d_image.image_store*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended2dimageImageload, "dEQP-VK.image.texel_view_compatible.compute.extended.2d_image.image_load*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended2dimageTexelfetch, "dEQP-VK.image.texel_view_compatible.compute.extended.2d_image.texel_fetch*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended2dimageTexture, "dEQP-VK.image.texel_view_compatible.compute.extended.2d_image.texture*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended2dimageImagestore, "dEQP-VK.image.texel_view_compatible.compute.extended.2d_image.image_store*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended3dimageImageload, "dEQP-VK.image.texel_view_compatible.compute.extended.3d_image.image_load*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended3dimageTexelfetch, "dEQP-VK.image.texel_view_compatible.compute.extended.3d_image.texel_fetch*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended3dimageTexture, "dEQP-VK.image.texel_view_compatible.compute.extended.3d_image.texture*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCComputeExtended3dimageImagestore, "dEQP-VK.image.texel_view_compatible.compute.extended.3d_image.image_store*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicBasic1dimageAttachmentread, "dEQP-VK.image.texel_view_compatible.graphic.basic.1d_image.attachment_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicBasic1dimageAttachmentwrite, "dEQP-VK.image.texel_view_compatible.graphic.basic.1d_image.attachment_write*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicBasic1dimageTextureread, "dEQP-VK.image.texel_view_compatible.graphic.basic.1d_image.texture_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicBasic1dimageTexturewrite, "dEQP-VK.image.texel_view_compatible.graphic.basic.1d_image.texture_write*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicBasic2dimageAttachmentread, "dEQP-VK.image.texel_view_compatible.graphic.basic.2d_image.attachment_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicBasic2dimageAttachmentwrite, "dEQP-VK.image.texel_view_compatible.graphic.basic.2d_image.attachment_write*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicBasic2dimageTextureread, "dEQP-VK.image.texel_view_compatible.graphic.basic.2d_image.texture_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicBasic2dimageTexturewrite, "dEQP-VK.image.texel_view_compatible.graphic.basic.2d_image.texture_write*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicBasic3dimageTextureread, "dEQP-VK.image.texel_view_compatible.graphic.basic.3d_image.texture_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicBasic3dimageTexturewrite, "dEQP-VK.image.texel_view_compatible.graphic.basic.3d_image.texture_write*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicExtended1dimageAttachmentread, "dEQP-VK.image.texel_view_compatible.graphic.extended.1d_image.attachment_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicExtended1dimageAttachmentwrite, "dEQP-VK.image.texel_view_compatible.graphic.extended.1d_image.attachment_write*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicExtended1dimageTextureread, "dEQP-VK.image.texel_view_compatible.graphic.extended.1d_image.texture_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicExtended1dimageTexturewrite, "dEQP-VK.image.texel_view_compatible.graphic.extended.1d_image.texture_write*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicExtended2dimageAttachmentread, "dEQP-VK.image.texel_view_compatible.graphic.extended.2d_image.attachment_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicExtended2dimageAttachmentwrite, "dEQP-VK.image.texel_view_compatible.graphic.extended.2d_image.attachment_write*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicExtended2dimageTextureread, "dEQP-VK.image.texel_view_compatible.graphic.extended.2d_image.texture_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicExtended2dimageTexturewrite, "dEQP-VK.image.texel_view_compatible.graphic.extended.2d_image.texture_write*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicExtended3dimageTextureread, "dEQP-VK.image.texel_view_compatible.graphic.extended.3d_image.texture_read*");
static SHRINK_HWTEST_F(ActsImage0017TS, TCGraphicExtended3dimageTexturewrite, "dEQP-VK.image.texel_view_compatible.graphic.extended.3d_image.texture_write*");