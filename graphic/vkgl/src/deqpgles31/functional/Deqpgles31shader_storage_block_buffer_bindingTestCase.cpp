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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024712,
        "dEQP-GLES31.functional.program_interface_query.",
        "shader_storage_block.buffer_binding.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024713,
        "dEQP-GLES31.functional.program_interface_query.s",
        "hader_storage_block.buffer_binding.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024714,
        "dEQP-GLES31.functional.program_interface_query.",
        "shader_storage_block.buffer_binding.block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024715,
        "dEQP-GLES31.functional.program_interface_query.shader_s",
        "torage_block.buffer_binding.named_block_explicit_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024716,
        "dEQP-GLES31.functional.program_interface_query.shader_st",
        "orage_block.buffer_binding.unnamed_block_explicit_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024717,
        "dEQP-GLES31.functional.program_interface_query.shader_s",
        "torage_block.buffer_binding.block_array_explicit_binding");
