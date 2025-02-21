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

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002169,
        "dEQP-GLES2.functional.shaders.func",
        "tions.invalid.break_in_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002170,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.invalid.break_in_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002171,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.invalid.continue_in_body_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002172,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.invalid.continue_in_body_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002173,
        "dEQP-GLES2.functional.shaders.functions.inv",
        "alid.return_value_from_void_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002174,
        "dEQP-GLES2.functional.shaders.functions.inva",
        "lid.return_value_from_void_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002175,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.invalid.extra_arguments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002176,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.invalid.extra_arguments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002177,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.invalid.missing_arguments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002178,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.invalid.missing_arguments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002179,
        "dEQP-GLES2.functional.shaders.function",
        "s.invalid.missing_argument_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002180,
        "dEQP-GLES2.functional.shaders.functions",
        ".invalid.missing_argument_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002181,
        "dEQP-GLES2.functional.shaders.functions.",
        "invalid.argument_basetype_mismatch_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002182,
        "dEQP-GLES2.functional.shaders.functions.i",
        "nvalid.argument_basetype_mismatch_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002183,
        "dEQP-GLES2.functional.shaders.functions.inv",
        "alid.argument_scalar_vector_mismatch_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002184,
        "dEQP-GLES2.functional.shaders.functions.inva",
        "lid.argument_scalar_vector_mismatch_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002185,
        "dEQP-GLES2.functional.shaders.functions.in",
        "valid.argument_vector_size_mismatch_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002186,
        "dEQP-GLES2.functional.shaders.functions.inv",
        "alid.argument_vector_size_mismatch_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002187,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.invalid.duplicate_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002188,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.invalid.duplicate_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002189,
        "dEQP-GLES2.functional.shaders.functions.in",
        "valid.prototype_mismatch_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002190,
        "dEQP-GLES2.functional.shaders.functions.inv",
        "alid.prototype_mismatch_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002191,
        "dEQP-GLES2.functional.shaders.functions.inv",
        "alid.prototype_unspecified_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002192,
        "dEQP-GLES2.functional.shaders.functions.inva",
        "lid.prototype_unspecified_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002193,
        "dEQP-GLES2.functional.shaders.functions.inva",
        "lid.call_mismatch_argument_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002194,
        "dEQP-GLES2.functional.shaders.functions.inval",
        "id.call_mismatch_argument_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002195,
        "dEQP-GLES2.functional.shaders.functions.inva",
        "lid.prototype_mismatch_argument_const_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002196,
        "dEQP-GLES2.functional.shaders.functions.inval",
        "id.prototype_mismatch_argument_const_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002197,
        "dEQP-GLES2.functional.shaders.functions.invalid",
        ".prototype_mismatch_argument_array_const_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002198,
        "dEQP-GLES2.functional.shaders.functions.invalid.",
        "prototype_mismatch_argument_array_const_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002199,
        "dEQP-GLES2.functional.shaders.functions.in",
        "valid.prototype_mismatch_array_inout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002200,
        "dEQP-GLES2.functional.shaders.functions.inv",
        "alid.prototype_mismatch_array_inout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002201,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.invalid.missing_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002202,
        "dEQP-GLES2.functional.shaders.function",
        "s.invalid.missing_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002203,
        "dEQP-GLES2.functional.shaders.function",
        "s.invalid.call_before_definition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002204,
        "dEQP-GLES2.functional.shaders.functions",
        ".invalid.call_before_definition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002205,
        "dEQP-GLES2.functional.shaders.function",
        "s.invalid.return_array_in_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002206,
        "dEQP-GLES2.functional.shaders.functions",
        ".invalid.return_array_in_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002207,
        "dEQP-GLES2.functional.shaders.functions.i",
        "nvalid.argument_precision_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002208,
        "dEQP-GLES2.functional.shaders.functions.in",
        "valid.argument_precision_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002209,
        "dEQP-GLES2.functional.shaders.functions",
        ".invalid.argument_in_out_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002210,
        "dEQP-GLES2.functional.shaders.functions.",
        "invalid.argument_in_out_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002211,
        "dEQP-GLES2.functional.shaders.functions.",
        "invalid.argument_in_inout_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002212,
        "dEQP-GLES2.functional.shaders.functions.i",
        "nvalid.argument_in_inout_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002213,
        "dEQP-GLES2.functional.shaders.functions.i",
        "nvalid.argument_out_inout_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002214,
        "dEQP-GLES2.functional.shaders.functions.in",
        "valid.argument_out_inout_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002215,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.invalid.return_type_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002216,
        "dEQP-GLES2.functional.shaders.function",
        "s.invalid.return_type_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002217,
        "dEQP-GLES2.functional.shaders.functions.in",
        "valid.return_type_precision_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002218,
        "dEQP-GLES2.functional.shaders.functions.inv",
        "alid.return_type_precision_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002219,
        "dEQP-GLES2.functional.shaders.functions.",
        "invalid.return_type_const_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002220,
        "dEQP-GLES2.functional.shaders.functions.i",
        "nvalid.return_type_const_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002221,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.invalid.return_without_value_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002222,
        "dEQP-GLES2.functional.shaders.function",
        "s.invalid.return_without_value_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002223,
        "dEQP-GLES2.functional.shaders.functions.",
        "invalid.local_function_definition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002224,
        "dEQP-GLES2.functional.shaders.functions.i",
        "nvalid.local_function_definition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002225,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.invalid.name_type_conflict_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002226,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.invalid.name_type_conflict_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002227,
        "dEQP-GLES2.functional.shaders.func",
        "tions.invalid.const_overload_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002228,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.invalid.const_overload_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002229,
        "dEQP-GLES2.functional.shaders.func",
        "tions.invalid.uniform_local_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002230,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.invalid.uniform_local_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002231,
        "dEQP-GLES2.functional.shaders.func",
        "tions.invalid.varying_local_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002232,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.invalid.varying_local_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002233,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.invalid.attribute_local_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002234,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.invalid.attribute_local_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002235,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.invalid.uniform_argument_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002236,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.invalid.uniform_argument_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002237,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.invalid.attribute_argument_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002238,
        "dEQP-GLES2.functional.shaders.function",
        "s.invalid.attribute_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002239,
        "dEQP-GLES2.functional.shaders.functions",
        ".invalid.attribute_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002240,
        "dEQP-GLES2.functional.shaders.functions",
        ".invalid.main_invalid_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002241,
        "dEQP-GLES2.functional.shaders.functions.",
        "invalid.main_invalid_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002242,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.invalid.main_has_arguments_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002243,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.invalid.main_has_arguments_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002244,
        "dEQP-GLES2.functional.shaders.functions",
        ".invalid.main_missing_return_type_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002245,
        "dEQP-GLES2.functional.shaders.functions.",
        "invalid.main_missing_return_type_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002246,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.invalid.write_const_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002247,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.invalid.write_const_arg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002248,
        "dEQP-GLES2.functional.shaders.function",
        "s.invalid.write_const_array_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002249,
        "dEQP-GLES2.functional.shaders.functions",
        ".invalid.write_const_array_arg_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002250,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.invalid.modify_const_arg_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002251,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.invalid.modify_const_arg_fragment");
