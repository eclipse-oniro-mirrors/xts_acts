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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020681,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block_col_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020682,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_row_major.named_block_col_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020683,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_row_major.named_block_col_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020787,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.named_block_col_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020788,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_stride.named_block_col_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020789,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_stride.named_block_col_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023789,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.is_row_major.named_block_col_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023790,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.is_row_major.named_block_col_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023791,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".is_row_major.named_block_col_major.row_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023792,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".is_row_major.named_block_col_major.row_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023793,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.named_block_col_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023794,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".is_row_major.named_block_col_major.row_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023795,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.is_row_major.named_block_col_major.row_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023796,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".is_row_major.named_block_col_major.row_major.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023944,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.matrix_stride.named_block_col_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023945,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.named_block_col_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023946,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "matrix_stride.named_block_col_major.row_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023947,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".matrix_stride.named_block_col_major.row_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023948,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.named_block_col_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023949,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".matrix_stride.named_block_col_major.row_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023950,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".matrix_stride.named_block_col_major.row_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023951,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "matrix_stride.named_block_col_major.row_major.var_unsized_array");
