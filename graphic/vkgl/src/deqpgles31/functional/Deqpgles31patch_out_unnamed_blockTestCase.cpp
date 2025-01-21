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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022390,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.resource_list.interface_blocks.patch_out.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022391,
        "dEQP-GLES31.functional.program_interface_query.program_output.r",
        "esource_list.interface_blocks.patch_out.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022392,
        "dEQP-GLES31.functional.program_interface_query.program_output.r",
        "esource_list.interface_blocks.patch_out.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022431,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.array_size.interface_blocks.patch_out.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022432,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "array_size.interface_blocks.patch_out.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022433,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".array_size.interface_blocks.patch_out.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022504,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.location.interface_blocks.patch_out.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022505,
        "dEQP-GLES31.functional.program_interface_query.program_output.loca",
        "tion.interface_blocks.patch_out.unnamed_block.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022506,
        "dEQP-GLES31.functional.program_interface_query.program_output",
        ".location.interface_blocks.patch_out.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022507,
        "dEQP-GLES31.functional.program_interface_query.program_output.location",
        ".interface_blocks.patch_out.unnamed_block.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022508,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.location.interface_blocks.patch_out.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022509,
        "dEQP-GLES31.functional.program_interface_query.program_output.locatio",
        "n.interface_blocks.patch_out.unnamed_block.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022548,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.name_length.interface_blocks.patch_out.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022549,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "name_length.interface_blocks.patch_out.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022550,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "name_length.interface_blocks.patch_out.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022966,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.is_per_patch.interface_blocks.patch_out.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022967,
        "dEQP-GLES31.functional.program_interface_query.program_output.i",
        "s_per_patch.interface_blocks.patch_out.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022968,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "is_per_patch.interface_blocks.patch_out.unnamed_block.var_array");
