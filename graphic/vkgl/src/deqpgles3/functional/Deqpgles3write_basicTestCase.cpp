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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000089,
        "dEQP-GLES3.functional.buffer.",
        "write.basic.array_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000090,
        "dEQP-GLES3.functional.buffer.",
        "write.basic.array_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000091,
        "dEQP-GLES3.functional.buffer.",
        "write.basic.array_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000092,
        "dEQP-GLES3.functional.buffer.",
        "write.basic.array_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000093,
        "dEQP-GLES3.functional.buffer.",
        "write.basic.array_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000094,
        "dEQP-GLES3.functional.buffer.",
        "write.basic.array_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000095,
        "dEQP-GLES3.functional.buffer.",
        "write.basic.array_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000096,
        "dEQP-GLES3.functional.buffer.",
        "write.basic.array_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000097,
        "dEQP-GLES3.functional.buffer.",
        "write.basic.array_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000098,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_read_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000099,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_read_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000100,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_read_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000101,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_read_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000102,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_read_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000103,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_read_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000104,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_read_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000105,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_read_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000106,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_read_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000107,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_write_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000108,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_write_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000109,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_write_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000110,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_write_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000111,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000112,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.copy_write_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000113,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.copy_write_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000114,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.copy_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000115,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.copy_write_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000116,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.element_array_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000117,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.element_array_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000118,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.element_array_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000119,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.element_array_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000120,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.element_array_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000121,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.element_array_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000122,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.element_array_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000123,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.element_array_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000124,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.element_array_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000125,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.pixel_pack_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000126,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.pixel_pack_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000127,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.pixel_pack_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000128,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.pixel_pack_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000129,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.pixel_pack_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000130,
        "dEQP-GLES3.functional.buffer.wr",
        "ite.basic.pixel_pack_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000131,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.pixel_pack_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000132,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.pixel_pack_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000133,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.pixel_pack_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000134,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.pixel_unpack_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000135,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.pixel_unpack_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000136,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.pixel_unpack_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000137,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.pixel_unpack_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000138,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.pixel_unpack_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000139,
        "dEQP-GLES3.functional.buffer.wri",
        "te.basic.pixel_unpack_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000140,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.pixel_unpack_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000141,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.pixel_unpack_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000142,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic.pixel_unpack_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000143,
        "dEQP-GLES3.functional.buffer.write.",
        "basic.transform_feedback_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000144,
        "dEQP-GLES3.functional.buffer.write.",
        "basic.transform_feedback_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000145,
        "dEQP-GLES3.functional.buffer.write.",
        "basic.transform_feedback_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000146,
        "dEQP-GLES3.functional.buffer.write.",
        "basic.transform_feedback_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000147,
        "dEQP-GLES3.functional.buffer.write.",
        "basic.transform_feedback_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000148,
        "dEQP-GLES3.functional.buffer.write.",
        "basic.transform_feedback_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000149,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic.transform_feedback_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000150,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic.transform_feedback_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000151,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic.transform_feedback_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000152,
        "dEQP-GLES3.functional.buffer.w",
        "rite.basic.uniform_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000153,
        "dEQP-GLES3.functional.buffer.w",
        "rite.basic.uniform_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000154,
        "dEQP-GLES3.functional.buffer.w",
        "rite.basic.uniform_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000155,
        "dEQP-GLES3.functional.buffer.w",
        "rite.basic.uniform_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000156,
        "dEQP-GLES3.functional.buffer.w",
        "rite.basic.uniform_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000157,
        "dEQP-GLES3.functional.buffer.w",
        "rite.basic.uniform_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000158,
        "dEQP-GLES3.functional.buffer.w",
        "rite.basic.uniform_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000159,
        "dEQP-GLES3.functional.buffer.w",
        "rite.basic.uniform_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000160,
        "dEQP-GLES3.functional.buffer.w",
        "rite.basic.uniform_dynamic_copy");
