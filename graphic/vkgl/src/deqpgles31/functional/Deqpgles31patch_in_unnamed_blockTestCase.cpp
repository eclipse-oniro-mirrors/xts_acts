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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021806,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.resource_list.interface_blocks.patch_in.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021807,
        "dEQP-GLES31.functional.program_interface_query.program_input.r",
        "esource_list.interface_blocks.patch_in.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021808,
        "dEQP-GLES31.functional.program_interface_query.program_input.r",
        "esource_list.interface_blocks.patch_in.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021841,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.array_size.interface_blocks.patch_in.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021842,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "array_size.interface_blocks.patch_in.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021843,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".array_size.interface_blocks.patch_in.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021902,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.location.interface_blocks.patch_in.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021903,
        "dEQP-GLES31.functional.program_interface_query.program_input.loca",
        "tion.interface_blocks.patch_in.unnamed_block.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021904,
        "dEQP-GLES31.functional.program_interface_query.program_input",
        ".location.interface_blocks.patch_in.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021905,
        "dEQP-GLES31.functional.program_interface_query.program_input.location",
        ".interface_blocks.patch_in.unnamed_block.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021906,
        "dEQP-GLES31.functional.program_interface_query.program_inpu",
        "t.location.interface_blocks.patch_in.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021907,
        "dEQP-GLES31.functional.program_interface_query.program_input.locatio",
        "n.interface_blocks.patch_in.unnamed_block.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021940,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.name_length.interface_blocks.patch_in.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021941,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "name_length.interface_blocks.patch_in.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021942,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "name_length.interface_blocks.patch_in.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022342,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.is_per_patch.interface_blocks.patch_in.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022343,
        "dEQP-GLES31.functional.program_interface_query.program_input.i",
        "s_per_patch.interface_blocks.patch_in.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022344,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "is_per_patch.interface_blocks.patch_in.unnamed_block.var_array");
