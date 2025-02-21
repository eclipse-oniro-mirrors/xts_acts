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

static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCGraphicsGraphic, "dEQP-VK.subgroups.ballot.graphics.graphic*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeCompute, "dEQP-VK.subgroups.ballot.compute.compute*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCComputeComputerequiredsubgroupsize, "dEQP-VK.subgroups.ballot.compute.compute_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferTesseval, "dEQP-VK.subgroups.ballot.framebuffer.tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferTesscontrol, "dEQP-VK.subgroups.ballot.framebuffer.tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferGeometry, "dEQP-VK.subgroups.ballot.framebuffer.geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCFramebufferVertex, "dEQP-VK.subgroups.ballot.framebuffer.vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCRaytracingTest, "dEQP-VK.subgroups.ballot.ray_tracing.test*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCExtshadersubgroupballotGraphicsGraphic, "dEQP-VK.subgroups.ballot.ext_shader_subgroup_ballot.graphics.graphic*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCExtshadersubgroupballotComputeCompute, "dEQP-VK.subgroups.ballot.ext_shader_subgroup_ballot.compute.compute*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCExtshadersubgroupballotComputeComputerequiredsubgroupsize, "dEQP-VK.subgroups.ballot.ext_shader_subgroup_ballot.compute.compute_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCExtshadersubgroupballotFramebufferTesseval, "dEQP-VK.subgroups.ballot.ext_shader_subgroup_ballot.framebuffer.tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCExtshadersubgroupballotFramebufferTesscontrol, "dEQP-VK.subgroups.ballot.ext_shader_subgroup_ballot.framebuffer.tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCExtshadersubgroupballotFramebufferGeometry, "dEQP-VK.subgroups.ballot.ext_shader_subgroup_ballot.framebuffer.geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0001TS, TCExtshadersubgroupballotFramebufferVertex, "dEQP-VK.subgroups.ballot.ext_shader_subgroup_ballot.framebuffer.vertex*");