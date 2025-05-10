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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008135,
        "dEQP-GLES31.functional.tessellation.invariance.outer",
        "_edge_index_independence.triangles_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008136,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge",
        "_index_independence.triangles_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008137,
        "dEQP-GLES31.functional.tessellation.invariance.oute",
        "r_edge_index_independence.triangles_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008138,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge",
        "_index_independence.triangles_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008139,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edg",
        "e_index_independence.triangles_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008140,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge_inde",
        "x_independence.triangles_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008141,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edg",
        "e_index_independence.triangles_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008142,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge_ind",
        "ex_independence.triangles_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008143,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge",
        "_index_independence.triangles_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008144,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge_inde",
        "x_independence.triangles_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008145,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edg",
        "e_index_independence.triangles_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008146,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge_inde",
        "x_independence.triangles_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008147,
        "dEQP-GLES31.functional.tessellation.invariance.out",
        "er_edge_index_independence.quads_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008148,
        "dEQP-GLES31.functional.tessellation.invariance.outer_ed",
        "ge_index_independence.quads_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008149,
        "dEQP-GLES31.functional.tessellation.invariance.ou",
        "ter_edge_index_independence.quads_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008150,
        "dEQP-GLES31.functional.tessellation.invariance.outer_ed",
        "ge_index_independence.quads_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008151,
        "dEQP-GLES31.functional.tessellation.invariance.outer_e",
        "dge_index_independence.quads_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008152,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge_in",
        "dex_independence.quads_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008153,
        "dEQP-GLES31.functional.tessellation.invariance.outer_e",
        "dge_index_independence.quads_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008154,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge_i",
        "ndex_independence.quads_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008155,
        "dEQP-GLES31.functional.tessellation.invariance.outer_ed",
        "ge_index_independence.quads_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008156,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge_in",
        "dex_independence.quads_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008157,
        "dEQP-GLES31.functional.tessellation.invariance.outer_e",
        "dge_index_independence.quads_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008158,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge_in",
        "dex_independence.quads_fractional_even_spacing_cw_point_mode");
