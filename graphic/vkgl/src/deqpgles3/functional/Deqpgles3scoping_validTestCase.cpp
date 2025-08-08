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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004926,
        "dEQP-GLES3.functional.shaders.scoping.valid",
        ".local_variable_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004927,
        "dEQP-GLES3.functional.shaders.scoping.valid.",
        "local_variable_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004928,
        "dEQP-GLES3.functional.shaders.scoping.valid",
        ".block_variable_hides_local_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004929,
        "dEQP-GLES3.functional.shaders.scoping.valid.",
        "block_variable_hides_local_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004930,
        "dEQP-GLES3.functional.shaders.scoping.valid",
        ".block_variable_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004931,
        "dEQP-GLES3.functional.shaders.scoping.valid.",
        "block_variable_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004932,
        "dEQP-GLES3.functional.shaders.scoping.valid.for_i",
        "nit_statement_variable_hides_local_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004933,
        "dEQP-GLES3.functional.shaders.scoping.valid.for_in",
        "it_statement_variable_hides_local_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004934,
        "dEQP-GLES3.functional.shaders.scoping.valid.whil",
        "e_condition_variable_hides_local_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004935,
        "dEQP-GLES3.functional.shaders.scoping.valid.while",
        "_condition_variable_hides_local_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004936,
        "dEQP-GLES3.functional.shaders.scoping.valid.for_in",
        "it_statement_variable_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004937,
        "dEQP-GLES3.functional.shaders.scoping.valid.for_ini",
        "t_statement_variable_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004938,
        "dEQP-GLES3.functional.shaders.scoping.valid.whil",
        "e_condition_variable_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004939,
        "dEQP-GLES3.functional.shaders.scoping.valid.while",
        "_condition_variable_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004940,
        "dEQP-GLES3.functional.shaders.scoping.valid",
        ".variable_in_if_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004941,
        "dEQP-GLES3.functional.shaders.scoping.valid.",
        "variable_in_if_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004942,
        "dEQP-GLES3.functional.shaders.scoping.valid.varia",
        "ble_from_outer_scope_visible_in_initializer_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004943,
        "dEQP-GLES3.functional.shaders.scoping.valid.variab",
        "le_from_outer_scope_visible_in_initializer_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004944,
        "dEQP-GLES3.functional.shaders.scoping.valid",
        ".local_int_variable_hides_struct_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004945,
        "dEQP-GLES3.functional.shaders.scoping.valid.",
        "local_int_variable_hides_struct_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004946,
        "dEQP-GLES3.functional.shaders.scoping.valid.l",
        "ocal_struct_variable_hides_struct_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004947,
        "dEQP-GLES3.functional.shaders.scoping.valid.lo",
        "cal_struct_variable_hides_struct_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004948,
        "dEQP-GLES3.functional.shaders.scoping.va",
        "lid.local_variable_hides_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004949,
        "dEQP-GLES3.functional.shaders.scoping.val",
        "id.local_variable_hides_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004950,
        "dEQP-GLES3.functional.shaders.scoping.valid.f",
        "unction_parameter_hides_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004951,
        "dEQP-GLES3.functional.shaders.scoping.valid.fu",
        "nction_parameter_hides_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004952,
        "dEQP-GLES3.functional.shaders.scoping.valid",
        ".function_parameter_hides_struct_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004953,
        "dEQP-GLES3.functional.shaders.scoping.valid.",
        "function_parameter_hides_struct_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004954,
        "dEQP-GLES3.functional.shaders.scoping.vali",
        "d.function_parameter_hides_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004955,
        "dEQP-GLES3.functional.shaders.scoping.valid",
        ".function_parameter_hides_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004956,
        "dEQP-GLES3.functional.shaders.scoping.valid.local_va",
        "riable_in_inner_scope_hides_function_parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004957,
        "dEQP-GLES3.functional.shaders.scoping.valid.local_var",
        "iable_in_inner_scope_hides_function_parameter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004958,
        "dEQP-GLES3.functional.shaders.scop",
        "ing.valid.redeclare_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004959,
        "dEQP-GLES3.functional.shaders.scopi",
        "ng.valid.redeclare_function_fragment");
