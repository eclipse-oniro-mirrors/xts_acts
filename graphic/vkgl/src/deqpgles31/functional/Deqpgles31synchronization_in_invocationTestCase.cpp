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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016173,
        "dEQP-GLES31.functional.synchroniza",
        "tion.in_invocation.image_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016174,
        "dEQP-GLES31.functional.synchroniza",
        "tion.in_invocation.image_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016175,
        "dEQP-GLES31.functional.synchroniza",
        "tion.in_invocation.image_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016176,
        "dEQP-GLES31.functional.synchronizat",
        "ion.in_invocation.image_alias_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016177,
        "dEQP-GLES31.functional.synchronizatio",
        "n.in_invocation.image_alias_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016178,
        "dEQP-GLES31.functional.synchronization",
        ".in_invocation.image_atomic_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016179,
        "dEQP-GLES31.functional.synchronization",
        ".in_invocation.image_atomic_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016180,
        "dEQP-GLES31.functional.synchronizatio",
        "n.in_invocation.image_atomic_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016181,
        "dEQP-GLES31.functional.synchronization",
        ".in_invocation.image_atomic_alias_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016182,
        "dEQP-GLES31.functional.synchronization.i",
        "n_invocation.image_atomic_alias_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016183,
        "dEQP-GLES31.functional.synchroniza",
        "tion.in_invocation.ssbo_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016184,
        "dEQP-GLES31.functional.synchroniza",
        "tion.in_invocation.ssbo_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016185,
        "dEQP-GLES31.functional.synchroniz",
        "ation.in_invocation.ssbo_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016186,
        "dEQP-GLES31.functional.synchroniza",
        "tion.in_invocation.ssbo_alias_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016187,
        "dEQP-GLES31.functional.synchronizati",
        "on.in_invocation.ssbo_alias_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016188,
        "dEQP-GLES31.functional.synchronizatio",
        "n.in_invocation.ssbo_atomic_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016189,
        "dEQP-GLES31.functional.synchronizatio",
        "n.in_invocation.ssbo_atomic_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016190,
        "dEQP-GLES31.functional.synchronizatio",
        "n.in_invocation.ssbo_atomic_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016191,
        "dEQP-GLES31.functional.synchronization",
        ".in_invocation.ssbo_atomic_alias_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016192,
        "dEQP-GLES31.functional.synchronization.i",
        "n_invocation.ssbo_atomic_alias_overwrite");
