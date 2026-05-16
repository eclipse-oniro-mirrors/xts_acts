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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012071,
        "dEQP-GLES31.functional.atomic_count",
        "er.get_inc.1_counter_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012072,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_inc.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012073,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_inc.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012074,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_inc.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012075,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_inc.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012076,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_inc.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012077,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_inc.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012078,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_inc.4_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012079,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_inc.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012080,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_inc.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012081,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_inc.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012082,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_inc.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012083,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_inc.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012084,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_inc.8_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012085,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_inc.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012086,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get_inc.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012087,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_inc.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012088,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_inc.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012089,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_inc.8_counters_100_calls_10_threads");
