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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033485,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_copy.stride0_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033486,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_copy.stride8_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033487,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride32_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033488,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride0_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033489,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride8_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033490,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.usages.dynamic_copy.stride32_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033491,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_copy.stride0_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033492,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_copy.stride8_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033493,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride32_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033494,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride0_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033495,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride8_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033496,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.usages.dynamic_copy.stride32_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033497,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_copy.stride0_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033498,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_copy.stride4_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033499,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride32_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033500,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride0_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033501,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride4_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033502,
        "dEQP-GLES3.functional.vertex_arrays.single_attri",
        "bute.usages.dynamic_copy.stride32_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033503,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_copy.stride0_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033504,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_copy.stride2_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033505,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_copy.stride17_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033506,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.dynamic_copy.stride32_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033507,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride0_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033508,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride2_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033509,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride17_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033510,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.dynamic_copy.stride32_byte_quads256");
