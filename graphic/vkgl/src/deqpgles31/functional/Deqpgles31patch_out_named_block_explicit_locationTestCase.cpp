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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022387,
        "dEQP-GLES31.functional.program_interface_query.program_output.resour",
        "ce_list.interface_blocks.patch_out.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022388,
        "dEQP-GLES31.functional.program_interface_query.program_output.resource_",
        "list.interface_blocks.patch_out.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022389,
        "dEQP-GLES31.functional.program_interface_query.program_output.resource_",
        "list.interface_blocks.patch_out.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022428,
        "dEQP-GLES31.functional.program_interface_query.program_output.arra",
        "y_size.interface_blocks.patch_out.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022429,
        "dEQP-GLES31.functional.program_interface_query.program_output.array_si",
        "ze.interface_blocks.patch_out.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022430,
        "dEQP-GLES31.functional.program_interface_query.program_output.array_s",
        "ize.interface_blocks.patch_out.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022498,
        "dEQP-GLES31.functional.program_interface_query.program_output.loc",
        "ation.interface_blocks.patch_out.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022499,
        "dEQP-GLES31.functional.program_interface_query.program_output.location.int",
        "erface_blocks.patch_out.named_block_explicit_location.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022500,
        "dEQP-GLES31.functional.program_interface_query.program_output.locatio",
        "n.interface_blocks.patch_out.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022501,
        "dEQP-GLES31.functional.program_interface_query.program_output.location.interfa",
        "ce_blocks.patch_out.named_block_explicit_location.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022502,
        "dEQP-GLES31.functional.program_interface_query.program_output.locati",
        "on.interface_blocks.patch_out.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022503,
        "dEQP-GLES31.functional.program_interface_query.program_output.location.interf",
        "ace_blocks.patch_out.named_block_explicit_location.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022545,
        "dEQP-GLES31.functional.program_interface_query.program_output.name_",
        "length.interface_blocks.patch_out.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022546,
        "dEQP-GLES31.functional.program_interface_query.program_output.name_len",
        "gth.interface_blocks.patch_out.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022547,
        "dEQP-GLES31.functional.program_interface_query.program_output.name_len",
        "gth.interface_blocks.patch_out.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022963,
        "dEQP-GLES31.functional.program_interface_query.program_output.is_pe",
        "r_patch.interface_blocks.patch_out.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022964,
        "dEQP-GLES31.functional.program_interface_query.program_output.is_per_pa",
        "tch.interface_blocks.patch_out.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022965,
        "dEQP-GLES31.functional.program_interface_query.program_output.is_per_p",
        "atch.interface_blocks.patch_out.named_block_explicit_location.var_array");
