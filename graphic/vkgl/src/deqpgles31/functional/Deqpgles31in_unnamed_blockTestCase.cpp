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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021794,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.resource_list.interface_blocks.in.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021795,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.resource_list.interface_blocks.in.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021796,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.resource_list.interface_blocks.in.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021829,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.array_size.interface_blocks.in.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021830,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.array_size.interface_blocks.in.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021831,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.array_size.interface_blocks.in.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021881,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.location.interface_blocks.in.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021882,
        "dEQP-GLES31.functional.program_interface_query.program_input.l",
        "ocation.interface_blocks.in.unnamed_block.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021883,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.location.interface_blocks.in.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021884,
        "dEQP-GLES31.functional.program_interface_query.program_input.locat",
        "ion.interface_blocks.in.unnamed_block.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021885,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.location.interface_blocks.in.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021886,
        "dEQP-GLES31.functional.program_interface_query.program_input.loca",
        "tion.interface_blocks.in.unnamed_block.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021928,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.name_length.interface_blocks.in.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021929,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.name_length.interface_blocks.in.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021930,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.name_length.interface_blocks.in.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022330,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.is_per_patch.interface_blocks.in.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022331,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.is_per_patch.interface_blocks.in.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022332,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.is_per_patch.interface_blocks.in.unnamed_block.var_array");
