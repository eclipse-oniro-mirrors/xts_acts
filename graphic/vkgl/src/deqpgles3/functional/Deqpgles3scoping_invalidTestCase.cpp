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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004960,
        "dEQP-GLES3.functional.shaders.scoping.i",
        "nvalid.redeclare_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004961,
        "dEQP-GLES3.functional.shaders.scoping.in",
        "valid.redeclare_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004962,
        "dEQP-GLES3.functional.shaders.scoping.",
        "invalid.redeclare_local_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004963,
        "dEQP-GLES3.functional.shaders.scoping.i",
        "nvalid.redeclare_local_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004964,
        "dEQP-GLES3.functional.shaders.scoping.invalid",
        ".redeclare_for_init_statement_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004965,
        "dEQP-GLES3.functional.shaders.scoping.invalid.",
        "redeclare_for_init_statement_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004966,
        "dEQP-GLES3.functional.shaders.scoping.inva",
        "lid.redeclare_for_condition_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004967,
        "dEQP-GLES3.functional.shaders.scoping.inval",
        "id.redeclare_for_condition_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004968,
        "dEQP-GLES3.functional.shaders.scoping.invalid.redecla",
        "re_for_init_statement_variable_in_for_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004969,
        "dEQP-GLES3.functional.shaders.scoping.invalid.redeclar",
        "e_for_init_statement_variable_in_for_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004970,
        "dEQP-GLES3.functional.shaders.scoping.inval",
        "id.redeclare_while_condition_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004971,
        "dEQP-GLES3.functional.shaders.scoping.invali",
        "d.redeclare_while_condition_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004972,
        "dEQP-GLES3.functional.shaders.scopi",
        "ng.invalid.redefine_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004973,
        "dEQP-GLES3.functional.shaders.scopin",
        "g.invalid.redefine_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004974,
        "dEQP-GLES3.functional.shaders.scopi",
        "ng.invalid.redeclare_builtin_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004975,
        "dEQP-GLES3.functional.shaders.scopin",
        "g.invalid.redeclare_builtin_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004976,
        "dEQP-GLES3.functional.shaders.scop",
        "ing.invalid.redefine_builtin_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004977,
        "dEQP-GLES3.functional.shaders.scopi",
        "ng.invalid.redefine_builtin_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004978,
        "dEQP-GLES3.functional.shaders.scoping.",
        "invalid.conflict_function_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004979,
        "dEQP-GLES3.functional.shaders.scoping.i",
        "nvalid.conflict_function_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004980,
        "dEQP-GLES3.functional.shaders.scoping.i",
        "nvalid.conflict_function_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004981,
        "dEQP-GLES3.functional.shaders.scoping.in",
        "valid.conflict_function_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004982,
        "dEQP-GLES3.functional.shaders.scoping.invalid",
        ".use_global_variable_before_declaration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004983,
        "dEQP-GLES3.functional.shaders.scoping.invalid.",
        "use_global_variable_before_declaration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004984,
        "dEQP-GLES3.functional.shaders.scoping.invalid",
        ".use_local_variable_before_declaration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004985,
        "dEQP-GLES3.functional.shaders.scoping.invalid.",
        "use_local_variable_before_declaration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004986,
        "dEQP-GLES3.functional.shaders.scoping.inval",
        "id.use_struct_type_before_declaration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004987,
        "dEQP-GLES3.functional.shaders.scoping.invali",
        "d.use_struct_type_before_declaration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004988,
        "dEQP-GLES3.functional.shaders.scoping.inva",
        "lid.use_function_before_declaration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004989,
        "dEQP-GLES3.functional.shaders.scoping.inval",
        "id.use_function_before_declaration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004990,
        "dEQP-GLES3.functional.shaders.scoping.invalid",
        ".use_variable_from_block_in_outer_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004991,
        "dEQP-GLES3.functional.shaders.scoping.invalid.",
        "use_variable_from_block_in_outer_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004992,
        "dEQP-GLES3.functional.shaders.scoping.invali",
        "d.use_variable_from_if_in_outer_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004993,
        "dEQP-GLES3.functional.shaders.scoping.invalid",
        ".use_variable_from_if_in_outer_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004994,
        "dEQP-GLES3.functional.shaders.scoping.invalid",
        ".use_variable_from_else_in_outer_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004995,
        "dEQP-GLES3.functional.shaders.scoping.invalid.",
        "use_variable_from_else_in_outer_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004996,
        "dEQP-GLES3.functional.shaders.scoping.in",
        "valid.use_variable_from_if_in_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004997,
        "dEQP-GLES3.functional.shaders.scoping.inv",
        "alid.use_variable_from_if_in_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004998,
        "dEQP-GLES3.functional.shaders.scoping.invalid.use_va",
        "riable_from_for_init_statement_in_outer_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004999,
        "dEQP-GLES3.functional.shaders.scoping.invalid.use_var",
        "iable_from_for_init_statement_in_outer_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005000,
        "dEQP-GLES3.functional.shaders.scoping.invalid.use_",
        "variable_from_while_condition_in_outer_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005001,
        "dEQP-GLES3.functional.shaders.scoping.invalid.use_v",
        "ariable_from_while_condition_in_outer_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005002,
        "dEQP-GLES3.functional.shaders.scoping.invalid.use",
        "_parameter_names_from_function_declaration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005003,
        "dEQP-GLES3.functional.shaders.scoping.invalid.use_",
        "parameter_names_from_function_declaration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005004,
        "dEQP-GLES3.functional.shaders.scoping.invalid.",
        "variable_not_visible_in_own_initializer_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005005,
        "dEQP-GLES3.functional.shaders.scoping.invalid.v",
        "ariable_not_visible_in_own_initializer_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005006,
        "dEQP-GLES3.functional.shaders.scoping.invalid.",
        "local_variable_hides_function_parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_005007,
        "dEQP-GLES3.functional.shaders.scoping.invalid.l",
        "ocal_variable_hides_function_parameter_fragment");
