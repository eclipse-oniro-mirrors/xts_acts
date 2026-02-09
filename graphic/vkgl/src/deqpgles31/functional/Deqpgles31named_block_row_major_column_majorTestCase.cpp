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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020675,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_row_major.named_block_row_major.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020676,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.named_block_row_major.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020677,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.named_block_row_major.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020781,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.named_block_row_major.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020782,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_stride.named_block_row_major.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020783,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.named_block_row_major.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023757,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.is_row_major.named_block_row_major.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023758,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.is_row_major.named_block_row_major.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023759,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.named_block_row_major.column_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023760,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.named_block_row_major.column_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023761,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.is_row_major.named_block_row_major.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023762,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.named_block_row_major.column_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023763,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.named_block_row_major.column_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023764,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.named_block_row_major.column_major.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023912,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.matrix_stride.named_block_row_major.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023913,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.matrix_stride.named_block_row_major.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023914,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.named_block_row_major.column_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023915,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.named_block_row_major.column_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023916,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.matrix_stride.named_block_row_major.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023917,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.named_block_row_major.column_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023918,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "matrix_stride.named_block_row_major.column_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023919,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.named_block_row_major.column_major.var_unsized_array");
