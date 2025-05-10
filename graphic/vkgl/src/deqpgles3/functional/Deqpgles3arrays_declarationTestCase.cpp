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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004417,
        "dEQP-GLES3.functional.shaders.arrays.",
        "declaration.implicit_size_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004418,
        "dEQP-GLES3.functional.shaders.arrays.d",
        "eclaration.implicit_size_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004419,
        "dEQP-GLES3.functional.shaders.arrays",
        ".declaration.implicit_size_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004420,
        "dEQP-GLES3.functional.shaders.arrays.",
        "declaration.implicit_size_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004421,
        "dEQP-GLES3.functional.shaders.arrays.",
        "declaration.implicit_size_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004422,
        "dEQP-GLES3.functional.shaders.arrays.d",
        "eclaration.implicit_size_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004423,
        "dEQP-GLES3.functional.shaders.arrays.d",
        "eclaration.implicit_size_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004424,
        "dEQP-GLES3.functional.shaders.arrays.de",
        "claration.implicit_size_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004425,
        "dEQP-GLES3.functional.shaders.arrays.dec",
        "laration.implicit_size_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004426,
        "dEQP-GLES3.functional.shaders.arrays.decl",
        "aration.implicit_size_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004427,
        "dEQP-GLES3.functional.shaders.arrays.de",
        "claration.implicit_size_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004428,
        "dEQP-GLES3.functional.shaders.arrays.dec",
        "laration.implicit_size_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004429,
        "dEQP-GLES3.functional.shaders.arrays.dec",
        "laration.implicit_size_bool_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004430,
        "dEQP-GLES3.functional.shaders.arrays.decl",
        "aration.implicit_size_bool_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004431,
        "dEQP-GLES3.functional.shaders.arrays.dec",
        "laration.implicit_size_float_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004432,
        "dEQP-GLES3.functional.shaders.arrays.decl",
        "aration.implicit_size_float_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004433,
        "dEQP-GLES3.functional.shaders.arrays.de",
        "claration.implicit_size_int_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004434,
        "dEQP-GLES3.functional.shaders.arrays.dec",
        "laration.implicit_size_int_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004435,
        "dEQP-GLES3.functional.shaders.arrays.de",
        "claration.implicit_size_bool_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004436,
        "dEQP-GLES3.functional.shaders.arrays.dec",
        "laration.implicit_size_bool_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004437,
        "dEQP-GLES3.functional.shaders.arrays.declar",
        "ation.constant_expression_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004438,
        "dEQP-GLES3.functional.shaders.arrays.declara",
        "tion.constant_expression_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004439,
        "dEQP-GLES3.functional.shaders.arrays.declara",
        "tion.constant_expression_array_access_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004440,
        "dEQP-GLES3.functional.shaders.arrays.declarat",
        "ion.constant_expression_array_access_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004441,
        "dEQP-GLES3.functional.shaders.arrays.declar",
        "ation.dynamic_expression_array_access_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004442,
        "dEQP-GLES3.functional.shaders.arrays.declara",
        "tion.dynamic_expression_array_access_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004443,
        "dEQP-GLES3.functional.shaders.arrays.declaration.mu",
        "ltiple_declarations_single_statement_explicit_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004444,
        "dEQP-GLES3.functional.shaders.arrays.declaration.mul",
        "tiple_declarations_single_statement_explicit_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004445,
        "dEQP-GLES3.functional.shaders.arrays.declaration.mu",
        "ltiple_declarations_single_statement_implicit_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004446,
        "dEQP-GLES3.functional.shaders.arrays.declaration.mul",
        "tiple_declarations_single_statement_implicit_fragment");
