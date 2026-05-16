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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022375,
        "dEQP-GLES31.functional.program_interface_query.program_output.res",
        "ource_list.interface_blocks.out.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022376,
        "dEQP-GLES31.functional.program_interface_query.program_output.resour",
        "ce_list.interface_blocks.out.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022377,
        "dEQP-GLES31.functional.program_interface_query.program_output.resour",
        "ce_list.interface_blocks.out.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022416,
        "dEQP-GLES31.functional.program_interface_query.program_output.a",
        "rray_size.interface_blocks.out.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022417,
        "dEQP-GLES31.functional.program_interface_query.program_output.array",
        "_size.interface_blocks.out.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022418,
        "dEQP-GLES31.functional.program_interface_query.program_output.arra",
        "y_size.interface_blocks.out.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022477,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "location.interface_blocks.out.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022478,
        "dEQP-GLES31.functional.program_interface_query.program_output.location.",
        "interface_blocks.out.named_block_explicit_location.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022479,
        "dEQP-GLES31.functional.program_interface_query.program_output.loca",
        "tion.interface_blocks.out.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022480,
        "dEQP-GLES31.functional.program_interface_query.program_output.location.inte",
        "rface_blocks.out.named_block_explicit_location.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022481,
        "dEQP-GLES31.functional.program_interface_query.program_output.loc",
        "ation.interface_blocks.out.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022482,
        "dEQP-GLES31.functional.program_interface_query.program_output.location.int",
        "erface_blocks.out.named_block_explicit_location.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022533,
        "dEQP-GLES31.functional.program_interface_query.program_output.na",
        "me_length.interface_blocks.out.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022534,
        "dEQP-GLES31.functional.program_interface_query.program_output.name_",
        "length.interface_blocks.out.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022535,
        "dEQP-GLES31.functional.program_interface_query.program_output.name_",
        "length.interface_blocks.out.named_block_explicit_location.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022951,
        "dEQP-GLES31.functional.program_interface_query.program_output.is",
        "_per_patch.interface_blocks.out.named_block_explicit_location.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022952,
        "dEQP-GLES31.functional.program_interface_query.program_output.is_per",
        "_patch.interface_blocks.out.named_block_explicit_location.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022953,
        "dEQP-GLES31.functional.program_interface_query.program_output.is_pe",
        "r_patch.interface_blocks.out.named_block_explicit_location.var_array");
