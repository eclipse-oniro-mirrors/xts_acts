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

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012090,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_inc_branch.1_counter_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012091,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_inc_branch.1_counter_1_call_5000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012092,
        "dEQP-GLES31.functional.atomic_counter.g",
        "et_inc_branch.1_counter_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012093,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_inc_branch.1_counter_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012094,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_inc_branch.1_counter_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012095,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_inc_branch.1_counter_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012096,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_inc_branch.4_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012097,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_inc_branch.4_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012098,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_inc_branch.4_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012099,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_inc_branch.4_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012100,
        "dEQP-GLES31.functional.atomic_counter.get_",
        "inc_branch.4_counters_100_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012101,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_inc_branch.8_counters_1_call_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012102,
        "dEQP-GLES31.functional.atomic_counter.ge",
        "t_inc_branch.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012103,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_inc_branch.8_counters_5_calls_10_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012104,
        "dEQP-GLES31.functional.atomic_counter.get",
        "_inc_branch.8_counters_100_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012105,
        "dEQP-GLES31.functional.atomic_counter.get_",
        "inc_branch.8_counters_100_calls_10_threads");
