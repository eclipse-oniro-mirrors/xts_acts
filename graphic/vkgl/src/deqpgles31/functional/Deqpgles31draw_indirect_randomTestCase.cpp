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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007862,
        "dEQP-GLES31.functional",
        ".draw_indirect.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007863,
        "dEQP-GLES31.functional",
        ".draw_indirect.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007864,
        "dEQP-GLES31.functional",
        ".draw_indirect.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007865,
        "dEQP-GLES31.functional",
        ".draw_indirect.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007866,
        "dEQP-GLES31.functional",
        ".draw_indirect.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007867,
        "dEQP-GLES31.functional",
        ".draw_indirect.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007868,
        "dEQP-GLES31.functional",
        ".draw_indirect.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007869,
        "dEQP-GLES31.functional",
        ".draw_indirect.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007870,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007871,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007872,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007873,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007874,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007875,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007876,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007877,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007878,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007879,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007880,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007881,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007882,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.24");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007883,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007884,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.27");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007885,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.28");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007886,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.29");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007887,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007888,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007889,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007890,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.35");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007891,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007892,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007893,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007894,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007895,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007896,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007897,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007898,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007899,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007900,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.46");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007901,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.47");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007902,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007903,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007904,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007905,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007906,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007907,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.53");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007908,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.54");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007909,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.55");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007910,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007911,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.57");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007912,
        "dEQP-GLES31.functional.",
        "draw_indirect.random.61");
