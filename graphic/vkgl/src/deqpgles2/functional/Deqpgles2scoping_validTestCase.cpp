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
#include "../ActsDeqpgles20003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002405,
        "dEQP-GLES2.functional.shaders.scoping.valid",
        ".local_variable_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002406,
        "dEQP-GLES2.functional.shaders.scoping.valid.",
        "local_variable_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002407,
        "dEQP-GLES2.functional.shaders.scoping.valid",
        ".block_variable_hides_local_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002408,
        "dEQP-GLES2.functional.shaders.scoping.valid.",
        "block_variable_hides_local_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002409,
        "dEQP-GLES2.functional.shaders.scoping.valid",
        ".block_variable_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002410,
        "dEQP-GLES2.functional.shaders.scoping.valid.",
        "block_variable_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002411,
        "dEQP-GLES2.functional.shaders.scoping.valid.for_i",
        "nit_statement_variable_hides_local_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002412,
        "dEQP-GLES2.functional.shaders.scoping.valid.for_in",
        "it_statement_variable_hides_local_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002413,
        "dEQP-GLES2.functional.shaders.scoping.valid.whil",
        "e_condition_variable_hides_local_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002414,
        "dEQP-GLES2.functional.shaders.scoping.valid.while",
        "_condition_variable_hides_local_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002415,
        "dEQP-GLES2.functional.shaders.scoping.valid.for_in",
        "it_statement_variable_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002416,
        "dEQP-GLES2.functional.shaders.scoping.valid.for_ini",
        "t_statement_variable_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002417,
        "dEQP-GLES2.functional.shaders.scoping.valid.whil",
        "e_condition_variable_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002418,
        "dEQP-GLES2.functional.shaders.scoping.valid.while",
        "_condition_variable_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002419,
        "dEQP-GLES2.functional.shaders.scoping.valid",
        ".variable_in_if_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002420,
        "dEQP-GLES2.functional.shaders.scoping.valid.",
        "variable_in_if_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002421,
        "dEQP-GLES2.functional.shaders.scoping.valid.varia",
        "ble_from_outer_scope_visible_in_initializer_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002422,
        "dEQP-GLES2.functional.shaders.scoping.valid.variab",
        "le_from_outer_scope_visible_in_initializer_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002423,
        "dEQP-GLES2.functional.shaders.scoping.valid",
        ".local_int_variable_hides_struct_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002424,
        "dEQP-GLES2.functional.shaders.scoping.valid.",
        "local_int_variable_hides_struct_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002425,
        "dEQP-GLES2.functional.shaders.scoping.valid.l",
        "ocal_struct_variable_hides_struct_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002426,
        "dEQP-GLES2.functional.shaders.scoping.valid.lo",
        "cal_struct_variable_hides_struct_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002427,
        "dEQP-GLES2.functional.shaders.scoping.va",
        "lid.local_variable_hides_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002428,
        "dEQP-GLES2.functional.shaders.scoping.val",
        "id.local_variable_hides_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002429,
        "dEQP-GLES2.functional.shaders.scoping.valid.f",
        "unction_parameter_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002430,
        "dEQP-GLES2.functional.shaders.scoping.valid.fu",
        "nction_parameter_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002431,
        "dEQP-GLES2.functional.shaders.scoping.valid",
        ".function_parameter_hides_struct_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002432,
        "dEQP-GLES2.functional.shaders.scoping.valid.",
        "function_parameter_hides_struct_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002433,
        "dEQP-GLES2.functional.shaders.scoping.vali",
        "d.function_parameter_hides_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002434,
        "dEQP-GLES2.functional.shaders.scoping.valid",
        ".function_parameter_hides_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002435,
        "dEQP-GLES2.functional.shaders.scoping.valid.local_va",
        "riable_in_inner_scope_hides_function_parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002436,
        "dEQP-GLES2.functional.shaders.scoping.valid.local_var",
        "iable_in_inner_scope_hides_function_parameter_fragment");
