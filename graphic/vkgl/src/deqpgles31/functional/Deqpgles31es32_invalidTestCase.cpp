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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003822,
        "dEQP-GLES31.functional.shaders.arrays.e",
        "s32.invalid.constructor_c_style1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003823,
        "dEQP-GLES31.functional.shaders.arrays.es",
        "32.invalid.constructor_c_style1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003824,
        "dEQP-GLES31.functional.shaders.arrays.e",
        "s32.invalid.constructor_c_style2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003825,
        "dEQP-GLES31.functional.shaders.arrays.es",
        "32.invalid.constructor_c_style2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003826,
        "dEQP-GLES31.functional.shaders.arrays.e",
        "s32.invalid.constructor_c_style3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003827,
        "dEQP-GLES31.functional.shaders.arrays.es",
        "32.invalid.constructor_c_style3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003828,
        "dEQP-GLES31.functional.shaders.arrays.e",
        "s32.invalid.constructor_c_style4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003829,
        "dEQP-GLES31.functional.shaders.arrays.es",
        "32.invalid.constructor_c_style4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004406,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.",
        "es32.invalid.dynamic_expression_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004407,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s32.invalid.dynamic_expression_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004408,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s32.invalid.empty_declaration_with_var_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004409,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "32.invalid.empty_declaration_with_var_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004410,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es32.invalid.uniform_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004411,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.invalid.uniform_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004412,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es32.invalid.storage_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004413,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es32.invalid.storage_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007391,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.invalid.member_in_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007392,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.invalid.member_in_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007393,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.invalid.member_out_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007394,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.invalid.member_out_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007395,
        "dEQP-GLES31.functional.shaders.uniform_block.es32",
        ".invalid.member_buffer_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007396,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.",
        "invalid.member_buffer_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007397,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.",
        "invalid.member_attribute_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007398,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.i",
        "nvalid.member_attribute_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007399,
        "dEQP-GLES31.functional.shaders.uniform_block.es32",
        ".invalid.member_varying_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007400,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.",
        "invalid.member_varying_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007401,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.invalid.conflicting_instance_names_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007402,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.invalid.conflicting_instance_names_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007403,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.i",
        "nvalid.conflicting_function_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007404,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.in",
        "valid.conflicting_function_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007405,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.",
        "invalid.conflicting_function_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007406,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.i",
        "nvalid.conflicting_function_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007407,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.i",
        "nvalid.conflicting_uniform_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007408,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.in",
        "valid.conflicting_uniform_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007409,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.invalid.conflicting_in_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007410,
        "dEQP-GLES31.functional.shaders.uniform_block.es32",
        ".invalid.conflicting_in_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007411,
        "dEQP-GLES31.functional.shaders.uniform_block.es32",
        ".invalid.conflicting_out_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007412,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.",
        "invalid.conflicting_out_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007413,
        "dEQP-GLES31.functional.shaders.uniform_block.es32",
        ".invalid.conflicting_uniform_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007414,
        "dEQP-GLES31.functional.shaders.uniform_block.es32.",
        "invalid.conflicting_uniform_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007415,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.invalid.conflicting_in_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007416,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.invalid.conflicting_in_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007417,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.invalid.conflicting_out_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007418,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.invalid.conflicting_out_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007419,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.invalid.matching_instance_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007420,
        "dEQP-GLES31.functional.shaders.uniform_block.es32",
        ".invalid.matching_instance_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007421,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.invalid.reference_using_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007422,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.invalid.reference_using_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007423,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es32.invalid.empty_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007424,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.invalid.empty_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007425,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es32.invalid.empty_layout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007426,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.invalid.empty_layout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007427,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.invalid.empty_member_layout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007428,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.invalid.empty_member_layout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007429,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.invalid.empty_global_layout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007430,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.invalid.empty_global_layout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007431,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.invalid.structure_definition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007432,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.invalid.structure_definition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007433,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.invalid.member_layout_shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007434,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.invalid.member_layout_shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007435,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.invalid.member_layout_packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007436,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.invalid.member_layout_packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007437,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.invalid.member_layout_std140std430_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007438,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.invalid.member_layout_std140std430_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007439,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es32.invalid.missing_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007440,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.invalid.missing_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007441,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.invalid.invalid_number_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007442,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.invalid.invalid_number_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007443,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.invalid.invalid_identifier_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007444,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.invalid.invalid_identifier_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007445,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es32.invalid.invalid_hash_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007446,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.invalid.invalid_hash_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007447,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.invalid.invalid_dollar_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007448,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.invalid.invalid_dollar_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007449,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.invalid.too_long_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007450,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.invalid.too_long_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007451,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.invalid.invalid_number_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007452,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.invalid.invalid_number_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007453,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.invalid.invalid_identifier_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007454,
        "dEQP-GLES31.functional.shaders.uniform_block.es32",
        ".invalid.invalid_identifier_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007455,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.invalid.invalid_hash_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007456,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.invalid.invalid_hash_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007457,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.invalid.invalid_dollar_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007458,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.invalid.invalid_dollar_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007459,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.invalid.repeated_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007460,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es32.invalid.repeated_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007461,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.invalid.repeated_block_no_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007462,
        "dEQP-GLES31.functional.shaders.uniform_block.es32",
        ".invalid.repeated_block_no_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007463,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.invalid.layout_std430_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007464,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es32.invalid.layout_std430_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007465,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.invalid.global_layout_std430_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007466,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.invalid.global_layout_std430_fragment");
