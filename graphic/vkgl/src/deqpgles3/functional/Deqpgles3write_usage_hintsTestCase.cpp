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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000417,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.usage_hints.array_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000418,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.usage_hints.array_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000419,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.usage_hints.array_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000420,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.usage_hints.array_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000421,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.usage_hints.array_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000422,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.usage_hints.array_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000423,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.usage_hints.array_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000424,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.usage_hints.array_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000425,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.usage_hints.array_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000426,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_read_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000427,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_read_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000428,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_read_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000429,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_read_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000430,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_read_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000431,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_read_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000432,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_read_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000433,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_read_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000434,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_read_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000435,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_write_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000436,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_write_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000437,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_write_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000438,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_write_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000439,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000440,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.copy_write_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000441,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.copy_write_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000442,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.copy_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000443,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.copy_write_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000444,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.element_array_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000445,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.element_array_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000446,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.element_array_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000447,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.element_array_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000448,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.element_array_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000449,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.element_array_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000450,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.element_array_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000451,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.element_array_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000452,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.element_array_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000453,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.pixel_pack_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000454,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.pixel_pack_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000455,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.pixel_pack_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000456,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.pixel_pack_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000457,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.pixel_pack_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000458,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.usage_hints.pixel_pack_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000459,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.pixel_pack_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000460,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.pixel_pack_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000461,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.pixel_pack_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000462,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.pixel_unpack_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000463,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.pixel_unpack_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000464,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.pixel_unpack_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000465,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.pixel_unpack_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000466,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.pixel_unpack_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000467,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.usage_hints.pixel_unpack_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000468,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.pixel_unpack_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000469,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.pixel_unpack_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000470,
        "dEQP-GLES3.functional.buffer.map.write",
        ".usage_hints.pixel_unpack_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000471,
        "dEQP-GLES3.functional.buffer.map.write.u",
        "sage_hints.transform_feedback_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000472,
        "dEQP-GLES3.functional.buffer.map.write.u",
        "sage_hints.transform_feedback_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000473,
        "dEQP-GLES3.functional.buffer.map.write.u",
        "sage_hints.transform_feedback_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000474,
        "dEQP-GLES3.functional.buffer.map.write.u",
        "sage_hints.transform_feedback_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000475,
        "dEQP-GLES3.functional.buffer.map.write.u",
        "sage_hints.transform_feedback_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000476,
        "dEQP-GLES3.functional.buffer.map.write.u",
        "sage_hints.transform_feedback_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000477,
        "dEQP-GLES3.functional.buffer.map.write.us",
        "age_hints.transform_feedback_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000478,
        "dEQP-GLES3.functional.buffer.map.write.us",
        "age_hints.transform_feedback_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000479,
        "dEQP-GLES3.functional.buffer.map.write.us",
        "age_hints.transform_feedback_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000480,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.usage_hints.uniform_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000481,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.usage_hints.uniform_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000482,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.usage_hints.uniform_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000483,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.usage_hints.uniform_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000484,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.usage_hints.uniform_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000485,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.usage_hints.uniform_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000486,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.usage_hints.uniform_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000487,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.usage_hints.uniform_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000488,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.usage_hints.uniform_dynamic_copy");
