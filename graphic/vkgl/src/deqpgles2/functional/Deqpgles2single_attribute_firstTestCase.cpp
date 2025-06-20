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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013335,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.float_first6_offset16_stride8_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013336,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.float_first24_offset16_stride8_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013337,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.float_first6_offset16_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013338,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.float_first24_offset16_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013339,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.float_first6_offset16_stride8_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013340,
        "dEQP-GLES2.functional.vertex_arrays.single_attrib",
        "ute.first.float_first24_offset16_stride8_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013341,
        "dEQP-GLES2.functional.vertex_arrays.single_attrib",
        "ute.first.float_first6_offset16_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013342,
        "dEQP-GLES2.functional.vertex_arrays.single_attrib",
        "ute.first.float_first24_offset16_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013343,
        "dEQP-GLES2.functional.vertex_arrays.single_att",
        "ribute.first.byte_first6_offset1_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013344,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first24_offset1_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013345,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first6_offset1_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013346,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first24_offset1_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013347,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first6_offset1_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013348,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first24_offset1_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013349,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first6_offset1_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013350,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first24_offset1_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013351,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first6_offset1_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013352,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first24_offset1_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013353,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first6_offset1_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013354,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first24_offset1_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013355,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first6_offset16_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013356,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first24_offset16_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013357,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first6_offset16_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013358,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first24_offset16_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013359,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first6_offset16_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013360,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first24_offset16_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013361,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first6_offset16_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013362,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first24_offset16_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013363,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first6_offset16_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013364,
        "dEQP-GLES2.functional.vertex_arrays.single_attrib",
        "ute.first.byte_first24_offset16_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013365,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first6_offset16_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013366,
        "dEQP-GLES2.functional.vertex_arrays.single_attrib",
        "ute.first.byte_first24_offset16_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013367,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first6_offset17_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013368,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first24_offset17_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013369,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first6_offset17_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013370,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first24_offset17_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013371,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.byte_first6_offset17_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013372,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first24_offset17_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013373,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first6_offset17_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013374,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first24_offset17_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013375,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first6_offset17_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013376,
        "dEQP-GLES2.functional.vertex_arrays.single_attrib",
        "ute.first.byte_first24_offset17_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013377,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.byte_first6_offset17_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013378,
        "dEQP-GLES2.functional.vertex_arrays.single_attrib",
        "ute.first.byte_first24_offset17_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013379,
        "dEQP-GLES2.functional.vertex_arrays.single_attr",
        "ibute.first.fixed_first6_offset16_stride8_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013380,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.fixed_first24_offset16_stride8_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013381,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.fixed_first6_offset16_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013382,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.fixed_first24_offset16_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013383,
        "dEQP-GLES2.functional.vertex_arrays.single_attri",
        "bute.first.fixed_first6_offset16_stride8_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013384,
        "dEQP-GLES2.functional.vertex_arrays.single_attrib",
        "ute.first.fixed_first24_offset16_stride8_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013385,
        "dEQP-GLES2.functional.vertex_arrays.single_attrib",
        "ute.first.fixed_first6_offset16_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013386,
        "dEQP-GLES2.functional.vertex_arrays.single_attrib",
        "ute.first.fixed_first24_offset16_stride32_quads256");
