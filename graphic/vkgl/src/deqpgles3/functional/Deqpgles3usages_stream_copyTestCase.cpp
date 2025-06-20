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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033459,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride0_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033460,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride8_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033461,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride32_float_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033462,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride0_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033463,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride8_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033464,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride32_float_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033465,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride0_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033466,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride8_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033467,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride32_fixed_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033468,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride0_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033469,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride8_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033470,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride32_fixed_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033471,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride0_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033472,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride4_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033473,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride32_short_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033474,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride0_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033475,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride4_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033476,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride32_short_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033477,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.stream_copy.stride0_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033478,
        "dEQP-GLES3.functional.vertex_arrays.single_at",
        "tribute.usages.stream_copy.stride2_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033479,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride17_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033480,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride32_byte_quads1");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033481,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride0_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033482,
        "dEQP-GLES3.functional.vertex_arrays.single_att",
        "ribute.usages.stream_copy.stride2_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033483,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride17_byte_quads256");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033484,
        "dEQP-GLES3.functional.vertex_arrays.single_attr",
        "ibute.usages.stream_copy.stride32_byte_quads256");
