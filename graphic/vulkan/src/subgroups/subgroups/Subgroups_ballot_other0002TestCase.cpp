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
#include "../ActsSubgroups0003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinverseballot, "dEQP-VK.subgroups.ballot_other.graphics.subgroupinverseballot*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupballotbitextract, "dEQP-VK.subgroups.ballot_other.graphics.subgroupballotbitextract*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupballotbitcount, "dEQP-VK.subgroups.ballot_other.graphics.subgroupballotbitcount*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupballotinclusivebitcount, "dEQP-VK.subgroups.ballot_other.graphics.subgroupballotinclusivebitcount*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupballotexclusivebitcount, "dEQP-VK.subgroups.ballot_other.graphics.subgroupballotexclusivebitcount*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupballotfindlsb, "dEQP-VK.subgroups.ballot_other.graphics.subgroupballotfindlsb*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupballotfindmsb, "dEQP-VK.subgroups.ballot_other.graphics.subgroupballotfindmsb*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupinverseballot, "dEQP-VK.subgroups.ballot_other.compute.subgroupinverseballot*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupinverseballotrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_other.compute.subgroupinverseballot_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotbitextract, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotbitextract*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotbitextractrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotbitextract_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotbitcount, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotbitcount*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotbitcountrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotbitcount_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotinclusivebitcount, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotinclusivebitcount*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotinclusivebitcountrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotinclusivebitcount_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotexclusivebitcount, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotexclusivebitcount*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotexclusivebitcountrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotexclusivebitcount_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotfindlsb, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotfindlsb*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotfindlsbrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotfindlsb_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotfindmsb, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotfindmsb*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCComputeSubgroupballotfindmsbrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_other.compute.subgroupballotfindmsb_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupinverseballotvertex, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupinverseballot_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupinverseballottesseval, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupinverseballot_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupinverseballottesscontrol, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupinverseballot_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupinverseballotgeometry, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupinverseballot_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotbitextractvertex, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotbitextract_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotbitextracttesseval, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotbitextract_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotbitextracttesscontrol, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotbitextract_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotbitextractgeometry, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotbitextract_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotbitcountvertex, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotbitcount_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotbitcounttesseval, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotbitcount_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotbitcounttesscontrol, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotbitcount_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotbitcountgeometry, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotbitcount_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotinclusivebitcountvertex, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotinclusivebitcount_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotinclusivebitcounttesseval, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotinclusivebitcount_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotinclusivebitcounttesscontrol, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotinclusivebitcount_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotinclusivebitcountgeometry, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotinclusivebitcount_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotexclusivebitcountvertex, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotexclusivebitcount_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotexclusivebitcounttesseval, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotexclusivebitcount_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotexclusivebitcounttesscontrol, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotexclusivebitcount_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotexclusivebitcountgeometry, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotexclusivebitcount_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotfindlsbvertex, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotfindlsb_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotfindlsbtesseval, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotfindlsb_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotfindlsbtesscontrol, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotfindlsb_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotfindlsbgeometry, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotfindlsb_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotfindmsbvertex, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotfindmsb_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotfindmsbtesseval, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotfindmsb_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotfindmsbtesscontrol, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotfindmsb_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCFramebufferSubgroupballotfindmsbgeometry, "dEQP-VK.subgroups.ballot_other.framebuffer.subgroupballotfindmsb_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCRaytracingSubgroupinverseballot, "dEQP-VK.subgroups.ballot_other.ray_tracing.subgroupinverseballot*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCRaytracingSubgroupballotbitextract, "dEQP-VK.subgroups.ballot_other.ray_tracing.subgroupballotbitextract*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCRaytracingSubgroupballotbitcount, "dEQP-VK.subgroups.ballot_other.ray_tracing.subgroupballotbitcount*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCRaytracingSubgroupballotinclusivebitcount, "dEQP-VK.subgroups.ballot_other.ray_tracing.subgroupballotinclusivebitcount*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCRaytracingSubgroupballotexclusivebitcount, "dEQP-VK.subgroups.ballot_other.ray_tracing.subgroupballotexclusivebitcount*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCRaytracingSubgroupballotfindlsb, "dEQP-VK.subgroups.ballot_other.ray_tracing.subgroupballotfindlsb*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCRaytracingSubgroupballotfindmsb, "dEQP-VK.subgroups.ballot_other.ray_tracing.subgroupballotfindmsb*");