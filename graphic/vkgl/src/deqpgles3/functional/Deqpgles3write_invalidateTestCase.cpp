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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000489,
        "dEQP-GLES3.functional.buffer.map",
        ".write.invalidate.array_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000490,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.invalidate.array_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000491,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.invalidate.copy_read_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000492,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.invalidate.copy_read_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000493,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.invalidate.copy_write_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000494,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.invalidate.copy_write_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000495,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.invalidate.element_array_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000496,
        "dEQP-GLES3.functional.buffer.map.write",
        ".invalidate.element_array_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000497,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.invalidate.pixel_pack_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000498,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.invalidate.pixel_pack_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000499,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.invalidate.pixel_unpack_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000500,
        "dEQP-GLES3.functional.buffer.map.write",
        ".invalidate.pixel_unpack_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000501,
        "dEQP-GLES3.functional.buffer.map.write.",
        "invalidate.transform_feedback_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000502,
        "dEQP-GLES3.functional.buffer.map.write.in",
        "validate.transform_feedback_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000503,
        "dEQP-GLES3.functional.buffer.map.",
        "write.invalidate.uniform_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000504,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.invalidate.uniform_write_partial");
