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
#include "../ActsDeqpgles30006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005086,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "invalid.member_in_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005087,
        "dEQP-GLES3.functional.shaders.uniform_block.i",
        "nvalid.member_in_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005088,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "invalid.member_out_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005089,
        "dEQP-GLES3.functional.shaders.uniform_block.i",
        "nvalid.member_out_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005090,
        "dEQP-GLES3.functional.shaders.uniform_block.in",
        "valid.member_buffer_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005091,
        "dEQP-GLES3.functional.shaders.uniform_block.inv",
        "alid.member_buffer_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005092,
        "dEQP-GLES3.functional.shaders.uniform_block.inv",
        "alid.member_attribute_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005093,
        "dEQP-GLES3.functional.shaders.uniform_block.inva",
        "lid.member_attribute_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005094,
        "dEQP-GLES3.functional.shaders.uniform_block.in",
        "valid.member_varying_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005095,
        "dEQP-GLES3.functional.shaders.uniform_block.inv",
        "alid.member_varying_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005096,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.invalid.conflicting_instance_names_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005097,
        "dEQP-GLES3.functional.shaders.uniform_block",
        ".invalid.conflicting_instance_names_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005098,
        "dEQP-GLES3.functional.shaders.uniform_block.inva",
        "lid.conflicting_function_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005099,
        "dEQP-GLES3.functional.shaders.uniform_block.inval",
        "id.conflicting_function_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005100,
        "dEQP-GLES3.functional.shaders.uniform_block.inv",
        "alid.conflicting_function_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005101,
        "dEQP-GLES3.functional.shaders.uniform_block.inva",
        "lid.conflicting_function_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005102,
        "dEQP-GLES3.functional.shaders.uniform_block.inva",
        "lid.conflicting_uniform_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005103,
        "dEQP-GLES3.functional.shaders.uniform_block.inval",
        "id.conflicting_uniform_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005104,
        "dEQP-GLES3.functional.shaders.uniform_block.i",
        "nvalid.conflicting_in_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005105,
        "dEQP-GLES3.functional.shaders.uniform_block.in",
        "valid.conflicting_in_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005106,
        "dEQP-GLES3.functional.shaders.uniform_block.in",
        "valid.conflicting_out_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005107,
        "dEQP-GLES3.functional.shaders.uniform_block.inv",
        "alid.conflicting_out_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005108,
        "dEQP-GLES3.functional.shaders.uniform_block.in",
        "valid.conflicting_uniform_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005109,
        "dEQP-GLES3.functional.shaders.uniform_block.inv",
        "alid.conflicting_uniform_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005110,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "invalid.conflicting_in_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005111,
        "dEQP-GLES3.functional.shaders.uniform_block.i",
        "nvalid.conflicting_in_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005112,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "invalid.conflicting_out_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005113,
        "dEQP-GLES3.functional.shaders.uniform_block.i",
        "nvalid.conflicting_out_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005114,
        "dEQP-GLES3.functional.shaders.uniform_block.i",
        "nvalid.matching_instance_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005115,
        "dEQP-GLES3.functional.shaders.uniform_block.in",
        "valid.matching_instance_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005116,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.invalid.reference_using_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005117,
        "dEQP-GLES3.functional.shaders.uniform_block",
        ".invalid.reference_using_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005118,
        "dEQP-GLES3.functional.shaders.unifo",
        "rm_block.invalid.empty_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005119,
        "dEQP-GLES3.functional.shaders.unifor",
        "m_block.invalid.empty_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005120,
        "dEQP-GLES3.functional.shaders.unifo",
        "rm_block.invalid.empty_layout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005121,
        "dEQP-GLES3.functional.shaders.unifor",
        "m_block.invalid.empty_layout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005122,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.invalid.empty_member_layout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005123,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.invalid.empty_member_layout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005124,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.invalid.empty_global_layout_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005125,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.invalid.empty_global_layout_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005126,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.invalid.structure_definition_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005127,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.invalid.structure_definition_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005128,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.invalid.member_layout_shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005129,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.invalid.member_layout_shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005130,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.invalid.member_layout_packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005131,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.invalid.member_layout_packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005132,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.invalid.member_layout_std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005133,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.invalid.member_layout_std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005134,
        "dEQP-GLES3.functional.shaders.uniform_",
        "block.invalid.missing_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005135,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.invalid.missing_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005136,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.invalid.invalid_number_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005137,
        "dEQP-GLES3.functional.shaders.uniform_block",
        ".invalid.invalid_number_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005138,
        "dEQP-GLES3.functional.shaders.uniform_blo",
        "ck.invalid.invalid_hash_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005139,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.invalid.invalid_hash_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005140,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.invalid.invalid_dollar_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005141,
        "dEQP-GLES3.functional.shaders.uniform_block",
        ".invalid.invalid_dollar_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005142,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "invalid.invalid_identifier_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005143,
        "dEQP-GLES3.functional.shaders.uniform_block.i",
        "nvalid.invalid_identifier_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005144,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.invalid.too_long_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005145,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.invalid.too_long_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005146,
        "dEQP-GLES3.functional.shaders.uniform_block",
        ".invalid.invalid_number_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005147,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "invalid.invalid_number_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005148,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.invalid.invalid_hash_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005149,
        "dEQP-GLES3.functional.shaders.uniform_block",
        ".invalid.invalid_hash_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005150,
        "dEQP-GLES3.functional.shaders.uniform_block",
        ".invalid.invalid_dollar_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005151,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "invalid.invalid_dollar_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005152,
        "dEQP-GLES3.functional.shaders.uniform_block.i",
        "nvalid.invalid_identifier_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005153,
        "dEQP-GLES3.functional.shaders.uniform_block.in",
        "valid.invalid_identifier_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005154,
        "dEQP-GLES3.functional.shaders.unifor",
        "m_block.invalid.repeated_block_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005155,
        "dEQP-GLES3.functional.shaders.uniform",
        "_block.invalid.repeated_block_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005156,
        "dEQP-GLES3.functional.shaders.uniform_block.i",
        "nvalid.repeated_block_no_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005157,
        "dEQP-GLES3.functional.shaders.uniform_block.in",
        "valid.repeated_block_no_instance_name_fragment");
