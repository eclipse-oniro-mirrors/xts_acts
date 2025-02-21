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
#include "../SubgroupsBaseFunc.h"
#include "../ActsSubgroups0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsSubgroupelect, "dEQP-VK.subgroups.basic.graphics.subgroupelect*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsSubgroupbarrier, "dEQP-VK.subgroups.basic.graphics.subgroupbarrier*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsSubgroupmemorybarrier, "dEQP-VK.subgroups.basic.graphics.subgroupmemorybarrier*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsSubgroupmemorybarrierbuffer, "dEQP-VK.subgroups.basic.graphics.subgroupmemorybarrierbuffer*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsSubgroupmemorybarrierimage, "dEQP-VK.subgroups.basic.graphics.subgroupmemorybarrierimage*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupelect, "dEQP-VK.subgroups.basic.compute.subgroupelect*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupelectrequiredsubgroupsize, "dEQP-VK.subgroups.basic.compute.subgroupelect_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupbarrier, "dEQP-VK.subgroups.basic.compute.subgroupbarrier*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupbarrierrequiredsubgroupsize, "dEQP-VK.subgroups.basic.compute.subgroupbarrier_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupmemorybarrier, "dEQP-VK.subgroups.basic.compute.subgroupmemorybarrier*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupmemorybarrierrequiredsubgroupsize, "dEQP-VK.subgroups.basic.compute.subgroupmemorybarrier_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupmemorybarrierbuffer, "dEQP-VK.subgroups.basic.compute.subgroupmemorybarrierbuffer*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupmemorybarrierbufferrequiredsubgroupsize, "dEQP-VK.subgroups.basic.compute.subgroupmemorybarrierbuffer_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupmemorybarriershared, "dEQP-VK.subgroups.basic.compute.subgroupmemorybarriershared*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupmemorybarriersharedrequiredsubgroupsize, "dEQP-VK.subgroups.basic.compute.subgroupmemorybarriershared_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupmemorybarrierimage, "dEQP-VK.subgroups.basic.compute.subgroupmemorybarrierimage*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupmemorybarrierimagerequiredsubgroupsize, "dEQP-VK.subgroups.basic.compute.subgroupmemorybarrierimage_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupelectvertex, "dEQP-VK.subgroups.basic.framebuffer.subgroupelect_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupelecttesseval, "dEQP-VK.subgroups.basic.framebuffer.subgroupelect_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupelecttesscontrol, "dEQP-VK.subgroups.basic.framebuffer.subgroupelect_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupelectgeometry, "dEQP-VK.subgroups.basic.framebuffer.subgroupelect_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupbarrierfragment, "dEQP-VK.subgroups.basic.framebuffer.subgroupbarrier_fragment*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupbarriervertex, "dEQP-VK.subgroups.basic.framebuffer.subgroupbarrier_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupbarriertesseval, "dEQP-VK.subgroups.basic.framebuffer.subgroupbarrier_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupbarriertesscontrol, "dEQP-VK.subgroups.basic.framebuffer.subgroupbarrier_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupbarriergeometry, "dEQP-VK.subgroups.basic.framebuffer.subgroupbarrier_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierfragment, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrier_fragment*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarriervertex, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrier_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarriertesseval, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrier_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarriertesscontrol, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrier_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarriergeometry, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrier_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierbufferfragment, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrierbuffer_fragment*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierbuffervertex, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrierbuffer_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierbuffertesseval, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrierbuffer_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierbuffertesscontrol, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrierbuffer_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierbuffergeometry, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrierbuffer_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierimagefragment, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrierimage_fragment*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierimagevertex, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrierimage_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierimagetesseval, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrierimage_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierimagetesscontrol, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrierimage_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupmemorybarrierimagegeometry, "dEQP-VK.subgroups.basic.framebuffer.subgroupmemorybarrierimage_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingSubgroupelect, "dEQP-VK.subgroups.basic.ray_tracing.subgroupelect*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingSubgroupbarrier, "dEQP-VK.subgroups.basic.ray_tracing.subgroupbarrier*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingSubgroupmemorybarrier, "dEQP-VK.subgroups.basic.ray_tracing.subgroupmemorybarrier*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingSubgroupmemorybarrierbuffer, "dEQP-VK.subgroups.basic.ray_tracing.subgroupmemorybarrierbuffer*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingSubgroupmemorybarrierimage, "dEQP-VK.subgroups.basic.ray_tracing.subgroupmemorybarrierimage*");