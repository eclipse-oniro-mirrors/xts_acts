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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021803,
        "dEQP-GLES31.functional.program_interface_query.program_input.resour",
        "ce_list.interface_blocks.patch_in.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021804,
        "dEQP-GLES31.functional.program_interface_query.program_input.resource_",
        "list.interface_blocks.patch_in.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021805,
        "dEQP-GLES31.functional.program_interface_query.program_input.resource_",
        "list.interface_blocks.patch_in.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021838,
        "dEQP-GLES31.functional.program_interface_query.program_input.arra",
        "y_size.interface_blocks.patch_in.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021839,
        "dEQP-GLES31.functional.program_interface_query.program_input.array_si",
        "ze.interface_blocks.patch_in.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021840,
        "dEQP-GLES31.functional.program_interface_query.program_input.array_s",
        "ize.interface_blocks.patch_in.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021896,
        "dEQP-GLES31.functional.program_interface_query.program_input.loc",
        "ation.interface_blocks.patch_in.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021897,
        "dEQP-GLES31.functional.program_interface_query.program_input.location.int",
        "erface_blocks.patch_in.named_block_explicit_location.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021898,
        "dEQP-GLES31.functional.program_interface_query.program_input.locatio",
        "n.interface_blocks.patch_in.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021899,
        "dEQP-GLES31.functional.program_interface_query.program_input.location.interfa",
        "ce_blocks.patch_in.named_block_explicit_location.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021900,
        "dEQP-GLES31.functional.program_interface_query.program_input.locati",
        "on.interface_blocks.patch_in.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021901,
        "dEQP-GLES31.functional.program_interface_query.program_input.location.interf",
        "ace_blocks.patch_in.named_block_explicit_location.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021937,
        "dEQP-GLES31.functional.program_interface_query.program_input.name_",
        "length.interface_blocks.patch_in.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021938,
        "dEQP-GLES31.functional.program_interface_query.program_input.name_len",
        "gth.interface_blocks.patch_in.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021939,
        "dEQP-GLES31.functional.program_interface_query.program_input.name_len",
        "gth.interface_blocks.patch_in.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022339,
        "dEQP-GLES31.functional.program_interface_query.program_input.is_pe",
        "r_patch.interface_blocks.patch_in.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022340,
        "dEQP-GLES31.functional.program_interface_query.program_input.is_per_pa",
        "tch.interface_blocks.patch_in.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022341,
        "dEQP-GLES31.functional.program_interface_query.program_input.is_per_p",
        "atch.interface_blocks.patch_in.named_block_explicit_location.var_array");
