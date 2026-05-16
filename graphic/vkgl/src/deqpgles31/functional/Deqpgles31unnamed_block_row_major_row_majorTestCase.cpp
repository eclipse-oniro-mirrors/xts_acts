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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020699,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.unnamed_block_row_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020700,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.unnamed_block_row_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020701,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_row_major.unnamed_block_row_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020805,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.unnamed_block_row_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020806,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.unnamed_block_row_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020807,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_stride.unnamed_block_row_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023837,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.is_row_major.unnamed_block_row_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023838,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.is_row_major.unnamed_block_row_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023839,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.unnamed_block_row_major.row_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023840,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.unnamed_block_row_major.row_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023841,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.is_row_major.unnamed_block_row_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023842,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.unnamed_block_row_major.row_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023843,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".is_row_major.unnamed_block_row_major.row_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023844,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "is_row_major.unnamed_block_row_major.row_major.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023992,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.matrix_stride.unnamed_block_row_major.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023993,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.matrix_stride.unnamed_block_row_major.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023994,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.unnamed_block_row_major.row_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023995,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "matrix_stride.unnamed_block_row_major.row_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023996,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.matrix_stride.unnamed_block_row_major.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023997,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "matrix_stride.unnamed_block_row_major.row_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023998,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "matrix_stride.unnamed_block_row_major.row_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023999,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.unnamed_block_row_major.row_major.var_unsized_array");
