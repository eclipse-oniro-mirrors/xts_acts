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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022378,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.resource_list.interface_blocks.out.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022379,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.resource_list.interface_blocks.out.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022380,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.resource_list.interface_blocks.out.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022419,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.array_size.interface_blocks.out.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022420,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.array_size.interface_blocks.out.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022421,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.array_size.interface_blocks.out.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022483,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.location.interface_blocks.out.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022484,
        "dEQP-GLES31.functional.program_interface_query.program_output.l",
        "ocation.interface_blocks.out.unnamed_block.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022485,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.location.interface_blocks.out.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022486,
        "dEQP-GLES31.functional.program_interface_query.program_output.locat",
        "ion.interface_blocks.out.unnamed_block.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022487,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.location.interface_blocks.out.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022488,
        "dEQP-GLES31.functional.program_interface_query.program_output.loca",
        "tion.interface_blocks.out.unnamed_block.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022536,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.name_length.interface_blocks.out.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022537,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.name_length.interface_blocks.out.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022538,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.name_length.interface_blocks.out.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022954,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.is_per_patch.interface_blocks.out.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022955,
        "dEQP-GLES31.functional.program_interface_query.program_outpu",
        "t.is_per_patch.interface_blocks.out.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022956,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.is_per_patch.interface_blocks.out.unnamed_block.var_array");
