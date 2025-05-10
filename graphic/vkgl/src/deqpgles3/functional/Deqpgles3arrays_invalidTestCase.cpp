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
#include "../ActsDeqpgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004455,
        "dEQP-GLES3.functional.shaders.arrays.",
        "invalid.multidimensional_array1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004456,
        "dEQP-GLES3.functional.shaders.arrays.i",
        "nvalid.multidimensional_array1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004457,
        "dEQP-GLES3.functional.shaders.arrays.",
        "invalid.multidimensional_array2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004458,
        "dEQP-GLES3.functional.shaders.arrays.i",
        "nvalid.multidimensional_array2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004459,
        "dEQP-GLES3.functional.shaders.arrays.inva",
        "lid.multidimensional_uniform_array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004460,
        "dEQP-GLES3.functional.shaders.arrays.inval",
        "id.multidimensional_uniform_array_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004461,
        "dEQP-GLES3.functional.shaders.arrays.invalid.",
        "multidimensional_array_in_uniform_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004462,
        "dEQP-GLES3.functional.shaders.arrays.invalid.m",
        "ultidimensional_array_in_uniform_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004463,
        "dEQP-GLES3.functional.shaders.arrays.inv",
        "alid.dynamic_expression_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004464,
        "dEQP-GLES3.functional.shaders.arrays.inva",
        "lid.dynamic_expression_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004465,
        "dEQP-GLES3.functional.shaders.arrays.inva",
        "lid.empty_declaration_with_var_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004466,
        "dEQP-GLES3.functional.shaders.arrays.inval",
        "id.empty_declaration_with_var_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004467,
        "dEQP-GLES3.functional.shaders.arrays",
        ".invalid.constructor_c_style1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004468,
        "dEQP-GLES3.functional.shaders.arrays.",
        "invalid.constructor_c_style1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004469,
        "dEQP-GLES3.functional.shaders.arrays",
        ".invalid.constructor_c_style2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004470,
        "dEQP-GLES3.functional.shaders.arrays.",
        "invalid.constructor_c_style2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004471,
        "dEQP-GLES3.functional.shaders.arrays",
        ".invalid.constructor_c_style3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004472,
        "dEQP-GLES3.functional.shaders.arrays.",
        "invalid.constructor_c_style3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004473,
        "dEQP-GLES3.functional.shaders.arrays",
        ".invalid.constructor_c_style4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004474,
        "dEQP-GLES3.functional.shaders.arrays.",
        "invalid.constructor_c_style4_fragment");
