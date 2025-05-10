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
#include "../ActsDeqpgles310022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021225,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced",
        "_by_shader.vertex_tess_fragment_only_tess_ctrl.unnamed_block.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021226,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_by",
        "_shader.vertex_tess_fragment_only_tess_ctrl.unnamed_block.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021227,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_by_",
        "shader.vertex_tess_fragment_only_tess_ctrl.unnamed_block.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024303,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.ref",
        "erenced_by.vertex_tess_fragment_only_tess_ctrl.unnamed_block.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024304,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.refere",
        "nced_by.vertex_tess_fragment_only_tess_ctrl.unnamed_block.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024305,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.refere",
        "nced_by.vertex_tess_fragment_only_tess_ctrl.unnamed_block.float_struct");
