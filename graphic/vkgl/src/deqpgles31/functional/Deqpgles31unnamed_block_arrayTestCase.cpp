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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020361,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.unnamed_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020362,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.unnamed_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020363,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.unnamed_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020364,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.unnamed_block.array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020365,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.unnamed_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020366,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.unnamed_block.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020932,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.unnamed_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020933,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.unnamed_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020934,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.unnamed_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020935,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.unnamed_block.array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020936,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.unnamed_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020937,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.unnamed_block.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021540,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.unnamed_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021541,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.unnamed_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021542,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.unnamed_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021543,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.unnamed_block.array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021544,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.unnamed_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021545,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.unnamed_block.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022194,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.unnamed_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022195,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.unnamed_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022196,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.unnamed_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022197,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.unnamed_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022198,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.unnamed_block.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022199,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.unnamed_block.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022200,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.in.unnamed_block.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022278,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.unnamed_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022279,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.unnamed_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022280,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.unnamed_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022281,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.unnamed_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022282,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.unnamed_block.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022283,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.unnamed_block.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022284,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.type.interface_blocks.patch_in.unnamed_block.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022836,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.unnamed_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022837,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.unnamed_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022838,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.unnamed_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022839,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.unnamed_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022840,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.unnamed_block.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022841,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.unnamed_block.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022842,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.type.interface_blocks.out.unnamed_block.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022908,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.unnamed_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022909,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.unnamed_block.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022910,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.unnamed_block.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022911,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.type.interface_blocks.patch_out.unnamed_block.array.mat3x2");
