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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020373,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.array_stride.block_array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020374,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_stride.block_array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020375,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_stride.block_array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020376,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_stride.block_array.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020377,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_stride.block_array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020378,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_stride.block_array.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020944,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.offset.block_array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020945,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.block_array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020946,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.block_array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020947,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.block_array.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020948,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.block_array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020949,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.block_array.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021552,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.type.block_array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021553,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.block_array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021554,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.block_array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021555,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.block_array.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021556,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.block_array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021557,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.block_array.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022208,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.block_array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022209,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.block_array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022210,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.block_array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022211,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.block_array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022212,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.block_array.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022213,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.block_array.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022214,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.in.block_array.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022292,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.block_array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022293,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.block_array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022294,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.block_array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022295,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.block_array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022296,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.block_array.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022297,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.block_array.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022298,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".type.interface_blocks.patch_in.block_array.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022850,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.block_array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022851,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.block_array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022852,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.block_array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022853,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.block_array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022854,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.block_array.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022855,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.block_array.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022856,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.out.block_array.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022916,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.block_array.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022917,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.block_array.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022918,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.block_array.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022919,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.block_array.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022920,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.block_array.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022921,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.block_array.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022922,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".type.interface_blocks.patch_out.block_array.basic_type.mat3x2");
