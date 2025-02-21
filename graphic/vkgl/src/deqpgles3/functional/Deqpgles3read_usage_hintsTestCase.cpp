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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000297,
        "dEQP-GLES3.functional.buffer.map.",
        "read.usage_hints.array_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000298,
        "dEQP-GLES3.functional.buffer.map.",
        "read.usage_hints.array_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000299,
        "dEQP-GLES3.functional.buffer.map.",
        "read.usage_hints.array_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000300,
        "dEQP-GLES3.functional.buffer.map.",
        "read.usage_hints.array_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000301,
        "dEQP-GLES3.functional.buffer.map.",
        "read.usage_hints.array_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000302,
        "dEQP-GLES3.functional.buffer.map.",
        "read.usage_hints.array_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000303,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.usage_hints.array_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000304,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.usage_hints.array_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000305,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.usage_hints.array_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000306,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.usage_hints.copy_read_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000307,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.usage_hints.copy_read_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000308,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.usage_hints.copy_read_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000309,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.usage_hints.copy_read_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000310,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.usage_hints.copy_read_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000311,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.usage_hints.copy_read_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000312,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_read_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000313,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_read_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000314,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_read_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000315,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_write_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000316,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_write_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000317,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_write_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000318,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_write_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000319,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000320,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_write_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000321,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_write_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000322,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000323,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.copy_write_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000324,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.element_array_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000325,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.element_array_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000326,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.element_array_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000327,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.element_array_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000328,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.element_array_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000329,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.element_array_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000330,
        "dEQP-GLES3.functional.buffer.map.read.",
        "usage_hints.element_array_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000331,
        "dEQP-GLES3.functional.buffer.map.read.",
        "usage_hints.element_array_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000332,
        "dEQP-GLES3.functional.buffer.map.read.",
        "usage_hints.element_array_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000333,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.pixel_pack_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000334,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.pixel_pack_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000335,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.pixel_pack_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000336,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.pixel_pack_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000337,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.pixel_pack_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000338,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.pixel_pack_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000339,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.pixel_pack_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000340,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.pixel_pack_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000341,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d.usage_hints.pixel_pack_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000342,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.pixel_unpack_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000343,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.pixel_unpack_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000344,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.pixel_unpack_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000345,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.pixel_unpack_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000346,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.pixel_unpack_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000347,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.pixel_unpack_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000348,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.pixel_unpack_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000349,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.pixel_unpack_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000350,
        "dEQP-GLES3.functional.buffer.map.read",
        ".usage_hints.pixel_unpack_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000351,
        "dEQP-GLES3.functional.buffer.map.read.us",
        "age_hints.transform_feedback_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000352,
        "dEQP-GLES3.functional.buffer.map.read.us",
        "age_hints.transform_feedback_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000353,
        "dEQP-GLES3.functional.buffer.map.read.us",
        "age_hints.transform_feedback_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000354,
        "dEQP-GLES3.functional.buffer.map.read.us",
        "age_hints.transform_feedback_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000355,
        "dEQP-GLES3.functional.buffer.map.read.us",
        "age_hints.transform_feedback_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000356,
        "dEQP-GLES3.functional.buffer.map.read.us",
        "age_hints.transform_feedback_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000357,
        "dEQP-GLES3.functional.buffer.map.read.us",
        "age_hints.transform_feedback_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000358,
        "dEQP-GLES3.functional.buffer.map.read.us",
        "age_hints.transform_feedback_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000359,
        "dEQP-GLES3.functional.buffer.map.read.us",
        "age_hints.transform_feedback_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000360,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.usage_hints.uniform_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000361,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.usage_hints.uniform_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000362,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.usage_hints.uniform_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000363,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.usage_hints.uniform_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000364,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.usage_hints.uniform_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000365,
        "dEQP-GLES3.functional.buffer.map.r",
        "ead.usage_hints.uniform_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000366,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.usage_hints.uniform_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000367,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.usage_hints.uniform_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000368,
        "dEQP-GLES3.functional.buffer.map.re",
        "ad.usage_hints.uniform_dynamic_copy");
