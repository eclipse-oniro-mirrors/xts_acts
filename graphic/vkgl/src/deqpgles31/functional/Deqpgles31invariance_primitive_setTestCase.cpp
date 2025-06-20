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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008057,
        "dEQP-GLES31.functional.tessellation.invarian",
        "ce.primitive_set.triangles_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008058,
        "dEQP-GLES31.functional.tessellation.invariance.pr",
        "imitive_set.triangles_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008059,
        "dEQP-GLES31.functional.tessellation.invaria",
        "nce.primitive_set.triangles_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008060,
        "dEQP-GLES31.functional.tessellation.invariance.pr",
        "imitive_set.triangles_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008061,
        "dEQP-GLES31.functional.tessellation.invariance.p",
        "rimitive_set.triangles_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008062,
        "dEQP-GLES31.functional.tessellation.invariance.primiti",
        "ve_set.triangles_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008063,
        "dEQP-GLES31.functional.tessellation.invariance.p",
        "rimitive_set.triangles_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008064,
        "dEQP-GLES31.functional.tessellation.invariance.primit",
        "ive_set.triangles_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008065,
        "dEQP-GLES31.functional.tessellation.invariance.pr",
        "imitive_set.triangles_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008066,
        "dEQP-GLES31.functional.tessellation.invariance.primiti",
        "ve_set.triangles_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008067,
        "dEQP-GLES31.functional.tessellation.invariance.p",
        "rimitive_set.triangles_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008068,
        "dEQP-GLES31.functional.tessellation.invariance.primiti",
        "ve_set.triangles_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008069,
        "dEQP-GLES31.functional.tessellation.invari",
        "ance.primitive_set.quads_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008070,
        "dEQP-GLES31.functional.tessellation.invariance.",
        "primitive_set.quads_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008071,
        "dEQP-GLES31.functional.tessellation.invar",
        "iance.primitive_set.quads_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008072,
        "dEQP-GLES31.functional.tessellation.invariance.",
        "primitive_set.quads_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008073,
        "dEQP-GLES31.functional.tessellation.invariance",
        ".primitive_set.quads_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008074,
        "dEQP-GLES31.functional.tessellation.invariance.primi",
        "tive_set.quads_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008075,
        "dEQP-GLES31.functional.tessellation.invariance",
        ".primitive_set.quads_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008076,
        "dEQP-GLES31.functional.tessellation.invariance.prim",
        "itive_set.quads_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008077,
        "dEQP-GLES31.functional.tessellation.invariance.",
        "primitive_set.quads_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008078,
        "dEQP-GLES31.functional.tessellation.invariance.primi",
        "tive_set.quads_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008079,
        "dEQP-GLES31.functional.tessellation.invariance",
        ".primitive_set.quads_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008080,
        "dEQP-GLES31.functional.tessellation.invariance.primi",
        "tive_set.quads_fractional_even_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008081,
        "dEQP-GLES31.functional.tessellation.invaria",
        "nce.primitive_set.isolines_equal_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008082,
        "dEQP-GLES31.functional.tessellation.invariance.pr",
        "imitive_set.isolines_equal_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008083,
        "dEQP-GLES31.functional.tessellation.invaria",
        "nce.primitive_set.isolines_equal_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008084,
        "dEQP-GLES31.functional.tessellation.invariance.p",
        "rimitive_set.isolines_equal_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008085,
        "dEQP-GLES31.functional.tessellation.invariance.p",
        "rimitive_set.isolines_fractional_odd_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008086,
        "dEQP-GLES31.functional.tessellation.invariance.primit",
        "ive_set.isolines_fractional_odd_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008087,
        "dEQP-GLES31.functional.tessellation.invariance.",
        "primitive_set.isolines_fractional_odd_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008088,
        "dEQP-GLES31.functional.tessellation.invariance.primit",
        "ive_set.isolines_fractional_odd_spacing_cw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008089,
        "dEQP-GLES31.functional.tessellation.invariance.p",
        "rimitive_set.isolines_fractional_even_spacing_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008090,
        "dEQP-GLES31.functional.tessellation.invariance.primiti",
        "ve_set.isolines_fractional_even_spacing_ccw_point_mode");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008091,
        "dEQP-GLES31.functional.tessellation.invariance.p",
        "rimitive_set.isolines_fractional_even_spacing_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008092,
        "dEQP-GLES31.functional.tessellation.invariance.primit",
        "ive_set.isolines_fractional_even_spacing_cw_point_mode");
