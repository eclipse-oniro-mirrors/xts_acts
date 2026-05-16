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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008932,
        "dEQP-GLES2.functional.shad",
        "ers.random.swizzle.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008933,
        "dEQP-GLES2.functional.shad",
        "ers.random.swizzle.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008934,
        "dEQP-GLES2.functional.shad",
        "ers.random.swizzle.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008935,
        "dEQP-GLES2.functional.shad",
        "ers.random.swizzle.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008936,
        "dEQP-GLES2.functional.shad",
        "ers.random.swizzle.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008937,
        "dEQP-GLES2.functional.shad",
        "ers.random.swizzle.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008938,
        "dEQP-GLES2.functional.shad",
        "ers.random.swizzle.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008939,
        "dEQP-GLES2.functional.shad",
        "ers.random.swizzle.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008940,
        "dEQP-GLES2.functional.shad",
        "ers.random.swizzle.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008941,
        "dEQP-GLES2.functional.shad",
        "ers.random.swizzle.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008942,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008943,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008944,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008945,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008946,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008947,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008948,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008949,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008950,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008951,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008952,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008953,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008954,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008955,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008956,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008957,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008958,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008959,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008960,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008961,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008962,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008963,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008964,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008965,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008966,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008967,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008968,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008969,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008970,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008971,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008972,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008973,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008974,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008975,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008976,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008977,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008978,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008979,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008980,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008981,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.vertex.49");
