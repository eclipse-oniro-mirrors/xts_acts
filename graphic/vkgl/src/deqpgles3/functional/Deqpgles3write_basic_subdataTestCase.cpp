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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000170,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic_subdata.array_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000171,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic_subdata.array_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000172,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic_subdata.array_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000173,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic_subdata.array_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000174,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic_subdata.array_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000175,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic_subdata.array_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000176,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic_subdata.array_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000177,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic_subdata.array_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000178,
        "dEQP-GLES3.functional.buffer.writ",
        "e.basic_subdata.array_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000179,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_read_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000180,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_read_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000181,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_read_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000182,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_read_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000183,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_read_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000184,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_read_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000185,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_read_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000186,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_read_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000187,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_read_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000188,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_write_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000189,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_write_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000190,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_write_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000191,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_write_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000192,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000193,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.copy_write_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000194,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.copy_write_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000195,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.copy_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000196,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.copy_write_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000197,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.element_array_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000198,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.element_array_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000199,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.element_array_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000200,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.element_array_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000201,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.element_array_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000202,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.element_array_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000203,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.element_array_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000204,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.element_array_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000205,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.element_array_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000206,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.pixel_pack_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000207,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.pixel_pack_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000208,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.pixel_pack_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000209,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.pixel_pack_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000210,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.pixel_pack_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000211,
        "dEQP-GLES3.functional.buffer.write.",
        "basic_subdata.pixel_pack_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000212,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.pixel_pack_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000213,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.pixel_pack_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000214,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.pixel_pack_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000215,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.pixel_unpack_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000216,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.pixel_unpack_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000217,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.pixel_unpack_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000218,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.pixel_unpack_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000219,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.pixel_unpack_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000220,
        "dEQP-GLES3.functional.buffer.write.b",
        "asic_subdata.pixel_unpack_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000221,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.pixel_unpack_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000222,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.pixel_unpack_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000223,
        "dEQP-GLES3.functional.buffer.write.ba",
        "sic_subdata.pixel_unpack_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000224,
        "dEQP-GLES3.functional.buffer.write.basi",
        "c_subdata.transform_feedback_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000225,
        "dEQP-GLES3.functional.buffer.write.basi",
        "c_subdata.transform_feedback_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000226,
        "dEQP-GLES3.functional.buffer.write.basi",
        "c_subdata.transform_feedback_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000227,
        "dEQP-GLES3.functional.buffer.write.basi",
        "c_subdata.transform_feedback_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000228,
        "dEQP-GLES3.functional.buffer.write.basi",
        "c_subdata.transform_feedback_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000229,
        "dEQP-GLES3.functional.buffer.write.basi",
        "c_subdata.transform_feedback_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000230,
        "dEQP-GLES3.functional.buffer.write.basic",
        "_subdata.transform_feedback_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000231,
        "dEQP-GLES3.functional.buffer.write.basic",
        "_subdata.transform_feedback_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000232,
        "dEQP-GLES3.functional.buffer.write.basic",
        "_subdata.transform_feedback_dynamic_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000233,
        "dEQP-GLES3.functional.buffer.write",
        ".basic_subdata.uniform_stream_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000234,
        "dEQP-GLES3.functional.buffer.write",
        ".basic_subdata.uniform_stream_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000235,
        "dEQP-GLES3.functional.buffer.write",
        ".basic_subdata.uniform_stream_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000236,
        "dEQP-GLES3.functional.buffer.write",
        ".basic_subdata.uniform_static_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000237,
        "dEQP-GLES3.functional.buffer.write",
        ".basic_subdata.uniform_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000238,
        "dEQP-GLES3.functional.buffer.write",
        ".basic_subdata.uniform_static_copy");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000239,
        "dEQP-GLES3.functional.buffer.write",
        ".basic_subdata.uniform_dynamic_draw");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000240,
        "dEQP-GLES3.functional.buffer.write",
        ".basic_subdata.uniform_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000241,
        "dEQP-GLES3.functional.buffer.write",
        ".basic_subdata.uniform_dynamic_copy");
