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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020696,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_row_major.unnamed_block_row_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020697,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_row_major.unnamed_block_row_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020698,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_row_major.unnamed_block_row_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020802,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_stride.unnamed_block_row_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020803,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_stride.unnamed_block_row_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020804,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_stride.unnamed_block_row_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023821,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.unnamed_block_row_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023822,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.is_row_major.unnamed_block_row_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023823,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.is",
        "_row_major.unnamed_block_row_major.no_qualifier.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023824,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.unnamed_block_row_major.no_qualifier.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023825,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.is_row_major.unnamed_block_row_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023826,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.unnamed_block_row_major.no_qualifier.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023827,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.i",
        "s_row_major.unnamed_block_row_major.no_qualifier.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023828,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.is",
        "_row_major.unnamed_block_row_major.no_qualifier.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023976,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.matrix_stride.unnamed_block_row_major.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023977,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".matrix_stride.unnamed_block_row_major.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023978,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_row_major.no_qualifier.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023979,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_row_major.no_qualifier.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023980,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.matrix_stride.unnamed_block_row_major.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023981,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_row_major.no_qualifier.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023982,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.m",
        "atrix_stride.unnamed_block_row_major.no_qualifier.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023983,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ma",
        "trix_stride.unnamed_block_row_major.no_qualifier.var_unsized_array");
