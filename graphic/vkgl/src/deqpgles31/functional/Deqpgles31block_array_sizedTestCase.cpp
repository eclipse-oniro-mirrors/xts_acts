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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023572,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.array_size.block_array.sized.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023573,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.block_array.sized.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023574,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.block_array.sized.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023575,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.array_size.block_array.sized.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023576,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.array_size.block_array.sized.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023577,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.block_array.sized.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023578,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.block_array.sized.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023579,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.array_size.block_array.sized.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023580,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.block_array.sized.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023581,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.block_array.sized.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023582,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.array_size.block_array.sized.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023583,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.block_array.sized.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023584,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.block_array.sized.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023685,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_stride.block_array.sized.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023686,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.block_array.sized.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023687,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.block_array.sized.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023688,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_stride.block_array.sized.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023689,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_stride.block_array.sized.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023690,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.block_array.sized.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023691,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.block_array.sized.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023692,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_stride.block_array.sized.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023693,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.block_array.sized.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023694,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.block_array.sized.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023695,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_stride.block_array.sized.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023696,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.block_array.sized.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023697,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.block_array.sized.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024068,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.name_length.block_array.sized.var");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024069,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.name_length.block_array.sized.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024070,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.name_length.block_array.sized.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024071,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.block_array.sized.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024072,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.block_array.sized.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024073,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.name_length.block_array.sized.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024074,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.block_array.sized.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024075,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.name_length.block_array.sized.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024076,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.name_length.block_array.sized.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024077,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.name_length.block_array.sized.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024078,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.block_array.sized.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024079,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.name_length.block_array.sized.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024080,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.name_length.block_array.sized.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024081,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.name_length.block_array.sized.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024082,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.name_length.block_array.sized.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024134,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.offset.block_array.sized.var");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024135,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.offset.block_array.sized.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024136,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.offset.block_array.sized.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024137,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.offset.block_array.sized.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024138,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.block_array.sized.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024139,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.offset.block_array.sized.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024140,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.block_array.sized.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024141,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.block_array.sized.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024142,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.offset.block_array.sized.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024143,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.offset.block_array.sized.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024144,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.block_array.sized.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024145,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.block_array.sized.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024146,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.offset.block_array.sized.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024147,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.block_array.sized.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024148,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.offset.block_array.sized.var_array_array_array");
