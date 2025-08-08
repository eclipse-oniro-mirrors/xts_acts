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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012020,
        "dEQP-GLES31.functional.atomic_counter.",
        "inc_branch.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012021,
        "dEQP-GLES31.functional.atomic_counter.i",
        "nc_branch.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012022,
        "dEQP-GLES31.functional.atomic_counter",
        ".inc_branch.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012023,
        "dEQP-GLES31.functional.atomic_counter.",
        "inc_branch.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012024,
        "dEQP-GLES31.functional.atomic_counter.",
        "inc_branch.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012025,
        "dEQP-GLES31.functional.atomic_counter.i",
        "nc_branch.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012026,
        "dEQP-GLES31.functional.atomic_counter.",
        "inc_branch.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012027,
        "dEQP-GLES31.functional.atomic_counter.",
        "inc_branch.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012028,
        "dEQP-GLES31.functional.atomic_counter.i",
        "nc_branch.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012029,
        "dEQP-GLES31.functional.atomic_counter.i",
        "nc_branch.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012030,
        "dEQP-GLES31.functional.atomic_counter.in",
        "c_branch.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012031,
        "dEQP-GLES31.functional.atomic_counter.",
        "inc_branch.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012032,
        "dEQP-GLES31.functional.atomic_counter.",
        "inc_branch.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012033,
        "dEQP-GLES31.functional.atomic_counter.i",
        "nc_branch.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012034,
        "dEQP-GLES31.functional.atomic_counter.i",
        "nc_branch.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012035,
        "dEQP-GLES31.functional.atomic_counter.in",
        "c_branch.8_counters_100_calls_10_threads");
