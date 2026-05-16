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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020690,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.matrix_row_major.unnamed_block.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020691,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.matrix_row_major.unnamed_block.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020692,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.matrix_row_major.unnamed_block.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020796,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.matrix_stride.unnamed_block.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020797,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.matrix_stride.unnamed_block.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020798,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.matrix_stride.unnamed_block.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023813,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.is_row_major.unnamed_block.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023814,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.is_row_major.unnamed_block.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023815,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.unnamed_block.row_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023816,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.unnamed_block.row_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023817,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.is_row_major.unnamed_block.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023818,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.unnamed_block.row_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023819,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.is_row_major.unnamed_block.row_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023820,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.unnamed_block.row_major.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023968,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.matrix_stride.unnamed_block.row_major.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023969,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.matrix_stride.unnamed_block.row_major.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023970,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.unnamed_block.row_major.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023971,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.matrix_stride.unnamed_block.row_major.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023972,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.matrix_stride.unnamed_block.row_major.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023973,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.matrix_stride.unnamed_block.row_major.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023974,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.matrix_stride.unnamed_block.row_major.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023975,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.unnamed_block.row_major.var_unsized_array");
