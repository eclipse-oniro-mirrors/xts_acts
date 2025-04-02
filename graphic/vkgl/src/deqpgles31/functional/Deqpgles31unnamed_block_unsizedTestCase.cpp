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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023559,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.unnamed_block.unsized.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023560,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_size.unnamed_block.unsized.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023561,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.unnamed_block.unsized.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023562,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.unnamed_block.unsized.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023563,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.unnamed_block.unsized.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023564,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_size.unnamed_block.unsized.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023565,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.unnamed_block.unsized.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023566,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.unnamed_block.unsized.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023567,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.unnamed_block.unsized.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023568,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.unnamed_block.unsized.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023569,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.unnamed_block.unsized.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023570,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_size.unnamed_block.unsized.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023571,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_size.unnamed_block.unsized.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023672,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.unnamed_block.unsized.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023673,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.array_stride.unnamed_block.unsized.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023674,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.unnamed_block.unsized.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023675,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.unnamed_block.unsized.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023676,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.unnamed_block.unsized.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023677,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.array_stride.unnamed_block.unsized.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023678,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.unnamed_block.unsized.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023679,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.unnamed_block.unsized.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023680,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.unnamed_block.unsized.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023681,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.unnamed_block.unsized.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023682,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.unnamed_block.unsized.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023683,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.array_stride.unnamed_block.unsized.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023684,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_stride.unnamed_block.unsized.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024061,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.name_length.unnamed_block.unsized.var");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024062,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.name_length.unnamed_block.unsized.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024063,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.name_length.unnamed_block.unsized.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024064,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.name_length.unnamed_block.unsized.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024065,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.name_length.unnamed_block.unsized.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024066,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.name_length.unnamed_block.unsized.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024067,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.name_length.unnamed_block.unsized.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024127,
        "dEQP-GLES31.functional.program_interface_query.",
        "buffer_variable.offset.unnamed_block.unsized.var");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024128,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.offset.unnamed_block.unsized.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024129,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.offset.unnamed_block.unsized.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024130,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.offset.unnamed_block.unsized.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024131,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.offset.unnamed_block.unsized.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024132,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.offset.unnamed_block.unsized.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_024133,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.offset.unnamed_block.unsized.var_array_array");
