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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000721,
        "dEQP-GLES3.functional.bu",
        "ffer.copy.subrange.middle");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000722,
        "dEQP-GLES3.functional.buffer",
        ".copy.subrange.small_to_large");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000723,
        "dEQP-GLES3.functional.buffer",
        ".copy.subrange.large_to_small");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000724,
        "dEQP-GLES3.functional.buffer",
        ".copy.subrange.low_to_high_1");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000725,
        "dEQP-GLES3.functional.buffer",
        ".copy.subrange.low_to_high_2");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000726,
        "dEQP-GLES3.functional.buffer",
        ".copy.subrange.high_to_low_1");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000727,
        "dEQP-GLES3.functional.buffer",
        ".copy.subrange.high_to_low_2");
