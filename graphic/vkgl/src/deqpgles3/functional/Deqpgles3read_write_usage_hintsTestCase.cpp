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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000593,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d_write.usage_hints.array_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000594,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d_write.usage_hints.array_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000595,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d_write.usage_hints.array_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000596,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d_write.usage_hints.array_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000597,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d_write.usage_hints.array_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000598,
        "dEQP-GLES3.functional.buffer.map.rea",
        "d_write.usage_hints.array_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000599,
        "dEQP-GLES3.functional.buffer.map.read",
        "_write.usage_hints.array_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000600,
        "dEQP-GLES3.functional.buffer.map.read",
        "_write.usage_hints.array_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000601,
        "dEQP-GLES3.functional.buffer.map.read",
        "_write.usage_hints.array_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000602,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.usage_hints.copy_read_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000603,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.usage_hints.copy_read_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000604,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.usage_hints.copy_read_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000605,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.usage_hints.copy_read_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000606,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.usage_hints.copy_read_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000607,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.usage_hints.copy_read_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000608,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_read_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000609,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_read_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000610,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_read_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000611,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_write_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000612,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_write_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000613,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_write_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000614,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_write_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000615,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000616,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_write_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000617,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_write_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000618,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000619,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.copy_write_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000620,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.element_array_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000621,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.element_array_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000622,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.element_array_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000623,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.element_array_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000624,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.element_array_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000625,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.element_array_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000626,
        "dEQP-GLES3.functional.buffer.map.read_wri",
        "te.usage_hints.element_array_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000627,
        "dEQP-GLES3.functional.buffer.map.read_wri",
        "te.usage_hints.element_array_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000628,
        "dEQP-GLES3.functional.buffer.map.read_wri",
        "te.usage_hints.element_array_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000629,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.pixel_pack_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000630,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.pixel_pack_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000631,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.pixel_pack_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000632,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.pixel_pack_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000633,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.pixel_pack_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000634,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.pixel_pack_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000635,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.pixel_pack_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000636,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.pixel_pack_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000637,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.usage_hints.pixel_pack_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000638,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.pixel_unpack_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000639,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.pixel_unpack_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000640,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.pixel_unpack_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000641,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.pixel_unpack_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000642,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.pixel_unpack_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000643,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.pixel_unpack_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000644,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.pixel_unpack_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000645,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.pixel_unpack_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000646,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.usage_hints.pixel_unpack_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000647,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".usage_hints.transform_feedback_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000648,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".usage_hints.transform_feedback_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000649,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".usage_hints.transform_feedback_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000650,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".usage_hints.transform_feedback_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000651,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".usage_hints.transform_feedback_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000652,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".usage_hints.transform_feedback_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000653,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".usage_hints.transform_feedback_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000654,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".usage_hints.transform_feedback_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000655,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".usage_hints.transform_feedback_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000656,
        "dEQP-GLES3.functional.buffer.map.read",
        "_write.usage_hints.uniform_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000657,
        "dEQP-GLES3.functional.buffer.map.read",
        "_write.usage_hints.uniform_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000658,
        "dEQP-GLES3.functional.buffer.map.read",
        "_write.usage_hints.uniform_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000659,
        "dEQP-GLES3.functional.buffer.map.read",
        "_write.usage_hints.uniform_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000660,
        "dEQP-GLES3.functional.buffer.map.read",
        "_write.usage_hints.uniform_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000661,
        "dEQP-GLES3.functional.buffer.map.read",
        "_write.usage_hints.uniform_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000662,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.usage_hints.uniform_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000663,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.usage_hints.uniform_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000664,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.usage_hints.uniform_dynamic_copy");
