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
#include "../KhrglesextBaseFunc.h"
#include "../ActsKhrglesext0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000216,
        "KHR-GLESEXT.texture_c",
        "ube_map_array.sampling");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000217,
        "KHR-GLESEXT.texture_cube_map_",
        "array.color_depth_attachments");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000218,
        "KHR-GLESEXT.texture_cube_map_array.s",
        "tencil_attachments_mutable_nonlayered");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000219,
        "KHR-GLESEXT.texture_cube_map_array.",
        "stencil_attachments_mutable_layered");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000220,
        "KHR-GLESEXT.texture_cube_map_array.st",
        "encil_attachments_immutable_nonlayered");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000221,
        "KHR-GLESEXT.texture_cube_map_array.s",
        "tencil_attachments_immutable_layered");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000222,
        "KHR-GLESEXT.texture_cube_",
        "map_array.tex3D_validation");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000223,
        "KHR-GLESEXT.texture_cu",
        "be_map_array.subimage3D");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000224,
        "KHR-GLESEXT.texture_cub",
        "e_map_array.getter_calls");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000225,
        "KHR-GLESEXT.texture_cube_map_array.generat",
        "e_mip_map_filterable_internalformat_mutable");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000226,
        "KHR-GLESEXT.texture_cube_map_array.generate",
        "_mip_map_filterable_internalformat_immutable");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000227,
        "KHR-GLESEXT.texture_cube_map_array.genera",
        "te_mip_map_non_filterable_mutable_storage");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000228,
        "KHR-GLESEXT.texture_cube_map_array.generat",
        "e_mip_map_non_filterable_immutable_storage");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000229,
        "KHR-GLESEXT.texture_cube_ma",
        "p_array.image_op_compute_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000230,
        "KHR-GLESEXT.texture_cube_m",
        "ap_array.image_op_vertex_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000231,
        "KHR-GLESEXT.texture_cube_ma",
        "p_array.image_op_fragment_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000232,
        "KHR-GLESEXT.texture_cube_ma",
        "p_array.image_op_geometry_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000233,
        "KHR-GLESEXT.texture_cube_map_arra",
        "y.image_op_tessellation_control_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000234,
        "KHR-GLESEXT.texture_cube_map_array.",
        "image_op_tessellation_evaluation_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000235,
        "KHR-GLESEXT.texture_cube_m",
        "ap_array.fbo_incompleteness");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000236,
        "KHR-GLESEXT.texture_cube_map",
        "_array.texture_size_vertex_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000237,
        "KHR-GLESEXT.texture_cube_map_",
        "array.texture_size_geometry_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000238,
        "KHR-GLESEXT.texture_cube_map_arra",
        "y.texture_size_tesselation_con_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000239,
        "KHR-GLESEXT.texture_cube_map_arr",
        "ay.texture_size_tesselation_ev_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000240,
        "KHR-GLESEXT.texture_cube_map_",
        "array.texture_size_fragment_sh");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000241,
        "KHR-GLESEXT.texture_cube_map_",
        "array.texture_size_compute_sh");
