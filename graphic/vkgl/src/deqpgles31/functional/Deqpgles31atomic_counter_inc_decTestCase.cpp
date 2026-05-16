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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012141,
        "dEQP-GLES31.functional.atomic_count",
        "er.inc_dec.1_counter_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012142,
        "dEQP-GLES31.functional.atomic_counte",
        "r.inc_dec.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012143,
        "dEQP-GLES31.functional.atomic_counter",
        ".inc_dec.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012144,
        "dEQP-GLES31.functional.atomic_counte",
        "r.inc_dec.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012145,
        "dEQP-GLES31.functional.atomic_counter",
        ".inc_dec.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012146,
        "dEQP-GLES31.functional.atomic_counter",
        ".inc_dec.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012147,
        "dEQP-GLES31.functional.atomic_counter.",
        "inc_dec.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012148,
        "dEQP-GLES31.functional.atomic_counte",
        "r.inc_dec.4_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012149,
        "dEQP-GLES31.functional.atomic_counter",
        ".inc_dec.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012150,
        "dEQP-GLES31.functional.atomic_counte",
        "r.inc_dec.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012151,
        "dEQP-GLES31.functional.atomic_counter",
        ".inc_dec.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012152,
        "dEQP-GLES31.functional.atomic_counter",
        ".inc_dec.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012153,
        "dEQP-GLES31.functional.atomic_counter.",
        "inc_dec.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012154,
        "dEQP-GLES31.functional.atomic_counte",
        "r.inc_dec.8_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012155,
        "dEQP-GLES31.functional.atomic_counter",
        ".inc_dec.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012156,
        "dEQP-GLES31.functional.atomic_counte",
        "r.inc_dec.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012157,
        "dEQP-GLES31.functional.atomic_counter",
        ".inc_dec.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012158,
        "dEQP-GLES31.functional.atomic_counter",
        ".inc_dec.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012159,
        "dEQP-GLES31.functional.atomic_counter.",
        "inc_dec.8_counters_100_calls_10_threads");
