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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021736,
        "dEQP-GLES31.functional.program_interface_query.uniform_block.re",
        "ferenced_by.vertex_tess_geo_fragment_only_tess_ctrl.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021737,
        "dEQP-GLES31.functional.program_interface_query.uniform_block.ref",
        "erenced_by.vertex_tess_geo_fragment_only_tess_ctrl.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021738,
        "dEQP-GLES31.functional.program_interface_query.uniform_block.re",
        "ferenced_by.vertex_tess_geo_fragment_only_tess_ctrl.block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024791,
        "dEQP-GLES31.functional.program_interface_query.shader_storage_bloc",
        "k.referenced_by.vertex_tess_geo_fragment_only_tess_ctrl.named_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024792,
        "dEQP-GLES31.functional.program_interface_query.shader_storage_block",
        ".referenced_by.vertex_tess_geo_fragment_only_tess_ctrl.unnamed_block");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_024793,
        "dEQP-GLES31.functional.program_interface_query.shader_storage_bloc",
        "k.referenced_by.vertex_tess_geo_fragment_only_tess_ctrl.block_array");
