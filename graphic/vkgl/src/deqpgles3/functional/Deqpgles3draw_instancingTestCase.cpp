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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30045TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044084,
        "dEQP-GLES3.functional.draw.instanc",
        "ing.draw_arrays_instanced_grid_2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044085,
        "dEQP-GLES3.functional.draw.instanc",
        "ing.draw_arrays_instanced_grid_5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044086,
        "dEQP-GLES3.functional.draw.instanci",
        "ng.draw_arrays_instanced_grid_10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044087,
        "dEQP-GLES3.functional.draw.instanci",
        "ng.draw_arrays_instanced_grid_32x32");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044088,
        "dEQP-GLES3.functional.draw.instancin",
        "g.draw_arrays_instanced_grid_100x100");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044089,
        "dEQP-GLES3.functional.draw.instanci",
        "ng.draw_elements_instanced_grid_2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044090,
        "dEQP-GLES3.functional.draw.instanci",
        "ng.draw_elements_instanced_grid_5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044091,
        "dEQP-GLES3.functional.draw.instancin",
        "g.draw_elements_instanced_grid_10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044092,
        "dEQP-GLES3.functional.draw.instancin",
        "g.draw_elements_instanced_grid_32x32");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044093,
        "dEQP-GLES3.functional.draw.instancing",
        ".draw_elements_instanced_grid_100x100");
