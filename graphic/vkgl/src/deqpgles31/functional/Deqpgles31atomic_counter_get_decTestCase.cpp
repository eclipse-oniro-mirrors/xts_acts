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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012106,
        "dEQP-GLES31.functional.atomic_count",
        "er.get_dec.1_counter_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012107,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_dec.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012108,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_dec.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012109,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_dec.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012110,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_dec.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012111,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_dec.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012112,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_dec.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012113,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_dec.4_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012114,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_dec.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012115,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_dec.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012116,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_dec.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012117,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_dec.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012118,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_dec.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012119,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_dec.8_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012120,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_dec.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012121,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_dec.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012122,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_dec.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012123,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_dec.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012124,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_dec.8_counters_100_calls_10_threads");
