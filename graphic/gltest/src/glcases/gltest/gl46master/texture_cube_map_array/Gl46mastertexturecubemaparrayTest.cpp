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
#include "../Gl46masterBaseFunc.h"
#include "../ActsGl46master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008346,
    "KHR-GL46.texture_cube_map_array.sampling");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008347,
    "KHR-GL46.texture_cube_map_array.color_depth_attachments");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008348,
    "KHR-GL46.texture_cube_map_array.stencil_attachments_mutable_nonlayered");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008349,
    "KHR-GL46.texture_cube_map_array.stencil_attachments_mutable_layered");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008350,
    "KHR-GL46.texture_cube_map_array.stencil_attachments_immutable_nonlayered");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008351,
    "KHR-GL46.texture_cube_map_array.stencil_attachments_immutable_layered");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008352,
    "KHR-GL46.texture_cube_map_array.tex3D_validation");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008353,
    "KHR-GL46.texture_cube_map_array.subimage3D");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008354,
    "KHR-GL46.texture_cube_map_array.getter_calls");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008355,
    "KHR-GL46.texture_cube_map_array.generate_mip_map_filterable_internalformat_mutable");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008356,
    "KHR-GL46.texture_cube_map_array.generate_mip_map_filterable_internalformat_immutable");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008357,
    "KHR-GL46.texture_cube_map_array.generate_mip_map_non_filterable_mutable_storage");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008358,
    "KHR-GL46.texture_cube_map_array.generate_mip_map_non_filterable_immutable_storage");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008359,
    "KHR-GL46.texture_cube_map_array.image_op_compute_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008360,
    "KHR-GL46.texture_cube_map_array.image_op_vertex_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008361,
    "KHR-GL46.texture_cube_map_array.image_op_fragment_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008362,
    "KHR-GL46.texture_cube_map_array.image_op_geometry_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008363,
    "KHR-GL46.texture_cube_map_array.image_op_tessellation_control_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008364,
    "KHR-GL46.texture_cube_map_array.image_op_tessellation_evaluation_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008365,
    "KHR-GL46.texture_cube_map_array.fbo_incompleteness");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008366,
    "KHR-GL46.texture_cube_map_array.texture_size_vertex_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008367,
    "KHR-GL46.texture_cube_map_array.texture_size_geometry_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008368,
    "KHR-GL46.texture_cube_map_array.texture_size_tesselation_con_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008369,
    "KHR-GL46.texture_cube_map_array.texture_size_tesselation_ev_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008370,
    "KHR-GL46.texture_cube_map_array.texture_size_fragment_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008371,
    "KHR-GL46.texture_cube_map_array.texture_size_compute_sh");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008372,
    "KHR-GL46.texture_cube_map_array.etc2_texture");
