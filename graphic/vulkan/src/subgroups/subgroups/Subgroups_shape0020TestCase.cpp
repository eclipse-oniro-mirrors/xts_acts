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
#include "../ActsSubgroups0021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCGraphicsClustered, "dEQP-VK.subgroups.shape.graphics.clustered*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCGraphicsQuad, "dEQP-VK.subgroups.shape.graphics.quad*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeClustered, "dEQP-VK.subgroups.shape.compute.clustered*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeClusteredrequiredsubgroupsize, "dEQP-VK.subgroups.shape.compute.clustered_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeQuad, "dEQP-VK.subgroups.shape.compute.quad*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeQuadrequiredsubgroupsize, "dEQP-VK.subgroups.shape.compute.quad_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferClusteredvertex, "dEQP-VK.subgroups.shape.framebuffer.clustered_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferClusteredtesseval, "dEQP-VK.subgroups.shape.framebuffer.clustered_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferClusteredtesscontrol, "dEQP-VK.subgroups.shape.framebuffer.clustered_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferClusteredgeometry, "dEQP-VK.subgroups.shape.framebuffer.clustered_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferQuadvertex, "dEQP-VK.subgroups.shape.framebuffer.quad_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferQuadtesseval, "dEQP-VK.subgroups.shape.framebuffer.quad_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferQuadtesscontrol, "dEQP-VK.subgroups.shape.framebuffer.quad_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferQuadgeometry, "dEQP-VK.subgroups.shape.framebuffer.quad_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingClustered, "dEQP-VK.subgroups.shape.ray_tracing.clustered*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingQuad, "dEQP-VK.subgroups.shape.ray_tracing.quad*");