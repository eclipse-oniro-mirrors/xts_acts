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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000401,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.render_as_index_array.array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000402,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.render_as_index_array.array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000403,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.render_as_index_array.copy_read_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000404,
        "dEQP-GLES3.functional.buffer.map.write.",
        "render_as_index_array.copy_read_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000405,
        "dEQP-GLES3.functional.buffer.map.write",
        ".render_as_index_array.copy_write_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000406,
        "dEQP-GLES3.functional.buffer.map.write.",
        "render_as_index_array.copy_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000407,
        "dEQP-GLES3.functional.buffer.map.write.",
        "render_as_index_array.element_array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000408,
        "dEQP-GLES3.functional.buffer.map.write.re",
        "nder_as_index_array.element_array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000409,
        "dEQP-GLES3.functional.buffer.map.write",
        ".render_as_index_array.pixel_pack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000410,
        "dEQP-GLES3.functional.buffer.map.write.",
        "render_as_index_array.pixel_pack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000411,
        "dEQP-GLES3.functional.buffer.map.write.",
        "render_as_index_array.pixel_unpack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000412,
        "dEQP-GLES3.functional.buffer.map.write.r",
        "ender_as_index_array.pixel_unpack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000413,
        "dEQP-GLES3.functional.buffer.map.write.ren",
        "der_as_index_array.transform_feedback_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000414,
        "dEQP-GLES3.functional.buffer.map.write.rend",
        "er_as_index_array.transform_feedback_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000415,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.render_as_index_array.uniform_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000416,
        "dEQP-GLES3.functional.buffer.map.write",
        ".render_as_index_array.uniform_partial");
