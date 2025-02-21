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

static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsSubgroupeqmask, "dEQP-VK.subgroups.builtin_mask_var.graphics.subgroupeqmask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsSubgroupgemask, "dEQP-VK.subgroups.builtin_mask_var.graphics.subgroupgemask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsSubgroupgtmask, "dEQP-VK.subgroups.builtin_mask_var.graphics.subgroupgtmask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsSubgrouplemask, "dEQP-VK.subgroups.builtin_mask_var.graphics.subgrouplemask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsSubgroupltmask, "dEQP-VK.subgroups.builtin_mask_var.graphics.subgroupltmask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupeqmask, "dEQP-VK.subgroups.builtin_mask_var.compute.subgroupeqmask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupeqmaskrequiredsubgroupsize, "dEQP-VK.subgroups.builtin_mask_var.compute.subgroupeqmask_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupgemask, "dEQP-VK.subgroups.builtin_mask_var.compute.subgroupgemask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupgemaskrequiredsubgroupsize, "dEQP-VK.subgroups.builtin_mask_var.compute.subgroupgemask_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupgtmask, "dEQP-VK.subgroups.builtin_mask_var.compute.subgroupgtmask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupgtmaskrequiredsubgroupsize, "dEQP-VK.subgroups.builtin_mask_var.compute.subgroupgtmask_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgrouplemask, "dEQP-VK.subgroups.builtin_mask_var.compute.subgrouplemask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgrouplemaskrequiredsubgroupsize, "dEQP-VK.subgroups.builtin_mask_var.compute.subgrouplemask_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupltmask, "dEQP-VK.subgroups.builtin_mask_var.compute.subgroupltmask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeSubgroupltmaskrequiredsubgroupsize, "dEQP-VK.subgroups.builtin_mask_var.compute.subgroupltmask_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupeqmaskvertex, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupeqmask_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupeqmasktesseval, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupeqmask_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupeqmasktesscontrol, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupeqmask_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupeqmaskgeometry, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupeqmask_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupgemaskvertex, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupgemask_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupgemasktesseval, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupgemask_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupgemasktesscontrol, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupgemask_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupgemaskgeometry, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupgemask_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupgtmaskvertex, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupgtmask_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupgtmasktesseval, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupgtmask_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupgtmasktesscontrol, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupgtmask_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupgtmaskgeometry, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupgtmask_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgrouplemaskvertex, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgrouplemask_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgrouplemasktesseval, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgrouplemask_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgrouplemasktesscontrol, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgrouplemask_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgrouplemaskgeometry, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgrouplemask_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupltmaskvertex, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupltmask_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupltmasktesseval, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupltmask_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupltmasktesscontrol, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupltmask_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferSubgroupltmaskgeometry, "dEQP-VK.subgroups.builtin_mask_var.framebuffer.subgroupltmask_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingSubgroupeqmask, "dEQP-VK.subgroups.builtin_mask_var.ray_tracing.subgroupeqmask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingSubgroupgemask, "dEQP-VK.subgroups.builtin_mask_var.ray_tracing.subgroupgemask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingSubgroupgtmask, "dEQP-VK.subgroups.builtin_mask_var.ray_tracing.subgroupgtmask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingSubgrouplemask, "dEQP-VK.subgroups.builtin_mask_var.ray_tracing.subgrouplemask*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingSubgroupltmask, "dEQP-VK.subgroups.builtin_mask_var.ray_tracing.subgroupltmask*");