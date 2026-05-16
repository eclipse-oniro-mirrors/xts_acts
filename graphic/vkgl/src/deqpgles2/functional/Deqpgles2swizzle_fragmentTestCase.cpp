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

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008982,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008983,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008984,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008985,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008986,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008987,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008988,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008989,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008990,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008991,
        "dEQP-GLES2.functional.shade",
        "rs.random.swizzle.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008992,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008993,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008994,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008995,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008996,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008997,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008998,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008999,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009000,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009001,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009002,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009003,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009004,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009005,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009006,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009007,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009008,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009009,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009010,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009011,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009012,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009013,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009014,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009015,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009016,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009017,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009018,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009019,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009020,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009021,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009022,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009023,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009024,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009025,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009026,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009027,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009028,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009029,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009030,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_009031,
        "dEQP-GLES2.functional.shader",
        "s.random.swizzle.fragment.49");
