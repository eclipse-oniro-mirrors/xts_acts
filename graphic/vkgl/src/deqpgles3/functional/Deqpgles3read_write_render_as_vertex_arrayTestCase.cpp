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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000561,
        "dEQP-GLES3.functional.buffer.map.read_",
        "write.render_as_vertex_array.array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000562,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.render_as_vertex_array.array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000563,
        "dEQP-GLES3.functional.buffer.map.read_wr",
        "ite.render_as_vertex_array.copy_read_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000564,
        "dEQP-GLES3.functional.buffer.map.read_writ",
        "e.render_as_vertex_array.copy_read_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000565,
        "dEQP-GLES3.functional.buffer.map.read_wri",
        "te.render_as_vertex_array.copy_write_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000566,
        "dEQP-GLES3.functional.buffer.map.read_writ",
        "e.render_as_vertex_array.copy_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000567,
        "dEQP-GLES3.functional.buffer.map.read_writ",
        "e.render_as_vertex_array.element_array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000568,
        "dEQP-GLES3.functional.buffer.map.read_write.",
        "render_as_vertex_array.element_array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000569,
        "dEQP-GLES3.functional.buffer.map.read_wri",
        "te.render_as_vertex_array.pixel_pack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000570,
        "dEQP-GLES3.functional.buffer.map.read_writ",
        "e.render_as_vertex_array.pixel_pack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000571,
        "dEQP-GLES3.functional.buffer.map.read_writ",
        "e.render_as_vertex_array.pixel_unpack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000572,
        "dEQP-GLES3.functional.buffer.map.read_write",
        ".render_as_vertex_array.pixel_unpack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000573,
        "dEQP-GLES3.functional.buffer.map.read_write.r",
        "ender_as_vertex_array.transform_feedback_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000574,
        "dEQP-GLES3.functional.buffer.map.read_write.re",
        "nder_as_vertex_array.transform_feedback_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000575,
        "dEQP-GLES3.functional.buffer.map.read_w",
        "rite.render_as_vertex_array.uniform_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000576,
        "dEQP-GLES3.functional.buffer.map.read_wri",
        "te.render_as_vertex_array.uniform_partial");
