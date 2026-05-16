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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000728,
        "dEQP-GLES3.functional.buffer.co",
        "py.single_buffer.array_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000729,
        "dEQP-GLES3.functional.buffer.cop",
        "y.single_buffer.array_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000730,
        "dEQP-GLES3.functional.buffer.copy",
        ".single_buffer.array_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000731,
        "dEQP-GLES3.functional.buffer.cop",
        "y.single_buffer.array_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000732,
        "dEQP-GLES3.functional.buffer.copy",
        ".single_buffer.array_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000733,
        "dEQP-GLES3.functional.buffer.copy.si",
        "ngle_buffer.array_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000734,
        "dEQP-GLES3.functional.buffer.c",
        "opy.single_buffer.array_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000735,
        "dEQP-GLES3.functional.buffer.co",
        "py.single_buffer.copy_read_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000736,
        "dEQP-GLES3.functional.buffer.copy.",
        "single_buffer.copy_read_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000737,
        "dEQP-GLES3.functional.buffer.copy.s",
        "ingle_buffer.copy_read_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000738,
        "dEQP-GLES3.functional.buffer.copy.",
        "single_buffer.copy_read_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000739,
        "dEQP-GLES3.functional.buffer.copy.s",
        "ingle_buffer.copy_read_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000740,
        "dEQP-GLES3.functional.buffer.copy.sing",
        "le_buffer.copy_read_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000741,
        "dEQP-GLES3.functional.buffer.cop",
        "y.single_buffer.copy_read_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000742,
        "dEQP-GLES3.functional.buffer.cop",
        "y.single_buffer.copy_write_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000743,
        "dEQP-GLES3.functional.buffer.copy.",
        "single_buffer.copy_write_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000744,
        "dEQP-GLES3.functional.buffer.copy.si",
        "ngle_buffer.copy_write_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000745,
        "dEQP-GLES3.functional.buffer.copy.",
        "single_buffer.copy_write_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000746,
        "dEQP-GLES3.functional.buffer.copy.s",
        "ingle_buffer.copy_write_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000747,
        "dEQP-GLES3.functional.buffer.copy.sing",
        "le_buffer.copy_write_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000748,
        "dEQP-GLES3.functional.buffer.copy",
        ".single_buffer.copy_write_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000749,
        "dEQP-GLES3.functional.buffer.copy",
        ".single_buffer.element_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000750,
        "dEQP-GLES3.functional.buffer.copy.s",
        "ingle_buffer.element_array_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000751,
        "dEQP-GLES3.functional.buffer.copy.si",
        "ngle_buffer.element_array_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000752,
        "dEQP-GLES3.functional.buffer.copy.si",
        "ngle_buffer.element_array_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000753,
        "dEQP-GLES3.functional.buffer.copy.sin",
        "gle_buffer.element_array_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000754,
        "dEQP-GLES3.functional.buffer.copy.single",
        "_buffer.element_array_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000755,
        "dEQP-GLES3.functional.buffer.copy.",
        "single_buffer.element_array_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000756,
        "dEQP-GLES3.functional.buffer.cop",
        "y.single_buffer.pixel_pack_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000757,
        "dEQP-GLES3.functional.buffer.copy.",
        "single_buffer.pixel_pack_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000758,
        "dEQP-GLES3.functional.buffer.copy.",
        "single_buffer.pixel_pack_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000759,
        "dEQP-GLES3.functional.buffer.copy.si",
        "ngle_buffer.pixel_pack_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000760,
        "dEQP-GLES3.functional.buffer.copy.s",
        "ingle_buffer.pixel_pack_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000761,
        "dEQP-GLES3.functional.buffer.copy.sing",
        "le_buffer.pixel_pack_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000762,
        "dEQP-GLES3.functional.buffer.copy",
        ".single_buffer.pixel_pack_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000763,
        "dEQP-GLES3.functional.buffer.copy",
        ".single_buffer.pixel_unpack_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000764,
        "dEQP-GLES3.functional.buffer.copy.s",
        "ingle_buffer.pixel_unpack_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000765,
        "dEQP-GLES3.functional.buffer.copy.s",
        "ingle_buffer.pixel_unpack_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000766,
        "dEQP-GLES3.functional.buffer.copy.sin",
        "gle_buffer.pixel_unpack_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000767,
        "dEQP-GLES3.functional.buffer.copy.s",
        "ingle_buffer.pixel_unpack_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000768,
        "dEQP-GLES3.functional.buffer.copy.singl",
        "e_buffer.pixel_unpack_transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000769,
        "dEQP-GLES3.functional.buffer.copy.",
        "single_buffer.pixel_unpack_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000770,
        "dEQP-GLES3.functional.buffer.copy.si",
        "ngle_buffer.transform_feedback_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000771,
        "dEQP-GLES3.functional.buffer.copy.sing",
        "le_buffer.transform_feedback_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000772,
        "dEQP-GLES3.functional.buffer.copy.sing",
        "le_buffer.transform_feedback_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000773,
        "dEQP-GLES3.functional.buffer.copy.single",
        "_buffer.transform_feedback_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000774,
        "dEQP-GLES3.functional.buffer.copy.sing",
        "le_buffer.transform_feedback_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000775,
        "dEQP-GLES3.functional.buffer.copy.singl",
        "e_buffer.transform_feedback_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000776,
        "dEQP-GLES3.functional.buffer.copy.sin",
        "gle_buffer.transform_feedback_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000777,
        "dEQP-GLES3.functional.buffer.c",
        "opy.single_buffer.uniform_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000778,
        "dEQP-GLES3.functional.buffer.cop",
        "y.single_buffer.uniform_copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000779,
        "dEQP-GLES3.functional.buffer.copy",
        ".single_buffer.uniform_copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000780,
        "dEQP-GLES3.functional.buffer.copy.",
        "single_buffer.uniform_element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000781,
        "dEQP-GLES3.functional.buffer.copy",
        ".single_buffer.uniform_pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000782,
        "dEQP-GLES3.functional.buffer.copy.",
        "single_buffer.uniform_pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000783,
        "dEQP-GLES3.functional.buffer.copy.sin",
        "gle_buffer.uniform_transform_feedback");
