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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020663,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.matrix_row_major.named_block.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020664,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_row_major.named_block.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020665,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.matrix_row_major.named_block.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023741,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.is_row_major.named_block.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023742,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.is_row_major.named_block.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023743,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.is_row_major.named_block.row_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023744,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.is_row_major.named_block.row_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023745,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.is_row_major.named_block.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023746,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.is_row_major.named_block.row_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023747,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.is_row_major.named_block.row_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023748,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.is_row_major.named_block.row_major.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023896,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.matrix_stride.named_block.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023897,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.matrix_stride.named_block.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023898,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.matrix_stride.named_block.row_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023899,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.matrix_stride.named_block.row_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023900,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.matrix_stride.named_block.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023901,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.matrix_stride.named_block.row_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023902,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.matrix_stride.named_block.row_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023903,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.matrix_stride.named_block.row_major.var_unsized_array");
