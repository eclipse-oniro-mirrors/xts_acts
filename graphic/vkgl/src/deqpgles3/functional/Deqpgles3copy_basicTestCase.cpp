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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000665,
        "dEQP-GLES3.functional.buffe",
        "r.copy.basic.array_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000666,
        "dEQP-GLES3.functional.buffer",
        ".copy.basic.array_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000667,
        "dEQP-GLES3.functional.buffer.",
        "copy.basic.array_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000668,
        "dEQP-GLES3.functional.buffer",
        ".copy.basic.array_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000669,
        "dEQP-GLES3.functional.buffer.",
        "copy.basic.array_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000670,
        "dEQP-GLES3.functional.buffer.cop",
        "y.basic.array_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000671,
        "dEQP-GLES3.functional.buff",
        "er.copy.basic.array_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000672,
        "dEQP-GLES3.functional.buffe",
        "r.copy.basic.copy_read_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000673,
        "dEQP-GLES3.functional.buffer.c",
        "opy.basic.copy_read_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000674,
        "dEQP-GLES3.functional.buffer.co",
        "py.basic.copy_read_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000675,
        "dEQP-GLES3.functional.buffer.c",
        "opy.basic.copy_read_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000676,
        "dEQP-GLES3.functional.buffer.co",
        "py.basic.copy_read_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000677,
        "dEQP-GLES3.functional.buffer.copy.",
        "basic.copy_read_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000678,
        "dEQP-GLES3.functional.buffer",
        ".copy.basic.copy_read_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000679,
        "dEQP-GLES3.functional.buffer",
        ".copy.basic.copy_write_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000680,
        "dEQP-GLES3.functional.buffer.c",
        "opy.basic.copy_write_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000681,
        "dEQP-GLES3.functional.buffer.cop",
        "y.basic.copy_write_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000682,
        "dEQP-GLES3.functional.buffer.c",
        "opy.basic.copy_write_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000683,
        "dEQP-GLES3.functional.buffer.co",
        "py.basic.copy_write_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000684,
        "dEQP-GLES3.functional.buffer.copy.",
        "basic.copy_write_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000685,
        "dEQP-GLES3.functional.buffer.",
        "copy.basic.copy_write_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000686,
        "dEQP-GLES3.functional.buffer.",
        "copy.basic.element_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000687,
        "dEQP-GLES3.functional.buffer.co",
        "py.basic.element_array_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000688,
        "dEQP-GLES3.functional.buffer.cop",
        "y.basic.element_array_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000689,
        "dEQP-GLES3.functional.buffer.cop",
        "y.basic.element_array_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000690,
        "dEQP-GLES3.functional.buffer.copy",
        ".basic.element_array_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000691,
        "dEQP-GLES3.functional.buffer.copy.ba",
        "sic.element_array_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000692,
        "dEQP-GLES3.functional.buffer.c",
        "opy.basic.element_array_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000693,
        "dEQP-GLES3.functional.buffer",
        ".copy.basic.pixel_pack_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000694,
        "dEQP-GLES3.functional.buffer.c",
        "opy.basic.pixel_pack_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000695,
        "dEQP-GLES3.functional.buffer.c",
        "opy.basic.pixel_pack_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000696,
        "dEQP-GLES3.functional.buffer.cop",
        "y.basic.pixel_pack_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000697,
        "dEQP-GLES3.functional.buffer.co",
        "py.basic.pixel_pack_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000698,
        "dEQP-GLES3.functional.buffer.copy.",
        "basic.pixel_pack_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000699,
        "dEQP-GLES3.functional.buffer.",
        "copy.basic.pixel_pack_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000700,
        "dEQP-GLES3.functional.buffer.",
        "copy.basic.pixel_unpack_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000701,
        "dEQP-GLES3.functional.buffer.co",
        "py.basic.pixel_unpack_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000702,
        "dEQP-GLES3.functional.buffer.co",
        "py.basic.pixel_unpack_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000703,
        "dEQP-GLES3.functional.buffer.copy",
        ".basic.pixel_unpack_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000704,
        "dEQP-GLES3.functional.buffer.co",
        "py.basic.pixel_unpack_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000705,
        "dEQP-GLES3.functional.buffer.copy.b",
        "asic.pixel_unpack_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000706,
        "dEQP-GLES3.functional.buffer.c",
        "opy.basic.pixel_unpack_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000707,
        "dEQP-GLES3.functional.buffer.cop",
        "y.basic.transform_feedback_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000708,
        "dEQP-GLES3.functional.buffer.copy.",
        "basic.transform_feedback_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000709,
        "dEQP-GLES3.functional.buffer.copy.",
        "basic.transform_feedback_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000710,
        "dEQP-GLES3.functional.buffer.copy.ba",
        "sic.transform_feedback_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000711,
        "dEQP-GLES3.functional.buffer.copy.",
        "basic.transform_feedback_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000712,
        "dEQP-GLES3.functional.buffer.copy.b",
        "asic.transform_feedback_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000713,
        "dEQP-GLES3.functional.buffer.copy",
        ".basic.transform_feedback_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000714,
        "dEQP-GLES3.functional.buff",
        "er.copy.basic.uniform_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000715,
        "dEQP-GLES3.functional.buffer",
        ".copy.basic.uniform_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000716,
        "dEQP-GLES3.functional.buffer.",
        "copy.basic.uniform_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000717,
        "dEQP-GLES3.functional.buffer.c",
        "opy.basic.uniform_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000718,
        "dEQP-GLES3.functional.buffer.",
        "copy.basic.uniform_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000719,
        "dEQP-GLES3.functional.buffer.c",
        "opy.basic.uniform_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000720,
        "dEQP-GLES3.functional.buffer.copy",
        ".basic.uniform_transform_feedback");
