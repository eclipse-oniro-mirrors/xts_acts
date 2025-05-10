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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020367,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.array_stride.unnamed_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020368,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.unnamed_block.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020369,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.unnamed_block.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020370,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.unnamed_block.struct.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020371,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.unnamed_block.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020372,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.unnamed_block.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020938,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.offset.unnamed_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020939,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.unnamed_block.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020940,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.unnamed_block.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020941,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.unnamed_block.struct.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020942,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.unnamed_block.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020943,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.unnamed_block.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021546,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.type.unnamed_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021547,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.unnamed_block.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021548,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.unnamed_block.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021549,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.unnamed_block.struct.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021550,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.unnamed_block.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021551,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.unnamed_block.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022201,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.unnamed_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022202,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.unnamed_block.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022203,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.unnamed_block.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022204,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.unnamed_block.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022205,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.unnamed_block.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022206,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.unnamed_block.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022207,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.unnamed_block.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022285,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.unnamed_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022286,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.unnamed_block.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022287,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.unnamed_block.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022288,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.unnamed_block.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022289,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.unnamed_block.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022290,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.unnamed_block.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022291,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.unnamed_block.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022843,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.unnamed_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022844,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.unnamed_block.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022845,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.unnamed_block.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022846,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.unnamed_block.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022847,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.unnamed_block.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022848,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.unnamed_block.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022849,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.unnamed_block.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022912,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.unnamed_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022913,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.unnamed_block.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022914,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.unnamed_block.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022915,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.unnamed_block.struct.mat3x2");
