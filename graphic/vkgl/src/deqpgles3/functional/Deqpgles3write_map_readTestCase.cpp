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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000369,
        "dEQP-GLES3.functional.buffer.",
        "map.write.map_read.array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000370,
        "dEQP-GLES3.functional.buffer.m",
        "ap.write.map_read.array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000371,
        "dEQP-GLES3.functional.buffer.ma",
        "p.write.map_read.copy_read_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000372,
        "dEQP-GLES3.functional.buffer.map",
        ".write.map_read.copy_read_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000373,
        "dEQP-GLES3.functional.buffer.ma",
        "p.write.map_read.copy_write_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000374,
        "dEQP-GLES3.functional.buffer.map.",
        "write.map_read.copy_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000375,
        "dEQP-GLES3.functional.buffer.map.",
        "write.map_read.element_array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000376,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.map_read.element_array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000377,
        "dEQP-GLES3.functional.buffer.ma",
        "p.write.map_read.pixel_pack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000378,
        "dEQP-GLES3.functional.buffer.map.",
        "write.map_read.pixel_pack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000379,
        "dEQP-GLES3.functional.buffer.map",
        ".write.map_read.pixel_unpack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000380,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.map_read.pixel_unpack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000381,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.map_read.transform_feedback_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000382,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.map_read.transform_feedback_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000383,
        "dEQP-GLES3.functional.buffer.m",
        "ap.write.map_read.uniform_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000384,
        "dEQP-GLES3.functional.buffer.ma",
        "p.write.map_read.uniform_partial");
