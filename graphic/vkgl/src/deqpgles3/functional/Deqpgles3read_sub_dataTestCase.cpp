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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000265,
        "dEQP-GLES3.functional.buffer",
        ".map.read.sub_data.array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000266,
        "dEQP-GLES3.functional.buffer.m",
        "ap.read.sub_data.array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000267,
        "dEQP-GLES3.functional.buffer.m",
        "ap.read.sub_data.copy_read_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000268,
        "dEQP-GLES3.functional.buffer.map",
        ".read.sub_data.copy_read_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000269,
        "dEQP-GLES3.functional.buffer.ma",
        "p.read.sub_data.copy_write_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000270,
        "dEQP-GLES3.functional.buffer.map",
        ".read.sub_data.copy_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000271,
        "dEQP-GLES3.functional.buffer.map",
        ".read.sub_data.element_array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000272,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.sub_data.element_array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000273,
        "dEQP-GLES3.functional.buffer.ma",
        "p.read.sub_data.pixel_pack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000274,
        "dEQP-GLES3.functional.buffer.map",
        ".read.sub_data.pixel_pack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000275,
        "dEQP-GLES3.functional.buffer.map",
        ".read.sub_data.pixel_unpack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000276,
        "dEQP-GLES3.functional.buffer.map.",
        "read.sub_data.pixel_unpack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000277,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.sub_data.transform_feedback_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000278,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.sub_data.transform_feedback_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000279,
        "dEQP-GLES3.functional.buffer.",
        "map.read.sub_data.uniform_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000280,
        "dEQP-GLES3.functional.buffer.ma",
        "p.read.sub_data.uniform_partial");
