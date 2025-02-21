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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020711,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_row_major.unnamed_block_col_major.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020712,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_row_major.unnamed_block_col_major.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020713,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_row_major.unnamed_block_col_major.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020817,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_stride.unnamed_block_col_major.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020818,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_stride.unnamed_block_col_major.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020819,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_stride.unnamed_block_col_major.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023853,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.unnamed_block_col_major.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023854,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.is_row_major.unnamed_block_col_major.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023855,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.is",
        "_row_major.unnamed_block_col_major.column_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023856,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.unnamed_block_col_major.column_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023857,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.is_row_major.unnamed_block_col_major.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023858,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.unnamed_block_col_major.column_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023859,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.unnamed_block_col_major.column_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023860,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.is",
        "_row_major.unnamed_block_col_major.column_major.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024008,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.matrix_stride.unnamed_block_col_major.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024009,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".matrix_stride.unnamed_block_col_major.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024010,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_col_major.column_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024011,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_col_major.column_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024012,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.matrix_stride.unnamed_block_col_major.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024013,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_col_major.column_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024014,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.unnamed_block_col_major.column_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024015,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_col_major.column_major.var_unsized_array");
