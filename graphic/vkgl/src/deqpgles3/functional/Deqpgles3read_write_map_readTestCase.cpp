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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000545,
        "dEQP-GLES3.functional.buffer.ma",
        "p.read_write.map_read.array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000546,
        "dEQP-GLES3.functional.buffer.map.",
        "read_write.map_read.array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000547,
        "dEQP-GLES3.functional.buffer.map.",
        "read_write.map_read.copy_read_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000548,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad_write.map_read.copy_read_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000549,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead_write.map_read.copy_write_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000550,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad_write.map_read.copy_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000551,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad_write.map_read.element_array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000552,
        "dEQP-GLES3.functional.buffer.map.read",
        "_write.map_read.element_array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000553,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead_write.map_read.pixel_pack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000554,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad_write.map_read.pixel_pack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000555,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad_write.map_read.pixel_unpack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000556,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d_write.map_read.pixel_unpack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000557,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.map_read.transform_feedback_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000558,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.map_read.transform_feedback_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000559,
        "dEQP-GLES3.functional.buffer.map",
        ".read_write.map_read.uniform_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000560,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead_write.map_read.uniform_partial");
