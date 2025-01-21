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
#include "../ActsDeqpgles30034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033637,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.first.byte.first6_offset1_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033638,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first24_offset1_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033639,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first6_offset1_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033640,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first24_offset1_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033641,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first6_offset1_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033642,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first24_offset1_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033643,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first6_offset1_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033644,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first24_offset1_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033645,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first6_offset1_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033646,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first24_offset1_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033647,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first6_offset1_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033648,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first24_offset1_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033649,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first6_offset16_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033650,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first24_offset16_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033651,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first6_offset16_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033652,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first24_offset16_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033653,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first6_offset16_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033654,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first24_offset16_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033655,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first6_offset16_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033656,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first24_offset16_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033657,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first6_offset16_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033658,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.first.byte.first24_offset16_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033659,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first6_offset16_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033660,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.first.byte.first24_offset16_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033661,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first6_offset17_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033662,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first24_offset17_stride2_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033663,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first6_offset17_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033664,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first24_offset17_stride17_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033665,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.first.byte.first6_offset17_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033666,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first24_offset17_stride32_quads5");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033667,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first6_offset17_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033668,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first24_offset17_stride2_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033669,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first6_offset17_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033670,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.first.byte.first24_offset17_stride17_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033671,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.first.byte.first6_offset17_stride32_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033672,
        "dEQP-GLES3.functional.vertex_arrays.single_attrib",
        "ute.first.byte.first24_offset17_stride32_quads256");
