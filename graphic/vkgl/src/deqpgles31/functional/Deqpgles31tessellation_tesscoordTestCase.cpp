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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007963,
        "dEQP-GLES31.functional.tessellatio",
        "n.tesscoord.triangles_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007964,
        "dEQP-GLES31.functional.tessellation.tes",
        "scoord.triangles_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007965,
        "dEQP-GLES31.functional.tessellation.tes",
        "scoord.triangles_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007966,
        "dEQP-GLES31.functional.tessellat",
        "ion.tesscoord.quads_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007967,
        "dEQP-GLES31.functional.tessellation.t",
        "esscoord.quads_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007968,
        "dEQP-GLES31.functional.tessellation.t",
        "esscoord.quads_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007969,
        "dEQP-GLES31.functional.tessellatio",
        "n.tesscoord.isolines_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007970,
        "dEQP-GLES31.functional.tessellation.te",
        "sscoord.isolines_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007971,
        "dEQP-GLES31.functional.tessellation.tes",
        "scoord.isolines_fractional_even_spacing");
