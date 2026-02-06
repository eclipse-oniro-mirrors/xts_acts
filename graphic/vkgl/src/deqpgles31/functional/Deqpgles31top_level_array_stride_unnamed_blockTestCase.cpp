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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024496,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.top_level_array_stride.unnamed_block.var");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024497,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.top_level_array_stride.unnamed_block.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024498,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.top_level_array_stride.unnamed_block.var_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024499,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".top_level_array_stride.unnamed_block.var_struct_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024500,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.top_level_array_stride.unnamed_block.var_array_struct_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024501,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.top_level_array_stride.unnamed_block.var_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024502,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.top_level_array_stride.unnamed_block.var_struct_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024503,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.top_level_array_stride.unnamed_block.var_array_array_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024504,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.top_level_array_stride.unnamed_block.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024505,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.top_level_array_stride.unnamed_block.var_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024506,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.top_level_array_stride.unnamed_block.var_struct_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024507,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.top_level_array_stride.unnamed_block.var_array_struct_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024508,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.top_level_array_stride.unnamed_block.var_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024509,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.top_level_array_stride.unnamed_block.var_struct_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024510,
        "dEQP-GLES31.functional.program_interface_query.buffer_variab",
        "le.top_level_array_stride.unnamed_block.var_array_array_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024511,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.top_level_array_stride.unnamed_block.var_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024512,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable",
        ".top_level_array_stride.unnamed_block.var_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024513,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.to",
        "p_level_array_stride.unnamed_block.var_struct_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024514,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.to",
        "p_level_array_stride.unnamed_block.var_array_struct_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024515,
        "dEQP-GLES31.functional.program_interface_query.buffer_variabl",
        "e.top_level_array_stride.unnamed_block.var_array_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024516,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.to",
        "p_level_array_stride.unnamed_block.var_struct_array_unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024517,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.t",
        "op_level_array_stride.unnamed_block.var_array_array_unsized_array");
