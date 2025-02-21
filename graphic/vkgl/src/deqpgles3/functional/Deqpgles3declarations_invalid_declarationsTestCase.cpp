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
#include "../ActsDeqpgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002792,
        "dEQP-GLES3.functional.shaders.declaratio",
        "ns.invalid_declarations.in_in_vertex_main");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002793,
        "dEQP-GLES3.functional.shaders.declaration",
        "s.invalid_declarations.out_in_vertex_main");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002794,
        "dEQP-GLES3.functional.shaders.declaration",
        "s.invalid_declarations.in_in_fragment_main");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002795,
        "dEQP-GLES3.functional.shaders.declarations",
        ".invalid_declarations.out_in_fragment_main");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002796,
        "dEQP-GLES3.functional.shaders.declarations.",
        "invalid_declarations.uniform_in_vertex_main");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002797,
        "dEQP-GLES3.functional.shaders.declarations.i",
        "nvalid_declarations.uniform_in_fragment_main");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002798,
        "dEQP-GLES3.functional.shaders.declarations.inv",
        "alid_declarations.uniform_block_in_main_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002799,
        "dEQP-GLES3.functional.shaders.declarations.inva",
        "lid_declarations.uniform_block_in_main_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002800,
        "dEQP-GLES3.functional.shaders.declaration",
        "s.invalid_declarations.invariant_attribute");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002801,
        "dEQP-GLES3.functional.shaders.declaratio",
        "ns.invalid_declarations.invariant_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002802,
        "dEQP-GLES3.functional.shaders.declarations.inval",
        "id_declarations.invariant_uniform_block_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002803,
        "dEQP-GLES3.functional.shaders.declarations.invali",
        "d_declarations.invariant_uniform_block_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002804,
        "dEQP-GLES3.functional.shaders.declarations.inval",
        "id_declarations.invariant_uniform_block_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002805,
        "dEQP-GLES3.functional.shaders.declarations.invali",
        "d_declarations.invariant_uniform_block_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002806,
        "dEQP-GLES3.functional.shaders.declarations.invalid",
        "_declarations.uniform_block_layout_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002807,
        "dEQP-GLES3.functional.shaders.declarations.invalid_",
        "declarations.uniform_block_layout_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002808,
        "dEQP-GLES3.functional.shaders.declarations.invalid_dec",
        "larations.uniform_block_member_layout_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002809,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decl",
        "arations.uniform_block_member_layout_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002810,
        "dEQP-GLES3.functional.shaders.declarations.invalid_dec",
        "larations.uniform_block_nested_struct_definition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002811,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decl",
        "arations.uniform_block_nested_struct_definition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002812,
        "dEQP-GLES3.functional.shaders.declarations.in",
        "valid_declarations.nested_uniform_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002813,
        "dEQP-GLES3.functional.shaders.declarations.inv",
        "alid_declarations.nested_uniform_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002814,
        "dEQP-GLES3.functional.shaders.declarations.inva",
        "lid_declarations.uniform_block_sampler_2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002815,
        "dEQP-GLES3.functional.shaders.declarations.inval",
        "id_declarations.uniform_block_sampler_2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002816,
        "dEQP-GLES3.functional.shaders.declarations.inval",
        "id_declarations.uniform_block_sampler_cube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002817,
        "dEQP-GLES3.functional.shaders.declarations.invali",
        "d_declarations.uniform_block_sampler_cube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002818,
        "dEQP-GLES3.functional.shaders.declarations.invalid_dec",
        "larations.uniform_block_missing_member_semicolon_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002819,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decl",
        "arations.uniform_block_missing_member_semicolon_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002820,
        "dEQP-GLES3.functional.shaders.declarations.invalid_de",
        "clarations.uniform_block_missing_end_semicolon_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002821,
        "dEQP-GLES3.functional.shaders.declarations.invalid_dec",
        "larations.uniform_block_missing_end_semicolon_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002822,
        "dEQP-GLES3.functional.shaders.declarations.invalid_dec",
        "larations.uniform_block_duplicate_member_name_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002823,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decl",
        "arations.uniform_block_duplicate_member_name_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002824,
        "dEQP-GLES3.functional.shaders.declarations.invalid_dec",
        "larations.uniform_block_duplicate_member_name_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002825,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decl",
        "arations.uniform_block_duplicate_member_name_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002826,
        "dEQP-GLES3.functional.shaders.declarations.invalid_dec",
        "larations.uniform_block_duplicate_member_name_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002827,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decl",
        "arations.uniform_block_duplicate_member_name_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002828,
        "dEQP-GLES3.functional.shaders.declarations.invalid_d",
        "eclarations.uniform_block_duplicate_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002829,
        "dEQP-GLES3.functional.shaders.declarations.invalid_de",
        "clarations.uniform_block_duplicate_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002830,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decl",
        "arations.uniform_block_duplicate_instance_name_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002831,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decla",
        "rations.uniform_block_duplicate_instance_name_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002832,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decl",
        "arations.uniform_block_duplicate_instance_name_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002833,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decla",
        "rations.uniform_block_duplicate_instance_name_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002834,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decl",
        "arations.uniform_block_duplicate_instance_name_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002835,
        "dEQP-GLES3.functional.shaders.declarations.invalid_decla",
        "rations.uniform_block_duplicate_instance_name_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002836,
        "dEQP-GLES3.functional.shaders.declarations.invalid_declar",
        "ations.uniform_block_array_without_instance_name_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002837,
        "dEQP-GLES3.functional.shaders.declarations.invalid_declara",
        "tions.uniform_block_array_without_instance_name_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002838,
        "dEQP-GLES3.functional.shaders.declarations.invalid_declar",
        "ations.uniform_block_array_without_instance_name_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002839,
        "dEQP-GLES3.functional.shaders.declarations.invalid_declara",
        "tions.uniform_block_array_without_instance_name_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002840,
        "dEQP-GLES3.functional.shaders.declarations.",
        "invalid_declarations.uniform_block_in_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002841,
        "dEQP-GLES3.functional.shaders.declarations.i",
        "nvalid_declarations.uniform_block_in_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002842,
        "dEQP-GLES3.functional.shaders.declarations.i",
        "nvalid_declarations.uniform_block_out_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002843,
        "dEQP-GLES3.functional.shaders.declarations.in",
        "valid_declarations.uniform_block_out_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002844,
        "dEQP-GLES3.functional.shaders.declarations.in",
        "valid_declarations.uniform_block_const_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002845,
        "dEQP-GLES3.functional.shaders.declarations.inv",
        "alid_declarations.uniform_block_const_fragment");
