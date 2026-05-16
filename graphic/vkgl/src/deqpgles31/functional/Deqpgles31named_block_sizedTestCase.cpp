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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024024,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.name_length.named_block.sized.var");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024025,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.name_length.named_block.sized.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024026,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.name_length.named_block.sized.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024027,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.named_block.sized.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024028,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.named_block.sized.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024029,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.name_length.named_block.sized.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024030,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.named_block.sized.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024031,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.name_length.named_block.sized.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024032,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.name_length.named_block.sized.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024033,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.name_length.named_block.sized.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024034,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.name_length.named_block.sized.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024035,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.name_length.named_block.sized.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024036,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.name_length.named_block.sized.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024037,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.name_length.named_block.sized.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024038,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.name_length.named_block.sized.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024090,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.buffer_variable.offset.named_block.sized.var");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024091,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.offset.named_block.sized.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024092,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.offset.named_block.sized.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024093,
        "dEQP-GLES31.functional.program_interface_query.buffer_va",
        "riable.offset.named_block.sized.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024094,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.named_block.sized.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024095,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.offset.named_block.sized.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024096,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.named_block.sized.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024097,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.named_block.sized.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024098,
        "dEQP-GLES31.functional.program_interface_query.b",
        "uffer_variable.offset.named_block.sized.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024099,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.offset.named_block.sized.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024100,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.named_block.sized.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024101,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.named_block.sized.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024102,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.offset.named_block.sized.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024103,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.offset.named_block.sized.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024104,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.offset.named_block.sized.var_array_array_array");
