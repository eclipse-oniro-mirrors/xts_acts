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
#include "../ActsDeqpgles310024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023725,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.is_row_major.named_block.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023726,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.is_row_major.named_block.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023727,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.is_row_major.named_block.no_qualifier.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023728,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.named_block.no_qualifier.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023729,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.is_row_major.named_block.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023730,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.named_block.no_qualifier.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023731,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.is_row_major.named_block.no_qualifier.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023732,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.is_row_major.named_block.no_qualifier.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023880,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.matrix_stride.named_block.no_qualifier.var");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023881,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.matrix_stride.named_block.no_qualifier.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023882,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.named_block.no_qualifier.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023883,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.named_block.no_qualifier.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023884,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.matrix_stride.named_block.no_qualifier.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023885,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.named_block.no_qualifier.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023886,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.matrix_stride.named_block.no_qualifier.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023887,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.matrix_stride.named_block.no_qualifier.var_unsized_array");
