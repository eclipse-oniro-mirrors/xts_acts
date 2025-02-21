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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033511,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride0_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033512,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride8_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033513,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride32_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033514,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride0_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033515,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride8_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033516,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride32_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033517,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride0_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033518,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride8_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033519,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride32_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033520,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride0_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033521,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride8_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033522,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride32_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033523,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride0_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033524,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride4_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033525,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride32_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033526,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride0_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033527,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride4_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033528,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride32_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033529,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.static_read.stride0_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033530,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.static_read.stride2_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033531,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride17_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033532,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride32_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033533,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride0_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033534,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.static_read.stride2_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033535,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride17_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033536,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.static_read.stride32_byte_quads256");
