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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012160,
        "dEQP-GLES31.functional.atomic_counter.in",
        "c_dec_branch.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012161,
        "dEQP-GLES31.functional.atomic_counter.inc",
        "_dec_branch.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012162,
        "dEQP-GLES31.functional.atomic_counter.i",
        "nc_dec_branch.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012163,
        "dEQP-GLES31.functional.atomic_counter.in",
        "c_dec_branch.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012164,
        "dEQP-GLES31.functional.atomic_counter.in",
        "c_dec_branch.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012165,
        "dEQP-GLES31.functional.atomic_counter.inc",
        "_dec_branch.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012166,
        "dEQP-GLES31.functional.atomic_counter.in",
        "c_dec_branch.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012167,
        "dEQP-GLES31.functional.atomic_counter.in",
        "c_dec_branch.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012168,
        "dEQP-GLES31.functional.atomic_counter.inc",
        "_dec_branch.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012169,
        "dEQP-GLES31.functional.atomic_counter.inc",
        "_dec_branch.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012170,
        "dEQP-GLES31.functional.atomic_counter.inc_",
        "dec_branch.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012171,
        "dEQP-GLES31.functional.atomic_counter.in",
        "c_dec_branch.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012172,
        "dEQP-GLES31.functional.atomic_counter.in",
        "c_dec_branch.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012173,
        "dEQP-GLES31.functional.atomic_counter.inc",
        "_dec_branch.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012174,
        "dEQP-GLES31.functional.atomic_counter.inc",
        "_dec_branch.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012175,
        "dEQP-GLES31.functional.atomic_counter.inc_",
        "dec_branch.8_counters_100_calls_10_threads");
