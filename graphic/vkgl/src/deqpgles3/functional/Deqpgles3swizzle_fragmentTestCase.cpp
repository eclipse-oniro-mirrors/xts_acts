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
#include "../ActsDeqpgles30021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020644,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020645,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020646,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020647,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020648,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020649,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020650,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020651,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020652,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020653,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020654,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020655,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020656,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020657,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020658,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020659,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020660,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020661,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020662,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020663,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020664,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020665,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020666,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020667,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020668,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020669,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020670,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020671,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020672,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020673,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020674,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020675,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020676,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020677,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020678,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020679,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020680,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020681,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020682,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020683,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020684,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020685,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020686,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020687,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020688,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020689,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020690,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020691,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020692,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020693,
        "dEQP-GLES3.functional.shader",
        "s.random.swizzle.fragment.49");
