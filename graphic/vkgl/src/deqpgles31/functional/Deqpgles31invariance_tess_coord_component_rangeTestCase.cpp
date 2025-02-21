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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008177,
        "dEQP-GLES31.functional.tessellation.invariance.tes",
        "s_coord_component_range.triangles_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008178,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coor",
        "d_component_range.triangles_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008179,
        "dEQP-GLES31.functional.tessellation.invariance.tes",
        "s_coord_component_range.triangles_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008180,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coo",
        "rd_component_range.triangles_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008181,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coo",
        "rd_component_range.triangles_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008182,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_co",
        "mponent_range.triangles_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008183,
        "dEQP-GLES31.functional.tessellation.invariance.tess_co",
        "ord_component_range.triangles_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008184,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_co",
        "mponent_range.triangles_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008185,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coo",
        "rd_component_range.triangles_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008186,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_com",
        "ponent_range.triangles_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008187,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coo",
        "rd_component_range.triangles_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008188,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_co",
        "mponent_range.triangles_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008189,
        "dEQP-GLES31.functional.tessellation.invariance.t",
        "ess_coord_component_range.quads_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008190,
        "dEQP-GLES31.functional.tessellation.invariance.tess_co",
        "ord_component_range.quads_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008191,
        "dEQP-GLES31.functional.tessellation.invariance.t",
        "ess_coord_component_range.quads_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008192,
        "dEQP-GLES31.functional.tessellation.invariance.tess_c",
        "oord_component_range.quads_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008193,
        "dEQP-GLES31.functional.tessellation.invariance.tess_c",
        "oord_component_range.quads_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008194,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_",
        "component_range.quads_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008195,
        "dEQP-GLES31.functional.tessellation.invariance.tess_",
        "coord_component_range.quads_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008196,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_",
        "component_range.quads_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008197,
        "dEQP-GLES31.functional.tessellation.invariance.tess_c",
        "oord_component_range.quads_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008198,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_c",
        "omponent_range.quads_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008199,
        "dEQP-GLES31.functional.tessellation.invariance.tess_c",
        "oord_component_range.quads_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008200,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_",
        "component_range.quads_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008201,
        "dEQP-GLES31.functional.tessellation.invariance.tes",
        "s_coord_component_range.isolines_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008202,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coo",
        "rd_component_range.isolines_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008203,
        "dEQP-GLES31.functional.tessellation.invariance.te",
        "ss_coord_component_range.isolines_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008204,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coo",
        "rd_component_range.isolines_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008205,
        "dEQP-GLES31.functional.tessellation.invariance.tess_co",
        "ord_component_range.isolines_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008206,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_co",
        "mponent_range.isolines_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008207,
        "dEQP-GLES31.functional.tessellation.invariance.tess_co",
        "ord_component_range.isolines_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008208,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_c",
        "omponent_range.isolines_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008209,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coo",
        "rd_component_range.isolines_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008210,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_co",
        "mponent_range.isolines_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008211,
        "dEQP-GLES31.functional.tessellation.invariance.tess_co",
        "ord_component_range.isolines_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008212,
        "dEQP-GLES31.functional.tessellation.invariance.tess_coord_co",
        "mponent_range.isolines_fractional_even_spacing_cw_point_mode");
