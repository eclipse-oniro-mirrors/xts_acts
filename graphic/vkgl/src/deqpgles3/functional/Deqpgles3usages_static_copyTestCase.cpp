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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033433,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride0_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033434,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride8_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033435,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride32_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033436,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride0_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033437,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride8_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033438,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride32_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033439,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride0_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033440,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride8_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033441,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride32_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033442,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride0_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033443,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride8_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033444,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride32_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033445,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride0_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033446,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride4_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033447,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride32_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033448,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride0_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033449,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride4_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033450,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride32_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033451,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.static_copy.stride0_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033452,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.static_copy.stride2_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033453,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride17_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033454,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride32_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033455,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride0_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033456,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_copy.stride2_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033457,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride17_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033458,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_copy.stride32_byte_quads256");
