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
#include "../ActsDeqpgles310013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012125,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_dec_branch.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012126,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_dec_branch.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012127,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_dec_branch.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012128,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_dec_branch.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012129,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_dec_branch.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012130,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_dec_branch.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012131,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_dec_branch.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012132,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_dec_branch.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012133,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_dec_branch.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012134,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_dec_branch.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012135,
        "dEQP-GLES31.functional.atomic_counter.get_",
        "dec_branch.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012136,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_dec_branch.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012137,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_dec_branch.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012138,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_dec_branch.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012139,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_dec_branch.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012140,
        "dEQP-GLES31.functional.atomic_counter.get_",
        "dec_branch.8_counters_100_calls_10_threads");
