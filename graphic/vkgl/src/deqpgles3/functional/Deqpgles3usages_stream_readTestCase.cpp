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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033537,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride0_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033538,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride8_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033539,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride32_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033540,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride0_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033541,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride8_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033542,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride32_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033543,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride0_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033544,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride8_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033545,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride32_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033546,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride0_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033547,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride8_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033548,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride32_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033549,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride0_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033550,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride4_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033551,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride32_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033552,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride0_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033553,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride4_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033554,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride32_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033555,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.stream_read.stride0_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033556,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.stream_read.stride2_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033557,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride17_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033558,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride32_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033559,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride0_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033560,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_read.stride2_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033561,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride17_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033562,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_read.stride32_byte_quads256");
