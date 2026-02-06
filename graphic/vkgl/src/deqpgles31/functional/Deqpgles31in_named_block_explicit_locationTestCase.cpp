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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021791,
        "dEQP-GLES31.functional.program_interface_query.program_input.res",
        "ource_list.interface_blocks.in.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021792,
        "dEQP-GLES31.functional.program_interface_query.program_input.resour",
        "ce_list.interface_blocks.in.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021793,
        "dEQP-GLES31.functional.program_interface_query.program_input.resour",
        "ce_list.interface_blocks.in.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021826,
        "dEQP-GLES31.functional.program_interface_query.program_input.a",
        "rray_size.interface_blocks.in.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021827,
        "dEQP-GLES31.functional.program_interface_query.program_input.array",
        "_size.interface_blocks.in.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021828,
        "dEQP-GLES31.functional.program_interface_query.program_input.arra",
        "y_size.interface_blocks.in.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021875,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "location.interface_blocks.in.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021876,
        "dEQP-GLES31.functional.program_interface_query.program_input.location.",
        "interface_blocks.in.named_block_explicit_location.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021877,
        "dEQP-GLES31.functional.program_interface_query.program_input.loca",
        "tion.interface_blocks.in.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021878,
        "dEQP-GLES31.functional.program_interface_query.program_input.location.inte",
        "rface_blocks.in.named_block_explicit_location.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021879,
        "dEQP-GLES31.functional.program_interface_query.program_input.loc",
        "ation.interface_blocks.in.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021880,
        "dEQP-GLES31.functional.program_interface_query.program_input.location.int",
        "erface_blocks.in.named_block_explicit_location.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021925,
        "dEQP-GLES31.functional.program_interface_query.program_input.na",
        "me_length.interface_blocks.in.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021926,
        "dEQP-GLES31.functional.program_interface_query.program_input.name_",
        "length.interface_blocks.in.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021927,
        "dEQP-GLES31.functional.program_interface_query.program_input.name_",
        "length.interface_blocks.in.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022327,
        "dEQP-GLES31.functional.program_interface_query.program_input.is",
        "_per_patch.interface_blocks.in.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022328,
        "dEQP-GLES31.functional.program_interface_query.program_input.is_per",
        "_patch.interface_blocks.in.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022329,
        "dEQP-GLES31.functional.program_interface_query.program_input.is_pe",
        "r_patch.interface_blocks.in.named_block_explicit_location.var_array");
