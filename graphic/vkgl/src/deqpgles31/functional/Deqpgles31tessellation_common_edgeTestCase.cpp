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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008007,
        "dEQP-GLES31.functional.tessellation",
        ".common_edge.triangles_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008008,
        "dEQP-GLES31.functional.tessellation.comm",
        "on_edge.triangles_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008009,
        "dEQP-GLES31.functional.tessellation.comm",
        "on_edge.triangles_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008010,
        "dEQP-GLES31.functional.tessellati",
        "on.common_edge.quads_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008011,
        "dEQP-GLES31.functional.tessellation.co",
        "mmon_edge.quads_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008012,
        "dEQP-GLES31.functional.tessellation.co",
        "mmon_edge.quads_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008013,
        "dEQP-GLES31.functional.tessellation.com",
        "mon_edge.triangles_equal_spacing_precise");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008014,
        "dEQP-GLES31.functional.tessellation.common_e",
        "dge.triangles_fractional_odd_spacing_precise");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008015,
        "dEQP-GLES31.functional.tessellation.common_e",
        "dge.triangles_fractional_even_spacing_precise");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008016,
        "dEQP-GLES31.functional.tessellation.c",
        "ommon_edge.quads_equal_spacing_precise");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008017,
        "dEQP-GLES31.functional.tessellation.common",
        "_edge.quads_fractional_odd_spacing_precise");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008018,
        "dEQP-GLES31.functional.tessellation.common",
        "_edge.quads_fractional_even_spacing_precise");
