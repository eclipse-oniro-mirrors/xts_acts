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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004237,
        "dEQP-GLES3.functional.shaders.func",
        "tions.invalid.break_in_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004238,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.break_in_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004239,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.continue_in_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004240,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.continue_in_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004241,
        "dEQP-GLES3.functional.shaders.functions.inv",
        "alid.return_value_from_void_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004242,
        "dEQP-GLES3.functional.shaders.functions.inva",
        "lid.return_value_from_void_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004243,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.extra_arguments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004244,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.extra_arguments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004245,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.missing_arguments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004246,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.invalid.missing_arguments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004247,
        "dEQP-GLES3.functional.shaders.function",
        "s.invalid.missing_argument_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004248,
        "dEQP-GLES3.functional.shaders.functions",
        ".invalid.missing_argument_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004249,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.argument_basetype_mismatch_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004250,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.argument_basetype_mismatch_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004251,
        "dEQP-GLES3.functional.shaders.functions.inv",
        "alid.argument_scalar_vector_mismatch_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004252,
        "dEQP-GLES3.functional.shaders.functions.inva",
        "lid.argument_scalar_vector_mismatch_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004253,
        "dEQP-GLES3.functional.shaders.functions.in",
        "valid.argument_vector_size_mismatch_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004254,
        "dEQP-GLES3.functional.shaders.functions.inv",
        "alid.argument_vector_size_mismatch_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004255,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.duplicate_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004256,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.invalid.duplicate_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004257,
        "dEQP-GLES3.functional.shaders.functions.in",
        "valid.prototype_mismatch_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004258,
        "dEQP-GLES3.functional.shaders.functions.inv",
        "alid.prototype_mismatch_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004259,
        "dEQP-GLES3.functional.shaders.functions.inv",
        "alid.prototype_unspecified_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004260,
        "dEQP-GLES3.functional.shaders.functions.inva",
        "lid.prototype_unspecified_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004261,
        "dEQP-GLES3.functional.shaders.functions.inva",
        "lid.call_mismatch_argument_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004262,
        "dEQP-GLES3.functional.shaders.functions.inval",
        "id.call_mismatch_argument_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004263,
        "dEQP-GLES3.functional.shaders.functions.inva",
        "lid.prototype_mismatch_argument_const_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004264,
        "dEQP-GLES3.functional.shaders.functions.inval",
        "id.prototype_mismatch_argument_const_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004265,
        "dEQP-GLES3.functional.shaders.functions.invalid",
        ".prototype_mismatch_argument_array_const_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004266,
        "dEQP-GLES3.functional.shaders.functions.invalid.",
        "prototype_mismatch_argument_array_const_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004267,
        "dEQP-GLES3.functional.shaders.functions.in",
        "valid.prototype_mismatch_array_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004268,
        "dEQP-GLES3.functional.shaders.functions.inv",
        "alid.prototype_mismatch_array_inout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004269,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.invalid.missing_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004270,
        "dEQP-GLES3.functional.shaders.function",
        "s.invalid.missing_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004271,
        "dEQP-GLES3.functional.shaders.function",
        "s.invalid.call_before_definition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004272,
        "dEQP-GLES3.functional.shaders.functions",
        ".invalid.call_before_definition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004273,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.argument_precision_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004274,
        "dEQP-GLES3.functional.shaders.functions.in",
        "valid.argument_precision_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004275,
        "dEQP-GLES3.functional.shaders.functions",
        ".invalid.argument_in_out_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004276,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.argument_in_out_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004277,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.argument_in_inout_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004278,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.argument_in_inout_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004279,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.argument_out_inout_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004280,
        "dEQP-GLES3.functional.shaders.functions.in",
        "valid.argument_out_inout_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004281,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.invalid.return_type_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004282,
        "dEQP-GLES3.functional.shaders.function",
        "s.invalid.return_type_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004283,
        "dEQP-GLES3.functional.shaders.functions.in",
        "valid.return_type_precision_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004284,
        "dEQP-GLES3.functional.shaders.functions.inv",
        "alid.return_type_precision_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004285,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.return_type_const_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004286,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.return_type_const_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004287,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.invalid.return_without_value_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004288,
        "dEQP-GLES3.functional.shaders.function",
        "s.invalid.return_without_value_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004289,
        "dEQP-GLES3.functional.shaders.functions",
        ".invalid.local_function_prototype_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004290,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.local_function_prototype_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004291,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.local_function_definition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004292,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.local_function_definition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004293,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.name_type_conflict_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004294,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.invalid.name_type_conflict_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004295,
        "dEQP-GLES3.functional.shaders.func",
        "tions.invalid.const_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004296,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.const_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004297,
        "dEQP-GLES3.functional.shaders.func",
        "tions.invalid.uniform_local_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004298,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.uniform_local_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004299,
        "dEQP-GLES3.functional.shaders.f",
        "unctions.invalid.in_local_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004300,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.invalid.in_local_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004301,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.invalid.out_local_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004302,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.invalid.out_local_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004303,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.invalid.inout_local_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004304,
        "dEQP-GLES3.functional.shaders.func",
        "tions.invalid.inout_local_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004305,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.uniform_argument_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004306,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.uniform_argument_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004307,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.invalid.uniform_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004308,
        "dEQP-GLES3.functional.shaders.function",
        "s.invalid.uniform_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004309,
        "dEQP-GLES3.functional.shaders.func",
        "tions.invalid.in_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004310,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.in_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004311,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.out_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004312,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.out_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004313,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.inout_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004314,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.invalid.inout_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004315,
        "dEQP-GLES3.functional.shaders.functions",
        ".invalid.main_invalid_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004316,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.main_invalid_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004317,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.main_has_arguments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004318,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.invalid.main_has_arguments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004319,
        "dEQP-GLES3.functional.shaders.functions",
        ".invalid.main_missing_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004320,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.main_missing_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004321,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.write_const_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004322,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.write_const_arg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004323,
        "dEQP-GLES3.functional.shaders.function",
        "s.invalid.write_const_array_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004324,
        "dEQP-GLES3.functional.shaders.functions",
        ".invalid.write_const_array_arg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004325,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.use_const_arg_in_const_expr_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004326,
        "dEQP-GLES3.functional.shaders.functions.in",
        "valid.use_const_arg_in_const_expr_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004327,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.use_const_arg_as_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004328,
        "dEQP-GLES3.functional.shaders.functions.in",
        "valid.use_const_arg_as_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004329,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.overload_builtin_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004330,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.overload_builtin_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004331,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.redefine_builtin_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004332,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.redefine_builtin_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004333,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.basic_recursion_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004334,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.basic_recursion_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004335,
        "dEQP-GLES3.functional.shaders.function",
        "s.invalid.simple_tail_recursion_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004336,
        "dEQP-GLES3.functional.shaders.functions",
        ".invalid.simple_tail_recursion_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004337,
        "dEQP-GLES3.functional.shaders.functions.in",
        "valid.dynamic_conditional_recursion_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004338,
        "dEQP-GLES3.functional.shaders.functions.inv",
        "alid.dynamic_conditional_recursion_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004339,
        "dEQP-GLES3.functional.shaders.function",
        "s.invalid.dynamic_loop_recursion_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004340,
        "dEQP-GLES3.functional.shaders.functions",
        ".invalid.dynamic_loop_recursion_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004341,
        "dEQP-GLES3.functional.shaders.functions",
        ".invalid.dynamic_switch_recursion_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004342,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.dynamic_switch_recursion_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004343,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.invalid.modify_const_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004344,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.invalid.modify_const_arg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004345,
        "dEQP-GLES3.functional.shaders.functions.inv",
        "alid.init_const_local_from_const_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004346,
        "dEQP-GLES3.functional.shaders.functions.inva",
        "lid.init_const_local_from_const_arg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004347,
        "dEQP-GLES3.functional.shaders.functions.",
        "invalid.array_size_from_const_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004348,
        "dEQP-GLES3.functional.shaders.functions.i",
        "nvalid.array_size_from_const_arg_fragment");
