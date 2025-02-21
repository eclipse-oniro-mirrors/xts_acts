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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008099,
        "dEQP-GLES31.functional.tessellation.invariance.",
        "outer_edge_symmetry.triangles_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008100,
        "dEQP-GLES31.functional.tessellation.invariance.outer",
        "_edge_symmetry.triangles_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008101,
        "dEQP-GLES31.functional.tessellation.invariance",
        ".outer_edge_symmetry.triangles_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008102,
        "dEQP-GLES31.functional.tessellation.invariance.outer",
        "_edge_symmetry.triangles_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008103,
        "dEQP-GLES31.functional.tessellation.invariance.oute",
        "r_edge_symmetry.triangles_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008104,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge",
        "_symmetry.triangles_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008105,
        "dEQP-GLES31.functional.tessellation.invariance.oute",
        "r_edge_symmetry.triangles_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008106,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edg",
        "e_symmetry.triangles_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008107,
        "dEQP-GLES31.functional.tessellation.invariance.outer",
        "_edge_symmetry.triangles_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008108,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge",
        "_symmetry.triangles_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008109,
        "dEQP-GLES31.functional.tessellation.invariance.oute",
        "r_edge_symmetry.triangles_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008110,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge",
        "_symmetry.triangles_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008111,
        "dEQP-GLES31.functional.tessellation.invarianc",
        "e.outer_edge_symmetry.quads_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008112,
        "dEQP-GLES31.functional.tessellation.invariance.out",
        "er_edge_symmetry.quads_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008113,
        "dEQP-GLES31.functional.tessellation.invarian",
        "ce.outer_edge_symmetry.quads_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008114,
        "dEQP-GLES31.functional.tessellation.invariance.out",
        "er_edge_symmetry.quads_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008115,
        "dEQP-GLES31.functional.tessellation.invariance.ou",
        "ter_edge_symmetry.quads_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008116,
        "dEQP-GLES31.functional.tessellation.invariance.outer_ed",
        "ge_symmetry.quads_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008117,
        "dEQP-GLES31.functional.tessellation.invariance.ou",
        "ter_edge_symmetry.quads_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008118,
        "dEQP-GLES31.functional.tessellation.invariance.outer_e",
        "dge_symmetry.quads_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008119,
        "dEQP-GLES31.functional.tessellation.invariance.out",
        "er_edge_symmetry.quads_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008120,
        "dEQP-GLES31.functional.tessellation.invariance.outer_ed",
        "ge_symmetry.quads_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008121,
        "dEQP-GLES31.functional.tessellation.invariance.ou",
        "ter_edge_symmetry.quads_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008122,
        "dEQP-GLES31.functional.tessellation.invariance.outer_ed",
        "ge_symmetry.quads_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008123,
        "dEQP-GLES31.functional.tessellation.invariance",
        ".outer_edge_symmetry.isolines_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008124,
        "dEQP-GLES31.functional.tessellation.invariance.outer",
        "_edge_symmetry.isolines_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008125,
        "dEQP-GLES31.functional.tessellation.invariance",
        ".outer_edge_symmetry.isolines_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008126,
        "dEQP-GLES31.functional.tessellation.invariance.oute",
        "r_edge_symmetry.isolines_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008127,
        "dEQP-GLES31.functional.tessellation.invariance.oute",
        "r_edge_symmetry.isolines_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008128,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edg",
        "e_symmetry.isolines_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008129,
        "dEQP-GLES31.functional.tessellation.invariance.out",
        "er_edge_symmetry.isolines_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008130,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edg",
        "e_symmetry.isolines_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008131,
        "dEQP-GLES31.functional.tessellation.invariance.oute",
        "r_edge_symmetry.isolines_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008132,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edge",
        "_symmetry.isolines_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008133,
        "dEQP-GLES31.functional.tessellation.invariance.oute",
        "r_edge_symmetry.isolines_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008134,
        "dEQP-GLES31.functional.tessellation.invariance.outer_edg",
        "e_symmetry.isolines_fractional_even_spacing_cw_point_mode");
