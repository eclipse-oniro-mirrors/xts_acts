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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024231,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.referenced_by.separable_geometry.named_block.float");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024232,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.referenced_by.separable_geometry.named_block.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024233,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.referenced_by.separable_geometry.named_block.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024234,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "referenced_by.separable_geometry.named_block.float_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024235,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "referenced_by.separable_geometry.named_block.float_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024236,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".referenced_by.separable_geometry.named_block.float_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024237,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "referenced_by.separable_geometry.named_block.float_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024238,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.",
        "referenced_by.separable_geometry.named_block.float_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024239,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.refe",
        "renced_by.separable_geometry.named_block.float_unsized_struct_array");
