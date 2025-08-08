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
#include "../ActsDeqpgles310022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021528,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.named_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021529,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021530,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021531,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.struct.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021532,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021533,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022159,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.named_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022160,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.named_block.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022161,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.named_block.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022162,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.named_block.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022163,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.named_block.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022164,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.named_block.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022165,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.named_block.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022243,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.named_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022244,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.named_block.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022245,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.named_block.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022246,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.named_block.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022247,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.named_block.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022248,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.named_block.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022249,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.named_block.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022801,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.named_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022802,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.named_block.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022803,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.named_block.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022804,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.named_block.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022805,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.named_block.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022806,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.named_block.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022807,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.named_block.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022882,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.named_block.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022883,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.named_block.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022884,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.named_block.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022885,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.named_block.struct.mat3x2");
