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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012055,
        "dEQP-GLES31.functional.atomic_counter.",
        "dec_branch.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012056,
        "dEQP-GLES31.functional.atomic_counter.d",
        "ec_branch.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012057,
        "dEQP-GLES31.functional.atomic_counter",
        ".dec_branch.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012058,
        "dEQP-GLES31.functional.atomic_counter.",
        "dec_branch.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012059,
        "dEQP-GLES31.functional.atomic_counter.",
        "dec_branch.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012060,
        "dEQP-GLES31.functional.atomic_counter.d",
        "ec_branch.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012061,
        "dEQP-GLES31.functional.atomic_counter.",
        "dec_branch.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012062,
        "dEQP-GLES31.functional.atomic_counter.",
        "dec_branch.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012063,
        "dEQP-GLES31.functional.atomic_counter.d",
        "ec_branch.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012064,
        "dEQP-GLES31.functional.atomic_counter.d",
        "ec_branch.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012065,
        "dEQP-GLES31.functional.atomic_counter.de",
        "c_branch.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012066,
        "dEQP-GLES31.functional.atomic_counter.",
        "dec_branch.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012067,
        "dEQP-GLES31.functional.atomic_counter.",
        "dec_branch.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012068,
        "dEQP-GLES31.functional.atomic_counter.d",
        "ec_branch.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012069,
        "dEQP-GLES31.functional.atomic_counter.d",
        "ec_branch.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012070,
        "dEQP-GLES31.functional.atomic_counter.de",
        "c_branch.8_counters_100_calls_10_threads");
