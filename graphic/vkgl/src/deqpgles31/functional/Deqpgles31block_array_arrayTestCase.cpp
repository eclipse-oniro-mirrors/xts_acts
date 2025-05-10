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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020379,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.block_array.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020380,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_stride.block_array.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020381,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.block_array.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020382,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.block_array.array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020383,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.block_array.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020384,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.block_array.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020950,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.block_array.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020951,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.offset.block_array.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020952,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.block_array.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020953,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.block_array.array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020954,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.block_array.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020955,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.block_array.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021558,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.block_array.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021559,
        "dEQP-GLES31.functional.program_interface",
        "_query.uniform.type.block_array.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021560,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.block_array.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021561,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.block_array.array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021562,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.block_array.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021563,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.block_array.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022215,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.block_array.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022216,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.type.interface_blocks.in.block_array.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022217,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.block_array.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022218,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.block_array.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022219,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.block_array.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022220,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.block_array.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022221,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.block_array.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022299,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.block_array.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022300,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.type.interface_blocks.patch_in.block_array.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022301,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.block_array.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022302,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.block_array.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022303,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.block_array.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022304,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.block_array.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022305,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.block_array.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022857,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.block_array.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022858,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.type.interface_blocks.out.block_array.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022859,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.block_array.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022860,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.block_array.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022861,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.block_array.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022862,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.block_array.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022863,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.block_array.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022923,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.patch_out.block_array.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022924,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.patch_out.block_array.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022925,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.type.interface_blocks.patch_out.block_array.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022926,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.block_array.array.mat3x2");
