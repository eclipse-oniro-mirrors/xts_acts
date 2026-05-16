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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020620,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_row_major.default_block.no_qualifier.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020621,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.default_block.no_qualifier.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020622,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.default_block.no_qualifier.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020623,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.default_block.no_qualifier.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020624,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.default_block.no_qualifier.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020625,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.default_block.no_qualifier.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020626,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.default_block.no_qualifier.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020627,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_row_major.default_block.no_qualifier.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020628,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.default_block.no_qualifier.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020629,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_row_major.default_block.no_qualifier.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020630,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_row_major.default_block.no_qualifier.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020631,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.default_block.no_qualifier.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020632,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_row_major.default_block.no_qualifier.types.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020633,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.default_block.no_qualifier.types.sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020634,
        "dEQP-GLES31.functional.program_interface_query.uniform.matri",
        "x_row_major.default_block.no_qualifier.types.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020635,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_row_major.default_block.no_qualifier.types.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020636,
        "dEQP-GLES31.functional.program_interface_query.uniform.matrix",
        "_row_major.default_block.no_qualifier.types.sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020637,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.default_block.no_qualifier.types.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020638,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.default_block.no_qualifier.types.usampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020639,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_row_major.default_block.no_qualifier.types.sampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020640,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_row_major.default_block.no_qualifier.types.isampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020641,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_row_major.default_block.no_qualifier.types.image_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020642,
        "dEQP-GLES31.functional.program_interface_query.uniform.matri",
        "x_row_major.default_block.no_qualifier.types.iimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020643,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_row_major.default_block.no_qualifier.types.uimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020644,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.default_block.no_qualifier.types.atomic_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020648,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.named_block.no_qualifier.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020649,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block.no_qualifier.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020650,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block.no_qualifier.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020651,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block.no_qualifier.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020652,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block.no_qualifier.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020653,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block.no_qualifier.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020654,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block.no_qualifier.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020655,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.named_block.no_qualifier.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020656,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block.no_qualifier.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020657,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.named_block.no_qualifier.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020658,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.named_block.no_qualifier.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020659,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block.no_qualifier.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020714,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.default_block.no_qualifier.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020715,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.default_block.no_qualifier.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020716,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.default_block.no_qualifier.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020717,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.default_block.no_qualifier.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020718,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.default_block.no_qualifier.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020719,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.default_block.no_qualifier.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020720,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.default_block.no_qualifier.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020721,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_stride.default_block.no_qualifier.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020722,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.default_block.no_qualifier.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020723,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_stride.default_block.no_qualifier.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020724,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_stride.default_block.no_qualifier.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020725,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.default_block.no_qualifier.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020726,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.default_block.no_qualifier.types.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020727,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_stride.default_block.no_qualifier.types.sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020728,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_stride.default_block.no_qualifier.types.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020729,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.default_block.no_qualifier.types.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020730,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_stride.default_block.no_qualifier.types.sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020731,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.default_block.no_qualifier.types.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020732,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.default_block.no_qualifier.types.usampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020733,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_stride.default_block.no_qualifier.types.sampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020734,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_stride.default_block.no_qualifier.types.isampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020735,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_stride.default_block.no_qualifier.types.image_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020736,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_stride.default_block.no_qualifier.types.iimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020737,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_stride.default_block.no_qualifier.types.uimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020738,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.default_block.no_qualifier.types.atomic_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020742,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.named_block.no_qualifier.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020743,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.matrix_stride.named_block.no_qualifier.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020744,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.named_block.no_qualifier.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020745,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.named_block.no_qualifier.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020746,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.named_block.no_qualifier.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020747,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.named_block.no_qualifier.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020748,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.named_block.no_qualifier.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020749,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.named_block.no_qualifier.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020750,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.named_block.no_qualifier.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020751,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.named_block.no_qualifier.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020752,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.named_block.no_qualifier.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020753,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.named_block.no_qualifier.types.mat4");
