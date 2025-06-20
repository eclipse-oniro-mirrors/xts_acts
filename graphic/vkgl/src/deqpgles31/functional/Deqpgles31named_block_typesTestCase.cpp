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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020216,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020217,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.array_size.named_block.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020218,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020219,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020220,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020221,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020222,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020223,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020224,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020225,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020226,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.named_block.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020227,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020228,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_size.named_block.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020229,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_size.named_block.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020315,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020316,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.array_stride.named_block.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020317,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020318,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020319,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020320,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020321,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020322,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020323,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020324,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020325,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.named_block.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020326,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020327,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.array_stride.named_block.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020328,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.array_stride.named_block.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020899,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020900,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.offset.named_block.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020901,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020902,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020903,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020904,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020905,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020906,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020907,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020908,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020909,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020910,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020911,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020912,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020913,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020914,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020915,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020916,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.named_block.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020917,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.named_block.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020918,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.named_block.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020919,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020920,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.named_block.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020921,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.named_block.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020922,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.offset.named_block.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020923,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.offset.named_block.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021497,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021498,
        "dEQP-GLES31.functional.program_interface",
        "_query.uniform.type.named_block.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021499,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021500,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021501,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021502,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021503,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021504,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021505,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021506,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021507,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021508,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021509,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021510,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021511,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021512,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021513,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021514,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.named_block.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021515,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.named_block.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021516,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.named_block.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021517,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021518,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.named_block.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021519,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.named_block.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021520,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.type.named_block.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_021521,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.type.named_block.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023714,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.is_row_major.named_block.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023715,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.is_row_major.named_block.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023716,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.is_row_major.named_block.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023717,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.is_row_major.named_block.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023718,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.is_row_major.named_block.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023719,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.is_row_major.named_block.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023720,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.is_row_major.named_block.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023721,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.is_row_major.named_block.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023722,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.is_row_major.named_block.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023723,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.is_row_major.named_block.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023724,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.is_row_major.named_block.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023869,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.matrix_stride.named_block.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023870,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.matrix_stride.named_block.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023871,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.matrix_stride.named_block.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023872,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.matrix_stride.named_block.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023873,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.matrix_stride.named_block.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023874,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.matrix_stride.named_block.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023875,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.matrix_stride.named_block.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023876,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.matrix_stride.named_block.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023877,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.matrix_stride.named_block.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023878,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.matrix_stride.named_block.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023879,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.matrix_stride.named_block.types.mat4");
