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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020984,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.referenced_by_shader.compute.block_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020985,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.referenced_by_shader.compute.block_array.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020986,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".referenced_by_shader.compute.block_array.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024168,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.referenced_by.compute.block_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024169,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.referenced_by.compute.block_array.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_024170,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.referenced_by.compute.block_array.float_struct");
