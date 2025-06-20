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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007325,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es32.valid.repeat_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007326,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.valid.repeat_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007327,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es32.valid.layout_shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007328,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.valid.layout_shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007329,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es32.valid.layout_packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007330,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.valid.layout_packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007331,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es32.valid.layout_std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007332,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.valid.layout_std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007333,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.valid.layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007334,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es32.valid.layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007335,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es32.valid.layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007336,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.valid.layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007337,
        "dEQP-GLES31.functional.shaders.unifo",
        "rm_block.es32.valid.layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007338,
        "dEQP-GLES31.functional.shaders.unifor",
        "m_block.es32.valid.layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007339,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es32.valid.layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007340,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es32.valid.layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007341,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es32.valid.global_layout_shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007342,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.valid.global_layout_shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007343,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es32.valid.global_layout_packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007344,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.valid.global_layout_packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007345,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es32.valid.global_layout_std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007346,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.valid.global_layout_std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007347,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.valid.global_layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007348,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es32.valid.global_layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007349,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es32.valid.global_layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007350,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.valid.global_layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007351,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es32.valid.global_layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007352,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es32.valid.global_layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007353,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es32.valid.global_layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007354,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.valid.global_layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007355,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.valid.member_layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007356,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es32.valid.member_layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007357,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es32.valid.member_layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007358,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.valid.member_layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007359,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.valid.member_layout_row_major_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007360,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.valid.member_layout_row_major_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007361,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.valid.member_layout_column_major_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007362,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.valid.member_layout_column_major_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007363,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es32.valid.member_layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007364,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es32.valid.member_layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007365,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es32.valid.member_layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007366,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.valid.member_layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007367,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.valid.no_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007368,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es32.valid.no_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007369,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es32.valid.same_variable_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007370,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.valid.same_variable_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007371,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.valid.same_variable_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007372,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.valid.same_variable_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007373,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es32.valid.struct_member_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007374,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.valid.struct_member_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007375,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s32.valid.struct_member_layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007376,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.valid.struct_member_layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007377,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.valid.struct_member_layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007378,
        "dEQP-GLES31.functional.shaders.uniform_block.es32",
        ".valid.struct_member_layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007379,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.valid.struct_member_layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007380,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es32.valid.struct_member_layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007381,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "32.valid.struct_member_layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007382,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "2.valid.struct_member_layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007383,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es32.valid.long_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007384,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es32.valid.long_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007385,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es32.valid.long_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007386,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es32.valid.long_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007387,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es32.valid.underscore_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007388,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.valid.underscore_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007389,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es32.valid.underscore_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007390,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es32.valid.underscore_instance_name_fragment");
