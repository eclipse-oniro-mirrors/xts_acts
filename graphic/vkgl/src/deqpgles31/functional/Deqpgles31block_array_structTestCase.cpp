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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020385,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.block_array.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020386,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.block_array.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020387,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.block_array.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020388,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.block_array.struct.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020389,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.block_array.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020390,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.block_array.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020956,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.block_array.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020957,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.block_array.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020958,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.block_array.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020959,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.block_array.struct.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020960,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.block_array.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020961,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.block_array.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021564,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.block_array.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021565,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.block_array.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021566,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.block_array.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021567,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.block_array.struct.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021568,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.block_array.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021569,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.block_array.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022222,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.block_array.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022223,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.block_array.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022224,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.block_array.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022225,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.interface_blocks.in.block_array.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022226,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.block_array.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022227,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.block_array.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022228,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.type.interface_blocks.in.block_array.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022306,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.block_array.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022307,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.block_array.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022308,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.block_array.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022309,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.type.interface_blocks.patch_in.block_array.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022310,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.block_array.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022311,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.block_array.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022312,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.type.interface_blocks.patch_in.block_array.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022864,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.block_array.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022865,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.block_array.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022866,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.block_array.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022867,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.interface_blocks.out.block_array.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022868,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.block_array.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022869,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.block_array.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022870,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.type.interface_blocks.out.block_array.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022927,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.block_array.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022928,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.block_array.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022929,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.block_array.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_022930,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.type.interface_blocks.patch_out.block_array.struct.mat3x2");
