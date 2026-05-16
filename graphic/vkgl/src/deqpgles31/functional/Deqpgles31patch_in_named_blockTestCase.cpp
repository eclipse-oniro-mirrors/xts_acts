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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021800,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.resource_list.interface_blocks.patch_in.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021801,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "resource_list.interface_blocks.patch_in.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021802,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "resource_list.interface_blocks.patch_in.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021835,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.array_size.interface_blocks.patch_in.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021836,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".array_size.interface_blocks.patch_in.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021837,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.array_size.interface_blocks.patch_in.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021890,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.location.interface_blocks.patch_in.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021891,
        "dEQP-GLES31.functional.program_interface_query.program_input.loc",
        "ation.interface_blocks.patch_in.named_block.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021892,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.location.interface_blocks.patch_in.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021893,
        "dEQP-GLES31.functional.program_interface_query.program_input.locatio",
        "n.interface_blocks.patch_in.named_block.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021894,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.location.interface_blocks.patch_in.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021895,
        "dEQP-GLES31.functional.program_interface_query.program_input.locati",
        "on.interface_blocks.patch_in.named_block.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021934,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.name_length.interface_blocks.patch_in.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021935,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".name_length.interface_blocks.patch_in.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021936,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".name_length.interface_blocks.patch_in.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022336,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.is_per_patch.interface_blocks.patch_in.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022337,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "is_per_patch.interface_blocks.patch_in.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022338,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".is_per_patch.interface_blocks.patch_in.named_block.var_array");
