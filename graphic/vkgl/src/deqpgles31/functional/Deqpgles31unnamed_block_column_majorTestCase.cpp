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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020693,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.matrix_row_major.unnamed_block.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020694,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.unnamed_block.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020695,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_row_major.unnamed_block.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020799,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.matrix_stride.unnamed_block.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020800,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_stride.unnamed_block.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020801,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_stride.unnamed_block.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023805,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.is_row_major.unnamed_block.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023806,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.is_row_major.unnamed_block.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023807,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.is_row_major.unnamed_block.column_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023808,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.is_row_major.unnamed_block.column_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023809,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.is_row_major.unnamed_block.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023810,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.is_row_major.unnamed_block.column_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023811,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.is_row_major.unnamed_block.column_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023812,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.is_row_major.unnamed_block.column_major.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023960,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.matrix_stride.unnamed_block.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023961,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.matrix_stride.unnamed_block.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023962,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.matrix_stride.unnamed_block.column_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023963,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.matrix_stride.unnamed_block.column_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023964,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.matrix_stride.unnamed_block.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023965,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.matrix_stride.unnamed_block.column_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023966,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.unnamed_block.column_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023967,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.matrix_stride.unnamed_block.column_major.var_unsized_array");
