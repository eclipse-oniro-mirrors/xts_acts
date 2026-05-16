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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000281,
        "dEQP-GLES3.functional.buffer.",
        "map.read.map_write.array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000282,
        "dEQP-GLES3.functional.buffer.m",
        "ap.read.map_write.array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000283,
        "dEQP-GLES3.functional.buffer.ma",
        "p.read.map_write.copy_read_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000284,
        "dEQP-GLES3.functional.buffer.map",
        ".read.map_write.copy_read_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000285,
        "dEQP-GLES3.functional.buffer.ma",
        "p.read.map_write.copy_write_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000286,
        "dEQP-GLES3.functional.buffer.map.",
        "read.map_write.copy_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000287,
        "dEQP-GLES3.functional.buffer.map.",
        "read.map_write.element_array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000288,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.map_write.element_array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000289,
        "dEQP-GLES3.functional.buffer.ma",
        "p.read.map_write.pixel_pack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000290,
        "dEQP-GLES3.functional.buffer.map.",
        "read.map_write.pixel_pack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000291,
        "dEQP-GLES3.functional.buffer.map",
        ".read.map_write.pixel_unpack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000292,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.map_write.pixel_unpack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000293,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.map_write.transform_feedback_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000294,
        "dEQP-GLES3.functional.buffer.map.read",
        ".map_write.transform_feedback_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000295,
        "dEQP-GLES3.functional.buffer.m",
        "ap.read.map_write.uniform_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000296,
        "dEQP-GLES3.functional.buffer.ma",
        "p.read.map_write.uniform_partial");
