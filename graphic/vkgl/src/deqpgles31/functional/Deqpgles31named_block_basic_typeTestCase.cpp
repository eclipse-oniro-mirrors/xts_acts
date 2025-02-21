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
#include "../ActsDeqpgles310023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022145,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.named_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022146,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.named_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022147,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.named_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022148,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.named_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022149,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.named_block.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022150,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.named_block.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022151,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.named_block.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022229,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.named_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022230,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.named_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022231,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.named_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022232,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.named_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022233,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.named_block.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022234,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.named_block.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022235,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.named_block.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022787,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.named_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022788,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.named_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022789,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.named_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022790,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.named_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022791,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.named_block.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022792,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.named_block.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022793,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.named_block.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022871,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.named_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022872,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.named_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022873,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.named_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022874,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.named_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022875,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.named_block.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022876,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.named_block.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022877,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.named_block.basic_type.mat3x2");
