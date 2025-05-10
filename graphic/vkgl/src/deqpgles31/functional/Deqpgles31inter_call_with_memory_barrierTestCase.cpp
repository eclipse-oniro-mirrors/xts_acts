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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016213,
        "dEQP-GLES31.functional.synchronization.inte",
        "r_call.with_memory_barrier.image_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016214,
        "dEQP-GLES31.functional.synchronization.inte",
        "r_call.with_memory_barrier.image_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016215,
        "dEQP-GLES31.functional.synchronization.int",
        "er_call.with_memory_barrier.image_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016216,
        "dEQP-GLES31.functional.synchronization.inter_ca",
        "ll.with_memory_barrier.image_multiple_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016217,
        "dEQP-GLES31.functional.synchronization.inter_call.wit",
        "h_memory_barrier.image_multiple_interleaved_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016218,
        "dEQP-GLES31.functional.synchronization.inter_call.with_m",
        "emory_barrier.image_multiple_unrelated_write_read_ordered");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016219,
        "dEQP-GLES31.functional.synchronization.inter_call.with_mem",
        "ory_barrier.image_multiple_unrelated_write_read_non_ordered");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016220,
        "dEQP-GLES31.functional.synchronization.inter_c",
        "all.with_memory_barrier.image_atomic_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016221,
        "dEQP-GLES31.functional.synchronization.inter_c",
        "all.with_memory_barrier.image_atomic_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016222,
        "dEQP-GLES31.functional.synchronization.inter_c",
        "all.with_memory_barrier.image_atomic_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016223,
        "dEQP-GLES31.functional.synchronization.inter_call.w",
        "ith_memory_barrier.image_atomic_multiple_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016224,
        "dEQP-GLES31.functional.synchronization.inter_call.with_me",
        "mory_barrier.image_atomic_multiple_interleaved_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016225,
        "dEQP-GLES31.functional.synchronization.inter_call.with_memor",
        "y_barrier.image_atomic_multiple_unrelated_write_read_ordered");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016226,
        "dEQP-GLES31.functional.synchronization.inter_call.with_memory_",
        "barrier.image_atomic_multiple_unrelated_write_read_non_ordered");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016227,
        "dEQP-GLES31.functional.synchronization.int",
        "er_call.with_memory_barrier.ssbo_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016228,
        "dEQP-GLES31.functional.synchronization.int",
        "er_call.with_memory_barrier.ssbo_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016229,
        "dEQP-GLES31.functional.synchronization.int",
        "er_call.with_memory_barrier.ssbo_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016230,
        "dEQP-GLES31.functional.synchronization.inter_ca",
        "ll.with_memory_barrier.ssbo_multiple_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016231,
        "dEQP-GLES31.functional.synchronization.inter_call.wit",
        "h_memory_barrier.ssbo_multiple_interleaved_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016232,
        "dEQP-GLES31.functional.synchronization.inter_call.with_m",
        "emory_barrier.ssbo_multiple_unrelated_write_read_ordered");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016233,
        "dEQP-GLES31.functional.synchronization.inter_call.with_mem",
        "ory_barrier.ssbo_multiple_unrelated_write_read_non_ordered");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016234,
        "dEQP-GLES31.functional.synchronization.inter_c",
        "all.with_memory_barrier.ssbo_atomic_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016235,
        "dEQP-GLES31.functional.synchronization.inter_c",
        "all.with_memory_barrier.ssbo_atomic_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016236,
        "dEQP-GLES31.functional.synchronization.inter_",
        "call.with_memory_barrier.ssbo_atomic_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016237,
        "dEQP-GLES31.functional.synchronization.inter_call.",
        "with_memory_barrier.ssbo_atomic_multiple_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016238,
        "dEQP-GLES31.functional.synchronization.inter_call.with_m",
        "emory_barrier.ssbo_atomic_multiple_interleaved_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016239,
        "dEQP-GLES31.functional.synchronization.inter_call.with_memo",
        "ry_barrier.ssbo_atomic_multiple_unrelated_write_read_ordered");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016240,
        "dEQP-GLES31.functional.synchronization.inter_call.with_memory",
        "_barrier.ssbo_atomic_multiple_unrelated_write_read_non_ordered");
