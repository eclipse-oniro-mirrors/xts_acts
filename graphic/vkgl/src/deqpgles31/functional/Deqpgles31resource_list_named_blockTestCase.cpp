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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020081,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.uniform.resource_list.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020082,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.resource_list.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020083,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.resource_list.named_block.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020084,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.named_block.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020085,
        "dEQP-GLES31.functional.program_interface_query.uniform.r",
        "esource_list.named_block.var_struct_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020086,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.named_block.var_array_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020087,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.named_block.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020088,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.named_block.var_struct_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020089,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.named_block.var_array_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020090,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.resource_list.named_block.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020091,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.named_block.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020092,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.named_block.var_struct_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020093,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.named_block.var_array_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020094,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.resource_list.named_block.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020095,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.named_block.var_struct_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020096,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".resource_list.named_block.var_array_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020097,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.uniform.resource_list.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020098,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.resource_list.named_block.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020099,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.resource_list.named_block.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020100,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.named_block.var_struct_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020101,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.named_block.var_array_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020102,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.resource_list.named_block.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020103,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.named_block.var_struct_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020104,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".resource_list.named_block.var_array_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020105,
        "dEQP-GLES31.functional.program_interface_query.u",
        "niform.resource_list.named_block.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020106,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.resource_list.named_block.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020107,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "resource_list.named_block.var_struct_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020108,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".resource_list.named_block.var_array_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020109,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.resource_list.named_block.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020110,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".resource_list.named_block.var_struct_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020111,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".resource_list.named_block.var_array_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023392,
        "dEQP-GLES31.functional.program_interface_query",
        ".buffer_variable.resource_list.named_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023393,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.resource_list.named_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023394,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.resource_list.named_block.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023395,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.named_block.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023396,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.resource_list.named_block.var_struct_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023397,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.named_block.var_array_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023398,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.named_block.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023399,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.named_block.var_struct_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023400,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.named_block.var_array_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023401,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.resource_list.named_block.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023402,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.named_block.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023403,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.named_block.var_struct_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023404,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.named_block.var_array_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023405,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.resource_list.named_block.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023406,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.named_block.var_struct_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023407,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.resource_list.named_block.var_array_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023408,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.resource_list.named_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023409,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.resource_list.named_block.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023410,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.resource_list.named_block.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023411,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.named_block.var_struct_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023412,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.named_block.var_array_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023413,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.resource_list.named_block.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023414,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.named_block.var_struct_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023415,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.resource_list.named_block.var_array_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023416,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.resource_list.named_block.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023417,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.resource_list.named_block.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023418,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.resource_list.named_block.var_struct_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023419,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.resource_list.named_block.var_array_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023420,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.resource_list.named_block.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023421,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.resource_list.named_block.var_struct_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_023422,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.resource_list.named_block.var_array_array_array_array");
