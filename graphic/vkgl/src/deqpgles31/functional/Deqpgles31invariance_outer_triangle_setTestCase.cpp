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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008171,
        "dEQP-GLES31.functional.tessellation.invarian",
        "ce.outer_triangle_set.triangles_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008172,
        "dEQP-GLES31.functional.tessellation.invariance.ou",
        "ter_triangle_set.triangles_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008173,
        "dEQP-GLES31.functional.tessellation.invariance.ou",
        "ter_triangle_set.triangles_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008174,
        "dEQP-GLES31.functional.tessellation.invari",
        "ance.outer_triangle_set.quads_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008175,
        "dEQP-GLES31.functional.tessellation.invariance.",
        "outer_triangle_set.quads_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008176,
        "dEQP-GLES31.functional.tessellation.invariance.",
        "outer_triangle_set.quads_fractional_even_spacing");
