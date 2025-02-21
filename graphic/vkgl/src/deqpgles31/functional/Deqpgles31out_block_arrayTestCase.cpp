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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022381,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.resource_list.interface_blocks.out.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022382,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.resource_list.interface_blocks.out.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022383,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.resource_list.interface_blocks.out.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022422,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.array_size.interface_blocks.out.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022423,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.array_size.interface_blocks.out.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022424,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.array_size.interface_blocks.out.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022489,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_output.location.interface_blocks.out.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022490,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.location.interface_blocks.out.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022491,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.location.interface_blocks.out.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022539,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.name_length.interface_blocks.out.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022540,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.name_length.interface_blocks.out.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022541,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.name_length.interface_blocks.out.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022957,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.is_per_patch.interface_blocks.out.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022958,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.is_per_patch.interface_blocks.out.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022959,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.is_per_patch.interface_blocks.out.block_array.var_array");
