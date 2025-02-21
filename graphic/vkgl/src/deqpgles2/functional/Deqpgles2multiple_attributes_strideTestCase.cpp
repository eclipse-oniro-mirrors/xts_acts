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

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013401,
        "dEQP-GLES2.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_0_float2_0_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013402,
        "dEQP-GLES2.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_0_float2_0_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013403,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_0_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013404,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_0_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013405,
        "dEQP-GLES2.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_0_float2_8_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013406,
        "dEQP-GLES2.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_0_float2_8_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013407,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_8_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013408,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_8_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013409,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_17_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013410,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_17_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013411,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_17_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013412,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_17_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013413,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_32_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013414,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_32_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013415,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_32_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013416,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_0_float2_32_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013417,
        "dEQP-GLES2.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_8_float2_0_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013418,
        "dEQP-GLES2.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_8_float2_0_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013419,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_0_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013420,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_0_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013421,
        "dEQP-GLES2.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_8_float2_8_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013422,
        "dEQP-GLES2.functional.vertex_arrays.multiple_",
        "attributes.stride.3_float2_8_float2_8_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013423,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_8_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013424,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_8_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013425,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_17_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013426,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_17_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013427,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_17_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013428,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_17_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013429,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_32_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013430,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_32_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013431,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_32_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013432,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_8_float2_32_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013433,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_0_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013434,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_0_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013435,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_0_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013436,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_0_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013437,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_8_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013438,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_8_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013439,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_8_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013440,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_8_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013441,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_17_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013442,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_17_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013443,
        "dEQP-GLES2.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_17_float2_17_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013444,
        "dEQP-GLES2.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_17_float2_17_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013445,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_32_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013446,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_17_float2_32_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013447,
        "dEQP-GLES2.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_17_float2_32_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013448,
        "dEQP-GLES2.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_17_float2_32_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013449,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_0_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013450,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_0_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013451,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_0_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013452,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_0_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013453,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_8_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013454,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_8_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013455,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_8_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013456,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_8_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013457,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_17_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013458,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_17_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013459,
        "dEQP-GLES2.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_32_float2_17_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013460,
        "dEQP-GLES2.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_32_float2_17_float2_32");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013461,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_32_float2_0");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013462,
        "dEQP-GLES2.functional.vertex_arrays.multiple_a",
        "ttributes.stride.3_float2_32_float2_32_float2_8");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013463,
        "dEQP-GLES2.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_32_float2_32_float2_17");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013464,
        "dEQP-GLES2.functional.vertex_arrays.multiple_at",
        "tributes.stride.3_float2_32_float2_32_float2_32");
