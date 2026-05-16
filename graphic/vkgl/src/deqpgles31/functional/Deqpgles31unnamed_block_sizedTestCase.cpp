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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023546,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.unnamed_block.sized.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023547,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.unnamed_block.sized.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023548,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.unnamed_block.sized.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023549,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.unnamed_block.sized.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023550,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.unnamed_block.sized.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023551,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.unnamed_block.sized.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023552,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.unnamed_block.sized.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023553,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.unnamed_block.sized.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023554,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.unnamed_block.sized.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023555,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.unnamed_block.sized.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023556,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.unnamed_block.sized.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023557,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.unnamed_block.sized.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023558,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.unnamed_block.sized.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023659,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.unnamed_block.sized.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023660,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.unnamed_block.sized.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023661,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.unnamed_block.sized.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023662,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.unnamed_block.sized.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023663,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.unnamed_block.sized.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023664,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.unnamed_block.sized.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023665,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.unnamed_block.sized.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023666,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.unnamed_block.sized.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023667,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.unnamed_block.sized.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023668,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.unnamed_block.sized.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023669,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.unnamed_block.sized.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023670,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.unnamed_block.sized.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023671,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.unnamed_block.sized.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024046,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.name_length.unnamed_block.sized.var");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024047,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.name_length.unnamed_block.sized.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024048,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.name_length.unnamed_block.sized.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024049,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.name_length.unnamed_block.sized.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024050,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.name_length.unnamed_block.sized.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024051,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.name_length.unnamed_block.sized.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024052,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.name_length.unnamed_block.sized.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024053,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.unnamed_block.sized.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024054,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.name_length.unnamed_block.sized.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024055,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.name_length.unnamed_block.sized.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024056,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.name_length.unnamed_block.sized.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024057,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.unnamed_block.sized.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024058,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.name_length.unnamed_block.sized.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024059,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.unnamed_block.sized.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024060,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.unnamed_block.sized.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024112,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.offset.unnamed_block.sized.var");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024113,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.offset.unnamed_block.sized.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024114,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.offset.unnamed_block.sized.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024115,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.offset.unnamed_block.sized.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024116,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.offset.unnamed_block.sized.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024117,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.offset.unnamed_block.sized.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024118,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.offset.unnamed_block.sized.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024119,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.offset.unnamed_block.sized.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024120,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.offset.unnamed_block.sized.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024121,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.offset.unnamed_block.sized.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024122,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.offset.unnamed_block.sized.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024123,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.offset.unnamed_block.sized.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024124,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.offset.unnamed_block.sized.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024125,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.offset.unnamed_block.sized.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024126,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.unnamed_block.sized.var_array_array_array");
