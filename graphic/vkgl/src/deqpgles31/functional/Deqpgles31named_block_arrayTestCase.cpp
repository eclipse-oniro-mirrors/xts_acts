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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021522,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021523,
        "dEQP-GLES31.functional.program_interface",
        "_query.uniform.type.named_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021524,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021525,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021526,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021527,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022152,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.named_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022153,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.type.interface_blocks.in.named_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022154,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.named_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022155,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.named_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022156,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.named_block.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022157,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.named_block.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022158,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.named_block.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022236,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.named_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022237,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.patch_in.named_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022238,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.named_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022239,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.named_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022240,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.named_block.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022241,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.named_block.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022242,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.named_block.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022794,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.named_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022795,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.type.interface_blocks.out.named_block.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022796,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.named_block.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022797,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.named_block.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022798,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.named_block.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022799,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.named_block.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022800,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.named_block.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022878,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.patch_out.named_block.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022879,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.patch_out.named_block.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022880,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.patch_out.named_block.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022881,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.named_block.array.mat3x2");
