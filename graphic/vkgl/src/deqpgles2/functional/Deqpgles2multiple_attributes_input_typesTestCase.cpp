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

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013465,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_fixed2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013466,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_fixed2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013467,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_fixed2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013468,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_fixed2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013469,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_fixed2_vec2_fixed2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013470,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013471,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_fixed2_vec2_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013472,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013473,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013474,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013475,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013476,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013477,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_fixed2_vec2_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013478,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013479,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_fixed2_vec2_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013480,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_unsigned_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013481,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_unsigned_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013482,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_unsigned_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013483,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_fixed2_vec2_unsigned_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013484,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_fixed2_vec2_unsigned_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013485,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_fixed2_vec2_unsigned_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013486,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_fixed2_vec2_unsigned_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013487,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_fixed2_vec2_unsigned_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013488,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_fixed2_vec2_unsigned_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013489,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_fixed2_vec2_unsigned_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013490,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_byte2_vec2_fixed2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013491,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_byte2_vec2_fixed2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013492,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_byte2_vec2_fixed2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013493,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_fixed2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013494,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_fixed2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013495,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_byte2_vec2_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013496,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_byte2_vec2_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013497,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_byte2_vec2_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013498,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes",
        ".input_types.3_byte2_vec2_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013499,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013500,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_byte2_vec2_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013501,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_byte2_vec2_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013502,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_byte2_vec2_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013503,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013504,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013505,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_unsigned_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013506,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes",
        ".input_types.3_byte2_vec2_unsigned_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013507,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_unsigned_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013508,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_byte2_vec2_unsigned_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013509,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_byte2_vec2_unsigned_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013510,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_unsigned_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013511,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_unsigned_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013512,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_byte2_vec2_unsigned_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013513,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_byte2_vec2_unsigned_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013514,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_byte2_vec2_unsigned_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013515,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_fixed2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013516,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_fixed2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013517,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_fixed2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013518,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_fixed2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013519,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_short2_vec2_fixed2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013520,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013521,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attrib",
        "utes.input_types.3_short2_vec2_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013522,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013523,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013524,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013525,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013526,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013527,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attribu",
        "tes.input_types.3_short2_vec2_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013528,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013529,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_short2_vec2_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013530,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_unsigned_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013531,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_unsigned_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013532,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_unsigned_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013533,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_short2_vec2_unsigned_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013534,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_short2_vec2_unsigned_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013535,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_short2_vec2_unsigned_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013536,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_short2_vec2_unsigned_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013537,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_short2_vec2_unsigned_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013538,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_short2_vec2_unsigned_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013539,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_short2_vec2_unsigned_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013540,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_fixed2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013541,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_fixed2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013542,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_fixed2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013543,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_fixed2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013544,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_byte2_vec2_fixed2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013545,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013546,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes",
        ".input_types.3_unsigned_byte2_vec2_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013547,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013548,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013549,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013550,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013551,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013552,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_byte2_vec2_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013553,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013554,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_byte2_vec2_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013555,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_unsigned_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013556,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_unsigned_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013557,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_unsigned_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013558,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input_ty",
        "pes.3_unsigned_byte2_vec2_unsigned_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013559,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_byte2_vec2_unsigned_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013560,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_byte2_vec2_unsigned_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013561,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_byte2_vec2_unsigned_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013562,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_byte2_vec2_unsigned_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013563,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_byte2_vec2_unsigned_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013564,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_byte2_vec2_unsigned_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013565,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_unsigned_short2_vec2_fixed2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013566,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_short2_vec2_fixed2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013567,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_unsigned_short2_vec2_fixed2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013568,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_fixed2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013569,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_fixed2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013570,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_short2_vec2_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013571,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_short2_vec2_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013572,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_short2_vec2_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013573,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_short2_vec2_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013574,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013575,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_unsigned_short2_vec2_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013576,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.",
        "input_types.3_unsigned_short2_vec2_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013577,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.i",
        "nput_types.3_unsigned_short2_vec2_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013578,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013579,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_short2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013580,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_unsigned_byte2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013581,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.inpu",
        "t_types.3_unsigned_short2_vec2_unsigned_byte2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013582,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_unsigned_byte2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013583,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_short2_vec2_unsigned_byte2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013584,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_short2_vec2_unsigned_byte2_vec2_unsigned_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013585,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_unsigned_short2_vec2_fixed2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013586,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_unsigned_short2_vec2_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013587,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input",
        "_types.3_unsigned_short2_vec2_unsigned_short2_vec2_short2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013588,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input_typ",
        "es.3_unsigned_short2_vec2_unsigned_short2_vec2_unsigned_byte2_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013589,
        "dEQP-GLES2.functional.vertex_arrays.multiple_attributes.input_type",
        "s.3_unsigned_short2_vec2_unsigned_short2_vec2_unsigned_short2_vec2");
