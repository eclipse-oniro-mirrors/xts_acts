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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021395,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_b",
        "y_shader.vertex_tess_geo_fragment_only_tess_ctrl.unnamed_block.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021396,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_by_s",
        "hader.vertex_tess_geo_fragment_only_tess_ctrl.unnamed_block.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021397,
        "dEQP-GLES31.functional.program_interface_query.uniform.referenced_by_sh",
        "ader.vertex_tess_geo_fragment_only_tess_ctrl.unnamed_block.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024393,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.refer",
        "enced_by.vertex_tess_geo_fragment_only_tess_ctrl.unnamed_block.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024394,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.referenc",
        "ed_by.vertex_tess_geo_fragment_only_tess_ctrl.unnamed_block.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024395,
        "dEQP-GLES31.functional.program_interface_query.buffer_variable.referenc",
        "ed_by.vertex_tess_geo_fragment_only_tess_ctrl.unnamed_block.float_struct");
