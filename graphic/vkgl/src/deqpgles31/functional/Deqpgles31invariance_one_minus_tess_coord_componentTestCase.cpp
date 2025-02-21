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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008213,
        "dEQP-GLES31.functional.tessellation.invariance.one_m",
        "inus_tess_coord_component.triangles_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008214,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_t",
        "ess_coord_component.triangles_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008215,
        "dEQP-GLES31.functional.tessellation.invariance.one_m",
        "inus_tess_coord_component.triangles_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008216,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_",
        "tess_coord_component.triangles_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008217,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_",
        "tess_coord_component.triangles_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008218,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tess_",
        "coord_component.triangles_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008219,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus",
        "_tess_coord_component.triangles_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008220,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tess_",
        "coord_component.triangles_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008221,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_",
        "tess_coord_component.triangles_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008222,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tess_c",
        "oord_component.triangles_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008223,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_",
        "tess_coord_component.triangles_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008224,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tess_",
        "coord_component.triangles_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008225,
        "dEQP-GLES31.functional.tessellation.invariance.one",
        "_minus_tess_coord_component.quads_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008226,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus",
        "_tess_coord_component.quads_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008227,
        "dEQP-GLES31.functional.tessellation.invariance.one",
        "_minus_tess_coord_component.quads_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008228,
        "dEQP-GLES31.functional.tessellation.invariance.one_minu",
        "s_tess_coord_component.quads_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008229,
        "dEQP-GLES31.functional.tessellation.invariance.one_minu",
        "s_tess_coord_component.quads_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008230,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tes",
        "s_coord_component.quads_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008231,
        "dEQP-GLES31.functional.tessellation.invariance.one_min",
        "us_tess_coord_component.quads_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008232,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tes",
        "s_coord_component.quads_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008233,
        "dEQP-GLES31.functional.tessellation.invariance.one_minu",
        "s_tess_coord_component.quads_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008234,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tess",
        "_coord_component.quads_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008235,
        "dEQP-GLES31.functional.tessellation.invariance.one_minu",
        "s_tess_coord_component.quads_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008236,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tes",
        "s_coord_component.quads_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008237,
        "dEQP-GLES31.functional.tessellation.invariance.one_m",
        "inus_tess_coord_component.isolines_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008238,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_",
        "tess_coord_component.isolines_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008239,
        "dEQP-GLES31.functional.tessellation.invariance.one_",
        "minus_tess_coord_component.isolines_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008240,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_",
        "tess_coord_component.isolines_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008241,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus",
        "_tess_coord_component.isolines_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008242,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tess_",
        "coord_component.isolines_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008243,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus",
        "_tess_coord_component.isolines_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008244,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tess",
        "_coord_component.isolines_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008245,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_",
        "tess_coord_component.isolines_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008246,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tess_",
        "coord_component.isolines_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008247,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus",
        "_tess_coord_component.isolines_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008248,
        "dEQP-GLES31.functional.tessellation.invariance.one_minus_tess_",
        "coord_component.isolines_fractional_even_spacing_cw_point_mode");
