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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012176,
        "dEQP-GLES31.functional.atomic_counter",
        ".get_inc_dec.1_counter_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012177,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_inc_dec.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012178,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_inc_dec.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012179,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_inc_dec.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012180,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_inc_dec.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012181,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_inc_dec.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012182,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_inc_dec.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012183,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_inc_dec.4_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012184,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_inc_dec.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012185,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_inc_dec.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012186,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_inc_dec.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012187,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_inc_dec.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012188,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_inc_dec.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012189,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_inc_dec.8_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012190,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_inc_dec.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012191,
        "dEQP-GLES31.functional.atomic_counter.",
        "get_inc_dec.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012192,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_inc_dec.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012193,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_inc_dec.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012194,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_inc_dec.8_counters_100_calls_10_threads");
