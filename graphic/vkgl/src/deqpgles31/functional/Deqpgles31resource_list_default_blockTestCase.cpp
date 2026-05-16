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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020050,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.resource_list.default_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020051,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.resource_list.default_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020052,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.resource_list.default_block.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020053,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.resource_list.default_block.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020054,
        "dEQP-GLES31.functional.program_interface_query.uniform.re",
        "source_list.default_block.var_struct_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020055,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.default_block.var_array_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020056,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.resource_list.default_block.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020057,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.default_block.var_struct_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020058,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.default_block.var_array_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020059,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.resource_list.default_block.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020060,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.resource_list.default_block.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020061,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.default_block.var_struct_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020062,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.default_block.var_array_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020063,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.default_block.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020064,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.default_block.var_struct_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020065,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.default_block.var_array_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020066,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.resource_list.default_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020067,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.resource_list.default_block.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020068,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.resource_list.default_block.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020069,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.default_block.var_struct_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020070,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.default_block.var_array_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020071,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.default_block.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020072,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.default_block.var_struct_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020073,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.default_block.var_array_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020074,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.resource_list.default_block.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020075,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.default_block.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020076,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.default_block.var_struct_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020077,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.default_block.var_array_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020078,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.default_block.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020079,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.default_block.var_struct_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020080,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.default_block.var_array_array_array_array");
