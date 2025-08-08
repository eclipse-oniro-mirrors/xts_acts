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
#include "../ActsDeqpgles310022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021788,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.resource_list.interface_blocks.in.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021789,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.resource_list.interface_blocks.in.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021790,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.resource_list.interface_blocks.in.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021823,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.array_size.interface_blocks.in.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021824,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.array_size.interface_blocks.in.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021825,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.array_size.interface_blocks.in.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021869,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_input.location.interface_blocks.in.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021870,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "location.interface_blocks.in.named_block.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021871,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.location.interface_blocks.in.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021872,
        "dEQP-GLES31.functional.program_interface_query.program_input.loca",
        "tion.interface_blocks.in.named_block.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021873,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.location.interface_blocks.in.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021874,
        "dEQP-GLES31.functional.program_interface_query.program_input.loc",
        "ation.interface_blocks.in.named_block.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021922,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.name_length.interface_blocks.in.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021923,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.name_length.interface_blocks.in.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021924,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.name_length.interface_blocks.in.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022324,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.is_per_patch.interface_blocks.in.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022325,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.is_per_patch.interface_blocks.in.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022326,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.is_per_patch.interface_blocks.in.named_block.var_array");
