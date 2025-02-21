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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024408,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.top_level_array_size.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024409,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.top_level_array_size.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024410,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.top_level_array_size.named_block.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024411,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_size.named_block.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024412,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.named_block.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024413,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.top_level_array_size.named_block.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024414,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.named_block.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024415,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.named_block.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024416,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.top_level_array_size.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024417,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.top_level_array_size.named_block.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024418,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.named_block.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024419,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.named_block.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024420,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.top_level_array_size.named_block.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024421,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.named_block.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024422,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.top_level_array_size.named_block.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024423,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.top_level_array_size.named_block.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024424,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_size.named_block.var_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024425,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "top_level_array_size.named_block.var_struct_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024426,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "top_level_array_size.named_block.var_array_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024427,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.top_level_array_size.named_block.var_array_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024428,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "top_level_array_size.named_block.var_struct_array_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024429,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".top_level_array_size.named_block.var_array_array_unsized_array");
