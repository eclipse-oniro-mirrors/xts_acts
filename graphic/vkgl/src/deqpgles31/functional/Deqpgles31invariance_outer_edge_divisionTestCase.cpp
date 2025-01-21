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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008093,
        "dEQP-GLES31.functional.tessellation.invarianc",
        "e.outer_edge_division.triangles_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008094,
        "dEQP-GLES31.functional.tessellation.invariance.ou",
        "ter_edge_division.triangles_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008095,
        "dEQP-GLES31.functional.tessellation.invariance.out",
        "er_edge_division.triangles_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008096,
        "dEQP-GLES31.functional.tessellation.invaria",
        "nce.outer_edge_division.quads_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008097,
        "dEQP-GLES31.functional.tessellation.invariance.",
        "outer_edge_division.quads_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008098,
        "dEQP-GLES31.functional.tessellation.invariance.o",
        "uter_edge_division.quads_fractional_even_spacing");
