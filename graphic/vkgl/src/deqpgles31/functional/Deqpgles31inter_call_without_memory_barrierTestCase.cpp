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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016241,
        "dEQP-GLES31.functional.synchronization.inter_call.without_",
        "memory_barrier.ssbo_atomic_dispatch_2_calls_1k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016242,
        "dEQP-GLES31.functional.synchronization.inter_call.without_",
        "memory_barrier.ssbo_atomic_dispatch_5_calls_1k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016243,
        "dEQP-GLES31.functional.synchronization.inter_call.without_m",
        "emory_barrier.ssbo_atomic_dispatch_100_calls_1k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016244,
        "dEQP-GLES31.functional.synchronization.inter_call.without_",
        "memory_barrier.ssbo_atomic_dispatch_2_calls_4k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016245,
        "dEQP-GLES31.functional.synchronization.inter_call.without_",
        "memory_barrier.ssbo_atomic_dispatch_5_calls_4k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016246,
        "dEQP-GLES31.functional.synchronization.inter_call.without_m",
        "emory_barrier.ssbo_atomic_dispatch_100_calls_4k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016247,
        "dEQP-GLES31.functional.synchronization.inter_call.without_",
        "memory_barrier.ssbo_atomic_dispatch_2_calls_32k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016248,
        "dEQP-GLES31.functional.synchronization.inter_call.without_",
        "memory_barrier.ssbo_atomic_dispatch_5_calls_32k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016249,
        "dEQP-GLES31.functional.synchronization.inter_call.without_m",
        "emory_barrier.ssbo_atomic_dispatch_100_calls_32k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016250,
        "dEQP-GLES31.functional.synchronization.inter_call.without_m",
        "emory_barrier.image_atomic_dispatch_2_calls_8x8_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016251,
        "dEQP-GLES31.functional.synchronization.inter_call.without_m",
        "emory_barrier.image_atomic_dispatch_5_calls_8x8_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016252,
        "dEQP-GLES31.functional.synchronization.inter_call.without_me",
        "mory_barrier.image_atomic_dispatch_100_calls_8x8_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016253,
        "dEQP-GLES31.functional.synchronization.inter_call.without_me",
        "mory_barrier.image_atomic_dispatch_2_calls_32x32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016254,
        "dEQP-GLES31.functional.synchronization.inter_call.without_me",
        "mory_barrier.image_atomic_dispatch_5_calls_32x32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016255,
        "dEQP-GLES31.functional.synchronization.inter_call.without_mem",
        "ory_barrier.image_atomic_dispatch_100_calls_32x32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016256,
        "dEQP-GLES31.functional.synchronization.inter_call.without_mem",
        "ory_barrier.image_atomic_dispatch_2_calls_128x128_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016257,
        "dEQP-GLES31.functional.synchronization.inter_call.without_mem",
        "ory_barrier.image_atomic_dispatch_5_calls_128x128_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016258,
        "dEQP-GLES31.functional.synchronization.inter_call.without_memo",
        "ry_barrier.image_atomic_dispatch_100_calls_128x128_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016259,
        "dEQP-GLES31.functional.synchronization.inter_call.without_m",
        "emory_barrier.atomic_counter_dispatch_2_calls_32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016260,
        "dEQP-GLES31.functional.synchronization.inter_call.without_m",
        "emory_barrier.atomic_counter_dispatch_5_calls_32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016261,
        "dEQP-GLES31.functional.synchronization.inter_call.without_me",
        "mory_barrier.atomic_counter_dispatch_100_calls_32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016262,
        "dEQP-GLES31.functional.synchronization.inter_call.without_me",
        "mory_barrier.atomic_counter_dispatch_2_calls_128_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016263,
        "dEQP-GLES31.functional.synchronization.inter_call.without_me",
        "mory_barrier.atomic_counter_dispatch_5_calls_128_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016264,
        "dEQP-GLES31.functional.synchronization.inter_call.without_mem",
        "ory_barrier.atomic_counter_dispatch_100_calls_128_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016265,
        "dEQP-GLES31.functional.synchronization.inter_call.without_m",
        "emory_barrier.atomic_counter_dispatch_2_calls_1k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016266,
        "dEQP-GLES31.functional.synchronization.inter_call.without_m",
        "emory_barrier.atomic_counter_dispatch_5_calls_1k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016267,
        "dEQP-GLES31.functional.synchronization.inter_call.without_me",
        "mory_barrier.atomic_counter_dispatch_100_calls_1k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016268,
        "dEQP-GLES31.functional.synchronization.inter_call.without_memory_",
        "barrier.ssbo_atomic_counter_mixed_dispatch_2_calls_32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016269,
        "dEQP-GLES31.functional.synchronization.inter_call.without_memory_",
        "barrier.ssbo_atomic_counter_mixed_dispatch_5_calls_32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016270,
        "dEQP-GLES31.functional.synchronization.inter_call.without_memory_b",
        "arrier.ssbo_atomic_counter_mixed_dispatch_100_calls_32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016271,
        "dEQP-GLES31.functional.synchronization.inter_call.without_memory_",
        "barrier.ssbo_atomic_counter_mixed_dispatch_2_calls_128_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016272,
        "dEQP-GLES31.functional.synchronization.inter_call.without_memory_",
        "barrier.ssbo_atomic_counter_mixed_dispatch_5_calls_128_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016273,
        "dEQP-GLES31.functional.synchronization.inter_call.without_memory_b",
        "arrier.ssbo_atomic_counter_mixed_dispatch_100_calls_128_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016274,
        "dEQP-GLES31.functional.synchronization.inter_call.without_memory_",
        "barrier.ssbo_atomic_counter_mixed_dispatch_2_calls_1k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016275,
        "dEQP-GLES31.functional.synchronization.inter_call.without_memory_",
        "barrier.ssbo_atomic_counter_mixed_dispatch_5_calls_1k_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016276,
        "dEQP-GLES31.functional.synchronization.inter_call.without_memory_b",
        "arrier.ssbo_atomic_counter_mixed_dispatch_100_calls_1k_invocations");
