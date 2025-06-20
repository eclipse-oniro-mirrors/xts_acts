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
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015257,
        "dEQP-GLES2.functional.d",
        "epth_range.write.default");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015258,
        "dEQP-GLES2.functional.d",
        "epth_range.write.reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015259,
        "dEQP-GLES2.functional.dept",
        "h_range.write.zero_to_half");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015260,
        "dEQP-GLES2.functional.dep",
        "th_range.write.half_to_one");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015261,
        "dEQP-GLES2.functional.dept",
        "h_range.write.half_to_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015262,
        "dEQP-GLES2.functional.dep",
        "th_range.write.one_to_half");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015263,
        "dEQP-GLES2.functional.dept",
        "h_range.write.third_to_0_8");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015264,
        "dEQP-GLES2.functional.dept",
        "h_range.write.0_8_to_third");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015265,
        "dEQP-GLES2.functional.dept",
        "h_range.write.zero_to_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015266,
        "dEQP-GLES2.functional.dept",
        "h_range.write.half_to_half");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015267,
        "dEQP-GLES2.functional.dep",
        "th_range.write.one_to_one");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015268,
        "dEQP-GLES2.functional.dep",
        "th_range.write.clamp_near");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015269,
        "dEQP-GLES2.functional.de",
        "pth_range.write.clamp_far");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015270,
        "dEQP-GLES2.functional.dep",
        "th_range.write.clamp_both");
