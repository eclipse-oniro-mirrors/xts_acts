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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033563,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_read.stride0_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033564,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_read.stride8_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033565,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride32_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033566,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride0_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033567,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride8_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033568,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.usages.dynamic_read.stride32_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033569,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_read.stride0_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033570,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_read.stride8_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033571,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride32_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033572,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride0_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033573,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride8_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033574,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.usages.dynamic_read.stride32_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033575,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_read.stride0_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033576,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_read.stride4_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033577,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride32_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033578,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride0_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033579,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride4_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033580,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.usages.dynamic_read.stride32_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033581,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_read.stride0_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033582,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_read.stride2_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033583,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_read.stride17_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033584,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_read.stride32_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033585,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride0_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033586,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride2_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033587,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride17_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033588,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_read.stride32_byte_quads256");
