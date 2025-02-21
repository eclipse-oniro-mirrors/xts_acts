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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022384,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.resource_list.interface_blocks.patch_out.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022385,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "resource_list.interface_blocks.patch_out.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022386,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "resource_list.interface_blocks.patch_out.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022425,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.array_size.interface_blocks.patch_out.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022426,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".array_size.interface_blocks.patch_out.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022427,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.array_size.interface_blocks.patch_out.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022492,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.location.interface_blocks.patch_out.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022493,
        "dEQP-GLES31.functional.program_interface_query.program_output.loc",
        "ation.interface_blocks.patch_out.named_block.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022494,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.location.interface_blocks.patch_out.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022495,
        "dEQP-GLES31.functional.program_interface_query.program_output.locatio",
        "n.interface_blocks.patch_out.named_block.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022496,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.location.interface_blocks.patch_out.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022497,
        "dEQP-GLES31.functional.program_interface_query.program_output.locati",
        "on.interface_blocks.patch_out.named_block.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022542,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.name_length.interface_blocks.patch_out.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022543,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".name_length.interface_blocks.patch_out.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022544,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".name_length.interface_blocks.patch_out.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022960,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.is_per_patch.interface_blocks.patch_out.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022961,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "is_per_patch.interface_blocks.patch_out.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022962,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".is_per_patch.interface_blocks.patch_out.named_block.var_array");
