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
#include "../ActsDeqpgles310024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023505,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_size.named_block.sized.aggregates.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023506,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_size.named_block.sized.aggregates.float_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023507,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.float_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023508,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_size.named_block.sized.aggregates.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023509,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.float_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023510,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.float_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023511,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_size.named_block.sized.aggregates.bool_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023512,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.array_size.named_block.sized.aggregates.bool_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023513,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_size.named_block.sized.aggregates.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023514,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_size.named_block.sized.aggregates.bvec3_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023515,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.bvec3_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023516,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_size.named_block.sized.aggregates.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023517,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.bvec3_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023518,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.bvec3_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023519,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_size.named_block.sized.aggregates.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023520,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.vec4_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023521,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.vec4_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023522,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.array_size.named_block.sized.aggregates.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023523,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.vec4_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023524,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.array_size.named_block.sized.aggregates.vec4_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023525,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_size.named_block.sized.aggregates.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023526,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_size.named_block.sized.aggregates.ivec2_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023527,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.ivec2_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023528,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_size.named_block.sized.aggregates.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023529,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.ivec2_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023530,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_size.named_block.sized.aggregates.ivec2_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023618,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_stride.named_block.sized.aggregates.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023619,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".array_stride.named_block.sized.aggregates.float_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023620,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.float_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023621,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_stride.named_block.sized.aggregates.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023622,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.float_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023623,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.float_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023624,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_stride.named_block.sized.aggregates.bool_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023625,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_stride.named_block.sized.aggregates.bool_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023626,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_stride.named_block.sized.aggregates.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023627,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".array_stride.named_block.sized.aggregates.bvec3_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023628,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.bvec3_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023629,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_stride.named_block.sized.aggregates.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023630,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.bvec3_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023631,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.bvec3_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023632,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_stride.named_block.sized.aggregates.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023633,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.vec4_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023634,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.vec4_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023635,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_stride.named_block.sized.aggregates.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023636,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.vec4_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023637,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.array_stride.named_block.sized.aggregates.vec4_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023638,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_stride.named_block.sized.aggregates.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023639,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".array_stride.named_block.sized.aggregates.ivec2_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023640,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.ivec2_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023641,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_stride.named_block.sized.aggregates.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023642,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.ivec2_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023643,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.array_stride.named_block.sized.aggregates.ivec2_array_array");
