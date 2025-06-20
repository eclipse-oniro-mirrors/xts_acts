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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020143,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.resource_list.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020144,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.resource_list.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020145,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.resource_list.block_array.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020146,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.block_array.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020147,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.block_array.var_struct_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020148,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.block_array.var_array_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020149,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.block_array.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020150,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.block_array.var_struct_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020151,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.block_array.var_array_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020152,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.resource_list.block_array.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020153,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.block_array.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020154,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.block_array.var_struct_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020155,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.block_array.var_array_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020156,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.resource_list.block_array.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020157,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.block_array.var_struct_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020158,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".resource_list.block_array.var_array_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020159,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.resource_list.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020160,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.resource_list.block_array.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020161,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.block_array.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020162,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.block_array.var_struct_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020163,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.block_array.var_array_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020164,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.resource_list.block_array.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020165,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.block_array.var_struct_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020166,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".resource_list.block_array.var_array_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020167,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.resource_list.block_array.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020168,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.resource_list.block_array.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020169,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.block_array.var_struct_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020170,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".resource_list.block_array.var_array_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020171,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.resource_list.block_array.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020172,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".resource_list.block_array.var_struct_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020173,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".resource_list.block_array.var_array_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023454,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.resource_list.block_array.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023455,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.resource_list.block_array.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023456,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.resource_list.block_array.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023457,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.block_array.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023458,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.block_array.var_struct_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023459,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.block_array.var_array_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023460,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.block_array.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023461,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.block_array.var_struct_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023462,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.block_array.var_array_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023463,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.resource_list.block_array.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023464,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.block_array.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023465,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.block_array.var_struct_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023466,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.block_array.var_array_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023467,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.resource_list.block_array.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023468,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.block_array.var_struct_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023469,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.resource_list.block_array.var_array_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023470,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.resource_list.block_array.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023471,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.resource_list.block_array.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023472,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.block_array.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023473,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.block_array.var_struct_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023474,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.block_array.var_array_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023475,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.resource_list.block_array.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023476,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.block_array.var_struct_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023477,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.resource_list.block_array.var_array_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023478,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.resource_list.block_array.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023479,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.resource_list.block_array.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023480,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.block_array.var_struct_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023481,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.resource_list.block_array.var_array_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023482,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.resource_list.block_array.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023483,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.resource_list.block_array.var_struct_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023484,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.resource_list.block_array.var_array_array_array_array");
