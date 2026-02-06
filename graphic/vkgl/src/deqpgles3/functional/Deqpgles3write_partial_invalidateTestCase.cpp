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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000505,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.partial_invalidate.array_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000506,
        "dEQP-GLES3.functional.buffer.map.write",
        ".partial_invalidate.array_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000507,
        "dEQP-GLES3.functional.buffer.map.write",
        ".partial_invalidate.copy_read_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000508,
        "dEQP-GLES3.functional.buffer.map.write.p",
        "artial_invalidate.copy_read_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000509,
        "dEQP-GLES3.functional.buffer.map.write.",
        "partial_invalidate.copy_write_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000510,
        "dEQP-GLES3.functional.buffer.map.write.pa",
        "rtial_invalidate.copy_write_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000511,
        "dEQP-GLES3.functional.buffer.map.write.p",
        "artial_invalidate.element_array_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000512,
        "dEQP-GLES3.functional.buffer.map.write.par",
        "tial_invalidate.element_array_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000513,
        "dEQP-GLES3.functional.buffer.map.write.",
        "partial_invalidate.pixel_pack_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000514,
        "dEQP-GLES3.functional.buffer.map.write.pa",
        "rtial_invalidate.pixel_pack_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000515,
        "dEQP-GLES3.functional.buffer.map.write.p",
        "artial_invalidate.pixel_unpack_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000516,
        "dEQP-GLES3.functional.buffer.map.write.par",
        "tial_invalidate.pixel_unpack_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000517,
        "dEQP-GLES3.functional.buffer.map.write.part",
        "ial_invalidate.transform_feedback_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000518,
        "dEQP-GLES3.functional.buffer.map.write.partia",
        "l_invalidate.transform_feedback_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000519,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.partial_invalidate.uniform_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000520,
        "dEQP-GLES3.functional.buffer.map.write.",
        "partial_invalidate.uniform_write_partial");
