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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000090,
        "dEQP-GLES2.functional.buffer.",
        "write.partial_specify.whole_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000091,
        "dEQP-GLES2.functional.buffer.",
        "write.partial_specify.whole_2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000092,
        "dEQP-GLES2.functional.buffer.",
        "write.partial_specify.whole_3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000093,
        "dEQP-GLES2.functional.buffer.",
        "write.partial_specify.whole_4");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000094,
        "dEQP-GLES2.functional.buffer",
        ".write.partial_specify.low_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000095,
        "dEQP-GLES2.functional.buffer",
        ".write.partial_specify.low_2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000096,
        "dEQP-GLES2.functional.buffer",
        ".write.partial_specify.low_3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000097,
        "dEQP-GLES2.functional.buffer",
        ".write.partial_specify.high_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000098,
        "dEQP-GLES2.functional.buffer",
        ".write.partial_specify.high_2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000099,
        "dEQP-GLES2.functional.buffer",
        ".write.partial_specify.high_3");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000100,
        "dEQP-GLES2.functional.buffer.",
        "write.partial_specify.middle_1");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000101,
        "dEQP-GLES2.functional.buffer.",
        "write.partial_specify.middle_2");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000102,
        "dEQP-GLES2.functional.buffer.",
        "write.partial_specify.middle_3");
