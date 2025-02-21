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
#include "../ActsRenderpass0002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount1Startindex0, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_1.start_index_0*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount2Startindex1, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_2.start_index_1*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount3Startindex0, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_3.start_index_0*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount3Startindex1, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_3.start_index_1*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount3Startindex2, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_3.start_index_2*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount4Startindex0, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_4.start_index_0*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount4Startindex1, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_4.start_index_1*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount4Startindex2, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_4.start_index_2*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount4Startindex3, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_4.start_index_3*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount8Startindex0, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_8.start_index_0*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount8Startindex1, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_8.start_index_1*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount8Startindex2, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_8.start_index_2*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount8Startindex3, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_8.start_index_3*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount8Startindex4, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_8.start_index_4*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount8Startindex5, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_8.start_index_5*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount8Startindex6, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_8.start_index_6*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentwritemaskAttachmentcount8Startindex7, "dEQP-VK.renderpass.suballocation.attachment_write_mask.attachment_count_8.start_index_7*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCAttachmentallocationGrow0, "dEQP-VK.renderpass.suballocation.attachment_allocation.*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR5g6b5unormpack16Samples2, "dEQP-VK.renderpass.suballocation.multisample.r5g6b5_unorm_pack16.samples_2*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR5g6b5unormpack16Samples4, "dEQP-VK.renderpass.suballocation.multisample.r5g6b5_unorm_pack16.samples_4*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR5g6b5unormpack16Samples8, "dEQP-VK.renderpass.suballocation.multisample.r5g6b5_unorm_pack16.samples_8*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR5g6b5unormpack16Samples16, "dEQP-VK.renderpass.suballocation.multisample.r5g6b5_unorm_pack16.samples_16*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR5g6b5unormpack16Samples32, "dEQP-VK.renderpass.suballocation.multisample.r5g6b5_unorm_pack16.samples_32*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR8unormSamples2, "dEQP-VK.renderpass.suballocation.multisample.r8_unorm.samples_2*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR8unormSamples4, "dEQP-VK.renderpass.suballocation.multisample.r8_unorm.samples_4*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR8unormSamples8, "dEQP-VK.renderpass.suballocation.multisample.r8_unorm.samples_8*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR8unormSamples16, "dEQP-VK.renderpass.suballocation.multisample.r8_unorm.samples_16*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR8unormSamples32, "dEQP-VK.renderpass.suballocation.multisample.r8_unorm.samples_32*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR8snormSamples2, "dEQP-VK.renderpass.suballocation.multisample.r8_snorm.samples_2*");
static SHRINK_HWTEST_F(ActsRenderpass0002TS, TCMultisampleR8snormSamples4, "dEQP-VK.renderpass.suballocation.multisample.r8_snorm.samples_4*");