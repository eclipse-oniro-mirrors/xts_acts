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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020112,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.uniform.resource_list.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020113,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.resource_list.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020114,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.resource_list.unnamed_block.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020115,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.resource_list.unnamed_block.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020116,
        "dEQP-GLES31.functional.program_interface_query.uniform.re",
        "source_list.unnamed_block.var_struct_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020117,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.unnamed_block.var_array_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020118,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.resource_list.unnamed_block.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020119,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.unnamed_block.var_struct_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020120,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.unnamed_block.var_array_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020121,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.resource_list.unnamed_block.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020122,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.resource_list.unnamed_block.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020123,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.unnamed_block.var_struct_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020124,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.unnamed_block.var_array_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020125,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.unnamed_block.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020126,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.unnamed_block.var_struct_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020127,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.unnamed_block.var_array_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020128,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.resource_list.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020129,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.resource_list.unnamed_block.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020130,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.resource_list.unnamed_block.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020131,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.unnamed_block.var_struct_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020132,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.unnamed_block.var_array_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020133,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.unnamed_block.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020134,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.unnamed_block.var_struct_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020135,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.unnamed_block.var_array_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020136,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.resource_list.unnamed_block.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020137,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.unnamed_block.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020138,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.unnamed_block.var_struct_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020139,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.unnamed_block.var_array_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020140,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.unnamed_block.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020141,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.unnamed_block.var_struct_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020142,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.unnamed_block.var_array_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023423,
        "dEQP-GLES31.functional.program_interface_query.",
        "buffer_variable.resource_list.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023424,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.resource_list.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023425,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.resource_list.unnamed_block.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023426,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.resource_list.unnamed_block.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023427,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.resource_list.unnamed_block.var_struct_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023428,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.unnamed_block.var_array_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023429,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.resource_list.unnamed_block.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023430,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.unnamed_block.var_struct_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023431,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.unnamed_block.var_array_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023432,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.resource_list.unnamed_block.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023433,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.resource_list.unnamed_block.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023434,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.unnamed_block.var_struct_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023435,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.unnamed_block.var_array_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023436,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.unnamed_block.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023437,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.unnamed_block.var_struct_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023438,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.unnamed_block.var_array_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023439,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.resource_list.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023440,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.resource_list.unnamed_block.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023441,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.resource_list.unnamed_block.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023442,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.unnamed_block.var_struct_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023443,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.unnamed_block.var_array_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023444,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.unnamed_block.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023445,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.unnamed_block.var_struct_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023446,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.unnamed_block.var_array_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023447,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.resource_list.unnamed_block.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023448,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.unnamed_block.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023449,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.unnamed_block.var_struct_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023450,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.unnamed_block.var_array_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023451,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.unnamed_block.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023452,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.unnamed_block.var_struct_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023453,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.unnamed_block.var_array_array_array_array");
