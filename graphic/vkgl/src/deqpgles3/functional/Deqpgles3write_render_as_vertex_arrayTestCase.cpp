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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000385,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.render_as_vertex_array.array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000386,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.render_as_vertex_array.array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000387,
        "dEQP-GLES3.functional.buffer.map.write",
        ".render_as_vertex_array.copy_read_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000388,
        "dEQP-GLES3.functional.buffer.map.write.",
        "render_as_vertex_array.copy_read_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000389,
        "dEQP-GLES3.functional.buffer.map.write",
        ".render_as_vertex_array.copy_write_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000390,
        "dEQP-GLES3.functional.buffer.map.write.r",
        "ender_as_vertex_array.copy_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000391,
        "dEQP-GLES3.functional.buffer.map.write.r",
        "ender_as_vertex_array.element_array_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000392,
        "dEQP-GLES3.functional.buffer.map.write.re",
        "nder_as_vertex_array.element_array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000393,
        "dEQP-GLES3.functional.buffer.map.write",
        ".render_as_vertex_array.pixel_pack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000394,
        "dEQP-GLES3.functional.buffer.map.write.r",
        "ender_as_vertex_array.pixel_pack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000395,
        "dEQP-GLES3.functional.buffer.map.write.",
        "render_as_vertex_array.pixel_unpack_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000396,
        "dEQP-GLES3.functional.buffer.map.write.re",
        "nder_as_vertex_array.pixel_unpack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000397,
        "dEQP-GLES3.functional.buffer.map.write.ren",
        "der_as_vertex_array.transform_feedback_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000398,
        "dEQP-GLES3.functional.buffer.map.write.rende",
        "r_as_vertex_array.transform_feedback_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000399,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.render_as_vertex_array.uniform_full");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000400,
        "dEQP-GLES3.functional.buffer.map.write",
        ".render_as_vertex_array.uniform_partial");
