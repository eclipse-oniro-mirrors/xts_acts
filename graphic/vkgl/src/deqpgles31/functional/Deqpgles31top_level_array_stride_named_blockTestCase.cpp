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
#include "../ActsDeqpgles310025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024474,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.top_level_array_stride.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024475,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.top_level_array_stride.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024476,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.top_level_array_stride.named_block.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024477,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.top_level_array_stride.named_block.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024478,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_stride.named_block.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024479,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.top_level_array_stride.named_block.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024480,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_stride.named_block.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024481,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_stride.named_block.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024482,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.top_level_array_stride.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024483,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.top_level_array_stride.named_block.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024484,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_stride.named_block.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024485,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_stride.named_block.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024486,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.top_level_array_stride.named_block.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024487,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_stride.named_block.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024488,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_stride.named_block.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024489,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.top_level_array_stride.named_block.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024490,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.top_level_array_stride.named_block.var_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024491,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.t",
        "op_level_array_stride.named_block.var_struct_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024492,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.t",
        "op_level_array_stride.named_block.var_array_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024493,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_stride.named_block.var_array_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024494,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.t",
        "op_level_array_stride.named_block.var_struct_array_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024495,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "top_level_array_stride.named_block.var_array_array_unsized_array");
