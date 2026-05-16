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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021679,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m_block.referenced_by.separable_tess_ctrl.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021680,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        "_block.referenced_by.separable_tess_ctrl.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021681,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m_block.referenced_by.separable_tess_ctrl.block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024734,
        "dEQP-GLES31.functional.program_interface_query.shader_st",
        "orage_block.referenced_by.separable_tess_ctrl.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024735,
        "dEQP-GLES31.functional.program_interface_query.shader_sto",
        "rage_block.referenced_by.separable_tess_ctrl.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024736,
        "dEQP-GLES31.functional.program_interface_query.shader_st",
        "orage_block.referenced_by.separable_tess_ctrl.block_array");
