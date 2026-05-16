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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021809,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.resource_list.interface_blocks.patch_in.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021810,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "resource_list.interface_blocks.patch_in.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021811,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "resource_list.interface_blocks.patch_in.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021844,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.array_size.interface_blocks.patch_in.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021845,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".array_size.interface_blocks.patch_in.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021846,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.array_size.interface_blocks.patch_in.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021908,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.location.interface_blocks.patch_in.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021909,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.location.interface_blocks.patch_in.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021910,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.location.interface_blocks.patch_in.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021943,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.name_length.interface_blocks.patch_in.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021944,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".name_length.interface_blocks.patch_in.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021945,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".name_length.interface_blocks.patch_in.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022345,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.is_per_patch.interface_blocks.patch_in.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022346,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "is_per_patch.interface_blocks.patch_in.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022347,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".is_per_patch.interface_blocks.patch_in.block_array.var_array");
