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

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033695,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_0_float2_0_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033696,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_0_float2_0_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033697,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_0_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033698,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_0_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033699,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_0_float2_8_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033700,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_0_float2_8_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033701,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_8_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033702,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_8_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033703,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_17_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033704,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_17_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033705,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_17_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033706,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_17_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033707,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_32_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033708,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_32_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033709,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_32_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033710,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_32_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033711,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_8_float2_0_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033712,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_8_float2_0_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033713,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_0_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033714,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_0_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033715,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_8_float2_8_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033716,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_8_float2_8_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033717,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_8_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033718,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_8_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033719,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_17_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033720,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_17_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033721,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_17_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033722,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_17_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033723,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_32_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033724,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_32_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033725,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_32_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033726,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_32_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033727,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_0_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033728,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_0_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033729,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_0_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033730,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_0_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033731,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_8_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033732,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_8_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033733,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_8_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033734,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_8_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033735,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_17_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033736,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_17_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033737,
        "dEQP-GLES3.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_17_float2_17_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033738,
        "dEQP-GLES3.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_17_float2_17_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033739,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_32_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033740,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_32_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033741,
        "dEQP-GLES3.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_17_float2_32_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033742,
        "dEQP-GLES3.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_17_float2_32_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033743,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_0_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033744,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_0_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033745,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_0_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033746,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_0_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033747,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_8_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033748,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_8_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033749,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_8_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033750,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_8_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033751,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_17_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033752,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_17_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033753,
        "dEQP-GLES3.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_32_float2_17_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033754,
        "dEQP-GLES3.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_32_float2_17_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033755,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_32_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033756,
        "dEQP-GLES3.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_32_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033757,
        "dEQP-GLES3.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_32_float2_32_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033758,
        "dEQP-GLES3.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_32_float2_32_float2_32");
