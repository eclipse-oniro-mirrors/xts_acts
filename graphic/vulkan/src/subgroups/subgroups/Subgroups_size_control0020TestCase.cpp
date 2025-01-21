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

static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCGenericSubgroupsizeproperties, "dEQP-VK.subgroups.size_control.generic.subgroup_size_properties*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCGraphicsAllowvaryingsubgroupsize, "dEQP-VK.subgroups.size_control.graphics.allow_varying_subgroup_size*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCGraphicsRequiredsubgroupsizemax, "dEQP-VK.subgroups.size_control.graphics.required_subgroup_size_max*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCGraphicsRequiredsubgroupsizemin, "dEQP-VK.subgroups.size_control.graphics.required_subgroup_size_min*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeAllowvaryingsubgroupsize, "dEQP-VK.subgroups.size_control.compute.allow_varying_subgroup_size*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeRequirefullsubgroups, "dEQP-VK.subgroups.size_control.compute.require_full_subgroups*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeRequirefullsubgroupsallowvaryingsubgroupsize, "dEQP-VK.subgroups.size_control.compute.require_full_subgroups_allow_varying_subgroup_size*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeRequiredsubgroupsizemax, "dEQP-VK.subgroups.size_control.compute.required_subgroup_size_max*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeRequiredsubgroupsizemin, "dEQP-VK.subgroups.size_control.compute.required_subgroup_size_min*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeRequiredsubgroupsizemaxrequirefullsubgroups, "dEQP-VK.subgroups.size_control.compute.required_subgroup_size_max_require_full_subgroups*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCComputeRequiredsubgroupsizeminrequirefullsubgroups, "dEQP-VK.subgroups.size_control.compute.required_subgroup_size_min_require_full_subgroups*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferVertexallowvaryingsubgroupsize, "dEQP-VK.subgroups.size_control.framebuffer.vertex_allow_varying_subgroup_size*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferTessevalallowvaryingsubgroupsize, "dEQP-VK.subgroups.size_control.framebuffer.tess_eval_allow_varying_subgroup_size*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferTesscontrolallowvaryingsubgroupsize, "dEQP-VK.subgroups.size_control.framebuffer.tess_control_allow_varying_subgroup_size*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferGeometryallowvaryingsubgroupsize, "dEQP-VK.subgroups.size_control.framebuffer.geometry_allow_varying_subgroup_size*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferFragmentallowvaryingsubgroupsize, "dEQP-VK.subgroups.size_control.framebuffer.fragment_allow_varying_subgroup_size*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferVertexrequiredsubgroupsizemax, "dEQP-VK.subgroups.size_control.framebuffer.vertex_required_subgroup_size_max*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferVertexrequiredsubgroupsizemin, "dEQP-VK.subgroups.size_control.framebuffer.vertex_required_subgroup_size_min*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferTessevalrequiredsubgroupsizemax, "dEQP-VK.subgroups.size_control.framebuffer.tess_eval_required_subgroup_size_max*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferTessevalrequiredsubgroupsizemin, "dEQP-VK.subgroups.size_control.framebuffer.tess_eval_required_subgroup_size_min*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferTesscontrolrequiredsubgroupsizemax, "dEQP-VK.subgroups.size_control.framebuffer.tess_control_required_subgroup_size_max*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferTesscontrolrequiredsubgroupsizemin, "dEQP-VK.subgroups.size_control.framebuffer.tess_control_required_subgroup_size_min*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferGeometryrequiredsubgroupsizemax, "dEQP-VK.subgroups.size_control.framebuffer.geometry_required_subgroup_size_max*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferGeometryrequiredsubgroupsizemin, "dEQP-VK.subgroups.size_control.framebuffer.geometry_required_subgroup_size_min*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferFragmentrequiredsubgroupsizemax, "dEQP-VK.subgroups.size_control.framebuffer.fragment_required_subgroup_size_max*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferFragmentrequiredsubgroupsizemin, "dEQP-VK.subgroups.size_control.framebuffer.fragment_required_subgroup_size_min*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingAllowvaryingsubgroupsize, "dEQP-VK.subgroups.size_control.ray_tracing.allow_varying_subgroup_size*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingRequiredsubgroupsizemax, "dEQP-VK.subgroups.size_control.ray_tracing.required_subgroup_size_max*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingRequiredsubgroupsizemin, "dEQP-VK.subgroups.size_control.ray_tracing.required_subgroup_size_min*");