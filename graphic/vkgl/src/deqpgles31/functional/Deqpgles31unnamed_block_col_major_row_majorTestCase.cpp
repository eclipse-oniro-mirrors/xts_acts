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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020708,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.unnamed_block_col_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020709,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.unnamed_block_col_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020710,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_row_major.unnamed_block_col_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020814,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.unnamed_block_col_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020815,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.unnamed_block_col_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020816,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.unnamed_block_col_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023861,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.is_row_major.unnamed_block_col_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023862,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.is_row_major.unnamed_block_col_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023863,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.unnamed_block_col_major.row_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023864,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.unnamed_block_col_major.row_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023865,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.is_row_major.unnamed_block_col_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023866,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.unnamed_block_col_major.row_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023867,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".is_row_major.unnamed_block_col_major.row_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023868,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.unnamed_block_col_major.row_major.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024016,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.matrix_stride.unnamed_block_col_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024017,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.matrix_stride.unnamed_block_col_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024018,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.unnamed_block_col_major.row_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024019,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "matrix_stride.unnamed_block_col_major.row_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024020,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.matrix_stride.unnamed_block_col_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024021,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "matrix_stride.unnamed_block_col_major.row_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024022,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "matrix_stride.unnamed_block_col_major.row_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024023,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.unnamed_block_col_major.row_major.var_unsized_array");
