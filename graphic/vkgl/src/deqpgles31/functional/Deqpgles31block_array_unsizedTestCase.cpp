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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023585,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.block_array.unsized.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023586,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.block_array.unsized.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023587,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.block_array.unsized.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023588,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.block_array.unsized.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023589,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.block_array.unsized.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023590,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.block_array.unsized.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023591,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.block_array.unsized.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023592,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.block_array.unsized.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023593,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.block_array.unsized.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023594,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.block_array.unsized.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023595,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.block_array.unsized.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023596,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.block_array.unsized.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023597,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.block_array.unsized.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023698,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.block_array.unsized.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023699,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.block_array.unsized.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023700,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.block_array.unsized.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023701,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.block_array.unsized.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023702,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.block_array.unsized.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023703,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.block_array.unsized.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023704,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.block_array.unsized.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023705,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.block_array.unsized.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023706,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.block_array.unsized.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023707,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.block_array.unsized.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023708,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.block_array.unsized.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023709,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.block_array.unsized.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023710,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.block_array.unsized.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024083,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.name_length.block_array.unsized.var");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024084,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.name_length.block_array.unsized.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024085,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.name_length.block_array.unsized.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024086,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.name_length.block_array.unsized.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024087,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.name_length.block_array.unsized.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024088,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.name_length.block_array.unsized.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024089,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.name_length.block_array.unsized.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024149,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.offset.block_array.unsized.var");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024150,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.offset.block_array.unsized.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024151,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.offset.block_array.unsized.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024152,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.offset.block_array.unsized.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024153,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.offset.block_array.unsized.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024154,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.offset.block_array.unsized.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024155,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.offset.block_array.unsized.var_array_array");
