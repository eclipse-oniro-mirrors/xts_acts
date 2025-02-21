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

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005020,
        "dEQP-GLES3.functional.shaders.uniform_blo",
        "ck.valid.repeat_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005021,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.valid.repeat_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005022,
        "dEQP-GLES3.functional.shaders.unifo",
        "rm_block.valid.layout_shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005023,
        "dEQP-GLES3.functional.shaders.unifor",
        "m_block.valid.layout_shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005024,
        "dEQP-GLES3.functional.shaders.unifo",
        "rm_block.valid.layout_packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005025,
        "dEQP-GLES3.functional.shaders.unifor",
        "m_block.valid.layout_packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005026,
        "dEQP-GLES3.functional.shaders.unifo",
        "rm_block.valid.layout_std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005027,
        "dEQP-GLES3.functional.shaders.unifor",
        "m_block.valid.layout_std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005028,
        "dEQP-GLES3.functional.shaders.unifor",
        "m_block.valid.layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005029,
        "dEQP-GLES3.functional.shaders.uniform",
        "_block.valid.layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005030,
        "dEQP-GLES3.functional.shaders.uniform_",
        "block.valid.layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005031,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.valid.layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005032,
        "dEQP-GLES3.functional.shaders.uni",
        "form_block.valid.layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005033,
        "dEQP-GLES3.functional.shaders.unif",
        "orm_block.valid.layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005034,
        "dEQP-GLES3.functional.shaders.uniform",
        "_block.valid.layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005035,
        "dEQP-GLES3.functional.shaders.uniform_",
        "block.valid.layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005036,
        "dEQP-GLES3.functional.shaders.uniform_",
        "block.valid.global_layout_shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005037,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.valid.global_layout_shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005038,
        "dEQP-GLES3.functional.shaders.uniform_",
        "block.valid.global_layout_packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005039,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.valid.global_layout_packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005040,
        "dEQP-GLES3.functional.shaders.uniform_",
        "block.valid.global_layout_std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005041,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.valid.global_layout_std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005042,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.valid.global_layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005043,
        "dEQP-GLES3.functional.shaders.uniform_blo",
        "ck.valid.global_layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005044,
        "dEQP-GLES3.functional.shaders.uniform_blo",
        "ck.valid.global_layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005045,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.valid.global_layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005046,
        "dEQP-GLES3.functional.shaders.uniform",
        "_block.valid.global_layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005047,
        "dEQP-GLES3.functional.shaders.uniform_",
        "block.valid.global_layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005048,
        "dEQP-GLES3.functional.shaders.uniform_blo",
        "ck.valid.global_layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005049,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.valid.global_layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005050,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.valid.member_layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005051,
        "dEQP-GLES3.functional.shaders.uniform_blo",
        "ck.valid.member_layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005052,
        "dEQP-GLES3.functional.shaders.uniform_blo",
        "ck.valid.member_layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005053,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.valid.member_layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005054,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.valid.member_layout_row_major_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005055,
        "dEQP-GLES3.functional.shaders.uniform_block",
        ".valid.member_layout_row_major_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005056,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "valid.member_layout_column_major_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005057,
        "dEQP-GLES3.functional.shaders.uniform_block.v",
        "alid.member_layout_column_major_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005058,
        "dEQP-GLES3.functional.shaders.uniform",
        "_block.valid.member_layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005059,
        "dEQP-GLES3.functional.shaders.uniform_",
        "block.valid.member_layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005060,
        "dEQP-GLES3.functional.shaders.uniform_blo",
        "ck.valid.member_layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005061,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.valid.member_layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005062,
        "dEQP-GLES3.functional.shaders.unifor",
        "m_block.valid.no_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005063,
        "dEQP-GLES3.functional.shaders.uniform",
        "_block.valid.no_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005064,
        "dEQP-GLES3.functional.shaders.uniform_bloc",
        "k.valid.same_variable_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005065,
        "dEQP-GLES3.functional.shaders.uniform_block",
        ".valid.same_variable_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005066,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "valid.same_variable_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005067,
        "dEQP-GLES3.functional.shaders.uniform_block.v",
        "alid.same_variable_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005068,
        "dEQP-GLES3.functional.shaders.unifo",
        "rm_block.valid.struct_member_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005069,
        "dEQP-GLES3.functional.shaders.unifor",
        "m_block.valid.struct_member_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005070,
        "dEQP-GLES3.functional.shaders.uniform_block",
        ".valid.struct_member_layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005071,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "valid.struct_member_layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005072,
        "dEQP-GLES3.functional.shaders.uniform_block.v",
        "alid.struct_member_layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005073,
        "dEQP-GLES3.functional.shaders.uniform_block.va",
        "lid.struct_member_layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005074,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.valid.struct_member_layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005075,
        "dEQP-GLES3.functional.shaders.uniform_blo",
        "ck.valid.struct_member_layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005076,
        "dEQP-GLES3.functional.shaders.uniform_block.",
        "valid.struct_member_layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005077,
        "dEQP-GLES3.functional.shaders.uniform_block.v",
        "alid.struct_member_layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005078,
        "dEQP-GLES3.functional.shaders.unifor",
        "m_block.valid.long_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005079,
        "dEQP-GLES3.functional.shaders.uniform",
        "_block.valid.long_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005080,
        "dEQP-GLES3.functional.shaders.uniform",
        "_block.valid.long_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005081,
        "dEQP-GLES3.functional.shaders.uniform_",
        "block.valid.long_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005082,
        "dEQP-GLES3.functional.shaders.uniform_b",
        "lock.valid.underscore_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005083,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.valid.underscore_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005084,
        "dEQP-GLES3.functional.shaders.uniform_bl",
        "ock.valid.underscore_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005085,
        "dEQP-GLES3.functional.shaders.uniform_blo",
        "ck.valid.underscore_instance_name_fragment");
