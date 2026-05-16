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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000161,
        "dEQP-GLES3.functional.buffer.w",
        "rite.recreate_store.identical_1");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000162,
        "dEQP-GLES3.functional.buffer.w",
        "rite.recreate_store.identical_2");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000163,
        "dEQP-GLES3.functional.buffer.writ",
        "e.recreate_store.different_target");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000164,
        "dEQP-GLES3.functional.buffer.wri",
        "te.recreate_store.different_usage");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000165,
        "dEQP-GLES3.functional.buffer.wri",
        "te.recreate_store.different_size");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000166,
        "dEQP-GLES3.functional.buffer.",
        "write.recreate_store.random_1");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000167,
        "dEQP-GLES3.functional.buffer.",
        "write.recreate_store.random_2");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000168,
        "dEQP-GLES3.functional.buffer.",
        "write.recreate_store.random_3");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000169,
        "dEQP-GLES3.functional.buffer.",
        "write.recreate_store.random_4");
