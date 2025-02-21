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

static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotGraphicsGlsubgroupeqmaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.graphics.gl_subgroupeqmaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotGraphicsGlsubgroupgemaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.graphics.gl_subgroupgemaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotGraphicsGlsubgroupgtmaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.graphics.gl_subgroupgtmaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotGraphicsGlsubgrouplemaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.graphics.gl_subgrouplemaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotGraphicsGlsubgroupltmaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.graphics.gl_subgroupltmaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotComputeGlsubgroupeqmaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.compute.gl_subgroupeqmaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotComputeGlsubgroupeqmaskarbrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.compute.gl_subgroupeqmaskarb_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotComputeGlsubgroupgemaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.compute.gl_subgroupgemaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotComputeGlsubgroupgemaskarbrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.compute.gl_subgroupgemaskarb_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotComputeGlsubgroupgtmaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.compute.gl_subgroupgtmaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotComputeGlsubgroupgtmaskarbrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.compute.gl_subgroupgtmaskarb_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotComputeGlsubgrouplemaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.compute.gl_subgrouplemaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotComputeGlsubgrouplemaskarbrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.compute.gl_subgrouplemaskarb_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotComputeGlsubgroupltmaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.compute.gl_subgroupltmaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotComputeGlsubgroupltmaskarbrequiredsubgroupsize, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.compute.gl_subgroupltmaskarb_requiredsubgroupsize*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupeqmaskarbvertex, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupeqmaskarb_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupeqmaskarbtesseval, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupeqmaskarb_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupeqmaskarbtesscontrol, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupeqmaskarb_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupeqmaskarbgeometry, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupeqmaskarb_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupgemaskarbvertex, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupgemaskarb_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupgemaskarbtesseval, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupgemaskarb_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupgemaskarbtesscontrol, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupgemaskarb_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupgemaskarbgeometry, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupgemaskarb_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupgtmaskarbvertex, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupgtmaskarb_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupgtmaskarbtesseval, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupgtmaskarb_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupgtmaskarbtesscontrol, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupgtmaskarb_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupgtmaskarbgeometry, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupgtmaskarb_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgrouplemaskarbvertex, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgrouplemaskarb_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgrouplemaskarbtesseval, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgrouplemaskarb_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgrouplemaskarbtesscontrol, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgrouplemaskarb_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgrouplemaskarbgeometry, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgrouplemaskarb_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupltmaskarbvertex, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupltmaskarb_vertex*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupltmaskarbtesseval, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupltmaskarb_tess_eval*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupltmaskarbtesscontrol, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupltmaskarb_tess_control*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotFramebufferGlsubgroupltmaskarbgeometry, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.framebuffer.gl_subgroupltmaskarb_geometry*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotRaytracingGlsubgroupeqmaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.ray_tracing.gl_subgroupeqmaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotRaytracingGlsubgroupgemaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.ray_tracing.gl_subgroupgemaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotRaytracingGlsubgroupgtmaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.ray_tracing.gl_subgroupgtmaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotRaytracingGlsubgrouplemaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.ray_tracing.gl_subgrouplemaskarb*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCExtshadersubgroupballotRaytracingGlsubgroupltmaskarb, "dEQP-VK.subgroups.ballot_mask.ext_shader_subgroup_ballot.ray_tracing.gl_subgroupltmaskarb*");