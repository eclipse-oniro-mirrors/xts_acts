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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000074,
        "dEQP-GLES2.functional.buffer.w",
        "rite.recreate_store.identical_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000075,
        "dEQP-GLES2.functional.buffer.w",
        "rite.recreate_store.identical_2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000076,
        "dEQP-GLES2.functional.buffer.write",
        ".recreate_store.different_target_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000077,
        "dEQP-GLES2.functional.buffer.write",
        ".recreate_store.different_target_2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000078,
        "dEQP-GLES2.functional.buffer.wri",
        "te.recreate_store.different_usage");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000079,
        "dEQP-GLES2.functional.buffer.wri",
        "te.recreate_store.different_size");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000080,
        "dEQP-GLES2.functional.buffer.",
        "write.recreate_store.random_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000081,
        "dEQP-GLES2.functional.buffer.",
        "write.recreate_store.random_2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000082,
        "dEQP-GLES2.functional.buffer.",
        "write.recreate_store.random_3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000083,
        "dEQP-GLES2.functional.buffer.",
        "write.recreate_store.random_4");
