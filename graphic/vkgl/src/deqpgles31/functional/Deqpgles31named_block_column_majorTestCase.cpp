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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020666,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.matrix_row_major.named_block.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020667,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020668,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.named_block.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023733,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.is_row_major.named_block.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023734,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.is_row_major.named_block.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023735,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.is_row_major.named_block.column_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023736,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.named_block.column_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023737,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.is_row_major.named_block.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023738,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.named_block.column_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023739,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.named_block.column_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023740,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.is_row_major.named_block.column_major.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023888,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.matrix_stride.named_block.column_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023889,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.matrix_stride.named_block.column_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023890,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.named_block.column_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023891,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.named_block.column_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023892,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.matrix_stride.named_block.column_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023893,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.named_block.column_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023894,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.matrix_stride.named_block.column_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023895,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.named_block.column_major.var_unsized_array");
