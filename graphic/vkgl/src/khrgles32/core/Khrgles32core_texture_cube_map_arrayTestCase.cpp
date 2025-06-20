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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000244,
        "KHR-GLES32.core.texture",
        "_cube_map_array.sampling");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000245,
        "KHR-GLES32.core.texture_cube_ma",
        "p_array.color_depth_attachments");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000246,
        "KHR-GLES32.core.texture_cube_map_array",
        ".stencil_attachments_mutable_nonlayered");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000247,
        "KHR-GLES32.core.texture_cube_map_arra",
        "y.stencil_attachments_mutable_layered");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000248,
        "KHR-GLES32.core.texture_cube_map_array.",
        "stencil_attachments_immutable_nonlayered");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000249,
        "KHR-GLES32.core.texture_cube_map_array",
        ".stencil_attachments_immutable_layered");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000250,
        "KHR-GLES32.core.texture_cub",
        "e_map_array.tex3D_validation");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000251,
        "KHR-GLES32.core.texture_",
        "cube_map_array.subimage3D");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000252,
        "KHR-GLES32.core.texture_c",
        "ube_map_array.getter_calls");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000253,
        "KHR-GLES32.core.texture_cube_map_array.gener",
        "ate_mip_map_filterable_internalformat_mutable");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000254,
        "KHR-GLES32.core.texture_cube_map_array.genera",
        "te_mip_map_filterable_internalformat_immutable");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000255,
        "KHR-GLES32.core.texture_cube_map_array.gene",
        "rate_mip_map_non_filterable_mutable_storage");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000256,
        "KHR-GLES32.core.texture_cube_map_array.gener",
        "ate_mip_map_non_filterable_immutable_storage");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000257,
        "KHR-GLES32.core.texture_cube_",
        "map_array.image_op_compute_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000258,
        "KHR-GLES32.core.texture_cube",
        "_map_array.image_op_vertex_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000259,
        "KHR-GLES32.core.texture_cube_",
        "map_array.image_op_fragment_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000260,
        "KHR-GLES32.core.texture_cube_",
        "map_array.image_op_geometry_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000261,
        "KHR-GLES32.core.texture_cube_map_ar",
        "ray.image_op_tessellation_control_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000262,
        "KHR-GLES32.core.texture_cube_map_arra",
        "y.image_op_tessellation_evaluation_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000263,
        "KHR-GLES32.core.texture_cube",
        "_map_array.fbo_incompleteness");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000264,
        "KHR-GLES32.core.texture_cube_m",
        "ap_array.texture_size_vertex_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000265,
        "KHR-GLES32.core.texture_cube_ma",
        "p_array.texture_size_geometry_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000266,
        "KHR-GLES32.core.texture_cube_map_ar",
        "ray.texture_size_tesselation_con_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000267,
        "KHR-GLES32.core.texture_cube_map_a",
        "rray.texture_size_tesselation_ev_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000268,
        "KHR-GLES32.core.texture_cube_ma",
        "p_array.texture_size_fragment_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000269,
        "KHR-GLES32.core.texture_cube_ma",
        "p_array.texture_size_compute_sh");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000270,
        "KHR-GLES32.core.texture_c",
        "ube_map_array.etc2_texture");
