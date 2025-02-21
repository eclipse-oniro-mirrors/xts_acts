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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007183,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es31.valid.repeat_interface_qualifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007184,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.valid.repeat_interface_qualifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007185,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es31.valid.layout_shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007186,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.valid.layout_shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007187,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es31.valid.layout_packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007188,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.valid.layout_packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007189,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es31.valid.layout_std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007190,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.valid.layout_std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007191,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.valid.layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007192,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es31.valid.layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007193,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es31.valid.layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007194,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.valid.layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007195,
        "dEQP-GLES31.functional.shaders.unifo",
        "rm_block.es31.valid.layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007196,
        "dEQP-GLES31.functional.shaders.unifor",
        "m_block.es31.valid.layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007197,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es31.valid.layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007198,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es31.valid.layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007199,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es31.valid.global_layout_shared_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007200,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.valid.global_layout_shared_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007201,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es31.valid.global_layout_packed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007202,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.valid.global_layout_packed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007203,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es31.valid.global_layout_std140_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007204,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.valid.global_layout_std140_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007205,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.valid.global_layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007206,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es31.valid.global_layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007207,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es31.valid.global_layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007208,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.valid.global_layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007209,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es31.valid.global_layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007210,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es31.valid.global_layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007211,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es31.valid.global_layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007212,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.valid.global_layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007213,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.valid.member_layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007214,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es31.valid.member_layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007215,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es31.valid.member_layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007216,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.valid.member_layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007217,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.valid.member_layout_row_major_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007218,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.valid.member_layout_row_major_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007219,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.valid.member_layout_column_major_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007220,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.valid.member_layout_column_major_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007221,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es31.valid.member_layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007222,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es31.valid.member_layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007223,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es31.valid.member_layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007224,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.valid.member_layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007225,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.valid.no_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007226,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es31.valid.no_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007227,
        "dEQP-GLES31.functional.shaders.uniform_block.",
        "es31.valid.same_variable_and_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007228,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.valid.same_variable_and_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007229,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.valid.same_variable_and_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007230,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.valid.same_variable_and_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007231,
        "dEQP-GLES31.functional.shaders.uniform",
        "_block.es31.valid.struct_member_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007232,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.valid.struct_member_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007233,
        "dEQP-GLES31.functional.shaders.uniform_block.e",
        "s31.valid.struct_member_layout_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007234,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.valid.struct_member_layout_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007235,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.valid.struct_member_layout_column_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007236,
        "dEQP-GLES31.functional.shaders.uniform_block.es31",
        ".valid.struct_member_layout_column_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007237,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.valid.struct_member_layout_all_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007238,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es31.valid.struct_member_layout_all_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007239,
        "dEQP-GLES31.functional.shaders.uniform_block.es",
        "31.valid.struct_member_layout_all_8_times_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007240,
        "dEQP-GLES31.functional.shaders.uniform_block.es3",
        "1.valid.struct_member_layout_all_8_times_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007241,
        "dEQP-GLES31.functional.shaders.uniform_",
        "block.es31.valid.long_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007242,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es31.valid.long_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007243,
        "dEQP-GLES31.functional.shaders.uniform_b",
        "lock.es31.valid.long_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007244,
        "dEQP-GLES31.functional.shaders.uniform_bl",
        "ock.es31.valid.long_instance_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007245,
        "dEQP-GLES31.functional.shaders.uniform_blo",
        "ck.es31.valid.underscore_block_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007246,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.valid.underscore_block_name_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007247,
        "dEQP-GLES31.functional.shaders.uniform_bloc",
        "k.es31.valid.underscore_instance_name_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007248,
        "dEQP-GLES31.functional.shaders.uniform_block",
        ".es31.valid.underscore_instance_name_fragment");
