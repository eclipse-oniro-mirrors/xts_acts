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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021797,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.resource_list.interface_blocks.in.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021798,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.resource_list.interface_blocks.in.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021799,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.resource_list.interface_blocks.in.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021832,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.array_size.interface_blocks.in.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021833,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.array_size.interface_blocks.in.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021834,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.array_size.interface_blocks.in.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021887,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_input.location.interface_blocks.in.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021888,
        "dEQP-GLES31.functional.program_interface_query.program_i",
        "nput.location.interface_blocks.in.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021889,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.location.interface_blocks.in.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021931,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.name_length.interface_blocks.in.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021932,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.name_length.interface_blocks.in.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021933,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.name_length.interface_blocks.in.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022333,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.is_per_patch.interface_blocks.in.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022334,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.is_per_patch.interface_blocks.in.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022335,
        "dEQP-GLES31.functional.program_interface_query.program_in",
        "put.is_per_patch.interface_blocks.in.block_array.var_array");
