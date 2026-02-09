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
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043376,
        "dEQP-GLES3.functional.clipping",
        ".polygon_edge.quad_at_origin_0");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043377,
        "dEQP-GLES3.functional.clipping",
        ".polygon_edge.quad_at_origin_1");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043378,
        "dEQP-GLES3.functional.clipping",
        ".polygon_edge.quad_at_origin_2");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043379,
        "dEQP-GLES3.functional.clipping",
        ".polygon_edge.quad_at_origin_3");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043380,
        "dEQP-GLES3.functional.clipping",
        ".polygon_edge.quad_at_origin_4");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043381,
        "dEQP-GLES3.functional.clipping",
        ".polygon_edge.quad_near_edge_0");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043382,
        "dEQP-GLES3.functional.clipping",
        ".polygon_edge.quad_near_edge_1");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043383,
        "dEQP-GLES3.functional.clipping",
        ".polygon_edge.quad_near_edge_2");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043384,
        "dEQP-GLES3.functional.clip",
        "ping.polygon_edge.poly_fan");
