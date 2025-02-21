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

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015271,
        "dEQP-GLES2.functional.de",
        "pth_range.compare.default");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015272,
        "dEQP-GLES2.functional.de",
        "pth_range.compare.reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015273,
        "dEQP-GLES2.functional.depth",
        "_range.compare.zero_to_half");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015274,
        "dEQP-GLES2.functional.dept",
        "h_range.compare.half_to_one");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015275,
        "dEQP-GLES2.functional.depth",
        "_range.compare.half_to_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015276,
        "dEQP-GLES2.functional.dept",
        "h_range.compare.one_to_half");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015277,
        "dEQP-GLES2.functional.depth",
        "_range.compare.third_to_0_8");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015278,
        "dEQP-GLES2.functional.depth",
        "_range.compare.0_8_to_third");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015279,
        "dEQP-GLES2.functional.depth",
        "_range.compare.zero_to_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015280,
        "dEQP-GLES2.functional.depth",
        "_range.compare.half_to_half");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015281,
        "dEQP-GLES2.functional.dept",
        "h_range.compare.one_to_one");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015282,
        "dEQP-GLES2.functional.dept",
        "h_range.compare.clamp_near");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015283,
        "dEQP-GLES2.functional.dep",
        "th_range.compare.clamp_far");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015284,
        "dEQP-GLES2.functional.dept",
        "h_range.compare.clamp_both");
