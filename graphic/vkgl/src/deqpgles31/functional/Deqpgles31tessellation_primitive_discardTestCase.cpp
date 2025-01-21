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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008021,
        "dEQP-GLES31.functional.tessellation.prim",
        "itive_discard.triangles_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008022,
        "dEQP-GLES31.functional.tessellation.primitive_",
        "discard.triangles_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008023,
        "dEQP-GLES31.functional.tessellation.prim",
        "itive_discard.triangles_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008024,
        "dEQP-GLES31.functional.tessellation.primitive",
        "_discard.triangles_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008025,
        "dEQP-GLES31.functional.tessellation.primitive",
        "_discard.triangles_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008026,
        "dEQP-GLES31.functional.tessellation.primitive_disc",
        "ard.triangles_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008027,
        "dEQP-GLES31.functional.tessellation.primitiv",
        "e_discard.triangles_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008028,
        "dEQP-GLES31.functional.tessellation.primitive_disc",
        "ard.triangles_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008029,
        "dEQP-GLES31.functional.tessellation.primitive",
        "_discard.triangles_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008030,
        "dEQP-GLES31.functional.tessellation.primitive_disca",
        "rd.triangles_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008031,
        "dEQP-GLES31.functional.tessellation.primitive",
        "_discard.triangles_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008032,
        "dEQP-GLES31.functional.tessellation.primitive_disc",
        "ard.triangles_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008033,
        "dEQP-GLES31.functional.tessellation.pr",
        "imitive_discard.quads_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008034,
        "dEQP-GLES31.functional.tessellation.primitiv",
        "e_discard.quads_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008035,
        "dEQP-GLES31.functional.tessellation.pr",
        "imitive_discard.quads_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008036,
        "dEQP-GLES31.functional.tessellation.primiti",
        "ve_discard.quads_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008037,
        "dEQP-GLES31.functional.tessellation.primiti",
        "ve_discard.quads_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008038,
        "dEQP-GLES31.functional.tessellation.primitive_di",
        "scard.quads_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008039,
        "dEQP-GLES31.functional.tessellation.primit",
        "ive_discard.quads_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008040,
        "dEQP-GLES31.functional.tessellation.primitive_di",
        "scard.quads_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008041,
        "dEQP-GLES31.functional.tessellation.primiti",
        "ve_discard.quads_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008042,
        "dEQP-GLES31.functional.tessellation.primitive_dis",
        "card.quads_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008043,
        "dEQP-GLES31.functional.tessellation.primiti",
        "ve_discard.quads_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008044,
        "dEQP-GLES31.functional.tessellation.primitive_di",
        "scard.quads_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008045,
        "dEQP-GLES31.functional.tessellation.prim",
        "itive_discard.isolines_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008046,
        "dEQP-GLES31.functional.tessellation.primitive",
        "_discard.isolines_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008047,
        "dEQP-GLES31.functional.tessellation.pri",
        "mitive_discard.isolines_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008048,
        "dEQP-GLES31.functional.tessellation.primitive",
        "_discard.isolines_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008049,
        "dEQP-GLES31.functional.tessellation.primitiv",
        "e_discard.isolines_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008050,
        "dEQP-GLES31.functional.tessellation.primitive_disc",
        "ard.isolines_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008051,
        "dEQP-GLES31.functional.tessellation.primitiv",
        "e_discard.isolines_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008052,
        "dEQP-GLES31.functional.tessellation.primitive_dis",
        "card.isolines_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008053,
        "dEQP-GLES31.functional.tessellation.primitive",
        "_discard.isolines_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008054,
        "dEQP-GLES31.functional.tessellation.primitive_disc",
        "ard.isolines_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008055,
        "dEQP-GLES31.functional.tessellation.primitiv",
        "e_discard.isolines_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008056,
        "dEQP-GLES31.functional.tessellation.primitive_disc",
        "ard.isolines_fractional_even_spacing_cw_point_mode");
