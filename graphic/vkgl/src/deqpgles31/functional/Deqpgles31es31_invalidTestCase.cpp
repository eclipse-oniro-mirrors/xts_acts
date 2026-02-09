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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003814,
        "dEQP-GLES31.functional.shaders.arrays.e",
        "s31.invalid.constructor_c_style1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003815,
        "dEQP-GLES31.functional.shaders.arrays.es",
        "31.invalid.constructor_c_style1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003816,
        "dEQP-GLES31.functional.shaders.arrays.e",
        "s31.invalid.constructor_c_style2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003817,
        "dEQP-GLES31.functional.shaders.arrays.es",
        "31.invalid.constructor_c_style2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003818,
        "dEQP-GLES31.functional.shaders.arrays.e",
        "s31.invalid.constructor_c_style3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003819,
        "dEQP-GLES31.functional.shaders.arrays.es",
        "31.invalid.constructor_c_style3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003820,
        "dEQP-GLES31.functional.shaders.arrays.e",
        "s31.invalid.constructor_c_style4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003821,
        "dEQP-GLES31.functional.shaders.arrays.es",
        "31.invalid.constructor_c_style4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004114,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.",
        "es31.invalid.dynamic_expression_array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004115,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s31.invalid.dynamic_expression_array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004116,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s31.invalid.empty_declaration_with_var_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004117,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.invalid.empty_declaration_with_var_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004118,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es31.invalid.uniform_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004119,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.invalid.uniform_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004120,
        "dEQP-GLES31.functional.shaders.arrays_of",
        "_arrays.es31.invalid.storage_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_004121,
        "dEQP-GLES31.functional.shaders.arrays_of_",
        "arrays.es31.invalid.storage_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007249,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.invalid.member_in_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007250,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.invalid.member_in_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007251,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.invalid.member_out_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007252,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.invalid.member_out_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007253,
        "dEQP-GLES31.functional.shaders.uniform_block.es31",
        ".invalid.member_buffer_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007254,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.",
        "invalid.member_buffer_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007255,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.",
        "invalid.member_attribute_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007256,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.i",
        "nvalid.member_attribute_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007257,
        "dEQP-GLES31.functional.shaders.uniform_block.es31",
        ".invalid.member_varying_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007258,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.",
        "invalid.member_varying_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007259,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.invalid.conflicting_instance_names_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007260,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.invalid.conflicting_instance_names_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007261,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.i",
        "nvalid.conflicting_function_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007262,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.in",
        "valid.conflicting_function_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007263,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.",
        "invalid.conflicting_function_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007264,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.i",
        "nvalid.conflicting_function_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007265,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.i",
        "nvalid.conflicting_uniform_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007266,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.in",
        "valid.conflicting_uniform_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007267,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.invalid.conflicting_in_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007268,
        "dEQP-GLES31.functional.shaders.uniform_block.es31",
        ".invalid.conflicting_in_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007269,
        "dEQP-GLES31.functional.shaders.uniform_block.es31",
        ".invalid.conflicting_out_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007270,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.",
        "invalid.conflicting_out_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007271,
        "dEQP-GLES31.functional.shaders.uniform_block.es31",
        ".invalid.conflicting_uniform_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007272,
        "dEQP-GLES31.functional.shaders.uniform_block.es31.",
        "invalid.conflicting_uniform_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007273,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.invalid.conflicting_in_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007274,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.invalid.conflicting_in_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007275,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.invalid.conflicting_out_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007276,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.invalid.conflicting_out_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007277,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.invalid.matching_instance_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007278,
        "dEQP-GLES31.functional.shaders.uniform_block.es31",
        ".invalid.matching_instance_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007279,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.invalid.reference_using_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007280,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.invalid.reference_using_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007281,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es31.invalid.empty_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007282,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.invalid.empty_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007283,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es31.invalid.empty_layout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007284,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.invalid.empty_layout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007285,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.invalid.empty_member_layout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007286,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.invalid.empty_member_layout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007287,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.invalid.empty_global_layout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007288,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.invalid.empty_global_layout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007289,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.invalid.structure_definition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007290,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.invalid.structure_definition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007291,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.invalid.member_layout_shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007292,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.invalid.member_layout_shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007293,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.invalid.member_layout_packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007294,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.invalid.member_layout_packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007295,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.invalid.member_layout_std140std430_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007296,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.invalid.member_layout_std140std430_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007297,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es31.invalid.missing_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007298,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.invalid.missing_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007299,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.invalid.invalid_number_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007300,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.invalid.invalid_number_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007301,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.invalid.invalid_identifier_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007302,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.invalid.invalid_identifier_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007303,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es31.invalid.invalid_hash_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007304,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.invalid.invalid_hash_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007305,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.invalid.invalid_dollar_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007306,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.invalid.invalid_dollar_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007307,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.invalid.too_long_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007308,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.invalid.too_long_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007309,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.invalid.invalid_number_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007310,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.invalid.invalid_number_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007311,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.invalid.invalid_identifier_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007312,
        "dEQP-GLES31.functional.shaders.uniform_block.es31",
        ".invalid.invalid_identifier_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007313,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.invalid.invalid_hash_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007314,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.invalid.invalid_hash_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007315,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.invalid.invalid_dollar_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007316,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.invalid.invalid_dollar_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007317,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.invalid.repeated_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007318,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es31.invalid.repeated_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007319,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.invalid.repeated_block_no_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007320,
        "dEQP-GLES31.functional.shaders.uniform_block.es31",
        ".invalid.repeated_block_no_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007321,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.invalid.layout_std430_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007322,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es31.invalid.layout_std430_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007323,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.invalid.global_layout_std430_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_007324,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.invalid.global_layout_std430_fragment");
