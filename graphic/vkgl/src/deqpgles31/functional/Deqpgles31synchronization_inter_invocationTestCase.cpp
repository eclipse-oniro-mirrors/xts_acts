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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016193,
        "dEQP-GLES31.functional.synchronizati",
        "on.inter_invocation.image_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016194,
        "dEQP-GLES31.functional.synchronizati",
        "on.inter_invocation.image_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016195,
        "dEQP-GLES31.functional.synchronizat",
        "ion.inter_invocation.image_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016196,
        "dEQP-GLES31.functional.synchronizati",
        "on.inter_invocation.image_alias_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016197,
        "dEQP-GLES31.functional.synchronization",
        ".inter_invocation.image_alias_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016198,
        "dEQP-GLES31.functional.synchronization.",
        "inter_invocation.image_atomic_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016199,
        "dEQP-GLES31.functional.synchronization.",
        "inter_invocation.image_atomic_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016200,
        "dEQP-GLES31.functional.synchronization.",
        "inter_invocation.image_atomic_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016201,
        "dEQP-GLES31.functional.synchronization.i",
        "nter_invocation.image_atomic_alias_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016202,
        "dEQP-GLES31.functional.synchronization.int",
        "er_invocation.image_atomic_alias_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016203,
        "dEQP-GLES31.functional.synchronizat",
        "ion.inter_invocation.ssbo_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016204,
        "dEQP-GLES31.functional.synchronizat",
        "ion.inter_invocation.ssbo_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016205,
        "dEQP-GLES31.functional.synchronizat",
        "ion.inter_invocation.ssbo_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016206,
        "dEQP-GLES31.functional.synchronizati",
        "on.inter_invocation.ssbo_alias_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016207,
        "dEQP-GLES31.functional.synchronization",
        ".inter_invocation.ssbo_alias_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016208,
        "dEQP-GLES31.functional.synchronization.",
        "inter_invocation.ssbo_atomic_write_read");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016209,
        "dEQP-GLES31.functional.synchronization.",
        "inter_invocation.ssbo_atomic_read_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016210,
        "dEQP-GLES31.functional.synchronization",
        ".inter_invocation.ssbo_atomic_overwrite");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016211,
        "dEQP-GLES31.functional.synchronization.",
        "inter_invocation.ssbo_atomic_alias_write");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016212,
        "dEQP-GLES31.functional.synchronization.in",
        "ter_invocation.ssbo_atomic_alias_overwrite");
