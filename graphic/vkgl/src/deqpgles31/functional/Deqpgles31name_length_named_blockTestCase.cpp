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
#include "../ActsDeqpgles310021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020827,
        "dEQP-GLES31.functional.program_interface_",
        "query.uniform.name_length.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020828,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.name_length.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020829,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.name_length.named_block.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020830,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.name_length.named_block.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020831,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.uniform.name_length.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020832,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.name_length.named_block.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020833,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.name_length.named_block.var_array_array");
