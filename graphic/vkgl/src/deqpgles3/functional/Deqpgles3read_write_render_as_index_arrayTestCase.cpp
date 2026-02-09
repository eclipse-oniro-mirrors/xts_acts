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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000577,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.render_as_index_array.array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000578,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.render_as_index_array.array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000579,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.render_as_index_array.copy_read_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000580,
        "dEQP-GLES3.functional.buffer.map.read_wri",
        "te.render_as_index_array.copy_read_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000581,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.render_as_index_array.copy_write_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000582,
        "dEQP-GLES3.functional.buffer.map.read_writ",
        "e.render_as_index_array.copy_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000583,
        "dEQP-GLES3.functional.buffer.map.read_writ",
        "e.render_as_index_array.element_array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000584,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".render_as_index_array.element_array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000585,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.render_as_index_array.pixel_pack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000586,
        "dEQP-GLES3.functional.buffer.map.read_writ",
        "e.render_as_index_array.pixel_pack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000587,
        "dEQP-GLES3.functional.buffer.map.read_wri",
        "te.render_as_index_array.pixel_unpack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000588,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".render_as_index_array.pixel_unpack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000589,
        "dEQP-GLES3.functional.buffer.map.read_write.",
        "render_as_index_array.transform_feedback_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000590,
        "dEQP-GLES3.functional.buffer.map.read_write.re",
        "nder_as_index_array.transform_feedback_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000591,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.render_as_index_array.uniform_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000592,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.render_as_index_array.uniform_partial");
