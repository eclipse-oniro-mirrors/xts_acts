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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008165,
        "dEQP-GLES31.functional.tessellation.invarian",
        "ce.inner_triangle_set.triangles_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008166,
        "dEQP-GLES31.functional.tessellation.invariance.in",
        "ner_triangle_set.triangles_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008167,
        "dEQP-GLES31.functional.tessellation.invariance.in",
        "ner_triangle_set.triangles_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008168,
        "dEQP-GLES31.functional.tessellation.invari",
        "ance.inner_triangle_set.quads_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008169,
        "dEQP-GLES31.functional.tessellation.invariance.",
        "inner_triangle_set.quads_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008170,
        "dEQP-GLES31.functional.tessellation.invariance.",
        "inner_triangle_set.quads_fractional_even_spacing");
