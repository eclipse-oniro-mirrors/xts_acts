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

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002437,
        "dEQP-GLES2.functional.shaders.scoping.i",
        "nvalid.redeclare_global_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002438,
        "dEQP-GLES2.functional.shaders.scoping.in",
        "valid.redeclare_global_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002439,
        "dEQP-GLES2.functional.shaders.scoping.",
        "invalid.redeclare_local_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002440,
        "dEQP-GLES2.functional.shaders.scoping.i",
        "nvalid.redeclare_local_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002441,
        "dEQP-GLES2.functional.shaders.scoping.invalid",
        ".redeclare_for_init_statement_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002442,
        "dEQP-GLES2.functional.shaders.scoping.invalid.",
        "redeclare_for_init_statement_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002443,
        "dEQP-GLES2.functional.shaders.scoping.inva",
        "lid.redeclare_for_condition_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002444,
        "dEQP-GLES2.functional.shaders.scoping.inval",
        "id.redeclare_for_condition_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002445,
        "dEQP-GLES2.functional.shaders.scoping.invalid.redecla",
        "re_for_init_statement_variable_in_for_condition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002446,
        "dEQP-GLES2.functional.shaders.scoping.invalid.redeclar",
        "e_for_init_statement_variable_in_for_condition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002447,
        "dEQP-GLES2.functional.shaders.scoping.inval",
        "id.redeclare_while_condition_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002448,
        "dEQP-GLES2.functional.shaders.scoping.invali",
        "d.redeclare_while_condition_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002449,
        "dEQP-GLES2.functional.shaders.scopi",
        "ng.invalid.redefine_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002450,
        "dEQP-GLES2.functional.shaders.scopin",
        "g.invalid.redefine_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002451,
        "dEQP-GLES2.functional.shaders.scopi",
        "ng.invalid.redeclare_builtin_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002452,
        "dEQP-GLES2.functional.shaders.scopin",
        "g.invalid.redeclare_builtin_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002453,
        "dEQP-GLES2.functional.shaders.scoping.",
        "invalid.conflict_function_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002454,
        "dEQP-GLES2.functional.shaders.scoping.i",
        "nvalid.conflict_function_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002455,
        "dEQP-GLES2.functional.shaders.scoping.i",
        "nvalid.conflict_function_variable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002456,
        "dEQP-GLES2.functional.shaders.scoping.in",
        "valid.conflict_function_variable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002457,
        "dEQP-GLES2.functional.shaders.scoping.invalid",
        ".use_global_variable_before_declaration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002458,
        "dEQP-GLES2.functional.shaders.scoping.invalid.",
        "use_global_variable_before_declaration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002459,
        "dEQP-GLES2.functional.shaders.scoping.invalid",
        ".use_local_variable_before_declaration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002460,
        "dEQP-GLES2.functional.shaders.scoping.invalid.",
        "use_local_variable_before_declaration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002461,
        "dEQP-GLES2.functional.shaders.scoping.inval",
        "id.use_struct_type_before_declaration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002462,
        "dEQP-GLES2.functional.shaders.scoping.invali",
        "d.use_struct_type_before_declaration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002463,
        "dEQP-GLES2.functional.shaders.scoping.inva",
        "lid.use_function_before_declaration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002464,
        "dEQP-GLES2.functional.shaders.scoping.inval",
        "id.use_function_before_declaration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002465,
        "dEQP-GLES2.functional.shaders.scoping.invalid",
        ".use_variable_from_block_in_outer_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002466,
        "dEQP-GLES2.functional.shaders.scoping.invalid.",
        "use_variable_from_block_in_outer_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002467,
        "dEQP-GLES2.functional.shaders.scoping.invali",
        "d.use_variable_from_if_in_outer_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002468,
        "dEQP-GLES2.functional.shaders.scoping.invalid",
        ".use_variable_from_if_in_outer_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002469,
        "dEQP-GLES2.functional.shaders.scoping.invalid",
        ".use_variable_from_else_in_outer_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002470,
        "dEQP-GLES2.functional.shaders.scoping.invalid.",
        "use_variable_from_else_in_outer_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002471,
        "dEQP-GLES2.functional.shaders.scoping.in",
        "valid.use_variable_from_if_in_else_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002472,
        "dEQP-GLES2.functional.shaders.scoping.inv",
        "alid.use_variable_from_if_in_else_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002473,
        "dEQP-GLES2.functional.shaders.scoping.invalid.use_va",
        "riable_from_for_init_statement_in_outer_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002474,
        "dEQP-GLES2.functional.shaders.scoping.invalid.use_var",
        "iable_from_for_init_statement_in_outer_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002475,
        "dEQP-GLES2.functional.shaders.scoping.invalid.use_",
        "variable_from_while_condition_in_outer_scope_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002476,
        "dEQP-GLES2.functional.shaders.scoping.invalid.use_v",
        "ariable_from_while_condition_in_outer_scope_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002477,
        "dEQP-GLES2.functional.shaders.scoping.invalid.use",
        "_parameter_names_from_function_declaration_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002478,
        "dEQP-GLES2.functional.shaders.scoping.invalid.use_",
        "parameter_names_from_function_declaration_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002479,
        "dEQP-GLES2.functional.shaders.scoping.invalid.",
        "variable_not_visible_in_own_initializer_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002480,
        "dEQP-GLES2.functional.shaders.scoping.invalid.v",
        "ariable_not_visible_in_own_initializer_fragment");
