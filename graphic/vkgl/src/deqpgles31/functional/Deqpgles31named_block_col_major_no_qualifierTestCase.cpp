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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020678,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_row_major.named_block_col_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020679,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.named_block_col_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020680,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.named_block_col_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020784,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.named_block_col_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020785,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_stride.named_block_col_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020786,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.named_block_col_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023773,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.is_row_major.named_block_col_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023774,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.is_row_major.named_block_col_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023775,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.named_block_col_major.no_qualifier.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023776,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.named_block_col_major.no_qualifier.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023777,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.is_row_major.named_block_col_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023778,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.named_block_col_major.no_qualifier.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023779,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.named_block_col_major.no_qualifier.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023780,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.named_block_col_major.no_qualifier.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023928,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.matrix_stride.named_block_col_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023929,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.matrix_stride.named_block_col_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023930,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.named_block_col_major.no_qualifier.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023931,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.named_block_col_major.no_qualifier.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023932,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.matrix_stride.named_block_col_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023933,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.named_block_col_major.no_qualifier.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023934,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "matrix_stride.named_block_col_major.no_qualifier.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023935,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.named_block_col_major.no_qualifier.var_unsized_array");
