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
#include "../ActsDeqpgles310025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024721,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.shader_storage_block.name_length.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024722,
        "dEQP-GLES31.functional.program_interface_query",
        ".shader_storage_block.name_length.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024723,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.shader_storage_block.name_length.block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024724,
        "dEQP-GLES31.functional.program_interface_query.shader",
        "_storage_block.name_length.block_array_single_element");
