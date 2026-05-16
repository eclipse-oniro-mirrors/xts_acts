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
#include "../ActsDeqpgles310021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020355,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.array_stride.unnamed_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020356,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_stride.unnamed_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020357,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_stride.unnamed_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020358,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_stride.unnamed_block.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020359,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_stride.unnamed_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020360,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_stride.unnamed_block.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020926,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.offset.unnamed_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020927,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.unnamed_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020928,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.unnamed_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020929,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.unnamed_block.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020930,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.unnamed_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020931,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.unnamed_block.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021534,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.type.unnamed_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021535,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.unnamed_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021536,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.unnamed_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021537,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.unnamed_block.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021538,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.unnamed_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021539,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.unnamed_block.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022187,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.in.unnamed_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022188,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.unnamed_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022189,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.unnamed_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022190,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.unnamed_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022191,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.in.unnamed_block.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022192,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.in.unnamed_block.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022193,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.in.unnamed_block.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022271,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "type.interface_blocks.patch_in.unnamed_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022272,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.unnamed_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022273,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.unnamed_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022274,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.unnamed_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022275,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "type.interface_blocks.patch_in.unnamed_block.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022276,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "type.interface_blocks.patch_in.unnamed_block.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022277,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "type.interface_blocks.patch_in.unnamed_block.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022829,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.out.unnamed_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022830,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.unnamed_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022831,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.unnamed_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022832,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.unnamed_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022833,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.out.unnamed_block.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022834,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.out.unnamed_block.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022835,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.out.unnamed_block.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022901,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "type.interface_blocks.patch_out.unnamed_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022902,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.unnamed_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022903,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.unnamed_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022904,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.unnamed_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022905,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "type.interface_blocks.patch_out.unnamed_block.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022906,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "type.interface_blocks.patch_out.unnamed_block.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022907,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "type.interface_blocks.patch_out.unnamed_block.basic_type.mat3x2");
