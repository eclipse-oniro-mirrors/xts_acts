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
#include "../ActsDeqpgles310023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022393,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.resource_list.interface_blocks.patch_out.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022394,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "resource_list.interface_blocks.patch_out.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022395,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "resource_list.interface_blocks.patch_out.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022434,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.array_size.interface_blocks.patch_out.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022435,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".array_size.interface_blocks.patch_out.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022436,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.array_size.interface_blocks.patch_out.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022510,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.location.interface_blocks.patch_out.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022511,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.location.interface_blocks.patch_out.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022512,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.location.interface_blocks.patch_out.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022551,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.name_length.interface_blocks.patch_out.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022552,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".name_length.interface_blocks.patch_out.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022553,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".name_length.interface_blocks.patch_out.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022969,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.is_per_patch.interface_blocks.patch_out.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022970,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "is_per_patch.interface_blocks.patch_out.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022971,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".is_per_patch.interface_blocks.patch_out.block_array.var_array");
