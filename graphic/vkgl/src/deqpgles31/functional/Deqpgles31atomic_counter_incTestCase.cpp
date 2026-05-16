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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012001,
        "dEQP-GLES31.functional.atomic_cou",
        "nter.inc.1_counter_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012002,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.inc.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012003,
        "dEQP-GLES31.functional.atomic_count",
        "er.inc.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012004,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.inc.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012005,
        "dEQP-GLES31.functional.atomic_count",
        "er.inc.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012006,
        "dEQP-GLES31.functional.atomic_count",
        "er.inc.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012007,
        "dEQP-GLES31.functional.atomic_counte",
        "r.inc.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012008,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.inc.4_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012009,
        "dEQP-GLES31.functional.atomic_count",
        "er.inc.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012010,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.inc.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012011,
        "dEQP-GLES31.functional.atomic_count",
        "er.inc.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012012,
        "dEQP-GLES31.functional.atomic_count",
        "er.inc.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012013,
        "dEQP-GLES31.functional.atomic_counte",
        "r.inc.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012014,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.inc.8_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012015,
        "dEQP-GLES31.functional.atomic_count",
        "er.inc.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012016,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.inc.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012017,
        "dEQP-GLES31.functional.atomic_count",
        "er.inc.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012018,
        "dEQP-GLES31.functional.atomic_count",
        "er.inc.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012019,
        "dEQP-GLES31.functional.atomic_counte",
        "r.inc.8_counters_100_calls_10_threads");
