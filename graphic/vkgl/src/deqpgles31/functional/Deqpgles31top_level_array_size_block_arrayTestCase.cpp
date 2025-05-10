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
#include "../ActsDeqpgles310025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024452,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.top_level_array_size.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024453,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.top_level_array_size.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024454,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.top_level_array_size.block_array.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024455,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_size.block_array.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024456,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.block_array.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024457,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.top_level_array_size.block_array.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024458,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.block_array.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024459,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.block_array.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024460,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.top_level_array_size.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024461,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.top_level_array_size.block_array.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024462,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.block_array.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024463,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.block_array.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024464,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.top_level_array_size.block_array.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024465,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.block_array.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024466,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.top_level_array_size.block_array.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024467,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.top_level_array_size.block_array.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024468,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_size.block_array.var_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024469,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "top_level_array_size.block_array.var_struct_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024470,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "top_level_array_size.block_array.var_array_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024471,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.block_array.var_array_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024472,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "top_level_array_size.block_array.var_struct_array_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024473,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".top_level_array_size.block_array.var_array_array_unsized_array");
