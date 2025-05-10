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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012036,
        "dEQP-GLES31.functional.atomic_cou",
        "nter.dec.1_counter_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012037,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.dec.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012038,
        "dEQP-GLES31.functional.atomic_count",
        "er.dec.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012039,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.dec.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012040,
        "dEQP-GLES31.functional.atomic_count",
        "er.dec.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012041,
        "dEQP-GLES31.functional.atomic_count",
        "er.dec.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012042,
        "dEQP-GLES31.functional.atomic_counte",
        "r.dec.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012043,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.dec.4_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012044,
        "dEQP-GLES31.functional.atomic_count",
        "er.dec.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012045,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.dec.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012046,
        "dEQP-GLES31.functional.atomic_count",
        "er.dec.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012047,
        "dEQP-GLES31.functional.atomic_count",
        "er.dec.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012048,
        "dEQP-GLES31.functional.atomic_counte",
        "r.dec.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012049,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.dec.8_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012050,
        "dEQP-GLES31.functional.atomic_count",
        "er.dec.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012051,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.dec.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012052,
        "dEQP-GLES31.functional.atomic_count",
        "er.dec.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012053,
        "dEQP-GLES31.functional.atomic_count",
        "er.dec.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012054,
        "dEQP-GLES31.functional.atomic_counte",
        "r.dec.8_counters_100_calls_10_threads");
