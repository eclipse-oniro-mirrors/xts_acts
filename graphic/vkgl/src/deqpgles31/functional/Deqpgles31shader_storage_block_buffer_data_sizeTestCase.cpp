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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024718,
        "dEQP-GLES31.functional.program_interface_query.s",
        "hader_storage_block.buffer_data_size.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024719,
        "dEQP-GLES31.functional.program_interface_query.sh",
        "ader_storage_block.buffer_data_size.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024720,
        "dEQP-GLES31.functional.program_interface_query.s",
        "hader_storage_block.buffer_data_size.block_array");
