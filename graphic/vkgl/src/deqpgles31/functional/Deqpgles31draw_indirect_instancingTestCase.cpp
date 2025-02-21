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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007773,
        "dEQP-GLES31.functional.draw_indirect.i",
        "nstancing.draw_arrays_indirect_grid_2x2");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007774,
        "dEQP-GLES31.functional.draw_indirect.i",
        "nstancing.draw_arrays_indirect_grid_5x5");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007775,
        "dEQP-GLES31.functional.draw_indirect.in",
        "stancing.draw_arrays_indirect_grid_10x10");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007776,
        "dEQP-GLES31.functional.draw_indirect.in",
        "stancing.draw_arrays_indirect_grid_32x32");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007777,
        "dEQP-GLES31.functional.draw_indirect.ins",
        "tancing.draw_arrays_indirect_grid_100x100");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007778,
        "dEQP-GLES31.functional.draw_indirect.in",
        "stancing.draw_elements_indirect_grid_2x2");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007779,
        "dEQP-GLES31.functional.draw_indirect.in",
        "stancing.draw_elements_indirect_grid_5x5");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007780,
        "dEQP-GLES31.functional.draw_indirect.ins",
        "tancing.draw_elements_indirect_grid_10x10");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007781,
        "dEQP-GLES31.functional.draw_indirect.ins",
        "tancing.draw_elements_indirect_grid_32x32");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007782,
        "dEQP-GLES31.functional.draw_indirect.inst",
        "ancing.draw_elements_indirect_grid_100x100");
