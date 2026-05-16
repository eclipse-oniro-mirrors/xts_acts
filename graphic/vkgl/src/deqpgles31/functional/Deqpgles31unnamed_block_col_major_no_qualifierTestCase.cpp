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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020705,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_row_major.unnamed_block_col_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020706,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_row_major.unnamed_block_col_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020707,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_row_major.unnamed_block_col_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020811,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_stride.unnamed_block_col_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020812,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_stride.unnamed_block_col_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020813,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_stride.unnamed_block_col_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023845,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.unnamed_block_col_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023846,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.is_row_major.unnamed_block_col_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023847,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.is",
        "_row_major.unnamed_block_col_major.no_qualifier.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023848,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.unnamed_block_col_major.no_qualifier.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023849,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.is_row_major.unnamed_block_col_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023850,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.unnamed_block_col_major.no_qualifier.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023851,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.unnamed_block_col_major.no_qualifier.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023852,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.is",
        "_row_major.unnamed_block_col_major.no_qualifier.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024000,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.matrix_stride.unnamed_block_col_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024001,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".matrix_stride.unnamed_block_col_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024002,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_col_major.no_qualifier.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024003,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_col_major.no_qualifier.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024004,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.matrix_stride.unnamed_block_col_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024005,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_col_major.no_qualifier.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024006,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.unnamed_block_col_major.no_qualifier.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024007,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_col_major.no_qualifier.var_unsized_array");
