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
#include "../ActsDeqpgles310012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011966,
        "dEQP-GLES31.functional.atomic_cou",
        "nter.get.1_counter_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011967,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.get.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011968,
        "dEQP-GLES31.functional.atomic_count",
        "er.get.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011969,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.get.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011970,
        "dEQP-GLES31.functional.atomic_count",
        "er.get.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011971,
        "dEQP-GLES31.functional.atomic_count",
        "er.get.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011972,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011973,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.get.4_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011974,
        "dEQP-GLES31.functional.atomic_count",
        "er.get.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011975,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.get.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011976,
        "dEQP-GLES31.functional.atomic_count",
        "er.get.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011977,
        "dEQP-GLES31.functional.atomic_count",
        "er.get.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011978,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011979,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.get.8_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011980,
        "dEQP-GLES31.functional.atomic_count",
        "er.get.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011981,
        "dEQP-GLES31.functional.atomic_coun",
        "ter.get.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011982,
        "dEQP-GLES31.functional.atomic_count",
        "er.get.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011983,
        "dEQP-GLES31.functional.atomic_count",
        "er.get.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011984,
        "dEQP-GLES31.functional.atomic_counte",
        "r.get.8_counters_100_calls_10_threads");
