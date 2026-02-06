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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022372,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.resource_list.interface_blocks.out.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022373,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.resource_list.interface_blocks.out.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022374,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.resource_list.interface_blocks.out.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022413,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.array_size.interface_blocks.out.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022414,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.array_size.interface_blocks.out.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022415,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.array_size.interface_blocks.out.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022471,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_output.location.interface_blocks.out.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022472,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "location.interface_blocks.out.named_block.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022473,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.location.interface_blocks.out.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022474,
        "dEQP-GLES31.functional.program_interface_query.program_output.loca",
        "tion.interface_blocks.out.named_block.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022475,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.location.interface_blocks.out.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022476,
        "dEQP-GLES31.functional.program_interface_query.program_output.loc",
        "ation.interface_blocks.out.named_block.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022530,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.name_length.interface_blocks.out.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022531,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.name_length.interface_blocks.out.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022532,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.name_length.interface_blocks.out.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022948,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.is_per_patch.interface_blocks.out.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022949,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.is_per_patch.interface_blocks.out.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022950,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.is_per_patch.interface_blocks.out.named_block.var_array");
